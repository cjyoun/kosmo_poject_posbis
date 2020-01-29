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

	
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	public List<Map<String,Object>> getResList(ReservationDTO reservationDTO){
		for(int i=0; i<reservationDTO.getChooseBusinessNo().length; i++) {
			System.out.println("reservationDTO 사업자 넘버 = = " + reservationDTO.getChooseBusinessNo()[i]);
		}
		List<Map<String,Object>> resList = this.sqlSession.selectList(
			"com.naver.erp.ResManagerDAO.getResList" // 실행할 SQL 구문의 위치 지정 
			,reservationDTO
			
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

		
		public List<Map<String, Object>> getResCntList(ResCntDTO resCntDTO){
			for(int i=0; i<resCntDTO.getChooseBusinessNo().length; i++) {
				System.out.println("사업자 넘버 = = " + resCntDTO.getChooseBusinessNo()[i]);
			}
			List<Map<String, Object>> resCntList = this.sqlSession.selectList(
				"com.naver.erp.ResManagerDAO.getResCntList" // 실행할 SQL 구문의 위치 지정 
				,resCntDTO
				
			);
			System.out.println("resCntListDAO===>"+resCntList);
			return resCntList;
		}
		
		// [1개 메뉴]리턴하는 메소드 선언

		public ReservationDTO getReservationDTO(int r_no) {
			System.out.println("getReservationDTO시작==>" + r_no);
			// [SqlSessionTemplate 객체]의 selectOne(~,~) 를 호출하여 1개의 메뉴 얻기
			ReservationDTO reservationDTO = this.sqlSession.selectOne(
					"com.naver.erp.ResManagerDAO.getReservationDTO"    // 실행할 SQL 구문의 위치 지정
					,r_no								// 실행할 SQL 구문에서 사용할 데이터 지정
			);
			return reservationDTO;
		}

		public List<Map<String,Object>> getResUpDel(ReservationDTO reservationDTO){
			System.out.println("resManagerDTO===>"+reservationDTO);
			List<Map<String,Object>> resUpDel = this.sqlSession.selectList(
				"com.naver.erp.ResManagerDAO.getResUpDel" // 실행할 SQL 구문의 위치 지정 
				,reservationDTO
				
			);
			System.out.println("resUpDelDAO===>"+resUpDel);
			return resUpDel;
		}
		
		@Override
		public int getResCnt(ReservationDTO reservationDTO) {
			int resCnt = this.sqlSession.selectOne(
					"com.naver.erp.ResManagerDAO.getResCnt"    // 실행할 SQL 구문의 위치 지정
					,reservationDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
			);
			return resCnt;
		}

		@Override
		public int updateRes(ReservationDTO reservationDTO) {
			int updateCnt = this.sqlSession.update(
					"com.naver.erp.ResManagerDAO.updateRes"    // 실행할 SQL 구문의 위치 지정
					,reservationDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
			);
			return updateCnt;
		}

		@Override
		public int deleteRes(ReservationDTO reservationDTO) {
			int deleteCnt = this.sqlSession.delete(
					"com.naver.erp.ResManagerDAO.deleteRes"    // 실행할 SQL 구문의 위치 지정
					,reservationDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
			);
			return deleteCnt;
		}
		
		//김수민
		public Map<String,String> getNoShowChartMap(ReservationDTO reservationDTO){
			Map<String,String> noShowChartMap = this.sqlSession.selectOne(
				"com.naver.erp.ResManagerDAO.getNoShowChartMap" // 실행할 SQL 구문의 위치 지정 
				,reservationDTO
				
			);
			return noShowChartMap;
		}


		public int getChangeSuccess(String r_no) {
			int updateChangeSuccess = this.sqlSession.update(
					"com.naver.erp.ResManagerDAO.getChangeSuccess" // 실행할 SQL 구문의 위치 지정 
					,r_no
			);
			System.out.println("updateChangeSuccess===>"+updateChangeSuccess);

			return updateChangeSuccess;
		}
		
		
		public int getChangeNoshow(String r_no) {
			int updateChangeNoshow = this.sqlSession.update(
					"com.naver.erp.ResManagerDAO.getChangeNoshow" // 실행할 SQL 구문의 위치 지정 
					,r_no
			);
			System.out.println("updateChangeSuccess===>"+updateChangeNoshow);

			return updateChangeNoshow;
		}
		
		
}
