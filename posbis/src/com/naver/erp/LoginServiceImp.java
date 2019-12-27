package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LoginServiceImp implements LoginService {
	
		@Autowired
		private LoginDAO loginDAO;

		//---------------------------------------------------------------------------------
		///로그인 아이디 암호 개수-------------------------------------------------------------------
		//---------------------------------------------------------------------------------
		public int getAdminCnt(Map<String, String> admin_id_pwd) {
			System.out.println("serviceimp");
			int adminCnt = this.loginDAO.getAdminCnt(admin_id_pwd);
			return adminCnt;
		};
 
		
 
		//---------------------------------------------------------------------------------
		//아이디 중복확인-------------------------------------------------------------------
		//---------------------------------------------------------------------------------

		public int getJoinIDCnt(Map<String, String> join_id) {
			
			int join_idCnt = this.loginDAO.getJoinIDCnt(join_id);
			return join_idCnt;
		};
 
	
		//---------------------------------------------------------------------------------
		//주소 구 데이터 가져오기----------------------------------------------------------------------------------
		//---------------------------------------------------------------------------------
		public List<Map<String,String>> getAddrListGu(){
			List<Map<String,String>> addrListGu = this.loginDAO.getAddrListGu();
		      return addrListGu;
		};
		
		//---------------------------------------------------------------------------------
		//주소 동 데이터 가져오기----------------------------------------------------------------------------------
		//---------------------------------------------------------------------------------
		public List<String> getAddrListDong(String addr_gu){
			List<String> addrListDong = this.loginDAO.getAddrListDong(addr_gu);
		      return addrListDong;
		};
		
		
		
		//---------------------------------------------------------------------------------
		//업종 타입 1 데이터 가져오기----------------------------------------------------------------------------------
		//---------------------------------------------------------------------------------
		public List<Map<String,String>> getbusinessTypeList1(){
			List<Map<String,String>> businessTypeList1 = this.loginDAO.getbusinessTypeList1();
		      return businessTypeList1;
		};
   
		//---------------------------------------------------------------------------------
		//업종 타입 2 데이터 가져오기----------------------------------------------------------------------------------
		//---------------------------------------------------------------------------------
		public List<String> getbusinessTypeList2(String business_type_name1){
			List<String> businessTypeList2 = this.loginDAO.getbusinessTypeList2(business_type_name1);
		      return businessTypeList2;
		};
   
		
		//---------------------------------------------------------------------------------
		//회원가입 등록 대표자 정보----------------------------------------------------------------------------------
		//---------------------------------------------------------------------------------
		public int insertJoinUser(joinDTO joinDTO) {

			//회원가입 등록 사업장 정보----------------------------------------------------------------------------------

			int insertJoinCnt = this.loginDAO.insertJoinUser(joinDTO);
			
			
			int insertJoinBusinessInfoCnt=this.loginDAO.insertJoinBusinessInfo(joinDTO);
			if(insertJoinBusinessInfoCnt==0) return -1;
			
			return insertJoinCnt;
		};

		//---------------------------------------------------------------------------------
		//회원가입 등록 사업장 정보----------------------------------------------------------------------------------
		//---------------------------------------------------------------------------------
	/*
	 * public int insertJoinBusinessInfo(joinDTO joinDTO) { int
	 * insertJoinBusinessInfoCnt = this.loginDAO.insertJoinBusinessInfo(joinDTO);
	 * if(insertJoinBusinessInfoCnt==0) {return -1;}
	 * 
	 * 
	 * };
	 */
		//---------------------------------------------------------------------------------
		//탈퇴시 아이디 암호 조회 및 삭제 --------------------------------------------------------------------------------
		//DAO 순서대로 호출하기
		
		//---------------------------------------------------------------------------------
		public int deleteUserInfo(Map<String, String> user_id_pwd) {
			
		
		int deleteSalesBusiCnt=this.loginDAO.deleteSalesBusi(user_id_pwd);
		 if(deleteSalesBusiCnt==0) {return -1;}
		 
		/*
		 * int deleteSalesMenuCnt=this.loginDAO.deleteSalesMenu(user_id_pwd);
		 * if(deleteSalesMenuCnt==0) {return -2;}
		 */
			
		int deleteMenuCnt=this.loginDAO.deleteMenu(user_id_pwd);
		if(deleteMenuCnt==0) {return -3;}
		
		int deletebusinessInfoCnt=this.loginDAO.deletebusinessInfo(user_id_pwd);
		if(deletebusinessInfoCnt==0) {return -4;}
		
		int deleteCardCnt=this.loginDAO.deleteCard(user_id_pwd);
		if(deleteCardCnt==0) {return -5;}
		
		int deleteQnaCnt=this.loginDAO.deleteQna(user_id_pwd);
		if(deleteQnaCnt==0) {return -6;}

		int deleteUserInfoCnt=this.loginDAO.deleteUserInfo(user_id_pwd);
		return deleteUserInfoCnt;
			
		};
		
		
		//---------------------------------------------------------------------------------
		///사업자 번호 개수-------------------------------------------------------------------
		//---------------------------------------------------------------------------------
		public int getBusinessnoCnt(Map<String, String> CheckBusiness_no) {
			System.out.println("loginserviceImp"+CheckBusiness_no);
			
			int BusinessnoCnt = this.loginDAO.getBusinessnoCnt(CheckBusiness_no);
			return BusinessnoCnt;
		};
		
		
		//---------------------------------------------------------------------------------
		///아이디 암호 사업자번호 좋후  개수------------------------------------------------------------------
		//  메소드 순서 중요
		//---------------------------------------------------------------------------------
		public int getfindIDPasswordCnt(Map<String, String> FindIdPwd ) {
			System.out.println("loginserviceImp"+FindIdPwd);
			
			int FindBusinessNoCnt=this.loginDAO.getfindBusinessNoCnt(FindIdPwd);
			if(FindBusinessNoCnt==0) {return -1;}
			
			
			int FindIDPasswordCnt = this.loginDAO.getfindIDPasswordCnt(FindIdPwd);	
			if(FindIDPasswordCnt==0) {return -2;}
			
			return FindIDPasswordCnt;

			
		};
		
		public searchIDPwdDTO getfindIDPwd(Map<String, String> FindIdPwd ) {
			System.out.println("loginserviceImp"+FindIdPwd);
			
			searchIDPwdDTO findIDPassword = this.loginDAO.getfindIDPwd(FindIdPwd);
			return findIDPassword;
			
			
		};
		
		
		//마이페이지 데이터 가져오기---------------------------------------------------------------------------------- 
		public MyPageDTO getmypageList() {
			
			MyPageDTO mypageList = this.loginDAO.getmypageList();
		    return mypageList;
			
		}


		// business_no 에 따른 나의 정보 얻어오기.
		@Override
		public List<Map<String, String>> getMyInfo(String changeBusinessNo) {
			List<Map<String, String>> myInfo = this.loginDAO.getMyInfo(changeBusinessNo);
			
			return myInfo;
		};
		
		 
		
		// business_no에 따른 나의 정보, 가게 정보 얻어오기 (회원정보 수정 부분)
		@Override
		public List<Map<String, String>> getMyNStoreInfo(String changeBusinessNo) {
			List<Map<String, String>> myNStoreInfo = this.loginDAO.getMyNStoreInfo(changeBusinessNo);
			
			return myNStoreInfo;
		};
		
		
}
