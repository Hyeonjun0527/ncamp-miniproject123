package com.model2.mvc.product.dto.response;

import com.model2.mvc.product.domain.Product;
import lombok.Getter;
import lombok.ToString;

import java.sql.Date;
import java.time.LocalDate;

@Getter
@ToString
public class UpdateProductResponseDto {
    private int prodNo;
    private String fileName;
    private LocalDate manuDate;
    private int price;
    private String prodDetail;
    private String prodName;
    private Date regDate;
    private int stock;

    private UpdateProductResponseDto() {
    }

    public static UpdateProductResponseDto from(Product product) {
        UpdateProductResponseDto responseDTO = new UpdateProductResponseDto();
        responseDTO.prodNo = product.getProdNo();
        responseDTO.fileName = product.getFileName();
        responseDTO.manuDate = product.getManuDate();
        responseDTO.price = product.getPrice();
        responseDTO.prodDetail = product.getProdDetail();
        responseDTO.prodName = product.getProdName();
        responseDTO.regDate = product.getRegDate();
        responseDTO.stock = product.getStock();
        return responseDTO;
    }
}
