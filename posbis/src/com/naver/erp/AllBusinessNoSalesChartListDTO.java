package com.naver.erp;

import java.util.List;
import java.util.Map;

// 검색 조건을 담음
public class AllBusinessNoSalesChartListDTO {

	private List<Map<String,String>> allBusinessNoSalesMonthList;

	public List<Map<String, String>> getAllBusinessNoSalesMonthList() {
		return allBusinessNoSalesMonthList;
	}

	public void setAllBusinessNoSalesMonthList(List<Map<String, String>> allBusinessNoSalesMonthList) {
		this.allBusinessNoSalesMonthList = allBusinessNoSalesMonthList;
	}

}
