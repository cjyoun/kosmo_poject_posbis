package com.naver.erp;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



	@Controller 
	public class ResManagerController {
	
		@Autowired
		private ResManagerService resManagerService;
		
		@RequestMapping( value="/resManagerForm.do" )	
		public ModelAndView resManagerForm(
			ResManagerDTO resManagerDTO
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
	         System.out.println("user_no : " + user_no);
	         
	         // u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>> .  N행 1열이면 List<String> )
	         List<Map<String,String>> businessNoList = this.resManagerService.getBusinessNoList(user_no);

	         System.out.println("businessNoList 끝");
	         
	         mav.addObject("businessNoList" , businessNoList);
	         
	         System.out.println(businessNoList);
	         System.out.println( "businessNoList.size()=>" + businessNoList.size());
	         System.out.println( "businessNoList.get(\"business_no\")=>" + businessNoList.get(0).get("business_no") );

			/*
			 * int resListAllCnt = this.resManagerService.getResListAllCnt(resManagerDTO);
			 * System.out.println("resListAllCnt==>"+resListAllCnt);
			 * 
			 * 
			 * 
			 * List<Map<String,String>> resList =
			 * this.resManagerService.getResList(resManagerDTO);
			 * System.out.println("resList.size()=>" +resList.size());
			 * 
			 * mav.addObject("resList", resList); mav.addObject("resListAllCnt",
			 * resListAllCnt); mav.addObject("resManagerDTO", resManagerDTO);
			 */
				
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
		
		/*
		 @RequestMapping( value="/resCntProc.do" //접속하는 클래스의 URL 주소 설정
					,produces="application/json;charset=UTF-8" )	 
			@ResponseBody
			public  ReservationDTO resCntProc( 
					ResManagerDTO resManagerDTO 
			) {
			System.out.println("proc시작");
			
			
			ReservationDTO reservationDTO= new ReservationDTO();
			try {
			
				//검색목록 얻기
				List<Map<String,String>> resCntList = this.resManagerService.getResCntList(resManagerDTO);
				
				
			
			}
				catch(Exception e) {
				System.out.println("resCntProc <에러발생>");
				System.out.println(e.getMessage());
			}
			
			return reservationDTO;
			} 
		  */
		
		
		 @RequestMapping( value="/resCntProc.do" //접속하는 클래스의 URL 주소 설정
					,produces="application/json;charset=UTF-8" )	 
			@ResponseBody
			public  Map<String, Object> resCntProc( 
					ResCntDTO resCntDTO
			) {
			
			 Map<String, Object> message = new HashMap<String, Object>();
			try {
			
				//검색목록 얻기
				List<Map<String,Object>> resCntList2 = this.resManagerService.getResCntList2(resCntDTO);
				System.out.println("r_no ====> "+ resCntDTO.getUser_id());
				System.out.println("business_no ====> "+ resCntDTO.getBusiness_no());
				System.out.println("title ====> "+ resCntDTO.getTitle());
				System.out.println("start ====> "+ resCntDTO.getStart());
				System.out.println("resCntList2 ====> "+ resCntList2.get(0).get("title"));
				
				message.put("data", resCntList2);
				
			}
				catch(Exception e) {
				System.out.println("resCntProc <에러발생>");
				System.out.println(e.getMessage());
			}
			return message;
			//return resCntDTO;
			} 
		  	
		/*
		@RequestMapping( value="/resCntProc.do" //접속하는 클래스의 URL 주소 설정
				,produces="application/json;charset=UTF-8" )	 
		@ResponseBody
		public List<String> resCntProc( 
				ResCntDTO resCntDTO
		) {
			List<String> resCntList2 = new ArrayList<String>();
		try {
		
			//검색목록 얻기
			resCntList2 = this.resManagerService.getResCntList2(resCntDTO);
			System.out.println("r_no ====> "+ resCntDTO.getUser_id());
			System.out.println("business_no ====> "+ resCntDTO.getBusiness_no());
			System.out.println("title ====> "+ resCntDTO.getTitle());
			System.out.println("start ====> "+ resCntDTO.getStart());
			System.out.println("resCntList2 ====> "+ resCntList2);
			
			
		}
			catch(Exception e) {
			System.out.println("resCntProc <에러발생>");
			System.out.println(e.getMessage());
		}
		
		return resCntList2;
		}
		*/
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
	         System.out.println("businessNoList 끝");
	         
	         System.out.println("r_no ====> "+ reservationDTO.getR_no());
	         System.out.println("business_no ====> "+ reservationDTO.getBusiness_no());
				System.out.println("user_id ====> "+ reservationDTO.getUser_id());
				System.out.println("res_name ====> "+ reservationDTO.getRes_name());
				System.out.println("res_date ====> "+ reservationDTO.getRes_date());
				System.out.println("res_date ====> "+ reservationDTO.getRes_time());
				System.out.println("res_guest ====> "+ reservationDTO.getRes_guest());
				System.out.println("res_text ====> "+ reservationDTO.getRes_text());
				
	         resRegCnt = this.resManagerService.insertReservation(reservationDTO);
	         System.out.println("resRegCnt"+resRegCnt);
			}catch(Exception e) {
				System.out.println("<에러발생>");
				System.out.println(e.getMessage());
				
				resRegCnt=-1;
			}
			return resRegCnt;
		}
		
		


	}