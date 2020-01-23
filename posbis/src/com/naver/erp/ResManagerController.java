package com.naver.erp;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



	@Controller 
	public class ResManagerController {
	
		@Autowired
		private ResManagerService resManagerService;
		
		@RequestMapping( value="/resManagerForm.do" )	
		public ModelAndView resManagerForm(
			ResManagerDTO resManagerDTO
			,ReservationDTO reservationDTO
			,ResCntDTO resCntDTO
			,HttpSession session
		) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("resManagerForm.jsp");
	
		      String rank_code = (String)session.getAttribute("rank_code");
		      mav.addObject("rank_code",rank_code);
		      String user_id = (String)session.getAttribute("user_id");
		      mav.addObject("user_id",user_id);
				
		try {
				
	         // user_id 를 가지고 u_no 값 얻기
	         int user_no = this.resManagerService.getUserNo(user_id);
	         //System.out.println("user_no : " + user_no);
	         
	         // u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>> .  N행 1열이면 List<String> )
	         List<Map<String,String>> businessNoList = this.resManagerService.getBusinessNoList(user_no);

	         //System.out.println("businessNoList 끝");
	         
	         mav.addObject("businessNoList" , businessNoList);
	         mav.addObject("resManagerDTO", resManagerDTO);
	         mav.addObject("reservationDTO", reservationDTO);
	         mav.addObject("resCntDTO", resCntDTO);
	         
	         //System.out.println(businessNoList);
	         //System.out.println( "businessNoList.size()=>" + businessNoList.size());
	         //System.out.println( "businessNoList.get(\"business_no\")=>" + businessNoList.get(0).get("business_no") );


			}catch(Exception e) {
				//-------------------------------------
				// try 구문에서 예외가 발생하면 실행할 구문 설정
				//-------------------------------------
				System.out.println("<에러발생>");
				
				// catch 부분에 필수로 넣을것
				System.out.println(e.getMessage());
			}
	
			return mav;
		}

		 @RequestMapping( value="/resCntProc.do" //접속하는 클래스의 URL 주소 설정
					,produces="application/json;charset=UTF-8" )	 
			@ResponseBody
			public  Map<String, Object> resCntProc( 
					ResCntDTO resCntDTO
			) {
			
			 Map<String, Object> message = new HashMap<String, Object>();
			try {
				//System.out.println("resCntProc.do 시작해서 resCntList 얻기");
//				for(int i=0; i<resCntDTO.getChooseBusinessNo().length; i++) {
//					System.out.println("사업자 넘버 = = " + resCntDTO.getChooseBusinessNo()[i]);
//				}
				System.out.println("user_id ====> "+ resCntDTO.getUser_id());
				System.out.println("month ====> "+ resCntDTO.getMonth());
				//검색목록 얻기
				List<Map<String,Object>> resCntList = this.resManagerService.getResCntList(resCntDTO);
				//System.out.println("r_no ====> "+ resCntDTO.getUser_id());
				//System.out.println("business_no ====> "+ resCntDTO.getBusiness_no());
				//System.out.println("title ====> "+ resCntDTO.getTitle());
				//System.out.println("start ====> "+ resCntDTO.getStart());
				//System.out.println("resCntList ====> "+ resCntList.get(0).get("title"));
				//System.out.println(resCntList);
				
				message.put("data", resCntList);
				
			}
				catch(Exception e) {
				System.out.println("resCntProc <에러발생>");
				System.out.println(e.getMessage());
			}
			return message;
			//return resCntDTO;
			} 
		 
		 
		 @RequestMapping( value="/resListProc.do" //접속하는 클래스의 URL 주소 설정
					,produces="application/json;charset=UTF-8" )	 
			@ResponseBody
			public  Map<String, Object> resListProc( 
					ReservationDTO reservationDTO 
			) {
			 	System.out.println("resListProc시작");
				
			 	Map<String, Object> message = new HashMap<String, Object>();
			try {
				
//				for(int i=0; i<reservationDTO.getChooseBusinessNo().length; i++) {
//					System.out.println("사업자 넘버 = = " + reservationDTO.getChooseBusinessNo()[i]);
//				}

				//검색목록 얻기
				List<Map<String,Object>> resList = this.resManagerService.getResList(reservationDTO);
//				System.out.println("r_no ====> "+ reservationDTO.getUser_id());
//				System.out.println("business_no ====> "+ reservationDTO.getBusiness_no());
//				System.out.println("date ====> "+ reservationDTO.getRes_date());
//				System.out.println("time ====> "+ reservationDTO.getRes_time());
//				System.out.println("r_no ====> "+ reservationDTO.getR_no());
//				System.out.println("res_name ====> "+ reservationDTO.getRes_name());
//				System.out.println("res_phone ====> "+ reservationDTO.getRes_phone());
				
				message.put("data", resList);
			}
				catch(Exception e) {
				System.out.println("resListProc <에러발생>");
				System.out.println(e.getMessage());
			}
			
			return message;
			} 
		 

		// 예약등록 
		
		@RequestMapping(
				value="/resRegProc.do"			// 접속하는 클래스의 URL 주소 설정
				,method=RequestMethod.POST		// 접속하는 클래스의 파마리터값 전송 방법
				,produces="application/json;charset=UTF-8"	// 응답할 데이터 종류 설정
		)
		@ResponseBody
		public int insertReservation(
				ReservationDTO reservationDTO
				,HttpSession session
		) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("resManagerForm.jsp");
			
		      String rank_code = (String)session.getAttribute("rank_code");
		      mav.addObject("rank_code",rank_code);
		      String user_id = (String)session.getAttribute("user_id");
		      mav.addObject("user_id",user_id);
		
		
			int resRegCnt = 0;
			System.out.println(reservationDTO.getBusiness_no());
		
		try {
			
	         int user_no = this.resManagerService.getUserNo(user_id);
	         //System.out.println("businessNoList 끝");
	         
	         System.out.println("r_no ====> "+ reservationDTO.getR_no());
	         System.out.println("business_no ====> "+ reservationDTO.getBusiness_no());
				System.out.println("user_id ====> "+ reservationDTO.getUser_id());
				System.out.println("res_name ====> "+ reservationDTO.getRes_name());
				System.out.println("res_date ====> "+ reservationDTO.getRes_date());
				System.out.println("res_date ====> "+ reservationDTO.getRes_time());
				System.out.println("res_guest ====> "+ reservationDTO.getRes_guest());
				System.out.println("res_text ====> "+ reservationDTO.getRes_text());
				
	         resRegCnt = this.resManagerService.insertReservation(reservationDTO);
	         //System.out.println("resRegCnt"+resRegCnt);
			}catch(Exception e) {
				System.out.println("<에러발생>");
				System.out.println(e.getMessage());
				
				resRegCnt=-1;
			}
			return resRegCnt;
		}

		
		
		 @RequestMapping( value="/resUpDelProc.do" //접속하는 클래스의 URL 주소 설정
					,produces="application/json;charset=UTF-8" )	 
			@ResponseBody
			public  Map<String, Object> resUpDelProc( 
					ReservationDTO reservationDTO 
			) {
			 	System.out.println("resUpDelProc시작");
				
			 	Map<String, Object> message = new HashMap<String, Object>();
			try {

				//검색목록 얻기
				List<Map<String,Object>> resUpDel = this.resManagerService.getResUpDel(reservationDTO);

				
				message.put("data", resUpDel);
			}
				catch(Exception e) {
				System.out.println("resListProc <에러발생>");
				System.out.println(e.getMessage());
			}
			
			return message;
			} 
		 
		 
		 
		 
//=========================================================================================================		 
		 
		 //게이지 차트
		 @RequestMapping( value="/noShowChartProc.do" //접속하는 클래스의 URL 주소 설정
					,produces="application/json;charset=UTF-8" )	 
			@ResponseBody
			public  Map<String,String> noShowChartProc( 
					ReservationDTO reservationDTO
			) {
			
			 Map<String,String> noShowChartMap = new HashMap<String,String>();
			 
			try {
				
				System.out.println("noShowChartProc 시작 =========================");
				for(int i=0; i<reservationDTO.getChooseBusinessNo().length; i++) {
					System.out.println("사업자 넘버 = = " + reservationDTO.getChooseBusinessNo()[i]);
				}
				
				System.out.println("user_id ====> "+ reservationDTO.getUser_id());
				System.out.println("res_date ====> "+ reservationDTO.getRes_date());
			
				//검색목록 얻기
				noShowChartMap = this.resManagerService.getNoShowChartMap(reservationDTO);
				
				System.out.println("noShowChartMap ===========" + noShowChartMap);
				
			}catch(Exception e) {
				System.out.println("resCntProc <에러발생>");
				System.out.println(e.getMessage());
			}
		return noShowChartMap;
		} 
		 
		 
		 							
		 
		 
//=========================================================================================================		 
		 
		 // 확인버튼
		 @RequestMapping( value="/changeSuccessProc.do" //접속하는 클래스의 URL 주소 설정
					,produces="application/json;charset=UTF-8" )	 
			@ResponseBody
			public  int changeSuccessProc( 
					@RequestParam(value = "r_no") String r_no
			) {
			
			 int updateChangeSuccess = 0;
			 
			try {
				
				System.out.println("changeSuccessProc 시작 =========================");
				System.out.println("r_no =============== " + r_no);

				//검색목록 얻기
				updateChangeSuccess = this.resManagerService.getChangeSuccess(r_no);
				
				System.out.println("updateChangeSuccess ===========" + updateChangeSuccess);
				
			}catch(Exception e) {
				System.out.println("resCntProc <에러발생>");
				System.out.println(e.getMessage());
			}
		return updateChangeSuccess;
		} 		 
		 
		 
//=========================================================================================================		 
		 
		 // 노쇼버튼
		 @RequestMapping( value="/changeNoshowProc.do" //접속하는 클래스의 URL 주소 설정
					,produces="application/json;charset=UTF-8" )	 
			@ResponseBody
			public  int changeNoshowProc( 
					@RequestParam(value = "r_no") String r_no
			) {
			
			 int updateChangeNoshow = 0;
			 
			try {
				
				System.out.println("changeSuccessProc 시작 =========================");
				System.out.println("r_no =============== " + r_no);

				//검색목록 얻기
				updateChangeNoshow = this.resManagerService.getChangeNoshow(r_no);
				
				System.out.println("updateChangeSuccess ===========" + updateChangeNoshow);
				
			}catch(Exception e) {
				System.out.println("resCntProc <에러발생>");
				System.out.println(e.getMessage());
			}
		return updateChangeNoshow;
		} 		 		 

	}		 
		 
		 
		