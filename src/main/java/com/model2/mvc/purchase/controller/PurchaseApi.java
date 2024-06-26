package com.model2.mvc.purchase.controller;

import com.model2.mvc.common.SearchCondition;
import com.model2.mvc.common.propertyeditor.SearchConditionEditor;
import com.model2.mvc.purchase.controller.editor.LocalDateEditor;
import com.model2.mvc.purchase.controller.editor.PaymentOptionEditor;
import com.model2.mvc.purchase.controller.editor.TranStatusCodeEditor;
import com.model2.mvc.purchase.controller.editor.TransactionProductionEditor;
import com.model2.mvc.purchase.domain.PaymentOption;
import com.model2.mvc.purchase.domain.TranStatusCode;
import com.model2.mvc.purchase.dto.request.AddPurchaseRequestDTO;
import com.model2.mvc.purchase.dto.request.AddPurchaseViewResponseDTO;
import com.model2.mvc.purchase.dto.request.ListPurchaseRequestDto;
import com.model2.mvc.purchase.dto.request.UpdatePurchaseRequestDto;
import com.model2.mvc.purchase.dto.request.UpdateTranCodeRequestDTO;
import com.model2.mvc.purchase.dto.response.AddPurchaseResponseDTO;
import com.model2.mvc.purchase.dto.response.GetPurchaseResponseDto;
import com.model2.mvc.purchase.dto.response.ListPurchaseResponseDto;
import com.model2.mvc.purchase.service.PurchaseService;
import com.model2.mvc.user.domain.Role;
import com.model2.mvc.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/purchases")
@RequiredArgsConstructor
public class PurchaseApi {
    private final PurchaseService purchaseService;

    @Value("#{constantProperties['defaultPageSize']}")
    private int defaultPageSize;

    @Value("#{constantProperties['defaultPageDisplay']}")
    private int defaultPageDisplay;

    @InitBinder
    public void dateBinding(WebDataBinder binder) {
        binder.registerCustomEditor(LocalDate.class, LocalDateEditor.getInstance());
        binder.registerCustomEditor(List.class, "tranProds", TransactionProductionEditor.getInstance());
        binder.registerCustomEditor(PaymentOption.class, "paymentOption", PaymentOptionEditor.getInstance());
        binder.registerCustomEditor(TranStatusCode.class, "tranStatusCode", TranStatusCodeEditor.getInstance());
        binder.registerCustomEditor(SearchCondition.class, SearchConditionEditor.getInstance());
    }

    @PostMapping
    public ResponseEntity<AddPurchaseResponseDTO> addPurchase(@RequestBody AddPurchaseRequestDTO requestDTO,
                                                              @SessionAttribute(value = "user",
                                                                                required = false) User loginUser) {
        if (loginUser == null || loginUser.getRole() != Role.USER) {
            return new ResponseEntity<>(HttpStatus.FORBIDDEN);
        }
        return new ResponseEntity<>(this.purchaseService.addPurchase(requestDTO), HttpStatus.CREATED);
    }

    @GetMapping("/purchase-form-data")
    public ResponseEntity<AddPurchaseViewResponseDTO> getDataForPurchaseForm(
            @RequestParam("purchase") List<String> purchase) {
        if (purchase == null || purchase.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        Map<Integer, Integer> prodNoQuantityMap = new HashMap<>();

        purchase.stream()
                .map(p -> p.split("-"))
                .forEach(m -> prodNoQuantityMap.put(Integer.parseInt(m[0]), Integer.parseInt(m[1])));
        return new ResponseEntity<>(this.purchaseService.getProductsWithQuantity(prodNoQuantityMap), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<ListPurchaseResponseDto> listPurchases(@ModelAttribute ListPurchaseRequestDto requestDto,
                                                                 @SessionAttribute(value = "user",
                                                                                   required = false) User loginUser) {
        if (loginUser == null || loginUser.getRole() != Role.USER) {
            return new ResponseEntity<>(HttpStatus.FORBIDDEN);
        }
        requestDto.setUser(loginUser);
        return new ResponseEntity<>(this.purchaseService.getPurchaseList(requestDto), HttpStatus.OK);
    }

    @GetMapping("/sale")
    public ResponseEntity<ListPurchaseResponseDto> getSales(
            @RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "pageSize", required = false) Integer pageSize,
            @SessionAttribute(value = "user", required = false) User loginUser) {
        if (loginUser == null || loginUser.getRole() != Role.ADMIN) {
            return new ResponseEntity<>(HttpStatus.FORBIDDEN);
        }

        ListPurchaseResponseDto saleList = this.purchaseService.getSaleList(page, pageSize);
        saleList.setLoginUser(loginUser);
        return new ResponseEntity<>(saleList, HttpStatus.OK);
    }

    @PatchMapping("/{tranNo}")
    public ResponseEntity<Void> updatePurchase(@PathVariable("tranNo") int tranNo,
                                               @ModelAttribute UpdatePurchaseRequestDto requestDto) {
        this.purchaseService.updatePurchase(tranNo, requestDto);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PatchMapping("/{tranNo}/tran-code")
    public ResponseEntity<Void> updateTranCode(@PathVariable("tranNo") int tranNo,
                                               @RequestParam("tranCode") String tranCode) {
        this.purchaseService.updateTranCode(new UpdateTranCodeRequestDTO(tranNo, TranStatusCode.getTranCode(tranCode)));
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("/{tranNo}")
    public ResponseEntity<GetPurchaseResponseDto> getPurchase(@PathVariable("tranNo") int tranNo) {
        return new ResponseEntity<>(this.purchaseService.getPurchase(tranNo), HttpStatus.OK);
    }
}
