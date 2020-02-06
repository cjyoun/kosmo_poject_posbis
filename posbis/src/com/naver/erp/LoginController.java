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
	
	//로그인 전에 소개글로 가기
	@RequestMapping(value = "/beforeSignIntroForm.do")
	public ModelAndView beforeSignIntroForm() { // 메소드 이름은 상관 없음.
		System.out.println("main");
		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("beforeSignIntroForm.jsp"); // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49
											// 줄이 접두사 , 접미사 설정이 되어있음.
		return mav;

	}
	
	
	// -----------------------------------------------------------------------------
		// 아이디, 암호 체크 후 ajax를 통해 아이디 조회 후 로그인 하기
		@RequestMapping(value = "/loginProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
		@ResponseBody
		public int loginProc(
				@RequestParam(value = "user_id") String user_id,
				@RequestParam(value = "user_pwd") String user_pwd,
				@RequestParam(value = "is_login", required = false) String is_login, 
				HttpSession session,
				HttpServletResponse response
			) 
		{
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
					
					// 로그인한 user_id를 세션에 담기
					session.setAttribute("user_id", user_id);
					
					String rank_code = this.loginService.getRankCode(user_id);
					System.out.println("rank_code ===== " + rank_code);
					// 로그인한 rank_code를 세션에 담기
					session.setAttribute("rank_code", rank_code);
					
					// user_id 를 가지고 u_no 값 얻기
					int u_no = this.preChartService.getUserNo(user_id);
					System.out.println("user_no : " + u_no);
					session.setAttribute("u_no", u_no);
					
					
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
				System.out.println("e.getMessage()" + e.getMessage());
				System.out.println("loginProc접속실패");
				admin_idCnt = -1;
			}

			return admin_idCnt;
		}
	
	
	
	
	

//---------회원정보 띄워주기 ----------------	

	@RequestMapping(value = "/myPageForm.do")
	public ModelAndView myPageForm(	HttpSession session	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPageForm.jsp"); 
		  try {		  
	// 사업자번호 (가게명) 얻기.			
	//=========================================================================================================
			  	String rank_code = (String)session.getAttribute("rank_code");
			  	System.out.println("로그인한 아이디의 등급 코드 ======= "+ rank_code);
			    String user_id = (String) session.getAttribute("user_id");
				//String user_id = "master44";
				System.out.println("myPage user_no 얻기 시작");
				System.out.println(user_id);
	
				int u_no = (int) session.getAttribute("u_no");
	
				// u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>>
				// . N행 1열이면 List<String> )
				List<Map<String, String>> businessNoList = this.preChartService.getBusinessNoList(u_no);
	
				System.out.println("businessNoList 끝");
	
				// ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
				// ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 EL 문법으로 꺼낼 수 있다. ${저장키값명}
				// JSP 페이지에서 사용하기 위해 addObject를 사용하여 ModelAndView 객체에 저장.
				mav.addObject("businessNoList", businessNoList);
				mav.addObject("rank_code", rank_code);
				mav.addObject("user_id",user_id);

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
			, HttpSession session
	) {
		try {
			System.out.println("정보얻기 시작 ======= myPageProc.do");
			String rank_code = (String)session.getAttribute("rank_code");	
			List<Map<String, String>> myInfo = this.loginService.getMyInfo(changeBusinessNo);			
			myPageDTO.setMyInfo(myInfo);
			System.out.println("정보얻기 끝");
		} catch (Exception e) {
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
	// -----------------------------------------------------------------------------
		// 회원가입 후 결제창 
	
	
	@RequestMapping(value = "/joinPayForm.do")
	public ModelAndView joinPayForm() { // 메소드 이름은 상관 없음.
		System.out.println("main");
		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("joinPayForm.jsp"); // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49
											// 줄이 접두사 , 접미사 설정이 되어있음.
		return mav;

	}
	
	
	// -----------------------------------------------------------------------------
	// 아이디 중복 확인

	@RequestMapping(value = "/joinCheckUserId.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
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
	// 회원가입 등록 ajax
	@RequestMapping(value = "/joinRegProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int joinRegProc(JoinDTO joinDTO , HttpSession session) {
		// 사용자 등록
		int insertJoinCnt = 0;

		try {
			System.out.println("joinRegProc : " + insertJoinCnt);
			insertJoinCnt = this.loginService.insertJoinUser(joinDTO);
			
			System.out.println("joinRegProc 회원가입 성공 : " + insertJoinCnt);
			int u_no = this.preChartService.getUserNo(joinDTO.getUser_id());
			System.out.println("user_no : " + u_no);
			session.setAttribute("u_no", u_no);

		} catch (Exception e) {

			System.out.println("<insertJoin 에러발생>");
			System.out.println(e.getMessage());

		}

		return insertJoinCnt;
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
	
	

	
	
	
//-----------------------------------------------------------------------------------	
	

	@RequestMapping(value = "/introForm.do")
	public ModelAndView introForm(
			HttpSession session
			
			) 
	{ // 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("introForm.jsp"); // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49
											// 줄이 접두사 , 접미사 설정이 되어있음.
		
		String rank_code = (String)session.getAttribute("rank_code");
		String user_id = (String)session.getAttribute("user_id");
		mav.addObject("rank_code",rank_code);
		mav.addObject("user_id",user_id);
		return mav;

	}

	
	
	
//---------------------------------------------------------------------------------------------------	
		
		//성유진------------------------------------------------

		@RequestMapping(value = "/withdrawalForm.do")
		public ModelAndView withdrawalForm(HttpSession session) { // 메소드 이름은 상관 없음.

			// [ModelAndView 객체] 생성.
			// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
			// [ModelAndView 객체] 리턴하기
			ModelAndView mav = new ModelAndView();
			mav.setViewName("withdrawalForm.jsp"); // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에
													// 46~49 줄이 접두사 , 접미사 설정이 되어있음.
			
			
			String rank_code = (String)session.getAttribute("rank_code");
			String user_id = (String)session.getAttribute("user_id");
			mav.addObject("rank_code",rank_code);
			mav.addObject("user_id",user_id);
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
		
		// 성유진 controller 끝
		
	//--------------------------------------------------------------------------------------------------------	
	
	//------------------------------------------------------------------------------------		
	

		@RequestMapping(value = "/infoUpdateForm.do")
		public ModelAndView infoUpdateForm(
				@RequestParam(value = "business_no") String business_no,
				HttpSession session
			) {
			System.out.println("business_no =====> " + business_no);
			// [ModelAndView 객체] 생성.
			// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
			// [ModelAndView 객체] 리턴하기
			ModelAndView mav = new ModelAndView();
			mav.setViewName("infoUpdateForm.jsp"); 
			
			String rank_code = (String)session.getAttribute("rank_code");
			String user_id = (String)session.getAttribute("user_id");
			
			//김수민=====================================
			int u_no = (int)session.getAttribute("u_no");
			//===========================================
			
			mav.addObject("rank_code",rank_code);
			mav.addObject("user_id",user_id);
			
			try {
				//김수민=============================================
				//유저의 현재 비밀번호 가져오기
				String user_pwd = this.loginService.getUserPwd(u_no);
				mav.addObject("user_pwd", user_pwd);
				//===================================================
				
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
		
		
		
		@RequestMapping(value = "/infoUpdateProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
		@ResponseBody
		public int infoUpdateProc(
				UpdateInfoDTO updateInfoDTO 
				, HttpSession session
				, @RequestParam(value = "user_pwd") String user_pwd
			) 
		{
			int updateSuccess = 0;
			// 사용자 정보 업데이트 갯수
			int infoUpdateUserCnt = 0;
			// 사용자 정보 업데이트 갯수
			int infoUpdateBusinessCnt = 0;
			// 사용자가 저장한 카드의 갯수
			int cardCnt = 0;
			
			//영업시간 업데이트 갯수=========김수민
			int updateSalesTimeCnt = 0;
			
			int pwdCnt = 0;
			
			int u_no = (int)session.getAttribute("u_no");
			updateInfoDTO.setU_no(u_no);
			
			System.out.println("getU_no=======> " + updateInfoDTO.getU_no());
			//System.out.println("getU_no=======> " + updateInfoDTO.getNewPwd());

			String rank_code = (String)session.getAttribute("rank_code");
			System.out.println("업데이트 전 rank_code " + rank_code);
			
			try {

				// 유저 정보 업데이트
				infoUpdateUserCnt = this.loginService.updateInfoUser(updateInfoDTO);
				System.out.println("infoUpdateCnt ======> " + infoUpdateUserCnt);
								
				// 가게 정보 업데이트
				infoUpdateBusinessCnt = this.loginService.updateInfoBusiness(updateInfoDTO);
				System.out.println("infoUpdateBusinessCnt ======> " + infoUpdateBusinessCnt);
				
				// =============================김수민=====================================
				// 영업 시간 업데이트
				updateSalesTimeCnt = this.loginService.updateSalesTime(updateInfoDTO);
				System.out.println("updateSalesTimeCnt ======> " + updateSalesTimeCnt);
				//==========================================================================
				
				// 업데이트된 등급 구하기
				String newRankCode = this.loginService.getRankCode(updateInfoDTO.getUser_id());
				System.out.println("newRankCode ======> " + newRankCode);
				
				// 카드갯수 구하기
				cardCnt = this.loginService.getCardCnt(u_no);
				System.out.println("cardCnt ======> " + cardCnt);
				
				
				// 유저정보와 가게정보 업데이트가 성공했다면			김수민 추가
				if(infoUpdateUserCnt!=0 && infoUpdateBusinessCnt!=0 && updateSalesTimeCnt!=0) {
				    // 기존 등급에서 등급을 변경했을 때
					if(!rank_code.equals(newRankCode)) {				
						// 새로 업데이트된 등급이 프리미엄 등급일 때
						System.out.println("newRankCode2 ======> " + newRankCode);
						if( newRankCode.equals("2")) {
							// 카드가 등록되어 있지 않을 때
							if(cardCnt == 0) {
								updateSuccess = 1;
								System.out.println("카드가 등록되어 있지 않을 때 (프리미엄) ======> updateSuccess  " + updateSuccess);
							}
							// 카드가 이미 1개 등록되어 있을 때
							else if(cardCnt == 1){
								updateSuccess = 2;
								System.out.println("카드가 이미 1개 등록되어 있을 때 (프리미엄) ======> updateSuccess " + updateSuccess);
							}
							// 그 외의 경우
							else {
								updateSuccess = 3;
								System.out.println("cardCnt ======> updateSuccess " + updateSuccess);
							}
						}
						// 새로 업데이트된 등급이 일반 등급일 때
						else {
							// 카드가 등록되어 있지 않을 때
							if(cardCnt == 0) {
								updateSuccess = 4;
								System.out.println("카드가 등록되어 있지 않을 때 (일반) ======> updateSuccess " + updateSuccess);
							}
							// 카드가 등록되어 있을 때
							else {
								// 등록된 카드 삭제
								int deleteCard = this.loginService.deleteinfoCard(updateInfoDTO.getU_no());
								updateSuccess = 5;
								System.out.println("카드가 등록되어 있을 때 (일반) ======> updateSuccess " + updateSuccess);
							}
							
							
						}
						
				    }else {
				    		updateSuccess = 6;
				    }

					
				}
				
				
				
			} catch (Exception e) {

				System.out.println("<infoUpdateProc 에러발생>");
				System.out.println(e.getMessage());

			}

			return updateSuccess;
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


	

	
//------------------------------------------------------------------------	
	

	@RequestMapping(value = "/logoutForm.do")
	public ModelAndView logout(

			HttpSession session) {

		session.removeAttribute("user_id");
		session.removeAttribute("uri");
		session.removeAttribute("rank_code");
		session.removeAttribute("u_no");
		session.removeAttribute("qstnSearchDTO");

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
	public SearchIDPwdDTO findIDPassword(@RequestParam(value = "user_name") String user_name,
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

		SearchIDPwdDTO findfindIDPwd = null;

		try {

			System.out.println("findIDPassword입장");

			findfindIDPwd = this.loginService.getfindIDPwd(map);

			//System.out.println(findfindIDPwd.getUser_id());
			System.out.println(findfindIDPwd);
			System.out.println("<접속성공>findIDPassword \n\n\n");

		} catch (Exception e) {
			System.out.println(findfindIDPwd);
			System.out.println("<접속실패>findIDPassword \n\n\n");

		}

		// int 와 string을 사용한다면 modelandview 사용 해서 if 사용하여 가져옴
		return findfindIDPwd;
	}

	
	//----------------------------------------------------------------
	
	
	@RequestMapping( value="/payFormLogin.do" )   
	   public ModelAndView payFormLogin(HttpSession session) {      // 메소드 이름은 상관 없음.

	      // [ModelAndView 객체] 생성.
	      // [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
	      // [ModelAndView 객체] 리턴하기
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("payFormLogin.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 

	      String rank_code = (String)session.getAttribute("rank_code");
			String user_id = (String)session.getAttribute("user_id");
			mav.addObject("rank_code",rank_code);
			mav.addObject("user_id",user_id);
	      
	     // int u_no = (int)session.getAttribute("u_no");
	      
	      return mav;
	      
	   }	
	
	//----------------------------------------------------------------
	
	
	@RequestMapping( value="/payForm.do" )   
	   public ModelAndView payForm(HttpSession session) {      // 메소드 이름은 상관 없음.

	      // [ModelAndView 객체] 생성.
	      // [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
	      // [ModelAndView 객체] 리턴하기
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("payForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 

	      String rank_code = (String)session.getAttribute("rank_code");
			String user_id = (String)session.getAttribute("user_id");
			mav.addObject("rank_code",rank_code);
			mav.addObject("user_id",user_id);
	      
	     // int u_no = (int)session.getAttribute("u_no");
	      
	      return mav;
	      
	   }
	
	
	@RequestMapping(value = "/payProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int payProc(
			CardDTO cardDTO 
			, HttpSession session 
		) 
	{
		System.out.println("===============LoginController payProc.do===================");
		int insertCard = 0;
		
		int u_no = (int)session.getAttribute("u_no");
		
		//System.out.println("u_no =======> " + u_no);
		cardDTO.setU_no(u_no);
		System.out.println("getU_no=======> " + cardDTO.getU_no());
		//System.out.println("getU_no=======> " + updateInfoDTO.getNewPwd());

		try {
			String credit_no = cardDTO.getCreditNum1() + cardDTO.getCreditNum2() + cardDTO.getCreditNum3() + cardDTO.getCreditNum4() ;
			
			cardDTO.setCredit_no(credit_no);
			System.out.println("insertCard 메소드 시작");
			insertCard = this.loginService.insertCard(cardDTO);		
			
			int updateRank = this.loginService.updateRank(cardDTO.getU_no());
			

		} catch (Exception e) {

			System.out.println("<infoUpdateProc 에러발생>");
			System.out.println(e.getMessage());

		}

		return insertCard;
	}
	
//======= 카드 취소 (등급 일반으로 변경)	
	
	@RequestMapping(value = "/payProc2.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int payProc2(

			HttpSession session 
		) 
	{
		System.out.println("===============LoginController payProc.do===================");
		int cardCancel = 0;
		
		int u_no = (int)session.getAttribute("u_no");
		


		try {
			
			int updateRank2 = this.loginService.updateRank2(u_no);
			
			if(updateRank2 == 1) {
				cardCancel = 1;
			}
			

		} catch (Exception e) {

			System.out.println("<infoUpdateProc 에러발생>");
			System.out.println(e.getMessage());

		}

		return cardCancel;
	}
	
	
	
	//=============================================수민수민================================================
	//사업자 번호 추가
	
		@RequestMapping(value = "/newBusiForm.do")
		public ModelAndView newBusiForm(
				HttpSession session
				//,@RequestParam(value = "business_no") String business_no
				//,@RequestParam(value = "user_pwd") String user_pwd
			) {
			//System.out.println("business_no =====> " + business_no);
			// [ModelAndView 객체] 생성.
			// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
			// [ModelAndView 객체] 리턴하기
			ModelAndView mav = new ModelAndView();
			mav.setViewName("newBusiForm.jsp"); 
			
			String rank_code = (String)session.getAttribute("rank_code");
			mav.addObject("rank_code",rank_code);
			
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
		
		
		
	//=====================================================================================================
		//사업자번호 삭제	

		@RequestMapping(value = "/newBusiProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
		@ResponseBody
		public int newBusiProc(
				BusiInfoDTO busiInfoDTO
				, HttpSession session 
			) 
		{
			int insertBusiCnt = 0;

			int u_no = (int)session.getAttribute("u_no");
			busiInfoDTO.setU_no(u_no);
			
			try {
				insertBusiCnt = this.loginService.insertBusi(busiInfoDTO);

			} catch (Exception e) {
				System.out.println("<newBusi 에러발생>");
				System.out.println(e.getMessage());
			}
			return insertBusiCnt;
		}
		
		
		
		
	
		// -----------------------------------------------------------------------------
		@RequestMapping(value = "/delBusiProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
		@ResponseBody
		public int delBusiProc(
				@RequestParam(value = "changeBusinessNo") String business_no
				,@RequestParam(value = "user_pwd") String user_pwd
				,@RequestParam(value = "user_id") String user_id
				, HttpSession session 
			) 
		{
			int deleteBusiCnt = 0;
			try {
				
				Map<String, String> map = new HashMap<String, String>();
				map.put("business_no", business_no);
				map.put("user_pwd", user_pwd);
				map.put("user_id", user_id);
				
				deleteBusiCnt = this.loginService.deleteBusi(map);
				
			} catch (Exception e) {
				System.out.println("<newBusi 에러발생>");
				System.out.println(e.getMessage());
			}
			System.out.println(business_no);
			System.out.println(user_pwd);
			System.out.println(user_id);
			return deleteBusiCnt;
		}
	
	//====================================================================================================================	
		
		
		
		
	
	
	
}

// xxx.do로 접속하면 @Controller 가 붙어있는 클래스 안에 @RequestMapping( value="/xxx.do" ) 가 붙어있는 메소드 호출.
