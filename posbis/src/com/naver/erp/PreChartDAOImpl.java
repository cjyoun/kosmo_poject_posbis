package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



// @Repository 를 붙임으로써 DAO 클래스 임을 지정하게되고 bean 태그로 자동 등록된다.
//==================================================================================================================
@Repository
public class PreChartDAOImpl implements PreChartDAO{
	
	// 속변 sqlSession 선언하고 , SqlSessionTemplate 객체를 생성해 저장.
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	
//--------------------------------------------------------------------------------------------------   
	
	// user_id 를 가지고 u_no 얻기
	@Override
	public int getUserNo(String user_id) {
		System.out.println(user_id);
		System.out.println("getUserNo 메소드 시작");
		int user_no = this.sqlSession.selectOne(
				 "com.naver.erp.PreChartDAO.getUserNo"		// 실행할 SQL 구문의 위치 지정
				, user_id 	
			);
		System.out.println(user_no);


		return user_no;
	}

//--------------------------------------------------------------------------------------------------   

	
	// u_no을 가지고 business_no 과 business_name 얻기
	@Override
	public List<Map<String, String>> getBusinessNoList(int user_no) {
		System.out.println("DAO : businessNoList 시작");
		System.out.println("user_no : " + user_no);
		List<Map<String,String>> businessNoList = this.sqlSession.selectList(
				 "com.naver.erp.PreChartDAO.getBusinessNoList"		// 실행할 SQL 구문의 위치 지정 
				, user_no 							// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		System.out.println("DAO : businessNoList 끝");
		
		return businessNoList;
	}


//	
//	@Override
//	public List<String> getBusinessNoList(int user_no) {
//		System.out.println("DAO : businessNoList 시작");
//		System.out.println("user_no : " + user_no);
//		List<String> businessNoList = this.sqlSession.selectList(
//				 "com.naver.erp.PreChartDAO.getBusinessNoList"		// 실행할 SQL 구문의 위치 지정 
//				, user_no 							// 실행할 SQL 구문에서 사용할 데이터 지정
//		);
//		System.out.println("DAO : businessNoList 끝");
//		
//		return businessNoList;
//	}


	
//--------------------------------------------------------------------------------------------------   
	
	// business_no 가지고 나의 가게 월매출 얻기
	@Override
	public List<Map<String, String>> getSalesMonthList(String changeBusinessNo) {
		System.out.println("DAO : getSalesMonthList 시작");
		System.out.println("changeBusinessNo : " + changeBusinessNo);
		List<Map<String,String>> salesMonthList = this.sqlSession.selectList(
				 "com.naver.erp.PreChartDAO.getSalesMonthList"		// 실행할 SQL 구문의 위치 지정 
				, changeBusinessNo 							// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		System.out.println("DAO : getSalesMonthList 끝");
		
		return salesMonthList;
	}


//	@Override
//	public List<String> getSalesMonthList(String changeBusinessNo) {
//		System.out.println("DAO : getSalesMonthList 시작");
//		System.out.println("changeBusinessNo : " + changeBusinessNo);
//		List<String> salesMonthList = this.sqlSession.selectList(
//				 "com.naver.erp.PreChartDAO.getSalesMonthList"		// 실행할 SQL 구문의 위치 지정 
//				, changeBusinessNo 							// 실행할 SQL 구문에서 사용할 데이터 지정
//		);
//		System.out.println( "salesMonthList.get(\"business_no\")=>" + salesMonthList.get(0));
//		System.out.println("DAO : getSalesMonthList 끝");
//		
//		return salesMonthList;
//	}
//	
	

//--------------------------------------------------------------------------------------------------   

	// business_no 가지고 같은 동네, 같은 업종의 가게들의 월 평균 매출 얻기	
	@Override
	public List<Map<String, String>> getAllSalesMonthList(String changeBusinessNo) {
		System.out.println("DAO : getAllSalesMonthList 시작");
		System.out.println("changeBusinessNo : " + changeBusinessNo);
		List<Map<String,String>> allSalesMonthList = this.sqlSession.selectList(
				 "com.naver.erp.PreChartDAO.getAllSalesMonthList"		// 실행할 SQL 구문의 위치 지정 
				, changeBusinessNo 							// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		System.out.println("DAO : getAllSalesMonthList 끝");
		
		return allSalesMonthList;
	}
	
	
	

//--------------------------------------------------------------------------------------------------   

	// business_no 가지고 우리가게 인기메뉴 구하기
	@Override
	public List<Map<String,String>> getMyPopularityMenu(String changeBusinessNo) {
	//public List<String> getMyPopularityMenu(String changeBusinessNo) {
		System.out.println("DAO : getMyPopularityMenu 시작");
		System.out.println("changeBusinessNo : " + changeBusinessNo);
		List<Map<String,String>> myPopularityMenu = this.sqlSession.selectList(
				 "com.naver.erp.PreChartDAO.getMyPopularityMenu"		// 실행할 SQL 구문의 위치 지정 
				, changeBusinessNo 							// 실행할 SQL 구문에서 사용할 데이터 지정
		);
//		List<String> myPopularityMenu = this.sqlSession.selectList(
//				 "com.naver.erp.PreChartDAO.getMyPopularityMenu"		// 실행할 SQL 구문의 위치 지정 
//				, changeBusinessNo 							// 실행할 SQL 구문에서 사용할 데이터 지정
//		);
		System.out.println("DAO : getMyPopularityMenu 끝");
		
		return myPopularityMenu;
	}
	
	
//--------------------------------------------------------------------------------------------------   

	// business_no 가지고 다른가게 인기메뉴 구하기
	@Override
	public List<Map<String,String>> getOthersPopularityMenu(String changeBusinessNo) {
	//public List<String> getOthersPopularityMenu(String changeBusinessNo) {
		System.out.println("DAO : getOthersPopularityMenu 시작");
		System.out.println("changeBusinessNo : " + changeBusinessNo);
		List<Map<String,String>> othersPopularityMenu = this.sqlSession.selectList(
				 "com.naver.erp.PreChartDAO.getOthersPopularityMenu"		// 실행할 SQL 구문의 위치 지정 
				, changeBusinessNo 							// 실행할 SQL 구문에서 사용할 데이터 지정
		);
//		List<String> othersPopularityMenu = this.sqlSession.selectList(
//		 "com.naver.erp.PreChartDAO.getOthersPopularityMenu"		// 실행할 SQL 구문의 위치 지정 
//		, changeBusinessNo 							// 실행할 SQL 구문에서 사용할 데이터 지정
//		);

		
		
		System.out.println("DAO : getOthersPopularityMenu 끝");
		
		return othersPopularityMenu;
	}
			
	
//--------------------------------------------------------------------------------------------------   
	// business_no 가지고 같은 업종, 같은 동네 점포수 구하기
	@Override
	public String getStoreCount(String changeBusinessNo) {
		System.out.println("DAO : getStoreCount 시작");
		String storeCount = this.sqlSession.selectOne(
				 "com.naver.erp.PreChartDAO.getStoreCount"		// 실행할 SQL 구문의 위치 지정 
				, changeBusinessNo 							// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		System.out.println("DAO : getStoreCount 끝"); 
		return storeCount;
	}
	
	

//--------------------------------------------------------------------------------------------------   
	// business_no 가지고 상품별 판매 횟수 구하기.
	@Override
	public List<Map<String, String>> getMenuSalesCount(String changeBusinessNo) {
		System.out.println("DAO : getMenuSalesCount 시작");
		System.out.println("changeBusinessNo : " + changeBusinessNo);
		List<Map<String,String>> menuSalesCount = this.sqlSession.selectList(
				 "com.naver.erp.PreChartDAO.getMenuSalesCount"		// 실행할 SQL 구문의 위치 지정 
				, changeBusinessNo 							// 실행할 SQL 구문에서 사용할 데이터 지정
		);		
		
		System.out.println("DAO : getMenuSalesCount 끝");
		
		return menuSalesCount;
	}	

	
	
//--------------------------------------------------------------------------------------------------   
	// business_no 가지고 상품별 순이익 구하기.
	@Override
	public List<Map<String, String>> getSalesBenefit(String changeBusinessNo) {
		System.out.println("DAO : getSalesBenefit 시작");
		System.out.println("changeBusinessNo : " + changeBusinessNo);
		List<Map<String,String>> salesBenefit = this.sqlSession.selectList(
				 "com.naver.erp.PreChartDAO.getSalesBenefit"		// 실행할 SQL 구문의 위치 지정 
				, changeBusinessNo 							// 실행할 SQL 구문에서 사용할 데이터 지정
		);		
		
		System.out.println("DAO : getSalesBenefit 끝");
		
		return salesBenefit;
	}	
	
	
	

}
