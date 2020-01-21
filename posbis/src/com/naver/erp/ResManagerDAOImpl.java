package com.naver.erp;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResManagerDAOImpl implements ResManagerDAO{
	
	// 속변 sqlSession 선언하고[sqlSessionTemplate 객체]를 생성해 저장
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// [검색한 게시판 목록 개수] 리턴하는 메소드 선언
	public int getResListAllCnt(ResManagerDTO resManagerDTO) {
		int resListAllCnt = this.sqlSession.selectOne(
				"com.naver.erp.ResManagerDAO.getResListAllCnt"   // 실행할 SQL 구문의 위치 지정
				,resManagerDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		return resListAllCnt;
	}
	
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	public List<Map<String,String>> getResList(ResManagerDTO resManagerDTO){
		System.out.println("resManagerDTO===>"+resManagerDTO);
		List<Map<String,String>> resList = this.sqlSession.selectList(
			"com.naver.erp.ResManagerDAO.getResList" // 실행할 SQL 구문의 위치 지정 
			,resManagerDTO
			
		);
		System.out.println("resListDAO===>"+resList);
		return resList;
	}
	
	// user_id 를 가지고 u_no 얻기
	   @Override
	   public int getUserNo(String user_id) {
	      System.out.println(user_id);
	      System.out.println("getUserNo 메소드 시작");
	      int user_no = this.sqlSession.selectOne(
	             "com.naver.erp.ResManagerDAO.getUserNo"      // 실행할 SQL 구문의 위치 지정
	            , user_id    
	         );
	      System.out.println(user_no);

	      return user_no;
	   }
	
	   // u_no을 가지고 business_no 과 business_name 얻기
	   @Override
	   public List<Map<String, String>> getBusinessNoList(int user_no) {
	      System.out.println("DAO : businessNoList 시작");
	      System.out.println("user_no : " + user_no);
	      List<Map<String,String>> businessNoList = this.sqlSession.selectList(
	             "com.naver.erp.ResManagerDAO.getBusinessNoList"      // 실행할 SQL 구문의 위치 지정 
	            , user_no                      // 실행할 SQL 구문에서 사용할 데이터 지정
	      );
	      System.out.println("DAO : businessNoList 끝");
	      
	      return businessNoList;
	   }

		public int insertReservation(ReservationDTO reservationDTO) {
			int resRegCnt = this.sqlSession.insert(
					"com.naver.erp.ResManagerDAO.insertReservation"    // 실행할 SQL 구문의 위치 지정
					,reservationDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
			);
			System.out.println(resRegCnt);
			return resRegCnt;
	   }

		public List<Map<String,String>> getResCntList(ResManagerDTO resManagerDTO){
			System.out.println("resManagerDTO===>"+resManagerDTO);
			List<Map<String,String>> resCntList = this.sqlSession.selectList(
				"com.naver.erp.ResManagerDAO.getResCntList" // 실행할 SQL 구문의 위치 지정 
				,resManagerDTO
				
			);
			System.out.println("resCntListDAO===>"+resCntList);
			return resCntList;
		}
/*
		public List<String> getResCntList2(ResCntDTO resCntDTO){
		       List<String> resCntList2 = this.sqlSession.selectList(
		          "com.naver.erp.ResManagerDAO.resCntList2" // 실행할 SQL 구문의 위치 지정
		          ,resCntDTO   
		    );
		    System.out.println("DAO / resCntList2" + resCntList2);
		    return resCntList2;
		    }
*/		
		
		public List<Map<String, Object>> getResCntList2(ResCntDTO resCntDTO){
			System.out.println("resCntDTO===>"+resCntDTO);
			List<Map<String, Object>> resCntList2 = this.sqlSession.selectList(
				"com.naver.erp.ResManagerDAO.getResCntList2" // 실행할 SQL 구문의 위치 지정 
				,resCntDTO
				
			);
			System.out.println("resCntList2DAO===>"+resCntList2);
			return resCntList2;
		}
		
}
