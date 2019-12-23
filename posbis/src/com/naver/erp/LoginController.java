package com.naver.erp;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


//-------------------------------------------------------------------------------
// 가상 URL 주소로 접속하며 호출되는 메소드를 소유한 [컨트롤러 클래스] 선언.
// @Controller 를 붙임으로써 [컨트롤러 클래스]임을 지정한다.
//-------------------------------------------------------------------------------
@Controller
// 클래스 내부에서 발생하는 모든 예외를 잡는 것. (잡히면 @ExceptionHandler 가 붙은 메소드를 호출함.)
@ControllerAdvice
public class LoginController {
	
	
	@RequestMapping( value="/mainForm.do" )	
	public ModelAndView loginForm() {		// 메소드 이름은 상관 없음.
		System.out.println("loginForm 메소드 호출");
		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mainForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	@RequestMapping( value="/myPageForm.do" )	
	public ModelAndView myPageForm() {		// 메소드 이름은 상관 없음.
		System.out.println("myPageForm 메소드 호출");
		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPageForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	@RequestMapping( value="/joinForm.do" )	
	public ModelAndView joinForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("joinForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	
	@RequestMapping( value="/findIdPwdForm.do" )	
	public ModelAndView findIdPwdForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findIdPwdForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	
	@RequestMapping( value="/infoUpdateForm.do" )	
	public ModelAndView infoUpdateForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("infoUpdateForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	

	@RequestMapping( value="/introForm.do" )	
	public ModelAndView introForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("introForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	@RequestMapping( value="/menuForm.do" )	
	public ModelAndView menuForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("menuForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	@RequestMapping( value="/menuRegForm.do" )	
	public ModelAndView menuRegForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("menuRegForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	
	
	@RequestMapping( value="/menuUpDelForm.do" )	
	public ModelAndView menuUpDelForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("menuUpDelForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	
	
	
	@RequestMapping( value="/payForm.do" )	
	public ModelAndView payForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("payForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	
	
/*	
	@RequestMapping( value="/preChartForm.do" )	
	public ModelAndView preChartForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("preChartForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
*/	
	
	
	
//	
//	@RequestMapping( value="/preSearchForm.do" )	
//	public ModelAndView preSearchForm() {		// 메소드 이름은 상관 없음.
//
//		// [ModelAndView 객체] 생성.
//		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
//		// [ModelAndView 객체] 리턴하기
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("preSearchForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
//		return mav;
//		
//	}
//	
//	
	
	
	@RequestMapping( value="/qstnContentForm.do" )	
	public ModelAndView qstnContentForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qstnContentForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	
	
	
	@RequestMapping( value="/qstnForm.do" )	
	public ModelAndView qstnForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qstnForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	
	
	
	@RequestMapping( value="/qstnRegForm.do" )	
	public ModelAndView qstnRegForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qstnRegForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	
	
	
	
	@RequestMapping( value="/qstnUpDelForm.do" )	
	public ModelAndView qstnUpDelForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qstnUpDelForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}
	
	

	
	
//	@RequestMapping( value="/salesForm.do" )	
//	public ModelAndView salesForm() {		// 메소드 이름은 상관 없음.
//
//		// [ModelAndView 객체] 생성.
//		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
//		// [ModelAndView 객체] 리턴하기
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("salesForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
//		return mav;
//		
//	}
//	
//	
	
	
	@RequestMapping( value="/withdrawalForm.do" )	
	public ModelAndView withdrawalForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("withdrawalForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 
		return mav;
		
	}


}


// xxx.do로 접속하면 @Controller 가 붙어있는 클래스 안에 @RequestMapping( value="/xxx.do" ) 가 붙어있는 메소드 호출.


