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
	List<Map<String, String>> getSalesMonthList(PreChartParamDTO preChartParamDTO);
	//List<String> getSalesMonthList(String changeBusinessNo);
	

	// business_no 가지고 같은 동네, 같은 업종의 가게들의 월 평균 매출 얻기
	List<Map<String, String>> getAllSalesMonthList(PreChartParamDTO preChartParamDTO);

	// business_no 가지고 우리 가게 인기메뉴 구하기
	List<Map<String,String>> getMyPopularityMenu(PreChartParamDTO preChartParamDTO);

	// business_no 가지고 다른 가게 인기메뉴 구하기
	List<Map<String,String>> getOthersPopularityMenu(PreChartParamDTO preChartParamDTO);

	
//	// business_no 가지고 우리 가게 인기메뉴 구하기
//	List<String> getMyPopularityMenu(String changeBusinessNo);
//
//	// business_no 가지고 다른 가게 인기메뉴 구하기
//	List<String> getOthersPopularityMenu(String changeBusinessNo);
	
	// business_no 가지고 같은 업종, 같은 동네 점포수 구하기
	String getStoreCount(PreChartParamDTO preChartParamDTO);


	// business_no 가지고 상품별 판매 횟수 구하기.
	List<Map<String, String>> getMenuSalesCount(PreChartParamDTO preChartParamDTO);

	// business_no 가지고 상품별 순이익 구하기.
	List<Map<String, String>> getSalesBenefit(PreChartParamDTO preChartParamDTO);


	// business_no 여러개를 가지고 내가 가진 가게들의 각각의ㅏ 월매출 구하기
	List<Map<String, String>> getAllBusinessNoSalesMonthList(AllBusinessNoDTO allBusinessNoDTO);


	// 시간대별 판매 개수 구하기 (상품별 구분)
	List<Map<String, String>> getHourSalesCount(PreChartParamDTO preChartParamDTO);


	// open 시간 구하기
	String getSalesOpenTime(String business_no);

	// close 시간 구하기
	String getSalesCloseTime(String business_no);
	
	
	

}
