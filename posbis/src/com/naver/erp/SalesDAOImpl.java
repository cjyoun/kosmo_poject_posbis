package com.naver.erp;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDAOImpl implements SalesDAO{

	//속번 sqlSession 선언하고, [SqlSessionTemplate 객체]를 생성해 저장.
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//[검색한 게시판 목록] 리턴하는 메소드 선언
	public List<Map<String,String>> getSalesList(SalesSearchDTO salesSearchDTO){
	    //System.out.println("DAO : getSalesList 메소드 시작");
		List<Map<String,String>> salesList = this.sqlSession.selectList(
				"com.naver.erp.SalesDAO.getSalesList"	//실행할 SQL 구문의 위치 지정
				,salesSearchDTO							//실행할 SQL 구문에서 사용할 데이터 지정
			);
	    //System.out.println("DAO : getSalesList 메소드 끝");
				return salesList;
	}
	
	
	//[검색한 게시판 목록 개수] 리턴하는 메소드 선언
	public int getSalesListAllCnt(SalesSearchDTO salesSearchDTO) {		//{ 앞에 throws Exception 자동 삽입됨
		int salesListAllCnt=this.sqlSession.selectOne(
				"com.naver.erp.SalesDAO.getSalesListAllCnt"	//실행할 SQL 구문의 위치 지정
				,salesSearchDTO							//실행할 SQL 구문에서 사용할 데이터 지정
				);
	    //System.out.println("DAO: salesListAllCnt => " + salesListAllCnt);
		return salesListAllCnt;
	}
						
						//[검색한 게시판 목록] 리턴하는 메소드 선언
						public List<Map<String,String>> getMenuSalesList(MenuSalesSearchDTO menuSalesSearchDTO){
						    //System.out.println("DAO : getSalesList 메소드 시작");
							List<Map<String,String>> menuSalesList = this.sqlSession.selectList(
									"com.naver.erp.SalesDAO.getMenuSalesList"	//실행할 SQL 구문의 위치 지정
									,menuSalesSearchDTO							//실행할 SQL 구문에서 사용할 데이터 지정
								);
						    //System.out.println("DAO : getSalesList 메소드 끝");
									return menuSalesList;
						}
						
						
						//[검색한 게시판 목록 개수] 리턴하는 메소드 선언
						public int getMenuSalesListAllCnt(MenuSalesSearchDTO menuSalesSearchDTO) {		//{ 앞에 throws Exception 자동 삽입됨
							int menuSalesListAllCnt=this.sqlSession.selectOne(
									"com.naver.erp.SalesDAO.getMenuSalesListAllCnt"	//실행할 SQL 구문의 위치 지정
									,menuSalesSearchDTO							//실행할 SQL 구문에서 사용할 데이터 지정
									);
						    //System.out.println("DAO: salesListAllCnt => " + salesListAllCnt);
							return menuSalesListAllCnt;
						}
						
	
	 
	   // user_id 를 가지고 u_no 얻기
	   @Override
	   public int getUserNo(String user_id) {
	      //System.out.println(user_id);
	      //System.out.println("getUserNo 메소드 시작");
	      int user_no = this.sqlSession.selectOne(
	             "com.naver.erp.SalesDAO.getUserNo"      // 실행할 SQL 구문의 위치 지정
	            , user_id    
	         );
	      //System.out.println(user_no);

	      return user_no;
	   }

	//--------------------------------------------------------------------------------------------------   

	   // u_no을 가지고 business_no 과 business_name 얻기
	   @Override
	   public List<Map<String, String>> getBusinessNoList(int user_no) {
	      //System.out.println("DAO : businessNoList 시작");
	      //System.out.println("user_no : " + user_no);
	      List<Map<String,String>> businessNoList = this.sqlSession.selectList(
	             "com.naver.erp.SalesDAO.getBusinessNoList"      // 실행할 SQL 구문의 위치 지정 
	            , user_no                      // 실행할 SQL 구문에서 사용할 데이터 지정
	      );
	      //System.out.println("DAO : businessNoList 끝");
	      
	      return businessNoList;
	   }
	   
	   
		// 홈페이지 매출 현황
	   public List<Map<String, String>> getSalesNow(int u_no){
		      List<Map<String,String>> salesNow = this.sqlSession.selectList(
		             "com.naver.erp.SalesDAO.getSalesNow"      // 실행할 SQL 구문의 위치 지정 
		            , u_no                      // 실행할 SQL 구문에서 사용할 데이터 지정
		      );
		      //System.out.println("DAO : businessNoList 끝");
		      
		      return salesNow;
		   
	   }
}
