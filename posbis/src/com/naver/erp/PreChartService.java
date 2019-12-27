package com.naver.erp;

import java.util.List;
import java.util.Map;

//-----------------------------------------------------------------
// [BoardService 인터페이스] 선언
//----------------------------------------------------------------

public interface PreChartService {
	
	
	// user_id 를 가지고 u_no 얻기
	int getUserNo(String user_id);

	
	// u_no을 가지고 business_no 과 business_name 얻기
	List<Map<String, String>> getBusinessNoList(int user_no);
	// List<String> getBusinessNoList(int user_no);

	
	// business_no 가지고 나의 가게 월매출 얻기
	List<Map<String, String>> getSalesMonthList(String changeBusinessNo);
	//List<String> getSalesMonthList(String changeBusinessNo);
	

	// business_no 가지고 같은 동네, 같은 업종의 가게들의 월 평균 매출 얻기
	List<Map<String, String>> getAllSalesMonthList(String changeBusinessNo);

	// business_no 가지고 우리 가게 인기메뉴 구하기
	List<Map<String,String>> getMyPopularityMenu(String changeBusinessNo);

	// business_no 가지고 다른 가게 인기메뉴 구하기
	List<Map<String,String>> getOthersPopularityMenu(String changeBusinessNo);

	
//	// business_no 가지고 우리 가게 인기메뉴 구하기
//	List<String> getMyPopularityMenu(String changeBusinessNo);
//
//	// business_no 가지고 다른 가게 인기메뉴 구하기
//	List<String> getOthersPopularityMenu(String changeBusinessNo);
	
	// business_no 가지고 같은 업종, 같은 동네 점포수 구하기
	String getStoreCount(String changeBusinessNo);


	// business_no 가지고 상품별 판매 횟수 구하기.
	List<Map<String, String>> getMenuSalesCount(String changeBusinessNo);

	// business_no 가지고 상품별 순이익 구하기.
	List<Map<String, String>> getSalesBenefit(String changeBusinessNo);
	
	
	

}
