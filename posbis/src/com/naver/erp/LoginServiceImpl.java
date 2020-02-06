package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	
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
		//회원가입 등록 대표자, 사업장, 운영시간 정보----------------------------------------------------------------------------------
		//---------------------------------------------------------------------------------
		public int insertJoinUser(JoinDTO joinDTO) {

			//회원가입 등록 유저 정보
			int insertJoinCnt = this.loginDAO.insertJoinUser(joinDTO);
			//회원가입 등록 사업장 정보
			System.out.println("Service insertJoinBusinessInfoCnt");
			int insertJoinBusinessInfoCnt=this.loginDAO.insertJoinBusinessInfo(joinDTO);
			//회원가입 등록 운영시간 정보
			int insertJoinSalesTime=this.loginDAO.insertJoinSalesTime(joinDTO);
			

			System.out.println("Service insertJoinBusinessInfoCnt========" + insertJoinBusinessInfoCnt);
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
				//탈퇴시 아이디 암호 조회 및 삭제 --------------------------------------------------------------------------------
				// 성유진 ServiceImpl
				public int deleteUserInfo(Map<String, String> user_id_pwd) {
			
					int deleteUserInfoCnt=this.loginDAO.deleteUserInfo(user_id_pwd);
					return deleteUserInfoCnt;
					
				};
				// 성유진 ServiceImpl 끝
		
		
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
		
		public SearchIDPwdDTO getfindIDPwd(Map<String, String> FindIdPwd ) {
			System.out.println("loginserviceImp"+FindIdPwd);
			
			SearchIDPwdDTO findIDPassword = this.loginDAO.getfindIDPwd(FindIdPwd);
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
		}


		// 등급 코드 얻기.
		@Override
		public String getRankCode(String user_id) {
			String rank_code = this.loginDAO.getRankCode(user_id);
			return rank_code;
		}


		// 유저 정보 업데이트
		@Override
		public int updateInfoUser(UpdateInfoDTO updateInfoDTO) {
			int updateInfoUserCnt = this.loginDAO.updateInfoUser(updateInfoDTO);
			return updateInfoUserCnt;
		};
		
		
		// 가게 정보 업데이트
		@Override
		public int updateInfoBusiness(UpdateInfoDTO updateInfoDTO) {
			int updateInfoBusinessCnt = this.loginDAO.updateInfoBusiness(updateInfoDTO);
			return updateInfoBusinessCnt;
		}
		
		// 가게 영업시간 업데이트	=======================김수민
		@Override
		public int updateSalesTime(UpdateInfoDTO updateInfoDTO) {
			int updateSalesTimeCnt = this.loginDAO.updateSalesTime(updateInfoDTO);
			return updateSalesTimeCnt;
		}
		
		
		// 카드 갯수 얻기
		@Override
		public int getCardCnt(int u_no) {
			int cardCnt = this.loginDAO.getCardCnt(u_no);
			return cardCnt;
		};
		
		// 카드 지우기
		@Override
		public int deleteinfoCard(int u_no) {
			int deleteCard = this.loginDAO.deleteinfoCard(u_no);
			return deleteCard;
		};
		
		
		// 카드 생성하기
		@Override
		public int insertCard(CardDTO cardDTO) {
			int insertCard = this.loginDAO.insertCard(cardDTO);
			return insertCard;
		};
		
		// 카드 등록 시 유저 등급 업데이트 (프리미엄)
		@Override
		public int updateRank(int u_no) {
			int updateRank = this.loginDAO.updateRank(u_no);
			return updateRank;
		};
		
		// 카드 등록 시 유저 등급 업데이트 (일반)
		@Override
		public int updateRank2(int u_no) {
			int updateRank2 = this.loginDAO.updateRank2(u_no);
			return updateRank2;
		};
		
		

		// 내가게 정보 가져오기/////////////////////////////////////////////////////////이정숙꺼///////////////////////////////////////////////////////////////////////////
		public List<Map<String, String>> getMyStoreInfoList(MyStoreInfoDTO myStoreInfoDTO){
			List<Map<String, String>> myStoreInfoList = this.loginDAO.getMyStoreInfoList(myStoreInfoDTO);
			return myStoreInfoList;
		};
		public int getMyStoreInfoAllCnt(MyStoreInfoDTO myStoreInfoDTO){
			int myStoreInfoAllCnt = this.loginDAO.getMyStoreInfoAllCnt(myStoreInfoDTO);
			return myStoreInfoAllCnt;
		};
		// 내가게 정보 가져오기///////////////////////////끝//////////////////////////////이정숙꺼///////////////////////////////////////////////////////////////////////////
		
		
	//========================================김수민============================================	
		//유저의 현재 비밀번호 가져오기
		@Override
		public String getUserPwd(int u_no) {
			String userPwd =this.loginDAO.getUserPwd(u_no);
			return userPwd;
		};
	//==========================================================================================
		

		public int insertBusi(BusiInfoDTO busiInfoDTO) {
			int pwdCnt=this.loginDAO.getPwdCnt(busiInfoDTO);
			if(pwdCnt==0) {return -1;}

			int insertBusiCnt = this.loginDAO.insertBusi(busiInfoDTO);
			
			
			//회원가입 등록 운영시간 정보
			int insertNewSalesTime=this.loginDAO.insertNewSalesTime(busiInfoDTO);
			
			return insertBusiCnt;
		};
		
		public int deleteBusi(Map<String, String> DeleteBusi) {
			int pwdCnt2=this.loginDAO.getPwdCnt2(DeleteBusi);
			if(pwdCnt2==0) {return -1;}

			int deleteBusiCnt = this.loginDAO.deleteBusi(DeleteBusi);
			return deleteBusiCnt;
		};

//=============================================================================================	
		
}
