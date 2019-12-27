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
	public List<Map<String, String>> getSalesMonthList(String changeBusinessNo) {
		System.out.println("service : getSalesMonthList 시작");
		List<Map<String,String>> salesMonthList = this.preChartDAO.getSalesMonthList(changeBusinessNo);
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
	public List<Map<String, String>> getAllSalesMonthList(String changeBusinessNo) {
		System.out.println("service : getAllSalesMonthList 시작");
		List<Map<String,String>> allSalesMonthList = this.preChartDAO.getAllSalesMonthList(changeBusinessNo);
		System.out.println("service : getAllSalesMonthList 끝"); 
		return allSalesMonthList;
	}


	
//--------------------------------------------------------------------------------------------------   
	
	// business_no 가지고 우리 가게 인기메뉴 구하기	
	@Override
	public List<Map<String,String>> getMyPopularityMenu(String changeBusinessNo) {
	//public List<String> getMyPopularityMenu(String changeBusinessNo) {	
		System.out.println("service : getMyPopularityMenu 시작");
		List<Map<String,String>> myPopularityMenu = this.preChartDAO.getMyPopularityMenu(changeBusinessNo);
		//List<String> myPopularityMenu = this.preChartDAO.getMyPopularityMenu(changeBusinessNo);
		System.out.println("service : getMyPopularityMenu 끝"); 
		return myPopularityMenu;
	}
	
	

//--------------------------------------------------------------------------------------------------   

	// business_no 가지고 다른 가게 인기메뉴 구하기	
	@Override
	public List<Map<String,String>> getOthersPopularityMenu(String changeBusinessNo) {
	//public List<String> getOthersPopularityMenu(String changeBusinessNo) {	
		System.out.println("service : getOthersPopularityMenu 시작");
		List<Map<String,String>> othersPopularityMenu = this.preChartDAO.getOthersPopularityMenu(changeBusinessNo);
		//List<String> othersPopularityMenu = this.preChartDAO.getOthersPopularityMenu(changeBusinessNo);
		System.out.println("service : getOthersPopularityMenu 끝"); 
		return othersPopularityMenu;
	}
	
	
	
//--------------------------------------------------------------------------------------------------   
	// business_no 가지고 같은 업종, 같은 동네 점포수 구하기
	@Override
	public String getStoreCount(String changeBusinessNo) {
		System.out.println("service : getStoreCount 시작");
		String storeCount = this.preChartDAO.getStoreCount(changeBusinessNo);
		System.out.println("service : getStoreCount 끝"); 
		return storeCount;
	}

	
	
//--------------------------------------------------------------------------------------------------   
	// business_no 가지고 상품별 판매 횟수 구하기
	@Override
	public List<Map<String, String>> getMenuSalesCount(String changeBusinessNo) {
		System.out.println("service : getMenuSalesCount 시작");
		List<Map<String, String>> menuSalesCount = this.preChartDAO.getMenuSalesCount(changeBusinessNo);
		System.out.println("service : getMenuSalesCount 끝"); 
		return menuSalesCount;
	}
	
	
//--------------------------------------------------------------------------------------------------   
	// business_no 가지고 상품별 순이익 구하기
	@Override
	public List<Map<String, String>> getSalesBenefit(String changeBusinessNo) {
		System.out.println("service : getSalesBenefit 시작");
		List<Map<String, String>> salesBenefit = this.preChartDAO.getSalesBenefit(changeBusinessNo);
		System.out.println("service : getSalesBenefit 끝"); 
		return salesBenefit;
	}

   
}