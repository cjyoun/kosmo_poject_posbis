package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PreChartController {
	
	
	// 속성변수 boardService 선언하고 [BoardService 인터페이스]를 구현받은 클래스를 찾아 객체 생성해서 저장.
	// 관용적으로 [BoardService 인터페이스]를 구현받은 클래스명은 BoardServiceImpl 이다.
	@Autowired
	private PreChartService preChartService;
	
	//-------------------------------------------------------------------------------
	// 가상주소 /z_spring/boardRegForm.do 로 접근하면 호출되는 메소드 선언.
	//-------------------------------------------------------------------------------
	@RequestMapping( value="/preChartForm.do" )
	public ModelAndView goPreChartForm() {
		// ModelAndView 객체 생성하고 ModelAndView 객체에 호출 JSP 페이지명을 저장하기.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("preChartForm.jsp");  

		
		try {
		
// 사업자번호 (가게명) 얻기.			
//=========================================================================================================
			String user_id = "master7";
			System.out.println("user_no 얻기 시작");
			System.out.println(user_id);
			
			// user_id 를 가지고 u_no 값 얻기
			int user_no = this.preChartService.getUserNo(user_id);
			System.out.println("user_no : " + user_no);
			
			
			
			// u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>> .  N행 1열이면 List<String> )
			List<Map<String,String>> businessNoList = this.preChartService.getBusinessNoList(user_no);
//			List<String> businessNoList = this.preChartService.getBusinessNoList(user_no);

			System.out.println("businessNoList 끝");
			
					
			
			// ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
			// ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 EL 문법으로 꺼낼 수 있다. ${저장키값명}
			// JSP 페이지에서 사용하기 위해 addObject를 사용하여 ModelAndView 객체에 저장.			
			mav.addObject("businessNoList" , businessNoList);
			
			
	//		mav.addObject("boardListAllCnt" , boardListAllCnt);
			System.out.println(businessNoList);
			System.out.println( "businessNoList.size()=>" + businessNoList.size());
			System.out.println( "businessNoList.get(\"business_no\")=>" + businessNoList.get(0).get("business_no") );
			
//==================================================================================================================================
			
			
			
			
			
			
			
			
		}catch(Exception e) {
			//try 구문에서 예외가 발생하면 실행할 구문 설정
			System.out.println(e.getMessage());
			System.out.println("preChartProc <에러발생>");
		}
		
		
		return mav;
		
	}
		
		
		

	

	//-------------------------------------------------------------------------------
	// /preChartProc.do 로 접근하면 호출되는 메소드 선언.
	//-------------------------------------------------------------------------------
	@RequestMapping( 
			value="/preChartProc.do"						// 접속하는 클라이언트의 URL주소 설정
		//	, method=RequestMethod.POST						// 접속하는 클라이언트의 파라미터값 전송.
			, produces="application/json;charset=UTF-8"		// 응답할 데이터 종류는 json으로 설정.
	)
	@ResponseBody				
	public List<Map<String,String>> preChartProc(

			// 파라미터 값이 저장되는 [BoardSearchDTO 객체]를 매개변수로 선언
				// 1) [파라미터명]과 [BoardSearchDTO 객체]의 [속성변수명]이 같으면 satter 메소드가 작동되어 [파라미터값]이 [속성변수]에 저장된다. (Spring 프레임워크가 알아서 해주는 것.)
				// 2) [속성변수명]에 대응하는 [파라미터명]이 없으면 satter 메소드가 작동되지 않는다.
				// 3) [속성변수명]에 대응하는 [파라미터명]이 있는데 [파라미터값]이 없으면 [속성변수]의 자료형에 관계없이 무조건 null 값이 저장된다.
				//		- 자료형이 int 와 같은 기본형일 경우 속성변수 값으로 null 이 들어가게 되므로 에러가 발생한다.
				//		- 이러한 에러를 피하려면 파라미터값이 기본형이거나 속성면수의 자료형을 String으로 해야한다.
				//		- 에러가 발생하면 메소드 안의 실행구문은 하나도 실행되지 않는다. (예외처리도 안됨.)
			//PreChartSearchDTO preChartSearchDTO
			
			//,@RequestParam(value="user_id") String user_id
			@RequestParam(value="changeBusinessNo") String changeBusinessNo

			
	) {		
		System.out.println("preChartProc 시작1");
		List<Map<String,String>> salesMonthList = null;

		System.out.println("business_no ===> "+changeBusinessNo);
		try {
			
			System.out.println("salesMonthList 시작1");
			salesMonthList = this.preChartService.getSalesMonthList(changeBusinessNo);
			//List<String> salesMonthList = this.preChartService.getSalesMonthList(changeBusinessNo);
//			sml.add((Map<String, String>) salesMonthList);
		
			System.out.println( "salesMonthList.size()=>" + salesMonthList.size());
			
			for(int i=0; i<12; i++) {
				System.out.println( "salesMonthList.get(\"salesMonthList\")=>" + salesMonthList.get(i) );
			}
			
			

//			
//			System.out.println( "sml.size()=>" + sml.size());
//			System.out.println( "sml.get(\"business_no\")=>" + sml.get(0) );
//			
			
		}catch(Exception e) {
			//try 구문에서 예외가 발생하면 실행할 구문 설정
			System.out.println("e.getMessage()"+e.getMessage());
			System.out.println("preChartProc <에러발생>");
		}
		
		
		
		System.out.println("리턴한다~~~~");
		return salesMonthList;
		
		
	}
		
		
		
}
