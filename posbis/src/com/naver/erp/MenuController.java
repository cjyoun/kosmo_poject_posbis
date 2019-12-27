package com.naver.erp;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller 
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	@RequestMapping( value="/menuForm.do" )	
	public ModelAndView menuForm(
		MenuSearchDTO menuSearchDTO
		,HttpSession session
		, HttpServletResponse response
	) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("menuForm.jsp");
		
		try {
			
			// 사업자 번호 얻기 
			String user_id = (String)session.getAttribute("user_id");
			//String user_id = "user7";
			System.out.println("user_no 얻기 시작");
			System.out.println(user_id);
			
			int user_no = this.menuService.getUserNo(user_id);
			System.out.println("user_no : " + user_no);
			
			List<Map<String,String>> businessNoList = this.menuService.getBusinessNoList(user_no);
			System.out.println("businessNoList 끝");
			mav.addObject("businessNoList" , businessNoList);
			 
			System.out.println(businessNoList);
			System.out.println( "businessNoList.size()=>" + businessNoList.size());
			System.out.println( "businessNoList.get(\"business_no\")=>" + businessNoList.get(0).get("business_no") );
			
			// <1> HttpSession 객체에 uri 라는 키값으로 저장된 문자열 꺼내기
			String uri=(String)session.getAttribute("uri");
				// <2>만약 꺼낸 문자열이 null 이거나 "boardListForm" 이라면
				// 매개변수로 받은 boardSearchDTO 객체를 HttpSession 객체에
				// boardSearchDTO 라는 키값으로 저장하기
				if(uri==null || uri.equals("menuForm.do")) {
					session.setAttribute("menuSearchDTO", menuSearchDTO);
				}
				// <3> 만약 꺼낸 문자열이  null도 아니고 "boardListForm.do"도 아니라면
				// HttpSession 객체에 boardSearchDTO 라는 키값으로 저장된 놈 꺼내서 
				// 매개변수 boardSearchDTO 에 저장하기
				else {
					menuSearchDTO=(MenuSearchDTO)session.getAttribute("menuSearchDTO");
				}
				// <4> HttpSession 객체에 uri 라는 키값으로 "boardListForm.do" 문자열 저장하기
			session.setAttribute("uri", "menuForm.do");
			
			int menuAllCnt = this.menuService.getMenuAllCnt(menuSearchDTO);
			
			if(menuAllCnt>0) {
				// 선택한 페이지 번호 구하기
				int selectPageNo = menuSearchDTO.getSelectPageNo();
				// 한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = menuSearchDTO.getRowCntPerPage();
				// 검색할 시작행 번호 구하기
				int beginRowNo = selectPageNo*rowCntPerPage - rowCntPerPage + 1;
				// 만약 검색한 총 개수가 검색할 시작행 번호 보다 작으면
				// 선택한 페이지 번호를 1로 세팅하기
				if(menuAllCnt < beginRowNo) {
					menuSearchDTO.setSelectPageNo(1);
				}
			}
			
			// [검색된 게시판 검색 목록] 얻기
			// n행 n열 이므로 List사용
			List<Map<String,String>> menuList = this.menuService.getMenuList(menuSearchDTO);
			//System.out.println("menuList.size()=>" +menuList.size());
			
			//System.out.println( "menuSearchDTO=" + menuSearchDTO.getRowCntPerPage());
			
			mav.addObject("menuList", menuList);
			mav.addObject("menuAllCnt", menuAllCnt);
			mav.addObject("menuSearchDTO", menuSearchDTO);
			//System.out.println(menuList);
			
		}catch(Exception e) {
			//-------------------------------------
			// try 구문에서 예외가 발생하면 실행할 구문 설정
			//-------------------------------------
			System.out.println("<에러발생>");
			
			// catch 부분에 필수로 넣을것
			System.out.println(e.getMessage());
		}
		//-----------------------------------
		// [ModelAndView 객체] 리턴하기
		//-----------------------------------
		return mav;
		}
		
	
	@RequestMapping( value="/menuRegForm.do" )	
	public ModelAndView menuRegForm() {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("menuRegForm.jsp");
		
		try {
			//주소 구 데이터 가져오기-------------------------------------------------------------------
			 List<Map<String,String>> menuCategory1 = this.menuService.getMenuCategory1();
			 mav.addObject("menuCategory1",menuCategory1);
			 System.out.println("menuCategory1 : " + menuCategory1.size() );
			 
		}catch(Exception e) {
			 System.out.println("<menuCategory1 에러발생>");
			 System.out.println(e.getMessage());
		}	
		return mav;
		
	}
	
	//---------------------------------------------
	// 가상주소 /posbis/menuuRegProc.do 로 접근하면 호출되는 메소드 선언.
	//---------------------------------------------
	@RequestMapping(
			value="/menuRegProc.do"			// 접속하는 클래스의 URL 주소 설정
			,method=RequestMethod.POST		// 접속하는 클래스의 파마리터값 전송 방법
			,produces="application/json;charset=UTF-8"	// 응답할 데이터 종류 설정
	)
	@ResponseBody
	// 비동기 방식으로 접속에 대한 응답
	public int insertMenu(
			//-------------------------------------------
			// 파라미터값을 저장할 [BoardDTO 객체]를 매개변수로 선언
			//-------------------------------------------
			MenuDTO menuDTO
			
	) {
		//[게시판 입력 적용행의 개수]저장할 변수 선언
		int menuRegCnt = 0;
		System.out.println(menuDTO.getBusiness_no());
		try {
			
		System.out.println("menu_no ====> "+ menuDTO.getMenu_no());
		System.out.println("business_no ====> "+ menuDTO.getBusiness_no());
		System.out.println("menu_name ====> "+ menuDTO.getMenu_name());
		System.out.println("menu_price ====> "+ menuDTO.getMenu_price());
		System.out.println("menu_cost ====> "+ menuDTO.getMenu_cost());
		System.out.println("main_category_name ====> "+ menuDTO.getMain_category_name());
		System.out.println("mid_category_name ====> "+ menuDTO.getMid_category_name());
		System.out.println("sub_category_name ====> "+ menuDTO.getSub_category_name());

		
			
			menuRegCnt = this.menuService.insertMenu(menuDTO);
		}catch(Exception e) {
			System.out.println("<에러발생>");
			System.out.println(e.getMessage());
			
			menuRegCnt=-1;
		}
		return menuRegCnt;
	}
	
	//******************************************
	// menuUpDelForm.do 접속 시 호출되는 메소드 선언
	//******************************************
	@RequestMapping( value="/menuUpDelForm.do"
					,method=RequestMethod.POST
					,produces="application/json;charset=UTF-8"
	)
	public ModelAndView gomenuUpDelForm(
			
		// "menu_no" 라는 파라미터명의 파라미터값이 저장되는 매개변수 menu_no 선언
		@RequestParam(value="menu_no") int menu_no
		,HttpSession session
	) {
		//----------------------------------
		//[ModelAndView 객체] 생성하기
		//[ModelAndView 객체] 에 [호출 JSP 페이지명]을 저장하기
		//----------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("menuUpDelForm.jsp");
		
		try {
			session.setAttribute("uri","menuUpDelForm.do");
			
			// [수정/삭제할 메뉴 정보]얻기
			MenuDTO menuDTO = this.menuService.getMenuDTO(menu_no);

			//----------------------------------
			//[ModelAndView 객체] 에 JSP 페이지에서 꺼내볼 각종 데이터 저장하기
			//----------------------------------
			mav.addObject("menuDTO",menuDTO);
			System.out.println("<접속성공> [접속 URI]->/menuUpDelForm.do [호출메소드]->MenuController.gomenuUpDelForm(~) \n\n\n");
		
		}catch(Exception e) {
			//-------------------------------------------
			// 예외 발생 시 실행할 코드 설정
			//-------------------------------------------
			System.out.println("<접속실패> [접속 URI]->/menuUpDelForm.do [호출메소드]->MenuController.gomenuUpDelForm(~) \n\n\n");
			System.out.println(e.getMessage());
		}
		return mav;
	}
	
	
		//******************************************
		// /boardUpDelProc.do 접속 시 호출되는 메소드 선언
		//******************************************
		@RequestMapping(
				value="/menuUpDelProc.do"			// 접속하는 클래스의 URL 주소 설정
				,method=RequestMethod.POST		// 접속하는 클래스의 파마리터값 전송 방법
				,produces="application/json;charset=UTF-8"	// 응답할 데이터 종류 설정
		)
		@ResponseBody
		// 비동기 방식으로 접속에 대한 응답
		public int boardUpDelProc(
				//-------------------------------------------
				// 파라미터값을 저장할 [BoardDTO 객체]를 매개변수로 선언
				//-------------------------------------------
				MenuDTO menuDTO
				,@RequestParam(value="upDel") String upDel
		) {
			//수정 또는 삭제 적용행의 개수가 저장되는 변수 선언.
			int menuUpDelCnt = 0;
			try {
				//-------------------------------------------
				// 만약 수정 모드이면 수정 실행하고 수정 적용행의 개수를 저장
				//-------------------------------------------
				if(upDel.equals("up")) {
					System.out.println("000");
					menuUpDelCnt = this.menuService.updateMenu(menuDTO);
				}
				//-------------------------------------------
				// 만약 삭제 모드이면 삭제 실행하고 삭제 적용행의 개수를 저장
				//-------------------------------------------
				else{
					menuUpDelCnt = this.menuService.deleteMenu(menuDTO);
				}
			}catch(Exception e) {
				//-------------------------------------------
				// 예외 발생 시 실행할 코드 설정
				//-------------------------------------------
				System.out.println("<접속실패> [접속 URI]->/menuUpDelForm.do [호출메소드]->MenuController.gomenuUpDelForm(~) \n\n\n");
				System.out.println(e.getMessage());
			}
			//-------------------------------------------
			// 수정 또는 삭제 적용행의 개수 리턴
			//-------------------------------------------
			return menuUpDelCnt;	
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		@RequestMapping(
		         value="/middleProc.do"
		         , method=RequestMethod.POST
		         , produces="application/json;carset=UTF-8"
		   )
		   @ResponseBody
		   public List<String> middleProc(
		         @RequestParam(value="main_category_name") String main_category_name
		   ) {
		      
		      List<String> menuCategory2 = new ArrayList<String>();
		      System.out.println("main_category_name = " + main_category_name);
		      
		      try {
		         
		         menuCategory2 = this.menuService.getMenuCategory2(main_category_name);

		         System.out.println("menuCategory2.size() : " + menuCategory2.size() );
		         System.out.println("menuCategory2.size() : " + menuCategory2.get(0) );
		         
		      }catch(Exception e) {
		          System.out.println("<menuCategory2 에러발생>");
		          System.out.println(e.getMessage());          
		      }
		      
		      return menuCategory2;
		      
		   }
		
		
		   // 소분류
		   @RequestMapping(
		         value="/subProc.do"
		         , method=RequestMethod.POST
		         , produces="application/json;carset=UTF-8"
		   )
		   @ResponseBody
		   public List<String> subProc(
		         @RequestParam(value="mid_category_name") String mid_category_name
		   ) {
		      
		      List<String> menuCategory3 = new ArrayList<String>();
		      System.out.println("mid_category_name = " + mid_category_name);
		      
		      try {
		         
		         menuCategory3 = this.menuService.getMenuCategory3(mid_category_name);
		         System.out.println("menuCategory3.size() : " + menuCategory3.size() );
		         System.out.println("menuCategory3.size() : " + menuCategory3.get(0) );
		         
		      }catch(Exception e) {
		          System.out.println("<menuCategory3 에러발생>");
		          System.out.println(e.getMessage());          
		      }
		      
		      return menuCategory3;
		      
		   }
	
	
		
		
		
}


