package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface LoginDAO {

	//로그인 아이디 암호 개수 ---------------------------------------------------------------------------------
	int getAdminCnt(Map<String, String> admin_id_pwd);
	
	//아이디 중복검색----------------------------------------------------------------------------------
	int getJoinIDCnt(Map<String, String> join_id);
	
 
	//주소 구 데이터 가져오기----------------------------------------------------------------------------------
	List<Map<String,String>> getAddrListGu();
	//주소 동 데이터 가져오기----------------------------------------------------------------------------------
	List<String> getAddrListDong(String addr_gu);
	
	//업종 타입 1 데이터 가져오기---------------------------------------------------------------------------------- 
	List<Map<String,String>> getbusinessTypeList1();
	//업종 타입 2 데이터 가져오기---------------------------------------------------------------------------------- 
	List<String> getbusinessTypeList2(String business_type_name1);
	
	//회원가입 등록 대표자 정보---------------------------------------------------------------------------------
	int insertJoinUser(JoinDTO joinDTO);	
	//회원가입 등록 사업장 정보---------------------------------------------------------------------------------
	int insertJoinBusinessInfo(JoinDTO joinDTO);
	//회원가입 운영시간 정보
	int insertJoinSalesTime(JoinDTO joinDTO);
	
	//탈퇴시 아이디 암호 조회 및 삭제 --------------------------------------------------------------------------------
	// 성유진DAO
	int deleteUserInfo(Map<String, String> user_id_pwd);
	// 성유진DAO 끝
	
	//사업자 번호 개수 ---------------------------------------------------------------------------------
	int getBusinessnoCnt(Map<String, String> CheckBusiness_no);
	
	//아이디 암호 조회  및 사업자 번호 개수 ---------------------------------------------------------------------------------
	int getfindBusinessNoCnt(Map<String, String> FindIdPwd );
	int getfindIDPasswordCnt(Map<String, String> FindIdPwd );
	
	SearchIDPwdDTO getfindIDPwd(Map<String, String>  FindIdPwd );
	
	
	//마이페이지 데이터 가져오기---------------------------------------------------------------------------------- 
	MyPageDTO getmypageList();
	
 
	// business_no에 따른 나의 정보 얻어오기
	List<Map<String, String>> getMyInfo(String changeBusinessNo);
		
	// business_no에 따른 나의 정보, 가게 정보 얻어오기 (회원정보 수정 부분)
	List<Map<String, String>> getMyNStoreInfo(String business_no);
	
	
	// 등급 코드 얻기
	String getRankCode(String user_id);
		
	
	// 유저 정보 업데이트
	int updateInfoUser(UpdateInfoDTO updateInfoDTO);
		
	// 가게 정보 업데이트
	int updateInfoBusiness(UpdateInfoDTO updateInfoDTO);
	
	// 가게 영업시간 업데이트	=======================김수민
	int updateSalesTime(UpdateInfoDTO updateInfoDTO);
		
	// 카드 갯수 얻기
	int getCardCnt(int u_no);
		
	// 카드 지우기
	int deleteinfoCard(int u_no);
	
	// 카드 생성하기
	int insertCard(CardDTO cardDTO);
	
	// 카드 등록 시 유저 등급 업데이트 (프리미엄)
	int updateRank(int u_no);
	
	// 카드 등록 취소 시 유저 등급 업데이트 (일반)
	int updateRank2(int u_no);
		
	
	// 내가게 정보 가져오기/////////////////////////////////////////////////////////이정숙꺼
	List<Map<String, String>> getMyStoreInfoList(MyStoreInfoDTO myStoreInfoDTO);
	int getMyStoreInfoAllCnt(MyStoreInfoDTO myStoreInfoDTO);

	
	
	//================================김수민 infoUpdate==================================	
	//유저의 현재 비밀번호 가져오기
		String getUserPwd(int u_no);
	//===================================================================================	
		
		

	//================김수민==================================================================		
	
		int insertBusi(BusiInfoDTO busiInfoDTO);
		int getPwdCnt(BusiInfoDTO busiInfoDTO);

		int getPwdCnt2(Map<String, String> DeleteBusi);
		int deleteBusi(Map<String, String> DeleteBusi);

		int insertNewSalesTime(BusiInfoDTO busiInfoDTO);

		
		
	//========================================================================================	
		
}
