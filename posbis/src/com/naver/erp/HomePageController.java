package com.naver.erp;

import java.util.*;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


//-------------------------------------------------------------------------------
// 가상 URL 주소로 접속하며 호출되는 메소드를 소유한 [컨트롤러 클래스] 선언.
// @Controller 를 붙임으로써 [컨트롤러 클래스]임을 지정한다.
//-------------------------------------------------------------------------------
@Controller
// 클래스 내부에서 발생하는 모든 예외를 잡는 것. (잡히면 @ExceptionHandler 가 붙은 메소드를 호출함.)
@ControllerAdvice
public class HomePageController {
	
	 @Autowired private SalesService salesService;
	 @Autowired private LoginService loginService;
	 @Autowired private QstnService qstnService;
	  
		@RequestMapping( value="/homePageForm.do" )	
		public ModelAndView homePageForm(
			HttpSession session
		) {	
		
		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("homePageForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 

	
	    String rank_code = (String)session.getAttribute("rank_code");
	    mav.addObject("rank_code",rank_code);

		try {
			
			// id,  u_no 얻기      
			//=========================================================================================================
			String user_id = (String)session.getAttribute("user_id"); 

			int u_no = this.salesService.getUserNo(user_id);
		    
		    //System.out.println("user_no : " + u_no);

			//========================================================================
			//차트 김수민
			//========================================================================
		     List<Map<String,String>> salesNow = this.salesService.getSalesNow(u_no);
		     
		     mav.addObject("salesNow" , salesNow);
		     
			//mav.addObject("salesSearchDTO",salesSearchDTO); //자동 기능...안써도 감...? => 안 쓰면 안찍힘...
		     List<Map<String,String>> salesWeek = this.salesService.getSalesWeek(u_no);
		     mav.addObject("salesWeek" , salesWeek);
		     
		     
		     //성유진
		     MyQstnSearchDTO myQstnSearchDTO = new MyQstnSearchDTO();
		     
		     myQstnSearchDTO.setU_no(u_no);
				int myQstnAllCnt = this.qstnService.getMyQstnAllCnt(myQstnSearchDTO);
				System.out.println("myQstnAllCnt==>"+myQstnAllCnt);
				if(myQstnAllCnt>0) {
					// 선택한 페이지 번호 구하기
					int selectPageNo = myQstnSearchDTO.getSelectPageNo();
					// 한 화면에 보여지는 행의 개수 구하기
					int rowCntPerPage = myQstnSearchDTO.getRowCntPerPage();
					// 검색할 시작행 번호 구하기
					int beginRowNo = selectPageNo*rowCntPerPage - rowCntPerPage + 1;
				
						// 만약 검색한 총 개수가 검색할 시작행 번호 보다 작으면
						// 선택한 페이지 번호를 1로 세팅하기
						if(myQstnAllCnt < beginRowNo) {
							myQstnSearchDTO.setSelectPageNo(1);
						}
				}
				
				List<Map<String,String>> myQstnList = this.qstnService.getMyQstnList(myQstnSearchDTO);
				System.out.println("myQstnList.size()=>" +myQstnList.size());
				
				
				System.out.println("getU_no ====> "+ myQstnSearchDTO.getU_no());
				System.out.println("getSelectPageNo ====> "+ myQstnSearchDTO.getSelectPageNo());

				
				mav.addObject("myQstnList", myQstnList);
				mav.addObject("myQstnAllCnt", myQstnAllCnt);
				mav.addObject("myQstnSearchDTO", myQstnSearchDTO);
				mav.addObject("user_id",user_id);

				//========================================================================
			    // 내 가게 정보 /////////////////////////////////////////////////////////이정숙꺼
				//========================================================================
				MyStoreInfoDTO myStoreInfoDTO = new MyStoreInfoDTO();
				myStoreInfoDTO.setU_no(u_no);
			     List<Map<String,String>> myStoreInfoList = this.loginService.getMyStoreInfoList(myStoreInfoDTO);
			     mav.addObject("myStoreInfoList" , myStoreInfoList);
			     int myStoreInfoAllCnt = this.loginService.getMyStoreInfoAllCnt(myStoreInfoDTO);
			     mav.addObject("myStoreInfoAllCnt" , myStoreInfoAllCnt);
			     System.out.println("Controller/myStoreInfoAllCnt===>"+myStoreInfoAllCnt);
			     mav.addObject("myStoreInfoDTO" , myStoreInfoDTO);
				System.out.println("controller/getSelectPageNo2===>"+myStoreInfoDTO.getSelectPageNo2());
				//========================================================================
			    // /내 가게 정보 끝/////////////////////////////////////////////////////////이정숙꺼끝
				//========================================================================
			 		
			 }catch(Exception e) { //try 구문에서 예외가 발생하면 실행할 구문 설정
				 	System.out.println("<에러발생>");
					System.out.println(e.getMessage()); }
		
		return mav;
		
	}
	
	//========================================================================
    // 내 가게 정보 /////////////////////////////////////////////////////////이정숙꺼
	//========================================================================	
		@RequestMapping( value="/homeMyStoreInfoProc.do" //접속하는 클래스의 URL 주소 설정
						,produces="application/json;charset=UTF-8" )	 
		@ResponseBody
		public  MyStoreInfoDTO homeMyStoreInfoProc( 
				MyStoreInfoDTO myStoreInfoDTO
		) {
		System.out.println("proc시작");
		
		try {

		     int myStoreInfoAllCnt = this.loginService.getMyStoreInfoAllCnt(myStoreInfoDTO);
		     List<Map<String,String>> myStoreInfoList = this.loginService.getMyStoreInfoList(myStoreInfoDTO);
		     myStoreInfoDTO.setMyStoreInfoAllCnt(myStoreInfoAllCnt);
		     myStoreInfoDTO.setMyStoreInfoList(myStoreInfoList);
		
		}
		catch(Exception e) {
			System.out.println("salesProc <에러발생>");
			System.out.println(e.getMessage());
		}
		
			return myStoreInfoDTO;
		} 
		//========================================================================
	    // /내 가게 정보 끝/////////////////////////////////////////////////////////이정숙꺼끝
		//========================================================================
	

}





