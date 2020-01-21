package com.naver.erp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
public class PreChartController {

	@Autowired
	private PreChartService preChartService;

	// -------------------------------------------------------------------------------
	// 가상주소 /posbis/preChartForm.do 로 접근하면 호출되는 메소드 선언.
	// -------------------------------------------------------------------------------
	@RequestMapping(value = "/preChartForm.do")
	public ModelAndView goPreChartForm(
			HttpSession session
			, HttpServletResponse response
			) {
		// ModelAndView 객체 생성하고 ModelAndView 객체에 호출 JSP 페이지명을 저장하기.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("preChartForm.jsp");

		try {
			
			String user_id = (String)session.getAttribute("user_id");

// 사업자번호 (가게명) 얻기.			
//=========================================================================================================
			//String user_id = "master44";
			System.out.println("user_no 얻기 시작");
			System.out.println(user_id);

			// user_id 를 가지고 u_no 값 얻기
			int user_no = this.preChartService.getUserNo(user_id);
			System.out.println("user_no : " + user_no);

			// u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>>
			// . N행 1열이면 List<String> )
			List<Map<String, String>> businessNoList = this.preChartService.getBusinessNoList(user_no);
//			List<String> businessNoList = this.preChartService.getBusinessNoList(user_no);

			System.out.println("businessNoList 끝");

			// ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
			// ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 EL 문법으로 꺼낼 수 있다. ${저장키값명}
			// JSP 페이지에서 사용하기 위해 addObject를 사용하여 ModelAndView 객체에 저장.
			mav.addObject("businessNoList", businessNoList);

			// mav.addObject("boardListAllCnt" , boardListAllCnt);
			System.out.println(businessNoList);
			System.out.println("businessNoList.size()=>" + businessNoList.size());
			//System.out.println("businessNoList.get(\"business_no\")=>" + businessNoList.get(0).get("business_no"));
//
//			String all = "all";
//			mav.addObject("all",all);
			
			
//==================================================================================================================================

		} catch (Exception e) {
			// try 구문에서 예외가 발생하면 실행할 구문 설정
			System.out.println(e.getMessage());
			System.out.println("preChartForm <에러발생>");
		}

		return mav;

	}
	
	
	
//----------------------------------------------------------------------------------------------------------------------------
// 모두검색 일 때 (나의 가게 별 그래프)
	
		// -------------------------------------------------------------------------------
		// /preChartAllProc.do 로 접근하면 호출되는 메소드 선언.	사업자번호 선택 란이 모두 검색 일 때.
		// -------------------------------------------------------------------------------

		@RequestMapping(value = "/preChartAllProc.do" // 접속하는 클라이언트의 URL주소 설정
		// , method=RequestMethod.POST // 접속하는 클라이언트의 파라미터값 전송.
				, produces = "application/json;charset=UTF-8" // 응답할 데이터 종류는 json으로 설정.
		)
		@ResponseBody
		public AllBusinessNoSalesChartListDTO preChartAllProc(
				AllBusinessNoDTO allBusinessNoDTO
				, AllBusinessNoSalesChartListDTO allBusinessNoSalesChartListDTO

		) {

			
			System.out.println("============================preChartAllProc========================");
			System.out.println(allBusinessNoDTO);
			for(int i=0; i<allBusinessNoDTO.getAllBusinessNo().length; i++) {
			System.out.println("business_no ===> " + allBusinessNoDTO.getAllBusinessNo()[i]);
			}
			System.out.println("changeYear ==> " + allBusinessNoDTO.getChangeYear());
			
			try {
				System.out.println(allBusinessNoDTO.getAllBusinessNo().length);
				// 사업자번호 갯수만큼 반복문을 돌려서 각 가게 마다의 매출 현황 뽑기.
//				for(int i=0; i<allBusinessNoDTO.getAllBusinessNo().length; i++) {
//					
//					List<Map<String, String>> salesMonthList = this.preChartService.getSalesMonthList(allBusinessNoDTO.getAllBusinessNo()[i]);
//					// 2019-12-31 리스트는 뽑아오는데 이 값들을 어디에 저장할 지 생각해야함.
//					System.out.println("salesMonthList ===> " + salesMonthList);
//				
//					allBusinessNoSalesChartListDTO.setAllBusinessNoSalesMonthList(salesMonthList);		
//					
//				}
				
				List<Map<String, String>> allBusinessNoSalesMonthList = this.preChartService.getAllBusinessNoSalesMonthList(allBusinessNoDTO);

				allBusinessNoSalesChartListDTO.setAllBusinessNoSalesMonthList(allBusinessNoSalesMonthList);
				
				for (int i = 0; i < allBusinessNoSalesMonthList.size(); i++) {
					System.out.println("allBusinessNoSalesMonthList.get(\"allBusinessNoSalesMonthList\")=>" + allBusinessNoSalesMonthList.get(i));
				}
			} catch (Exception e) {
				// try 구문에서 예외가 발생하면 실행할 구문 설정
				System.out.println("e.getMessage()" + e.getMessage());
				System.out.println("preChartProc <에러발생>");
			}


			return allBusinessNoSalesChartListDTO;

		}	
	
//---------------------------------------------------------------------------------------------------------------------------------------	
	
	
	
	

//********************************************************************************************************	
// DTO에 [나의 가게 월별 매출] 과 [같은 동네, 같은 업종의 가게들 평균 월별 매출] 을 담아 리턴하기.
//********************************************************************************************************
	// -------------------------------------------------------------------------------
	// /preChartProc.do 로 접근하면 호출되는 메소드 선언.
	// -------------------------------------------------------------------------------
	@RequestMapping(value = "/preChartProc.do" // 접속하는 클라이언트의 URL주소 설정
	// , method=RequestMethod.POST // 접속하는 클라이언트의 파라미터값 전송.
			, produces = "application/json;charset=UTF-8" // 응답할 데이터 종류는 json으로 설정.
	)
	@ResponseBody
	public PreChartListDTO preChartProc(

			//@RequestParam(value = "changeBusinessNo") String changeBusinessNo
			PreChartParamDTO preChartParamDTO
			, PreChartListDTO preChartListDTO

	) {
		System.out.println("preChartProc 시작1");

		System.out.println("business_no ===> " + preChartParamDTO.getChangeBusinessNo());
		System.out.println("business_no ===> " + preChartParamDTO.getChangeYear());

		try {

// 나의 가게의 월매출 현황
//==================================================================================================================			
			
			  System.out.println("salesMonthList 시작1"); 
			  //List<Map<String, String>> salesMonthList = this.preChartService.getSalesMonthList(changeBusinessNo);
			  List<Map<String, String>> salesMonthList = this.preChartService.getSalesMonthList(preChartParamDTO);

			  System.out.println("salesMonthList.size()=>" + salesMonthList.size());
			  
			  for (int i = 0; i < 12; i++) {
			  System.out.println("salesMonthList.get(\"salesMonthList\")=>" +
			  salesMonthList.get(i)); }
			 

//==================================================================================================================	

// 나와 같은 동네, 같은 업종의 가게들의 평균 월매출 현황
//==================================================================================================================			

			
			  //List<Map<String, String>> allSalesMonthList =this.preChartService.getAllSalesMonthList(changeBusinessNo);
			  List<Map<String, String>> allSalesMonthList =this.preChartService.getAllSalesMonthList(preChartParamDTO);

			  
			  System.out.println("allSalesMonthList.size()=>" + allSalesMonthList.size());
			  
			  for (int i = 0; i < 12; i++) {
			  System.out.println("allSalesMonthList.get(\"allSalesMonthList\")=>" +
			  allSalesMonthList.get(i)); }
			 

//			
//			System.out.println( "sml.size()=>" + sml.size());
//			System.out.println( "sml.get(\"business_no\")=>" + sml.get(0) );
//			
//==================================================================================================================	
			preChartListDTO.setSalesMonthList(salesMonthList);
			preChartListDTO.setAllSalesMonthList(allSalesMonthList);

		} catch (Exception e) {
			// try 구문에서 예외가 발생하면 실행할 구문 설정
			System.out.println("e.getMessage()" + e.getMessage());
			System.out.println("preChartProc <에러발생>");
		}

		System.out.println("DTO 리턴한다~~~~");
		return preChartListDTO;

	}

	
//--------------------------------------------------------------------------------------------------------------------------
// 나의 가게 인기 메뉴, 다른 가게 인기 메뉴, 점포수 구하기	
	
	// -------------------------------------------------------------------------------
	// /preChartProc2.do 로 접근하면 호출되는 메소드 선언.
	// -------------------------------------------------------------------------------
	@RequestMapping(value = "/preChartProc2.do" // 접속하는 클라이언트의 URL주소 설정
	// , method=RequestMethod.POST // 접속하는 클라이언트의 파라미터값 전송.
			, produces = "application/json;charset=UTF-8" // 응답할 데이터 종류는 json으로 설정.
	)
	@ResponseBody
	public MyPopularityListDTO preChartProc2(
			// @RequestParam(value = "changeBusinessNo") String changeBusinessNo
			PreChartParamDTO preChartParamDTO
			, MyPopularityListDTO myPopularityListDTO

	) {
		System.out.println("preChartProc2 시작1");
		List<Map<String,String>> myPopularityMenu = new ArrayList<Map<String,String>>();
		
		List<Map<String,String>> othersPopularityMenu = new ArrayList<Map<String,String>>();
		

//		List<String> myPopularityMenu = new ArrayList<String>();
//		List<String> othersPopularityMenu = new ArrayList<String>();
		
		System.out.println("==================================================");
		System.out.println("나의 가게 인기메뉴, 다른가게 인기메뉴, 점포수 구하기");
		System.out.println("YEAR ====== " + preChartParamDTO.getChangeYear());

		try {
			
// 나의 가게 인기메뉴 구하기.
//==================================================================================================================			
			myPopularityMenu = this.preChartService.getMyPopularityMenu(preChartParamDTO);
			
			System.out.println("myPopularityMenu ===> " + myPopularityMenu.size());
			for (int i = 0; i < myPopularityMenu.size(); i++) {
				System.out.println("myPopularityMenu.get(\"myPopularityMenu\")=>" + myPopularityMenu.get(i));
			}

			myPopularityListDTO.setMyPopularityMenu(myPopularityMenu);
			
// 다른 가게 인기메뉴 구하기.
//==================================================================================================================			
			othersPopularityMenu = this.preChartService.getOthersPopularityMenu(preChartParamDTO);

			System.out.println("othersPopularityMenu ===> " + othersPopularityMenu.size());
			for (int i = 0; i < othersPopularityMenu.size(); i++) {
				System.out.println("othersPopularityMenu.get(\"othersPopularityMenu\")=>" + othersPopularityMenu.get(i));
			}

			myPopularityListDTO.setOthersPopularityMenu(othersPopularityMenu);
			
			
// 같은 동네, 같은 업종 점포수 구하기.
//==================================================================================================================			
			String storeCount = this.preChartService.getStoreCount(preChartParamDTO);
			
			System.out.println("storeCount ===> " + storeCount);
			
			myPopularityListDTO.setStoreCount(storeCount);
			
				
			
			

		} catch (Exception e) {
			// try 구문에서 예외가 발생하면 실행할 구문 설정
			System.out.println("e.getMessage()" + e.getMessage());
			System.out.println("preChartProc2 <에러발생>");
		}

		System.out.println("myPopularityListDTO 리턴한다~~~~");
		return myPopularityListDTO;

	}
	
//---------------------------------------------------------------------------------------------------------------------------
	
	

	
//-----------------------------------------------------------------------------------------------------------------------------
// 상품별 판매 개수, 순이익 구하기
	
	// -------------------------------------------------------------------------------
	// /preChartProc3.do 로 접근하면 호출되는 메소드 선언.
	// -------------------------------------------------------------------------------
	@RequestMapping(value = "/preChartProc3.do" // 접속하는 클라이언트의 URL주소 설정
	// , method=RequestMethod.POST // 접속하는 클라이언트의 파라미터값 전송.
			, produces = "application/json;charset=UTF-8" // 응답할 데이터 종류는 json으로 설정.
	)
	@ResponseBody
	public MySalesRatioDTO preChartProc3(

			//@RequestParam(value = "changeBusinessNo") String changeBusinessNo
			PreChartParamDTO preChartParamDTO
			, MySalesRatioDTO mySalesRatioDTO

	) {
		System.out.println("preChartProc3 시작1");
		List<Map<String,String>> menuSalesCount = new ArrayList<Map<String,String>>();
		List<Map<String,String>> salesBenefit = new ArrayList<Map<String,String>>();
		
		System.out.println("==================================================");
		System.out.println("상품별 판매 개수 구하기 , 상품별 순이익 구하기");


		try {
			
// 상품별 판매 개수 구하기
//==================================================================================================================			
			menuSalesCount = this.preChartService.getMenuSalesCount(preChartParamDTO);
			
			System.out.println("menuSalesCount ===> " + menuSalesCount.size());
			for (int i = 0; i < menuSalesCount.size(); i++) {
				System.out.println("menuSalesCount.get(\"menuSalesCount\")=>" + menuSalesCount.get(i));
			}

			mySalesRatioDTO.setMenuSalesCount(menuSalesCount);
			
			
			
// 상품별 순이익 구하기
//==================================================================================================================			
			salesBenefit = this.preChartService.getSalesBenefit(preChartParamDTO);
			
			System.out.println("salesBenefit ===> " + salesBenefit.size());
			for (int i = 0; i < salesBenefit.size(); i++) {
				System.out.println("salesBenefit.get(\"salesBenefit\")=>" + salesBenefit.get(i));
			}

			mySalesRatioDTO.setSalesBenefit(salesBenefit);			
				
			
			

		} catch (Exception e) {
			// try 구문에서 예외가 발생하면 실행할 구문 설정
			System.out.println("e.getMessage()" + e.getMessage());
			System.out.println("preChartProc3 <에러발생>");
		}

		System.out.println("myPopularityListDTO 리턴한다~~~~");
		return mySalesRatioDTO;

	}
	
	
	
	

	
	//-----------------------------------------------------------------------------------------------------------------------------
	// 시간대별 판매 갯수 구하기 (상품 별)
		
		// -------------------------------------------------------------------------------
		// /preChartProc3.do 로 접근하면 호출되는 메소드 선언.
		// -------------------------------------------------------------------------------
		@RequestMapping(value = "/preChartProc4.do" // 접속하는 클라이언트의 URL주소 설정
		// , method=RequestMethod.POST // 접속하는 클라이언트의 파라미터값 전송.
				, produces = "application/json;charset=UTF-8" // 응답할 데이터 종류는 json으로 설정.
		)
		@ResponseBody
		public PreChartHourSalesDTO preChartProc4(

				//@RequestParam(value = "changeBusinessNo") String changeBusinessNo
				PreChartParamDTO preChartParamDTO
				, PreChartHourSalesDTO preChartHourSalesDTO
				

		) {

			
			System.out.println("==================================================");
			System.out.println("시간대별 판매 개수 구하기 (상품별 구분)");
			System.out.println("월 ======= " + preChartParamDTO.getChangeMonth() );

			List<Map<String,String>> hourSalesCount = new ArrayList<Map<String,String>>();

			try {
				String business_no = preChartParamDTO.getChangeBusinessNo();
	
				hourSalesCount = this.preChartService.getHourSalesCount(preChartParamDTO);
				
				System.out.println("hourSalesCount.size() ===> " + hourSalesCount.size());
				for (int i = 0; i < hourSalesCount.size(); i++) {
					System.out.println("hourSalesCount.get(\"hourSalesCount\")=>" + hourSalesCount.get(i));
				}
				
				String salesOpenTime = this.preChartService.getSalesOpenTime(business_no);
				System.out.println("salesOpenTime =>" + salesOpenTime);

				String salesCloseTime = this.preChartService.getSalesCloseTime(business_no);
				System.out.println("salesCloseTime =>" + salesCloseTime);

				preChartHourSalesDTO.setHourSalesCount(hourSalesCount);
				preChartHourSalesDTO.setSalesOpenTime(salesOpenTime);
				preChartHourSalesDTO.setSalesCloseTime(salesCloseTime);
				

			} catch (Exception e) {
				// try 구문에서 예외가 발생하면 실행할 구문 설정
				System.out.println("e.getMessage()" + e.getMessage());
				System.out.println("preChartProc4 <에러발생>");
			}

			return preChartHourSalesDTO;

		}	

	
	
	
	

}
