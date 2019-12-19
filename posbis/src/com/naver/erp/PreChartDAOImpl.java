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
	
	


}
