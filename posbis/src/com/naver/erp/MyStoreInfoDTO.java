package com.naver.erp;

import java.util.List;
import java.util.Map;

public class MyStoreInfoDTO {
	
	

	private int myStoreInfoAllCnt=0;
	private List<Map<String,String>> myStoreInfoList;
	private int selectPageNo2=1;
	private int u_no;
	
	
	public int getMyStoreInfoAllCnt() {
		return myStoreInfoAllCnt;
	}
	public void setMyStoreInfoAllCnt(int myStoreInfoAllCnt) {
		this.myStoreInfoAllCnt = myStoreInfoAllCnt;
	}
	public List<Map<String, String>> getMyStoreInfoList() {
		return myStoreInfoList;
	}
	public void setMyStoreInfoList(List<Map<String, String>> myStoreInfoList) {
		this.myStoreInfoList = myStoreInfoList;
	}
	public int getSelectPageNo2() {
		return selectPageNo2;
	}
	public void setSelectPageNo2(int selectPageNo2) {
		this.selectPageNo2 = selectPageNo2;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	
	
	
	
	
	
	

}
