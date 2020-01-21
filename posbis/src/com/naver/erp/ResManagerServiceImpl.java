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

	public int getResListAllCnt(ResManagerDTO resManagerDTO){

		int resListAllCnt = this.resManagerDAO.getResListAllCnt(resManagerDTO);

		return resListAllCnt;
	}
		
	public List<Map<String,String>> getResList(ResManagerDTO resManagerDTO){
		System.out.println("service : getMenuList 시작");
		List<Map<String,String>> resList = this.resManagerDAO.getResList(resManagerDTO);
		System.out.println("service : getMenuList 끝");
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
	
	public List<Map<String,String>> getResCntList(ResManagerDTO resManagerDTO){
		System.out.println("service : getMenuList 시작");
		List<Map<String,String>> resCntList = this.resManagerDAO.getResCntList(resManagerDTO);
		System.out.println("service : resCntList 끝");
		return resCntList;
	}

	
	public List<Map<String, Object>> getResCntList2(ResCntDTO resCntDTO){
		System.out.println("service : getResCntList2 시작");
		List<Map<String, Object>> resCntList2 = this.resManagerDAO.getResCntList2(resCntDTO);
		System.out.println("service : resCntList2 끝");
		System.out.println("resManagerDAO" + resCntList2);
		return resCntList2;
	}
	/*
	   public List<String> getResCntList2(ResCntDTO resCntDTO){
	      List<String> resCntList2 = this.resManagerDAO.getResCntList2(resCntDTO);
	         return resCntList2;
	   }
	*/

}
	
