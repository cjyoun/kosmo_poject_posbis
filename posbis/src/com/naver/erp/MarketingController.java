
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
 
  
  @Controller public class MarketingController {

	  @Autowired private SalesService salesService;
	  
  @RequestMapping( value="/marketingForm.do" ) 
 public ModelAndView marketingForm(
		 	MarketingDTO marketingDTO
		  	,HttpSession session
		 ) { 
	  ModelAndView mav = new ModelAndView();
	  mav.setViewName("marketingForm.jsp");
	  
      String rank_code = (String)session.getAttribute("rank_code");
      mav.addObject("rank_code",rank_code);
      String user_id = (String)session.getAttribute("user_id");
      mav.addObject("user_id",user_id);
  
 try {
		// 사업자번호 (가게명) 얻기.         
		//=========================================================================================================
	     // user_id 를 가지고 u_no 값 얻기
	     int user_no = this.salesService.getUserNo(user_id);
	     //System.out.println("user_no : " + user_no);
	     
	     // u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>> .  N행 1열이면 List<String> )
	     List<Map<String,String>> businessNoList = this.salesService.getBusinessNoList(user_no);
	     
	     // ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
	     // ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 EL 문법으로 꺼낼 수 있다. ${저장키값명}
	     // JSP 페이지에서 사용하기 위해 addObject를 사용하여 ModelAndView 객체에 저장.
	     
	     mav.addObject("businessNoList" , businessNoList);
	     
//=========================================================================================================
	     List<Map<String,String>> setMenuList = this.salesService.getSetMenuList(marketingDTO);
	     mav.addObject("setMenuList",setMenuList);
	     mav.addObject("marketingDTO",marketingDTO);

	     System.out.println("ㅡㅡㅡ"+marketingDTO.getChangeBusinessNo());
	     System.out.println(marketingDTO.getDataArea());
	     System.out.println(setMenuList);
     }catch(Exception e) { //try 구문에서 예외가 발생하면 실행할 구문 설정
	 	System.out.println("<에러발생>");
		System.out.println(e.getMessage()); }
		 		
		 return mav;
}

  
  
  
  
  
	@RequestMapping(value = "/marketingProc.do" // 접속하는 클라이언트의 URL주소 설정
			, method=RequestMethod.POST // 접속하는 클라이언트의 파라미터값 전송.
			, produces = "application/json;charset=UTF-8" // 응답할 데이터 종류는 json으로 설정.
	)
	@ResponseBody
	public SetMenuDTO marketingProc(
			MarketingDTO marketingDTO
			, SetMenuDTO setMenuDTO

	) {		
		
		//List<Map<String,String>> setMenuList = new ArrayList<Map<String,String>>();
		//String changeBusinessNo = null;
		
		try {
			System.out.println("proc시작~~");
//==================================================================================================================	
			//System.out.println( this.salesService.getSetMenuList(marketingDTO) );
			//System.out.println( marketingDTO.getChangeBusinessNo() );		
			List<Map<String,String>> setMenuListChart = this.salesService.getSetMenuListChart(marketingDTO);
			setMenuDTO.setSetMenuList(setMenuListChart);
			
			String changeBusinessNo = marketingDTO.getChangeBusinessNo();
			setMenuDTO.setChangeBusinessNo(changeBusinessNo);		
			

			String dataArea = marketingDTO.getDataArea();
			setMenuDTO.setDataArea(dataArea);			
			
			System.out.println( setMenuDTO.getSetMenuList() );
			System.out.println( setMenuDTO.getChangeBusinessNo() );
			System.out.println( setMenuDTO.getDataArea()  );		

		} catch (Exception e) {
			// try 구문에서 예외가 발생하면 실행할 구문 설정
			System.out.println("e.getMessage()" + e.getMessage());
			System.out.println("marketingProc <에러발생>");
		}

		return setMenuDTO;

	}
 
 }
 
 
