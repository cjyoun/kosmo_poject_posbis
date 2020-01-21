package com.naver.erp;

import java.util.List;
import java.util.Map;

public class PreChartHourSalesDTO {

	List<Map<String,String>> hourSalesCount;
	
	String salesOpenTime;
	String salesCloseTime;

	public List<Map<String, String>> getHourSalesCount() {
		return hourSalesCount;
	}

	public void setHourSalesCount(List<Map<String, String>> hourSalesCount) {
		this.hourSalesCount = hourSalesCount;
	}

	public String getSalesOpenTime() {
		return salesOpenTime;
	}

	public void setSalesOpenTime(String salesOpenTime) {
		this.salesOpenTime = salesOpenTime;
	}

	public String getSalesCloseTime() {
		return salesCloseTime;
	}

	public void setSalesCloseTime(String salesCloseTime) {
		this.salesCloseTime = salesCloseTime;
	}
	

	
	

	
	
}
