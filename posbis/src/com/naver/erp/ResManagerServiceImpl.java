package com.naver.erp;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ResManagerServiceImpl implements ResManagerService{
	
	@Autowired
	private ResManagerDAO resManagerDAO;

	public List<Map<String,Object>> getResList(ReservationDTO reservationDTO){
		System.out.println("service : getResList 시작");
		List<Map<String, Object>> resList = this.resManagerDAO.getResList(reservationDTO);
		System.out.println("service : getResList 끝" + resList);
		return resList;
	}
	

   // user_id 를 가지고 u_no 얻기
   @Override
   public int getUserNo(String user_id) {
      System.out.println("service : "+user_id);
      int user_no = this.resManagerDAO.getUserNo(user_id);
      
      return user_no;
   }
   
   // u_no을 가지고 business_no 과 business_name 얻기   
   @Override
   public List<Map<String, String>> getBusinessNoList(int u_no) {
      System.out.println("service : businessNoList 시작");
      List<Map<String,String>> businessNoList = this.resManagerDAO.getBusinessNoList(u_no);
      System.out.println("service : businessNoList 끝"); 
      return businessNoList;
      
   }
   
	// [메뉴 등록 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	public int insertReservation(ReservationDTO reservationDTO){
			
		String business_no = reservationDTO.getBusiness_no();

		// 1개의 메뉴 등록 후 적용 행의 개수 리턴하기
		int resRegCnt = this.resManagerDAO.insertReservation(reservationDTO);
		return resRegCnt;
	}
	

	public List<Map<String, Object>> getResCntList(ResCntDTO resCntDTO){
		System.out.println("service : getResCntList 시작");
		List<Map<String, Object>> resCntList = this.resManagerDAO.getResCntList(resCntDTO);
		System.out.println("service : resCntList 끝");
		System.out.println("resManagerDAO" + resCntList);
		return resCntList;
	}
	
	public ReservationDTO getReservationDTO(int r_no) {
		System.out.println("r_no====>"+r_no);
		ReservationDTO reservationDTO = this.resManagerDAO.getReservationDTO(r_no);
	
		System.out.println("reservationDTO=====>"+reservationDTO);
		return reservationDTO;
	}

	public ReservationDTO getReservationDTO_upDel(int r_no) {
		
		ReservationDTO reservationDTO = this.resManagerDAO.getReservationDTO(r_no);
		return reservationDTO;
	}
	
	public List<Map<String,Object>> getResUpDel(ReservationDTO reservationDTO){
		System.out.println("service : getResUpDel 시작");
		List<Map<String, Object>> resUpDel = this.resManagerDAO.getResUpDel(reservationDTO);
		System.out.println("service : getResUpDel 끝" + resUpDel);
		return resUpDel;
	}
	
	public int updateRes(ReservationDTO reservationDTO){
		
		int resCnt = this.resManagerDAO.getResCnt(reservationDTO);
		if(resCnt==0) {return -1;}
		

		System.out.println("updateCnt");
		int updateCnt = this.resManagerDAO.updateRes(reservationDTO);
		
		return updateCnt;
	} 

	public int deleteRes(ReservationDTO reservationDTO){
		

		int resCnt = this.resManagerDAO.getResCnt(reservationDTO);
		if(resCnt==0) {return -1;}


		int deleteCnt = this.resManagerDAO.deleteRes(reservationDTO);
		return deleteCnt;
	}
	
	
	//김수민
	public Map<String,String> getNoShowChartMap(ReservationDTO reservationDTO){
		Map<String, String> noShowChartMap = this.resManagerDAO.getNoShowChartMap(reservationDTO);
		return noShowChartMap;
	}



	public int getChangeSuccess(String r_no) {

		int updateChangeSuccess = this.resManagerDAO.getChangeSuccess(r_no);
		return updateChangeSuccess;
	}


	public int getChangeNoshow(String r_no) {

		int updateChangeSuccess = this.resManagerDAO.getChangeNoshow(r_no);
		return updateChangeSuccess;
	}
	
	
}
	
