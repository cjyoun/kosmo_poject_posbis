package com.naver.erp;

import java.util.List;
import java.util.Map;

// 검색 조건을 담음
public class PreChartListDTO {

	private List<Map<String,String>> salesMonthList;
	private List<Map<String,String>> allSalesMonthList;
	
	
	public List<Map<String, String>> getSalesMonthList() {
		return salesMonthList;
	}
	public void setSalesMonthList(List<Map<String, String>> salesMonthList) {
		this.salesMonthList = salesMonthList;
	}
	public List<Map<String, String>> getAllSalesMonthList() {
		return allSalesMonthList;
	}
	public void setAllSalesMonthList(List<Map<String, String>> allSalesMonthList) {
		this.allSalesMonthList = allSalesMonthList;
	}
	
	

	
	

}
