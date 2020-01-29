package com.naver.erp;
import java.util.List;
import java.util.Map;

//-----------------------------------
// [DAO 인터페이스] 선언
//-----------------------------------
public interface ResManagerDAO {
	
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	List<Map<String,Object>> getResList(ReservationDTO reservationDTO);

	// 유저 정보를 를 리턴하는 메소드 선언
	int getUserNo(String user_id);

	List<Map<String, String>> getBusinessNoList(int u_no);

	int insertReservation(ReservationDTO reservationDTO);

	List<Map<String, Object>> getResCntList(ResCntDTO resCntDTO);
	
	ReservationDTO getReservationDTO(int r_no);

	List<Map<String,Object>> getResUpDel(ReservationDTO reservationDTO);
	
	int getResCnt(ReservationDTO reservationDTO);

	int updateRes(ReservationDTO reservationDTO);

	int deleteRes(ReservationDTO reservationDTO);
	
	//김수민
	Map<String,String> getNoShowChartMap(ReservationDTO reservationDTO);

	int getChangeSuccess(String r_no);
	int getChangeNoshow(String r_no);

}
