package com.naver.erp;

import java.util.List;
import java.util.Map;

public class PreResultDTO {

	//검색결과
	private List<Map<String,String>> preResultList;
	private int preResultAllCnt=0;
	
	

	public List<Map<String, String>> getPreResultList() {
		return preResultList;
	}
	public void setPreResultList(List<Map<String, String>> preResultList) {
		this.preResultList = preResultList;
	}
	public int getPreResultAllCnt() {
		return preResultAllCnt;
	}
	public void setPreResultAllCnt(int preResultAllCnt) {
		this.preResultAllCnt = preResultAllCnt;
	}
	
	
	
	

}