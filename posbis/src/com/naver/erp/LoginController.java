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

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private PreChartService preChartService;

	@RequestMapping(value = "/mainForm.do")
	public ModelAndView loginForm() { // 메소드 이름은 상관 없음.
		System.out.println("main");
		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mainForm.jsp"); // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49
											// 줄이 접두사 , 접미사 설정이 되어있음.
		return mav;

	}

//---------회원정보 띄워주기 ----------------	

	@RequestMapping(value = "/myPageForm.do")
	public ModelAndView myPageForm(
			HttpSession session
			
		) { // 메소드 이름은 상관 없음.

		
		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPageForm.jsp"); // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49
											// 줄이 접두사 , 접미사 설정이 되어있음.

		System.out.println("myPageForm 시작");
		// 마이페이지 가져오기

		
		  try {
		  
	// 사업자번호 (가게명) 얻기.			
	//=========================================================================================================
			    String user_id = (String) session.getAttribute("user_id");
				//String user_id = "master44";
				System.out.println("myPage user_no 얻기 시작");
				System.out.println(user_id);
	
				// user_id 를 가지고 u_no 값 얻기
				int user_no = this.preChartService.getUserNo(user_id);
				System.out.println("user_no : " + user_no);
	
				// u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>>
				// . N행 1열이면 List<String> )
				List<Map<String, String>> businessNoList = this.preChartService.getBusinessNoList(user_no);
	
				System.out.println("businessNoList 끝");
	
				// ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
				// ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 EL 문법으로 꺼낼 수 있다. ${저장키값명}
				// JSP 페이지에서 사용하기 위해 addObject를 사용하여 ModelAndView 객체에 저장.
				mav.addObject("businessNoList", businessNoList);
	

	//==================================================================================================================================
	  
		  
		  }catch(Exception e) { System.out.println("<addrList 에러발생>");
		  System.out.println(e.getMessage()); }


		return mav;

	}
	

	@RequestMapping(value = "/myPageProc.do" // 접속하는 클라이언트의 URL주소 설정
			, method=RequestMethod.POST // 접속하는 클라이언트의 파라미터값 전송.
			, produces = "application/json;charset=UTF-8" // 응답할 데이터 종류는 json으로 설정.
	)
	@ResponseBody
	public MyPageDTO myPageProc(

			@RequestParam(value = "changeBusinessNo") String changeBusinessNo
			, MyPageDTO myPageDTO

	) {
		System.out.println("myPageProc 시작1");

		System.out.println("business_no ===> " + changeBusinessNo);
		try {

// 사업자번호별 나의 정보 얻어 오기
//==================================================================================================================			
			System.out.println("myInfo 시작1");
			List<Map<String, String>> myInfo = this.loginService.getMyInfo(changeBusinessNo);
			// List<String> salesMonthList =
			// this.preChartService.getSalesMonthList(changeBusinessNo);
//					sml.add((Map<String, String>) salesMonthList);

			System.out.println("myInfo.size()=>" + myInfo.size());


			System.out.println("myInfo.get(\"myInfo\")=>" + myInfo.get(0));

			

//==================================================================================================================	
			myPageDTO.setMyInfo(myInfo);
			System.out.println("정보얻기 끝");
	//		preChartListDTO.setAllSalesMonthList(allSalesMonthList);

		} catch (Exception e) {
			// try 구문에서 예외가 발생하면 실행할 구문 설정
			System.out.println("e.getMessage()" + e.getMessage());
			System.out.println("myPageProc <에러발생>");
		}


		return myPageDTO;

	}

	
	
	
	
	

	@RequestMapping(value = "/joinForm.do")
	public ModelAndView joinForm(

	) { // 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("joinForm.jsp"); // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49
											// 줄이 접두사 , 접미사 설정이 되어있음.
		System.out.println("joinForm 시작");

		try {

			// 주소 구 데이터
			// 가져오기-------------------------------------------------------------------
			List<Map<String, String>> addrListGu = this.loginService.getAddrListGu();
			mav.addObject("addrListGu", addrListGu);
			System.out.println("addrListGu : " + addrListGu.size());

			// 업종 타입 1 데이터
			// 가져오기-------------------------------------------------------------------
			List<Map<String, String>> businessTypeList1 = this.loginService.getbusinessTypeList1();
			mav.addObject("businessTypeList1", businessTypeList1);
			System.out.println("businessTypeList1.size() : " + businessTypeList1.size());

		} catch (Exception e) {
			System.out.println("<addrList 에러발생>");
			System.out.println(e.getMessage());
		}

		return mav;

	}

	
//------------------------------------------------------------------------------------	
	
	@RequestMapping(value = "/findIdPwdForm.do")
	public ModelAndView findIdPwdForm() { // 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findIdPwdForm.jsp"); // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에
												// 46~49 줄이 접두사 , 접미사 설정이 되어있음.
		return mav;

	}
	
	
//------------------------------------------------------------------------------------		
	

	@RequestMapping(value = "/infoUpdateForm.do")
	public ModelAndView infoUpdateForm(
			@RequestParam(value = "business_no") String business_no
		) {
		System.out.println("business_no =====> " + business_no);
		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("infoUpdateForm.jsp"); 
		
		
		try {
			// business_no에 따른 회원정보 가져오기
			List<Map<String, String>> myNStoreInfo = this.loginService.getMyNStoreInfo(business_no);
			System.out.println("myNStoreInfo : " + myNStoreInfo.size());
			System.out.println("myNStoreInfo.get(\"myNStoreInfo\")=>" + myNStoreInfo.get(0));
			mav.addObject("myNStoreInfo", myNStoreInfo);
			
			// 주소 구 데이터
			// 가져오기-------------------------------------------------------------------
			List<Map<String, String>> addrListGu = this.loginService.getAddrListGu();
			mav.addObject("addrListGu", addrListGu);
			System.out.println("addrListGu : " + addrListGu.size());

			// 업종 타입 1 데이터
			// 가져오기-------------------------------------------------------------------
			List<Map<String, String>> businessTypeList1 = this.loginService.getbusinessTypeList1();
			mav.addObject("businessTypeList1", businessTypeList1);
			System.out.println("businessTypeList1.size() : " + businessTypeList1.size());
			


		} catch (Exception e) {
			System.out.println("<addrList 에러발생>");
			System.out.println(e.getMessage());
		}
		
		
		return mav;

	}
	
	
	
	
//-----------------------------------------------------------------------------------	
	

	@RequestMapping(value = "/introForm.do")
	public ModelAndView introForm() { // 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("introForm.jsp"); // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49
											// 줄이 접두사 , 접미사 설정이 되어있음.
		return mav;

	}

	
	
//---------------------------------------------------------------------------------------------------	
	
	

	@RequestMapping(value = "/withdrawalForm.do")
	public ModelAndView withdrawalForm() { // 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("withdrawalForm.jsp"); // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에
												// 46~49 줄이 접두사 , 접미사 설정이 되어있음.
		return mav;

	}
	
	// -----------------------------------------------------------------------------
	// ajax를 통해 아이디 암호 맞는 사용자 삭제하기
	@RequestMapping(value = "/withdrawalProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int withdrawalProc(
			@RequestParam(value = "user_id") String user_id,
			@RequestParam(value = "user_pwd") String user_pwd
		) 
	{

		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_pwd", user_pwd);

		int deleteUserInfoCnt = 0;

		System.out.println("user_id = " + user_id);
		System.out.println("user_pwd = " + user_pwd);

		try {
			System.out.println("실행전");
			deleteUserInfoCnt = this.loginService.deleteUserInfo(map);

			System.out.println("실행후");

		} catch (Exception e) {

			System.out.println("<withdrawalProc 에러발생>");
			System.out.println(e.getMessage());
			deleteUserInfoCnt = -1;
		}

		return deleteUserInfoCnt;

	}
	

	
//--------------------------------------------------------------------------------------------------------	

	// -----------------------------------------------------------------------------
	// 아이디 중복 확인

	@RequestMapping(value = "/joinProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int joinProc(@RequestParam(value = "user_id") String user_id) {

		System.out.println("user_id = " + user_id);

		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);

		int join_idCnt = 0;

		try {
			join_idCnt = this.loginService.getJoinIDCnt(map);

			System.out.println("<접속성공> [접속 URL]->/joinProc.do [호출메소드] -> LoginController.joinProc(~) \n\n\n");
		} catch (Exception e) {
			System.out.println("<접속실패> [접속 URL]->/joinProc.do [호출메소드] -> LoginController.joinProc(~) \n\n\n");
			join_idCnt = -1;
		}

		return join_idCnt;
	}

	// -----------------------------------------------------------------------------
	// 구 체크 후 동체크
	@RequestMapping(value = "/addrDongProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public List<String> addrDongProc(@RequestParam(value = "addr_gu") String addr_gu) {

		// webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이
		// 접두사 , 접미사 설정이 되어있음.
		List<String> addrDongList = new ArrayList<String>();
		// addrDongList.add(addr_gu);
		System.out.println("addr_gu = " + addr_gu);

		// List<Map<String,String>> addrListDong = null;

		try {

			addrDongList = this.loginService.getAddrListDong(addr_gu);
			// addrListDong.addAll("addrListDong",addrListDong);
			System.out.println("addrListDong.size() : " + addrDongList.size());
			System.out.println("addrListDong.size() : " + addrDongList.get(0));

		} catch (Exception e) {
			System.out.println("<addrListDong 에러발생>");
			System.out.println(e.getMessage());
		}

		// addrDongList.add()
		return addrDongList;

	}

	// -----------------------------------------------------------------------------
	// 업종1 검색시 업종2 구하기
	@RequestMapping(value = "/businessTypeName2Proc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public List<String> businessTypeName2Proc(@RequestParam(value = "business_type_name1") String business_type_name1) {

		List<String> businessTypeList2 = new ArrayList<String>();
		// addrDongList.add(business_type_name1);
		System.out.println("business_type_name1 = " + business_type_name1);

		// List<Map<String,String>> businessTypeList2 = null;

		try {

			businessTypeList2 = this.loginService.getbusinessTypeList2(business_type_name1);

			System.out.println("businessTypeList2.size() : " + businessTypeList2.size());

		} catch (Exception e) {
			System.out.println("<businessTypeList2 에러발생>");
			System.out.println(e.getMessage());
		}

		return businessTypeList2;

	}

	// -----------------------------------------------------------------------------
	// 회원가입 등록 ajax
	@RequestMapping(value = "/joinRegProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int joinRegProc(joinDTO joinDTO) {
		// 사용자 등록
		int insertJoinCnt = 0;

		try {
			insertJoinCnt = this.loginService.insertJoinUser(joinDTO);

		} catch (Exception e) {

			System.out.println("<insertJoin 에러발생>");
			System.out.println(e.getMessage());

		}

		return insertJoinCnt;
	}

	

	// -----------------------------------------------------------------------------
	// 아이디, 암호 체크 후 ajax를 통해 아이디 조회 후 로그인 하기
	@RequestMapping(value = "/loginProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int loginProc(@RequestParam(value = "user_id") String user_id,
			@RequestParam(value = "user_pwd") String user_pwd,
			@RequestParam(value = "is_login", required = false) String is_login, HttpSession session,
			HttpServletResponse response) {
		System.out.println("user_id = " + user_id);
		System.out.println("user_pwd = " + user_pwd);
		System.out.println("is_login = " + is_login);

		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_pwd", user_pwd);

		int admin_idCnt = 0;

		try {

			admin_idCnt = this.loginService.getAdminCnt(map);

			if (admin_idCnt == 1) {
				System.out.println("user_id = " + user_id);
				System.out.println("user_pwd = " + user_pwd);
				
				//user_id를 세션에 담기
				session.setAttribute("user_id", user_id);

				
				
				
				if (is_login != null) {
					System.out.println("if(is_login != null)접속성공");

					Cookie cookie1 = new Cookie("user_id", user_id);
					cookie1.setMaxAge(60 * 60 * 24);
					response.addCookie(cookie1);

					Cookie cookie2 = new Cookie("user_pwd", user_pwd);
					cookie2.setMaxAge(60 * 60 * 24);
					response.addCookie(cookie2);
				} else {

					Cookie cookie1 = new Cookie("user_id", null);
					cookie1.setMaxAge(0);
					response.addCookie(cookie1);

					Cookie cookie2 = new Cookie("user_pwd", null);
					cookie2.setMaxAge(0);
					response.addCookie(cookie2);
				}

			}

			System.out.println("loginProc접속성공");

		} catch (Exception e) {
			System.out.println("loginProc접속실패");
			admin_idCnt = -1;
		}

		return admin_idCnt;
	}

	@RequestMapping(value = "/logout.do")
	public ModelAndView logout(

			HttpSession session) {

		session.removeAttribute("admin_id");
		session.removeAttribute("uri");
		// session.removeAttribute("boardSearchDTO");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("logout.jsp");
		System.out.println(" 접속성공 logout");
		return mav;
	}

	@ExceptionHandler(Exception.class)
	public String handlerException(HttpServletRequest request) {
		return "logout.jsp";
	}
//-----------------------------------------------------------------------------		
	// 사업자 아이디 중복

	@RequestMapping(value = "/chekckBusinessNoProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int chekckBusinessNoProc(@RequestParam(value = "business_no") String business_no) {

		System.out.println("business_no = " + business_no);

		Map<String, String> map = new HashMap<String, String>();
		map.put("business_no", business_no);

		int businessnoCnt = 0;

		try {
			System.out.println("business_no = " + business_no);

			businessnoCnt = this.loginService.getBusinessnoCnt(map);

			System.out.println("<접속성공>chekckBusinessNoProc \n\n\n");

		} catch (Exception e) {
			System.out.println("<접속실패>chekckBusinessNoProc \n\n\n");
			businessnoCnt = -1;
		}

		return businessnoCnt;
	}

//-----------------------------------------------------------------------------		
	// 아이디 비밀번호 찾기

	@RequestMapping(value = "/findIDPassword.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public searchIDPwdDTO findIDPassword(@RequestParam(value = "user_name") String user_name,
			@RequestParam(value = "business_no") String business_no,
			@RequestParam(value = "question_code") String question_code,
			@RequestParam(value = "answer") String answer) {

		System.out.println("user_name = " + user_name);
		System.out.println("business_no = " + business_no);
		System.out.println("question_code = " + question_code);
		System.out.println("answer = " + answer);

		Map<String, String> map = new HashMap<String, String>();
		map.put("user_name", user_name);
		map.put("business_no", business_no);
		map.put("question_code", question_code);
		map.put("answer", answer);

		searchIDPwdDTO findfindIDPwd = null;

		try {

			System.out.println("findIDPassword입장");

			findfindIDPwd = this.loginService.getfindIDPwd(map);

			System.out.println(findfindIDPwd.getUser_id());
			System.out.println("<접속성공>findIDPassword \n\n\n");

		} catch (Exception e) {
			System.out.println("<접속실패>findIDPassword \n\n\n");

		}

		// int 와 string을 사용한다면 modelandview 사용 해서 if 사용하여 가져옴
		return findfindIDPwd;
	}

}

// xxx.do로 접속하면 @Controller 가 붙어있는 클래스 안에 @RequestMapping( value="/xxx.do" ) 가 붙어있는 메소드 호출.
