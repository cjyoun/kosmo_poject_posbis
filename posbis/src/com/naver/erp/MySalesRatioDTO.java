package com.naver.erp;

import java.util.List;
import java.util.Map;

// 검색 조건을 담음
public class MySalesRatioDTO {

	private List<Map<String,String>> menuSalesCount;
	private List<Map<String,String>> salesBenefit;
	
	
	
	public List<Map<String, String>> getMenuSalesCount() {
		return menuSalesCount;
	}
	public void setMenuSalesCount(List<Map<String, String>> menuSalesCount) {
		this.menuSalesCount = menuSalesCount;
	}
	public List<Map<String, String>> getSalesBenefit() {
		return salesBenefit;
	}
	public void setSalesBenefit(List<Map<String, String>> salesBenefit) {
		this.salesBenefit = salesBenefit;
	}
	


	
	
	
	

}
