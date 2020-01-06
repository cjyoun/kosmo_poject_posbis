package com.naver.erp;
import java.util.*;

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
		public ModelAndView getMenuList(
			
			MenuSearchDTO menuSearchDTO
			,HttpSession session
		) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("menuForm.jsp");

		      String rank_code = (String)session.getAttribute("rank_code");
		      mav.addObject("rank_code",rank_code);
		      String user_id = (String)session.getAttribute("user_id");
		      mav.addObject("user_id",user_id);
				
			try {
				
				 //String user_id = "user7";
		         //System.out.println("user_no 얻기 시작");
		         //System.out.println(user_id);
		         // user_id 를 가지고 u_no 값 얻기
		         int user_no = this.menuService.getUserNo(user_id);
		         //System.out.println("user_no : " + user_no);
		         
		         // u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>> .  N행 1열이면 List<String> )
		         List<Map<String,String>> businessNoList = this.menuService.getBusinessNoList(user_no);

		         //System.out.println("businessNoList 끝");
		         
		         
		         // ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
		         // ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 EL 문법으로 꺼낼 수 있다. ${저장키값명}
		         // JSP 페이지에서 사용하기 위해 addObject를 사용하여 ModelAndView 객체에 저장.
		         
		         mav.addObject("businessNoList" , businessNoList);
		         
		         //System.out.println(businessNoList);
		         //System.out.println( "businessNoList.size()=>" + businessNoList.size());
		         //System.out.println( "businessNoList.get(\"business_no\")=>" + businessNoList.get(0).get("business_no") );

				
				int menuListAllCnt = this.menuService.getMenuListAllCnt(menuSearchDTO);
				System.out.println("menuListAllCnt==>"+menuListAllCnt);
				if(menuListAllCnt>0) {
					// 선택한 페이지 번호 구하기
					int selectPageNo = menuSearchDTO.getSelectPageNo();
					// 한 화면에 보여지는 행의 개수 구하기
					int rowCntPerPage = menuSearchDTO.getRowCntPerPage();
					// 검색할 시작행 번호 구하기
					int beginRowNo = selectPageNo*rowCntPerPage - rowCntPerPage + 1;
					// 만약 검색한 총 개수가 검색할 시작행 번호 보다 작으면
					// 선택한 페이지 번호를 1로 세팅하기
					if(menuListAllCnt < beginRowNo) {
						menuSearchDTO.setSelectPageNo(1);
					}
				}
				
				List<Map<String,String>> menuList = this.menuService.getMenuList(menuSearchDTO);
				System.out.println("menuList.size()=>" +menuList.size());
				
				mav.addObject("menuList", menuList);
				mav.addObject("menuListAllCnt", menuListAllCnt);
				mav.addObject("menuSearchDTO", menuSearchDTO);
				
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
		
		
		 @RequestMapping( value="/menuProc.do" //접속하는 클래스의 URL 주소 설정
					,produces="application/json;charset=UTF-8" )	 
			@ResponseBody
			public  MenuDTO menuProc( 
					MenuSearchDTO menuSearchDTO 
			) {
			System.out.println("proc시작");
			
			
			MenuDTO menuDTO= new MenuDTO();
			try {
			
				int menuListAllCnt = this.menuService.getMenuListAllCnt(menuSearchDTO);
				System.out.println("menuListAllCnt==>"+menuListAllCnt);
				if(menuListAllCnt>0) {
					// 선택한 페이지 번호 구하기
					int selectPageNo = menuSearchDTO.getSelectPageNo();
					// 한 화면에 보여지는 행의 개수 구하기
					int rowCntPerPage = menuSearchDTO.getRowCntPerPage();
					// 검색할 시작행 번호 구하기
					int beginRowNo = selectPageNo*rowCntPerPage - rowCntPerPage + 1;
					// 만약 검색한 총 개수가 검색할 시작행 번호 보다 작으면
					// 선택한 페이지 번호를 1로 세팅하기
					if(menuListAllCnt < beginRowNo) {
						menuSearchDTO.setSelectPageNo(1);
					}
				}
				
				//검색목록 얻기
				List<Map<String,String>> menuList = this.menuService.getMenuList(menuSearchDTO);
			
			}
				catch(Exception e) {
				System.out.println("menuProc <에러발생>");
				System.out.println(e.getMessage());
			}
			
			return menuDTO;
			} 
	
		@RequestMapping( value="/menuRegForm.do" )	
		public ModelAndView menuRegForm(HttpSession session) {		// 메소드 이름은 상관 없음.
	
			// [ModelAndView 객체] 생성.
			// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
			// [ModelAndView 객체] 리턴하기
			ModelAndView mav = new ModelAndView();
			mav.setViewName("menuRegForm.jsp");
			
		      String rank_code = (String)session.getAttribute("rank_code");
		      mav.addObject("rank_code",rank_code);
		      String user_id = (String)session.getAttribute("user_id");
		      mav.addObject("user_id",user_id);
		      
			try {
				
				 //String user_id = "user7";
		         System.out.println("user_no 얻기 시작");
		         System.out.println(user_id);
		         // user_id 를 가지고 u_no 값 얻기
		         int user_no = this.menuService.getUserNo(user_id);
		         System.out.println("user_no : " + user_no);
		         // u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>> .  N행 1열이면 List<String> )
		         List<Map<String,String>> businessNoList = this.menuService.getBusinessNoList(user_no);
		         System.out.println("businessNoList 끝");

		         mav.addObject("businessNoList" , businessNoList);
		         
		         System.out.println(businessNoList);
		         System.out.println( "businessNoList.size()=>" + businessNoList.size());
		         System.out.println( "businessNoList.get(\"business_no\")=>" + businessNoList.get(0).get("business_no") );

				//대분류 데이터 가져오기-------------------------------------------------------------------
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
			


	         System.out.println("businessNoList 끝");
	         
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
		
		
		// 가상 주소 /menuUpDelForm.do 로 접근하면 호출되는 메소드 선언
		
		
		 @RequestMapping( value="/menuUpDelForm.do")
		 	public ModelAndView goMenuUpDelForm(
		 			
		 			@RequestParam(value="menu_no") int menu_no
					,HttpSession session
		 	) { 
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("menuUpDelForm.jsp");

			 String rank_code = (String)session.getAttribute("rank_code");
				String user_id = (String)session.getAttribute("user_id");
				mav.addObject("rank_code",rank_code);
				mav.addObject("user_id",user_id);
		      
			 try {
					session.setAttribute("uri","menuUpDelForm.do");
					System.out.println("menu_no==>"+menu_no);
					//-------------------------------------------
					// [수정/삭제할 1개의 게시판 글 정보]얻기
					//------------------------------------------- 
					// [BoardServiceImpl 객체]의 getBoardDTO_without_upReadcount 메소드를 호출하여 얻는다.
			
					MenuDTO menuDTO = this.menuService.getMenuDTO_upDel(menu_no);
					System.out.println("Controller menu_no==>"+menu_no);
					//----------------------------------
					//[ModelAndView 객체] 에 JSP 페이지에서 꺼내볼 각종 데이터 저장하기
					//----------------------------------
					mav.addObject("menuDTO",menuDTO);
					System.out.println("Controller menuDTO==>"+ menuDTO);
					System.out.println("Controller getMenu_using==>"+ menuDTO.getMenu_using());
					System.out.println("<접속성공> [접속 URI]->/menuUpDelForm.do [호출메소드]->MenuController.gomenuUpDelForm(~) \n\n\n");
					
					//대분류 데이터 가져오기-------------------------------------------------------------------
					 List<Map<String,String>> menuCategory1 = this.menuService.getMenuCategory1();
					 mav.addObject("menuCategory1",menuCategory1);
					 System.out.println("menuCategory1 menuUpDel : " + menuCategory1.size() );
					 
				}catch(Exception e) {
					//-------------------------------------------
					// 예외 발생 시 실행할 코드 설정
					//-------------------------------------------
					System.out.println("<접속실패> [접속 URI]->/menuUpDelForm.do [호출메소드]->MenuController.gomenuUpDelForm(~) \n\n\n");
					System.out.println(e.getMessage());
				}
			 return mav;
		 }
			 @RequestMapping(
						value="/menuUpDelProc.do"			// 접속하는 클래스의 URL 주소 설정
						,method=RequestMethod.POST		// 접속하는 클래스의 파마리터값 전송 방법
						,produces="application/json;charset=UTF-8"	// 응답할 데이터 종류 설정
				)
				@ResponseBody
				// 비동기 방식으로 접속에 대한 응답
				public int menuUpDelProc(
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
						System.out.println("<접속실패> [접속 URI]->/boardUpDelForm.do [호출메소드]->BoardController.goboardUpDelForm(~) \n\n\n");
						System.out.println(e.getMessage());
					}
					//-------------------------------------------
					// 수정 또는 삭제 적용행의 개수 리턴
					//-------------------------------------------
					return menuUpDelCnt;
				}

		 	//중분류 가상주소 접속 
		 
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
			
			
			   // 소분류 가상주소 접속
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


