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

@Controller
//클래스 내부에서 발생하는 모든 예외를 잡는 것. (잡히면 @ExceptionHandler 가 붙은 메소드를 호출함.)
@ControllerAdvice
public class PosLoginController {

	@Autowired
	private PosLoginService posLoginService;
	
	
	
	

	@RequestMapping(value = "/posLoginForm.do")
	public ModelAndView posLoginForm() {
		System.out.println("loginForm");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/posLoginForm.jsp"); 

		return mav;

	}
	
	
// -------------------------------------------------------------------------------------------------------------------------------------
	// 아이디, 암호 체크 후 ajax를 통해 아이디 조회 후 로그인 하기
	@RequestMapping(value = "/posLoginProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int posLoginProc(
			PosLoginDTO posLoginDTO
			, @RequestParam(value = "is_posLogin", required = false) String is_posLogin
			, HttpSession session
			, HttpServletResponse response
		) 
	{
		
		//System.out.println(posLoginDTO.getBusiness_no());
		//System.out.println(posLoginDTO.getUser_pwd());
		
		//System.out.println("is_posLogin = " + is_posLogin);


		int admin_idCnt = 0;

		try {

			admin_idCnt = this.posLoginService.getAdminNoCnt(posLoginDTO);
			
			if (admin_idCnt == 1) {
				
				// 로그인한 business_no를 세션에 담기
				session.setAttribute("pos_business_no", posLoginDTO.getBusiness_no());
			
				if (is_posLogin != null) {
					System.out.println("if(is_posLogin != null)접속성공");

					Cookie cookie1 = new Cookie("business_no", posLoginDTO.getBusiness_no());
					cookie1.setMaxAge(60 * 60 * 24);
					response.addCookie(cookie1);

					Cookie cookie2 = new Cookie("user_pwd", posLoginDTO.getUser_pwd());
					cookie2.setMaxAge(60 * 60 * 24);
					response.addCookie(cookie2);
				} else {

					Cookie cookie1 = new Cookie("business_no", null);
					cookie1.setMaxAge(0);
					response.addCookie(cookie1);

					Cookie cookie2 = new Cookie("user_pwd", null);
					cookie2.setMaxAge(0);
					response.addCookie(cookie2);
				}
			}

		} catch (Exception e) {
			System.out.println("e.getMessage()" + e.getMessage());
			System.out.println("posLoginProc접속실패");
			admin_idCnt = -1;
		}
		
		System.out.println("controller/admin_idCnt-->"+admin_idCnt);
		return admin_idCnt;
	}
	
	
	
	
	
	
	@RequestMapping(value = "/posLogoutForm.do")
	public ModelAndView posLogoutForm(

			HttpSession session) {

		session.removeAttribute("pos_business_no");

		// session.removeAttribute("boardSearchDTO");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/posLogout.jsp");
		System.out.println(" 접속성공 posLogoutForm");
		return mav;
	}
	
	
	@ExceptionHandler(Exception.class)
	public String handlerException(HttpServletRequest request) {
		return "posLogout.jsp";
	}
}