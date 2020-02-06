package com.naver.erp;
import java.util.List;
import java.util.Map;

//[DAO 인터페이스] 선언
public interface SalesDAO {
	
	//[검색한 판매목록] 리턴하는 메소드 선언
	List<Map<String,String>> getSalesList(SalesSearchDTO salesSearchDTO);
	
	//[검색한 판매목록 개수] 리턴하는 메소드 선언
	int getSalesListAllCnt(SalesSearchDTO salesSearchDTO);
	
	
	Map<String,String> getSalesSum(SalesSearchDTO salesSearchDTO);
	
	
	
				//[검색한 판매목록] 리턴하는 메소드 선언
				List<Map<String,String>> getMenuSalesList(MenuSalesSearchDTO menuSalesSearchDTO);
				
				//[검색한 판매목록 개수] 리턴하는 메소드 선언
				int getMenuSalesListAllCnt(MenuSalesSearchDTO menuSalesSearchDTO);

				Map<String,String> getMenuSalesSum(MenuSalesSearchDTO menuSalesSearchDTO);
	 
	// user_id 를 가지고 u_no 얻기
	int getUserNo(String user_id);

	//--------------------------------------------------------------------------------------------------   
	// u_no을 가지고 business_no 과 business_name 얻기
	List<Map<String, String>> getBusinessNoList(int u_no);
	


	// 홈페이지 매출 현황
	List<Map<String, String>> getSalesNow(int u_no);
	// 홈페이지 매출 현황
	List<Map<String, String>> getSalesWeek(int u_no);
	
	
	int insertSales(SalesDTO salesDTO);
	
	
	// 마케팅폼!! 새로한거 !!!!!!!
	// 세트메뉴 리스트 리턴하는 메소드 선언
	List<Map<String,String>> getSetMenuList(MarketingDTO marketingDTO);

	List<Map<String, String>> getSetMenuListChart(MarketingDTO marketingDTO);
	
}
