package com.naver.erp;
import java.util.*;


public interface ResManagerService {
	
	List<Map<String,String>> getResList(ResManagerDTO resManagerDTO);
	
	int getResListAllCnt(ResManagerDTO resManagerDTO);

	int getUserNo(String user_id);
	
	List<Map<String, String>> getBusinessNoList(int u_no);

	int insertReservation(ReservationDTO reservationDTO);
	
	List<Map<String,String>> getResCntList(ResManagerDTO resManagerDTO);

	//List<String> getResCntList2(ResCntDTO resCntDTO);

	List<Map<String, Object>> getResCntList2(ResCntDTO resCntDTO);
	
	
}
