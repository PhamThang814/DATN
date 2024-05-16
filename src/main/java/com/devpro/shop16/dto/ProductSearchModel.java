package com.devpro.shop16.dto;

import lombok.Data;

@Data
public class ProductSearchModel extends BaseSearchModel {

	public String keyword;

	public Integer categoryId;

	public String seo;

}
