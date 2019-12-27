package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface LoginService {
	
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
	int insertJoinUser(joinDTO joinDTO);

	/*
	 * //회원가입 등록 사업장
	 * 정보---------------------------------------------------------------------------
	 * ------ int insertJoinBusinessInfo(joinDTO joinDTO);
	 */
	//탈퇴시 아이디 암호 조회 및 삭제 --------------------------------------------------------------------------------
	int deleteUserInfo(Map<String, String> user_id_pwd);
	
	//사업자 번호 개수 ---------------------------------------------------------------------------------
	int getBusinessnoCnt(Map<String, String> CheckBusiness_no);
	
	
	//아이디 암호 조회 후  개수 ---------------------------------------------------------------------------------
	int getfindIDPasswordCnt(Map<String, String> FindIdPwd );
	searchIDPwdDTO getfindIDPwd(Map<String, String> FindIdPwd );
	
	//마이페이지 데이터 가져오기---------------------------------------------------------------------------------- 
	MyPageDTO getmypageList();

	
	// business_no에 따른 나의 정보 얻어오기
	List<Map<String, String>> getMyInfo(String changeBusinessNo);

	// business_no에 따른 나의 정보, 가게 정보 얻어오기 (회원정보 수정 부분)
	List<Map<String, String>> getMyNStoreInfo(String business_no);
	
	 
}
