package com.naver.erp;
import java.util.List;
import java.util.Map;

//-----------------------------------
// [DAO 인터페이스] 선언
//-----------------------------------
public interface ResManagerDAO {
	
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	List<Map<String,String>> getResList(ResManagerDTO resManagerDTO);

	// [검색한 게시판 목록 개수] 리턴하는 메소드 선언
	int getResListAllCnt(ResManagerDTO resManagerDTO);

	// 유저 정보를 를 리턴하는 메소드 선언
	int getUserNo(String user_id);

	List<Map<String, String>> getBusinessNoList(int u_no);

	int insertReservation(ReservationDTO reservationDTO);

	List<Map<String, String>> getResCntList(ResManagerDTO resManagerDTO);

	//List<String> getResCntList2(ResCntDTO resCntDTO);
	
	List<Map<String, Object>> getResCntList2(ResCntDTO resCntDTO);

}
