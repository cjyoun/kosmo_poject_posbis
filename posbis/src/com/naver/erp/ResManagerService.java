package com.naver.erp;
import java.util.*;


public interface ResManagerService {
	
	List<Map<String,Object>> getResList(ReservationDTO reservationDTO);
	
	int getUserNo(String user_id);
	
	List<Map<String, String>> getBusinessNoList(int u_no);

	int insertReservation(ReservationDTO reservationDTO);

	List<Map<String, Object>> getResCntList(ResCntDTO resCntDTO);
	
	List<Map<String,Object>> getResUpDel(ReservationDTO reservationDTO);
	
	int updateRes(ReservationDTO reservationDTO);

	int deleteRes(ReservationDTO reservationDTO);
	
	//김수민
	Map<String,String> getNoShowChartMap(ReservationDTO reservationDTO);

	
	int getChangeSuccess(String r_no);

	int getChangeNoshow(String r_no);
		

	
}
