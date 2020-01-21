package com.naver.erp;

import java.util.List;
import java.util.Map;

// 세트메뉴 리스트 담음
public class SetMenuDTO {

	private List<Map<String,String>> setMenuList;
	private String changeBusinessNo;
	private String dataArea;

	public List<Map<String, String>> getSetMenuList() {
		return setMenuList;
	}

	public void setSetMenuList(List<Map<String, String>> setMenuList) {
		this.setMenuList = setMenuList;
	}

	public String getChangeBusinessNo() {
		return changeBusinessNo;
	}

	public void setChangeBusinessNo(String changeBusinessNo) {
		this.changeBusinessNo = changeBusinessNo;
	}

	public String getDataArea() {
		return dataArea;
	}

	public void setDataArea(String dataArea) {
		this.dataArea = dataArea;
	}
	

}
