
 package com.naver.erp;
 
 import java.util.*;
 
 import javax.servlet.http.Cookie; import
 javax.servlet.http.HttpServletRequest; import
 javax.servlet.http.HttpServletResponse; import
 javax.servlet.http.HttpSession;
 
 import org.springframework.beans.factory.annotation.Autowired; import
 org.springframework.stereotype.Controller; import
 org.springframework.web.bind.annotation.ControllerAdvice; import
 org.springframework.web.bind.annotation.ExceptionHandler; import
 org.springframework.web.bind.annotation.RequestMapping; import
 org.springframework.web.bind.annotation.RequestMethod; import
 org.springframework.web.bind.annotation.RequestParam; import
 org.springframework.web.bind.annotation.ResponseBody; import
 org.springframework.web.servlet.ModelAndView;
 
 
 //---------------------------------------------------------------------------
 // 가상 URL 주소로 접속하며 호출되는 메소드를 소유한 [컨트롤러 클래스] 선언. // @Controller 를 붙임으로써
 // [컨트롤러 클래스]임을 지정한다.
 //---------------------------------------------------------------------------
 
  
  @Controller public class SalesController {
  
  @Autowired private SalesService salesService;
  
  @RequestMapping( value="/salesForm.do" ) 
 public ModelAndView getSalesList(
		  	SalesSearchDTO salesSearchDTO
		  	,HttpSession session
		 ) { 
	  ModelAndView mav = new ModelAndView();
	  mav.setViewName("salesForm.jsp");

      String rank_code = (String)session.getAttribute("rank_code");
      mav.addObject("rank_code",rank_code);
  
 try {
	// 사업자번호 (가게명) 얻기.         
	//=========================================================================================================
	 String user_id = (String)session.getAttribute("user_id");
	 //String user_id = "user7";
     //System.out.println(user_id);
     // user_id 를 가지고 u_no 값 얻기
     int user_no = this.salesService.getUserNo(user_id);
     //System.out.println("user_no : " + user_no);
     
     // u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>> .  N행 1열이면 List<String> )
     List<Map<String,String>> businessNoList = this.salesService.getBusinessNoList(user_no);
//	 List<String> businessNoList = this.preChartService.getBusinessNoList(user_no);
     
     // ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
     // ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 EL 문법으로 꺼낼 수 있다. ${저장키값명}
     // JSP 페이지에서 사용하기 위해 addObject를 사용하여 ModelAndView 객체에 저장.
     
     mav.addObject("businessNoList" , businessNoList);
         
         
   //      mav.addObject("boardListAllCnt" , boardListAllCnt);
     //System.out.println(businessNoList);
     //System.out.println( "businessNoList.size()=>" + businessNoList.size());
     //System.out.println( "businessNoList.get(\"business_no\")=>" + businessNoList.get(0).get("business_no") );
     
//==================================================================================================================================
	 
     //System.out.println("salesSearchDTO 의 user_id : " + salesSearchDTO.getUser_id());
     //System.out.println("salesSearchDTO 의 sales_date : " + salesSearchDTO.getSales_date());
     //System.out.println("salesSearchDTO 의 sales_date_t : " + salesSearchDTO.getSales_date_t1()+"~"+ salesSearchDTO.getSales_date_t2());
	 //[검색된 게시판의 총 개수]를 얻기
	 //BoardServiceImpl 객체 소유의 getBoardListAllCnt 메소드 호출로
	 //게시판 검색 개수를 얻기
	 int salesListAllCnt = this.salesService.getSalesListAllCnt(salesSearchDTO);
	 
	 //System.out.println("salesListAllCnt =>" +salesListAllCnt);
	 
	 //[선택된 페이지 번호] 보정하기
	 //보정을 하지 않으면 검색 총 개수 < 선택페이지의 시작행 번호일 때 검색 결과를 보여줄 수 없다.
	 //효율성을 위해 총 개수가 0개 이상일 때만 코딩 실행하도록 설정
	 		if(salesListAllCnt>0) {
	 		//선택한 페이지 번호 구하기
	 			int selectPageNo=salesSearchDTO.getSelectPageNo();
	 			//한 화면에 보여지는 행의 개수 구하기
	 			int rowCntPerPage=salesSearchDTO.getRowCntPerPage();
	 			//검색할 시작 행 번호 구하기
	 			int beginRowNo = selectPageNo*rowCntPerPage-rowCntPerPage+1;
	 			//만약 검색결과 총 행의 개수가 선택한 페이지 시작행 번호보다 작으면
	 			//선택한 페이지 번호를 1로 세팅하기
	 			if(salesListAllCnt<beginRowNo) {
	 							salesSearchDTO.setSelectPageNo(1);
	 			}
	 		}
	 //System.out.println("salesListAllCnt => "+salesListAllCnt);
	 
	 	//[게시판 검색 목록] 얻기
	 		List<Map<String,String>> salesList = this.salesService.getSalesList(salesSearchDTO);
	 		//System.out.println("salesList.size() =>" +salesList.size());
	  
	 		//ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
	 		//ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 EL문법으로 아래처럼 꺼낼 수 있다.
	 		//달러{저장키값명}
	 		mav.addObject("salesList",salesList);
	 		mav.addObject("salesListAllCnt",salesListAllCnt);
	 
	 		mav.addObject("salesSearchDTO",salesSearchDTO); //자동 기능...안써도 감...? => 안 쓰면 안찍힘...
	
	 }catch(Exception e) { //try 구문에서 예외가 발생하면 실행할 구문 설정
		 	System.out.println("<에러발생>");
			System.out.println(e.getMessage()); }
			 		
	 		 return mav;
  }
  
 
 }
 
 
