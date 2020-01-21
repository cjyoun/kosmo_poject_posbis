package com.naver.erp;

import java.util.List;
import java.util.Map;

public class PreSearchDTO {
	
	//검색조건
	private String business_type_name1;
	private String business_type_name2;
	private String addr_gu1;
	private String addr_gu2;
	private String addr_dong1;
	private int month_sales=0;
	private int selectPageNo=1;
	private int rowCntPerPage=10;
	private String sort="ranking asc";
	
	private List<Map<String,String>> addrGuList;
	private String strGu;

	
	//검색결과
	private List<Map<String,String>> preResultList;
	private List<Map<String,String>> preResultMAPList;
	private int preResultAllCnt=0;
	
	
	
	public String getStrGu() {
		return strGu;
	}
	public void setStrGu(String strGu) {
		this.strGu = strGu;
	}
	public String getBusiness_type_name1() {
		return business_type_name1;
	}
	public void setBusiness_type_name1(String business_type_name1) {
		this.business_type_name1 = business_type_name1;
	}
	public String getBusiness_type_name2() {
		return business_type_name2;
	}
	public void setBusiness_type_name2(String business_type_name2) {
		this.business_type_name2 = business_type_name2;
	}
	public String getAddr_gu1() {
		return addr_gu1;
	}
	public void setAddr_gu1(String addr_gu1) {
		this.addr_gu1 = addr_gu1;
	}
	public String getAddr_gu2() {
		return addr_gu2;
	}
	public void setAddr_gu2(String addr_gu2) {
		this.addr_gu2 = addr_gu2;
	}
	public String getAddr_dong1() {
		return addr_dong1;
	}
	public void setAddr_dong1(String addr_dong1) {
		this.addr_dong1 = addr_dong1;
	}
	public int getMonth_sales() {
		return month_sales;
	}
	public void setMonth_sales(int month_sales) {
		this.month_sales = month_sales;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public List<Map<String, String>> getAddrGuList() {
		return addrGuList;
	}
	public void setAddrGuList(List<Map<String, String>> addrGuList) {
		this.addrGuList = addrGuList;
	}
	public List<Map<String, String>> getPreResultList() {
		return preResultList;
	}
	public void setPreResultList(List<Map<String, String>> preResultList) {
		this.preResultList = preResultList;
	}
	public List<Map<String, String>> getPreResultMAPList() {
		return preResultMAPList;
	}
	public void setPreResultMAPList(List<Map<String, String>> preResultMAPList) {
		this.preResultMAPList = preResultMAPList;
	}
	public int getPreResultAllCnt() {
		return preResultAllCnt;
	}
	public void setPreResultAllCnt(int preResultAllCnt) {
		this.preResultAllCnt = preResultAllCnt;
	}
	
	
	


	
	
	

}