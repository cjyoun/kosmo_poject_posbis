package com.naver.erp;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class LoginDAOImp implements LoginDAO{

 
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	//---------------------------------------------------------------------------------
	///로그인 아이디 암호 개수-------------------------------------------------------------------
	//---------------------------------------------------------------------------------
	public int getAdminCnt(Map<String, String> admin_id_pwd) {
		
		System.out.println("daoimp");
		
		int adminCnt = this.sqlSession.selectOne(
				"com.naver.erp.LoginDAO.getAdminCnt"
				,admin_id_pwd
				);
		return adminCnt;
		};
	 
 
	//---------------------------------------------------------------------------------	
	//아이디 중복검색----------------------------------------------------------------------------------
	//---------------------------------------------------------------------------------
	
	public int getJoinIDCnt(Map<String, String> join_id) {
		
		System.out.println(join_id);
		
		int join_idCnt=this.sqlSession.selectOne(
				"com.naver.erp.LoginDAO.getJoinIDCnt"
				,join_id
				);
		return join_idCnt;
	};
	//---------------------------------------------------------------------------------
	//주소 구 데이터 가져오기----------------------------------------------------------------------------------
	//---------------------------------------------------------------------------------
	
	public List<Map<String,String>> getAddrListGu(){
		List<Map<String, String>> addrListGu = this.sqlSession.selectList(
				"com.naver.erp.LoginDAO.getAddrListGu" // 실행할 SQL 구문의 위치 지정
		);
		System.out.println("DAO / addrListGu" + addrListGu);
		return addrListGu;
	};
	
	//---------------------------------------------------------------------------------
	//주소 동 데이터 가져오기----------------------------------------------------------------------------------
	//---------------------------------------------------------------------------------
		
	public List<String> getAddrListDong(String addr_gu){
	 
		List<String> addrListDong = this.sqlSession.selectList(
			"com.naver.erp.LoginDAO.getAddrListDong" // 실행할 SQL 구문의 위치 지정
			,addr_gu	
	);
	System.out.println("DAO / addrListDong" + addrListDong);
	return addrListDong;
	};

	//---------------------------------------------------------------------------------
	//업종 타입 1 데이터 가져오기----------------------------------------------------------------------------------
	//---------------------------------------------------------------------------------

	public List<Map<String,String>> getbusinessTypeList1(){
		List<Map<String,String>> businessTypeList1 = this.sqlSession.selectList(
				"com.naver.erp.LoginDAO.getbusinessTypeList1" // 실행할 SQL 구문의 위치 지정
		);
		return businessTypeList1;
	};
	
	
	//---------------------------------------------------------------------------------
	//업종 타입 2  데이터 가져오기----------------------------------------------------------------------------------
	//---------------------------------------------------------------------------------

	public List<String> getbusinessTypeList2(String business_type_name1){
		List<String> businessTypeList2 = this.sqlSession.selectList(
			"com.naver.erp.LoginDAO.getbusinessTypeList2" // 실행할 SQL 구문의 위치 지정
			,business_type_name1	
	);
	System.out.println("DAO / businessTypeList2" + businessTypeList2);
	return businessTypeList2;
	};

	
	//---------------------------------------------------------------------------------
	//회원가입 등록 대표자 정보----------------------------------------------------------------------------------
	//---------------------------------------------------------------------------------

	public int insertJoinUser(joinDTO joinDTO){
		int insertJoinCnt = this.sqlSession.insert(
			"com.naver.erp.LoginDAO.insertJoinUser" // 실행할 SQL 구문의 위치 지정
			,joinDTO	
	);
	System.out.println("DAO / insertJoinCnt" + insertJoinCnt);
	return insertJoinCnt;
	};
	
	
	//---------------------------------------------------------------------------------
	//회원가입 등록 사업장 정보----------------------------------------------------------------------------------
	//---------------------------------------------------------------------------------

	public int insertJoinBusinessInfo(joinDTO joinDTO){
		
		System.out.println("회원가입 실행전"); 
		int insertJoinBusinessInfoCnt = this.sqlSession.insert(
			"com.naver.erp.LoginDAO.insertJoinBusinessInfo" // 실행할 SQL 구문의 위치 지정
			,joinDTO	
	);
	System.out.println("DAO / insertJoinBusinessInfoCnt" + insertJoinBusinessInfoCnt);
	return insertJoinBusinessInfoCnt;
	};
	
	//---------------------------------------------------------------------------------
		//탈퇴시 아이디 암호 조회 및 삭제 --------------------------------------------------------------------------------
		//---------------------------------------------------------------------------------
		// 성유진DAOImpl 
		public int deleteUserInfo(Map<String, String> user_id_pwd) {
			
			System.out.println("7실행전");
			int deleteUserInfoCnt=this.sqlSession.delete(
					"com.naver.erp.LoginDAO.deleteUserInfo"
					, user_id_pwd
				);
			System.out.println(deleteUserInfoCnt);
			System.out.println("7실행후");
			return deleteUserInfoCnt;
		};
		// 성유진DAOImpl 끝
	
	
	//---------------------------------------------------------------------------------
	///사업자 번호 개수-------------------------------------------------------------------
	//---------------------------------------------------------------------------------
	public int getBusinessnoCnt(Map<String, String> CheckBusiness_no) {
		
		System.out.println("DAO Imp"+CheckBusiness_no);
		
		int BusinessnoCnt = this.sqlSession.selectOne(
				"com.naver.erp.LoginDAO.getBusinessnoCnt"
				,CheckBusiness_no
				);
		
		
		return BusinessnoCnt;
		};
	 
	//---------------------------------------------------------------------------------
	//아이디 암호 사업자번호 조회 후  개수-------------------------------------------------------------------
	//---------------------------------------------------------------------------------	
	public int getfindBusinessNoCnt(Map<String, String> FindIdPwd ) {
		System.out.println("DAO Imp"+FindIdPwd);
		
		int FindBusinessNoCnt = this.sqlSession.selectOne(
				"com.naver.erp.LoginDAO.getfindBusinessNoCnt"
				,FindIdPwd
				);
		
		System.out.println(FindBusinessNoCnt);
		return FindBusinessNoCnt;
		
		
	};
	
	public int getfindIDPasswordCnt(Map<String, String> FindIdPwd ) {
		System.out.println("DAO Imp"+FindIdPwd);
		
		int FindIDPasswordCnt = this.sqlSession.selectOne(
				"com.naver.erp.LoginDAO.getfindIDPasswordCnt"
				,FindIdPwd
				);
		
		System.out.println("아이디 암호 조회후");
		return FindIDPasswordCnt;
		
		
	};
	
	
	public searchIDPwdDTO getfindIDPwd(Map<String, String>  FindIdPwd ) {
		System.out.println("DAO Imp"+FindIdPwd);
		
		searchIDPwdDTO findIDPassword = this.sqlSession.selectOne(
				"com.naver.erp.LoginDAO.getfindIDPwd"
				,FindIdPwd
				);
		
		System.out.println("아이디 암호 조회후");
		return findIDPassword;
		
		
	};
		
		
	//마이페이지 데이터 가져오기---------------------------------------------------------------------------------- 
	public MyPageDTO getmypageList() {
		
		MyPageDTO mypageList = (MyPageDTO) this.sqlSession.selectList(
				"com.naver.erp.LoginDAO.getmypageList"
				);
		
	    return mypageList;
		
	}

	// business_no 에 따른 나의 정보 얻어오기.
	@Override
	public List<Map<String, String>> getMyInfo(String changeBusinessNo) {
		List<Map<String, String>> myInfo = this.sqlSession.selectList(
				"com.naver.erp.LoginDAO.getMyInfo"
				, changeBusinessNo
				);
		return myInfo;
	};
			
		
	
	
	// business_no에 따른 나의 정보, 가게 정보 얻어오기 (회원정보 수정 부분)
	@Override
	public List<Map<String, String>> getMyNStoreInfo(String changeBusinessNo) {
		List<Map<String, String>> myNStoreInfo = this.sqlSession.selectList(
				"com.naver.erp.LoginDAO.getMyNStoreInfo"
				, changeBusinessNo
				);
		return myNStoreInfo;
	}


	// 등급코드 얻기
	@Override
	public String getRankCode(String user_id) {
		String rank_code = this.sqlSession.selectOne(
				"com.naver.erp.LoginDAO.getRankCode"
				, user_id
				);
		
		return rank_code;
	}


	// 유저정보 업데이트
	@Override
	public int updateInfoUser(UpdateInfoDTO updateInfoDTO) {
		System.out.println("DAO Imp 회원정보 수정에서 유저정보 업데이트 시작");
		System.out.println("DAO Imp user_id"+updateInfoDTO.getUser_id());
		int updateInfoUserCnt = this.sqlSession.update(
				 "com.naver.erp.LoginDAO.updateInfoUser"		// 실행할 SQL 구문의 위치 지정
				, updateInfoDTO 	
		);
		System.out.println("DAO Imp 회원정보 수정에서 유저정보 업데이트 끝");
		return updateInfoUserCnt;
	};
	
	
	// 가게정보 업데이트
	@Override
	public int updateInfoBusiness(UpdateInfoDTO updateInfoDTO) {
		System.out.println("----------------- " + updateInfoDTO.getBusiness_no());
		int updateInfoBusinessCnt = this.sqlSession.update(
				 "com.naver.erp.LoginDAO.updateInfoBusiness"		// 실행할 SQL 구문의 위치 지정
				, updateInfoDTO 	
		);
		return updateInfoBusinessCnt;
	};
	
	
	// 카드갯수 구하기
	@Override
	public int getCardCnt(int u_no) {
		int cardCnt = this.sqlSession.selectOne(
				 "com.naver.erp.LoginDAO.getCardCnt"		// 실행할 SQL 구문의 위치 지정
				, u_no 	
		);
		return cardCnt;
	};
	
	
	
	// 카드지우기
	@Override
	public int deleteinfoCard(int u_no) {
		int deleteCard = this.sqlSession.delete(
				 "com.naver.erp.LoginDAO.deleteinfoCard"		// 실행할 SQL 구문의 위치 지정
				, u_no 	
		);
		return deleteCard;
	};
	
	
	// 카드 생성하기
	@Override
	public int insertCard(CardDTO cardDTO) {
		int insertCard = this.sqlSession.insert(
				 "com.naver.erp.LoginDAO.insertCard"		// 실행할 SQL 구문의 위치 지정
				, cardDTO 	
		);
		return insertCard;
	};
	
	// 카드 등록 시 유저 등급 업데이트
	@Override
	public int updateRank(int u_no) {
		int updateRank = this.sqlSession.update(
				 "com.naver.erp.LoginDAO.updateRank"		// 실행할 SQL 구문의 위치 지정
				, u_no 	
		);
		return updateRank;
	};
	
	
	// 내가게 정보 가져오기/////////////////////////////////////////////////////////이정숙꺼
	public List<Map<String, String>> getMyStoreInfoList(int u_no){
		List<Map<String, String>> myStoreInfoList = this.sqlSession.selectList( 
				"com.naver.erp.LoginDAO.getMyStoreInfoList"
				, u_no
		);
		//System.out.println("DAO/myStoreInfoList===>"+myStoreInfoList);
		return myStoreInfoList;
	};
	
	
	//===============================김수민==================================================		
		
		public int insertBusi(BusiInfoDTO busiInfoDTO) {
			int insertBusiCnt = this.sqlSession.insert(
					 "com.naver.erp.LoginDAO.insertBusi"		// 실행할 SQL 구문의 위치 지정
					, busiInfoDTO
				);
				return insertBusiCnt;
		};
		
		public int getPwdCnt(BusiInfoDTO busiInfoDTO) {
			int pwdCnt=this.sqlSession.selectOne(
					"com.naver.erp.LoginDAO.getPwdCnt"	
					,busiInfoDTO	
			);
			return pwdCnt;
		}
		
		
		public int getPwdCnt2(Map<String, String> DeleteBusi) {
			int pwdCnt2=this.sqlSession.selectOne(
					"com.naver.erp.LoginDAO.getPwdCnt2"	
					,DeleteBusi	
			);
			return pwdCnt2;
		}
		
		public int deleteBusi(Map<String, String> DeleteBusi) {
			int deleteBusiCnt = this.sqlSession.delete(
					 "com.naver.erp.LoginDAO.deleteBusi"		// 실행할 SQL 구문의 위치 지정
					, DeleteBusi
				);
				return deleteBusiCnt;
		};
		
	//================================================================================================

}
