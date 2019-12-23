package com.naver.erp;

import java.util.List;
import java.util.Map;

// 검색 조건을 담음
public class MyPopularityListDTO {

	private List<Map<String,String>> myPopularityMenu;
	
	private List<Map<String,String>> othersPopularityMenu;

	public List<Map<String, String>> getMyPopularityMenu() {
		return myPopularityMenu;
	}

	public void setMyPopularityMenu(List<Map<String, String>> myPopularityMenu) {
		this.myPopularityMenu = myPopularityMenu;
	}

	public List<Map<String, String>> getOthersPopularityMenu() {
		return othersPopularityMenu;
	}

	public void setOthersPopularityMenu(List<Map<String, String>> othersPopularityMenu) {
		this.othersPopularityMenu = othersPopularityMenu;
	}


	
	

	
	

}
