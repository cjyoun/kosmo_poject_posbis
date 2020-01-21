package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class PreChartServiceImpl implements PreChartService{
   
   // 속성변수 선언 및 BoardDAO 인터페이스를 구현한 클래스 객체화 후 저장
   @Autowired
   private PreChartDAO preChartDAO;

//--------------------------------------------------------------------------------------------------   
  
   
   // user_id 를 가지고 u_no 얻기
	@Override
	public int getUserNo(String user_id) {
		System.out.println("service : "+user_id);
		int user_no = this.preChartDAO.getUserNo(user_id);
		
		return user_no;
	}
	
//--------------------------------------------------------------------------------------------------   
	
	// u_no을 가지고 business_no 과 business_name 얻기	
	@Override
	public List<Map<String, String>> getBusinessNoList(int user_no) {
		System.out.println("service : businessNoList 시작");
		List<Map<String,String>> businessNoList = this.preChartDAO.getBusinessNoList(user_no);
		System.out.println("service : businessNoList 끝"); 
		return businessNoList;
		
	}

	
	
//	@Override
//	public List<String> getBusinessNoList(int user_no) {
//		System.out.println("service : businessNoList 시작");
//		List<String> businessNoList = this.preChartDAO.getBusinessNoList(user_no);
//		System.out.println("service : businessNoList 끝"); 
//		return businessNoList;
//		
//	}
	
	
//--------------------------------------------------------------------------------------------------   
	
	// business_no 가지고 나의 가게 월매출 얻기
	@Override
	public List<Map<String, String>> getSalesMonthList(PreChartParamDTO preChartParamDTO) {
		System.out.println("service : getSalesMonthList 시작");
		List<Map<String,String>> salesMonthList = this.preChartDAO.getSalesMonthList(preChartParamDTO);
		System.out.println("service : getSalesMonthList 끝"); 
		return salesMonthList;
	}



//	@Override
//	public List<String> getSalesMonthList(String changeBusinessNo) {
//		System.out.println("service : getSalesMonthList 시작");
//		List<String> salesMonthList = this.preChartDAO.getSalesMonthList(changeBusinessNo);
//		System.out.println("service : getSalesMonthList 끝"); 
//		return salesMonthList;
//	}
	
	
	
//--------------------------------------------------------------------------------------------------   
	
	// business_no 가지고 같은 동네, 같은 업종의 가게들의 월 평균 매출 얻기
	@Override
	public List<Map<String, String>> getAllSalesMonthList(PreChartParamDTO preChartParamDTO) {
		System.out.println("service : getAllSalesMonthList 시작");
		List<Map<String,String>> allSalesMonthList = this.preChartDAO.getAllSalesMonthList(preChartParamDTO);
		System.out.println("service : getAllSalesMonthList 끝"); 
		return allSalesMonthList;
	}


	
//--------------------------------------------------------------------------------------------------   
	
	// business_no 가지고 우리 가게 인기메뉴 구하기	
	@Override
	public List<Map<String,String>> getMyPopularityMenu(PreChartParamDTO preChartParamDTO) {
	//public List<String> getMyPopularityMenu(String changeBusinessNo) {	
		System.out.println("service : getMyPopularityMenu 시작");
		List<Map<String,String>> myPopularityMenu = this.preChartDAO.getMyPopularityMenu(preChartParamDTO);
		//List<String> myPopularityMenu = this.preChartDAO.getMyPopularityMenu(changeBusinessNo);
		System.out.println("service : getMyPopularityMenu 끝"); 
		return myPopularityMenu;
	}
	
	

//--------------------------------------------------------------------------------------------------   

	// business_no 가지고 다른 가게 인기메뉴 구하기	
	@Override
	public List<Map<String,String>> getOthersPopularityMenu(PreChartParamDTO preChartParamDTO) {
	//public List<String> getOthersPopularityMenu(String changeBusinessNo) {	
		System.out.println("service : getOthersPopularityMenu 시작");
		List<Map<String,String>> othersPopularityMenu = this.preChartDAO.getOthersPopularityMenu(preChartParamDTO);
		//List<String> othersPopularityMenu = this.preChartDAO.getOthersPopularityMenu(changeBusinessNo);
		System.out.println("service : getOthersPopularityMenu 끝"); 
		return othersPopularityMenu;
	}
	
	
	
//--------------------------------------------------------------------------------------------------   
	// business_no 가지고 같은 업종, 같은 동네 점포수 구하기
	@Override
	public String getStoreCount(PreChartParamDTO preChartParamDTO) {
		System.out.println("service : getStoreCount 시작");
		String storeCount = this.preChartDAO.getStoreCount(preChartParamDTO);
		System.out.println("service : getStoreCount 끝"); 
		return storeCount;
	}

	
	
//--------------------------------------------------------------------------------------------------   
	// business_no 가지고 상품별 판매 횟수 구하기
	@Override
	public List<Map<String, String>> getMenuSalesCount(PreChartParamDTO preChartParamDTO) {
		System.out.println("service : getMenuSalesCount 시작");
		List<Map<String, String>> menuSalesCount = this.preChartDAO.getMenuSalesCount(preChartParamDTO);
		System.out.println("service : getMenuSalesCount 끝"); 
		return menuSalesCount;
	}
	
	
//--------------------------------------------------------------------------------------------------   
	// business_no 가지고 상품별 순이익 구하기
	@Override
	public List<Map<String, String>> getSalesBenefit(PreChartParamDTO preChartParamDTO) {
		System.out.println("service : getSalesBenefit 시작");
		List<Map<String, String>> salesBenefit = this.preChartDAO.getSalesBenefit(preChartParamDTO);
		System.out.println("service : getSalesBenefit 끝"); 
		return salesBenefit;
	}

//--------------------------------------------------------------------------------------------------   
	// business_no 여러개를 가지고 내가 가진 가게들의 각각의ㅏ 월매출 구하기
	@Override
	public List<Map<String, String>> getAllBusinessNoSalesMonthList(AllBusinessNoDTO allBusinessNoDTO) {
		System.out.println("service : getAllBusinessNoSalesMonthList 시작");
		List<Map<String, String>> allBusinessNoSalesMonthList = this.preChartDAO.getAllBusinessNoSalesMonthList(allBusinessNoDTO);
		System.out.println("service : getAllBusinessNoSalesMonthList 끝"); 
		return allBusinessNoSalesMonthList;
	}

	
//--------------------------------------------------------------------------------------------------   
	// 시간대별 판매 개수 구하기 (상품별 구분)
	@Override
	public List<Map<String, String>> getHourSalesCount(PreChartParamDTO preChartParamDTO) {

		List<Map<String, String>> hourSalesCount = this.preChartDAO.getHourSalesCount(preChartParamDTO);

		return hourSalesCount;
	}

	
	// open 시간 구하기
	@Override
	public String getSalesOpenTime(String business_no) {

		String salesOpenTime = this.preChartDAO.getSalesOpenTime(business_no);
		
		return salesOpenTime;
	}
	
	// close 시간 구하기
	@Override
	public String getSalesCloseTime(String business_no) {
		String salesCloseTime = this.preChartDAO.getSalesCloseTime(business_no);
		
		return salesCloseTime;
	}



   
}