package com.model2.mvc.product.dto.response;

import com.model2.mvc.category.domain.Category;
import com.model2.mvc.common.ListData;
import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.product.domain.Product;
import com.model2.mvc.product.dto.request.ListProductRequestDto;
import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
public class ListProductResponseDto {
    private int count;
    private List<Product> products;
    private List<Category> categories;
    private Page pageInfo;
    private String menuMode;
    private Search searchInfo;
    private Integer currentCategoryNo;

    private ListProductResponseDto() {
    }

    public static ListProductResponseDto from(ListData<Product> listData,
                                              List<Category> categories,
                                              Page pageInfo,
                                              ListProductRequestDto requestDTO,
                                              Search searchInfo) {
        ListProductResponseDto dto = new ListProductResponseDto();
        dto.count = listData.getCount();
        dto.products = listData.getList();
        dto.categories = categories;
        dto.pageInfo = pageInfo;
        dto.menuMode = requestDTO.getMenu();
        dto.searchInfo = searchInfo;
        dto.currentCategoryNo = requestDTO.getCategoryNo();
        return dto;
    }
}
