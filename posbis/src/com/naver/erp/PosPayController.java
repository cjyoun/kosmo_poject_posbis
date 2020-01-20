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
public class PosPayController {

	@Autowired
	private PosPayService posPayService;
 
	
	
	@RequestMapping(value ="/posPayForm.do")
	public ModelAndView posPayForm(
		HttpSession session 
	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "posPayForm.jsp");
		

	  	String business_no = (String)session.getAttribute("pos_business_no");
	  	
	  	
		try {
			
			mav.addObject("business_no", business_no);

			System.out.println("!11");
			
			// 媛�寃� �씠由� �뼸湲�
			String business_name = this.posPayService.getBusiness_name(business_no);
			mav.addObject("business_name", business_name);
			System.out.println(business_name);

//	      		 //================[硫붾돱 珥� 媛쒖닔] �뼸湲�=====================
//				int posMenuAllCnt = this.posPayService.getPosMenuAllCnt(business_no);
//				mav.addObject("posMenuAllCnt", posMenuAllCnt);
//				//================�걹  [硫붾돱 珥� 媛쒖닔] �뼸湲�=====================
//

				//=====================[硫붾돱 紐⑸줉] �뼸湲�===========================
				List<Map<String,String>> posMenuList = this.posPayService.getPosMenuList(business_no);
				mav.addObject("posMenuList", posMenuList);  
				System.out.println(posMenuList);
				//===================�걹  [硫붾돱 紐⑸줉] �뼸湲�===========================
					

			
		}
		catch(Exception e) {
			System.out.println("preResultList <�뿉�윭諛쒖깮>");
			System.out.println(e.getMessage());
		}
		
		return mav;
		
	}

	//--------------------------------------------------------------------------------------------------------
	
 /////////////////////////////////////////////////////////////
//硫붾돱 �겢由��떆 �젙蹂� 遺덈윭 �삤湲�
////////////////////////////////////////////////////////////

	@RequestMapping(value = "/posPerMenuProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public List<Map<String,String>>  posPerMenuProc( 
			PosMenuDTO posMenuDTO 
			,HttpSession session 
 
	){
		System.out.println("controller/getMenu_name===>"+posMenuDTO.getMenu_name());
		
		List<Map<String,String>> posPerMenuList=null;
	  	String business_no = (String)session.getAttribute("pos_business_no");
	  	posMenuDTO.setBusiness_no(business_no);

		
		try {
			
			 posPerMenuList= this.posPayService.getPosPerMenuList(posMenuDTO);
			 System.out.println("posPerMenuList.size() : " + posPerMenuList.size() );
			 
		 
			
			/*
			 * set 硫붿냼�뱶濡� �떟湲�- preChart cont -> 由ы꽩 ajax-> dto.�씠由�
			 */
		 
		} catch (Exception e) {
			
			System.out.println("<posPerMenuList �뿉�윭諛쒖깮>");
			System.out.println(e.getMessage());
		}

		System.out.println(posPerMenuList);
		return posPerMenuList;

	}
	
	//매출 등록
	
	//---------------------------------------------
	// 가상주소 /posbis/posSalesRegProc.do 로 접근하면 호출되는 메소드 선언.
	//---------------------------------------------
	@RequestMapping(
			value="/posSalesRegProc.do"			// 접속하는 클래스의 URL 주소 설정
			,method=RequestMethod.POST		// 접속하는 클래스의 파마리터값 전송 방법
			,produces="application/json;charset=UTF-8"	// 응답할 데이터 종류 설정
	)
	@ResponseBody
	// 비동기 방식으로 접속에 대한 응답
	public int updateSalesNo(
			//-------------------------------------------
			// 파라미터값을 저장할 [BoardDTO 객체]를 매개변수로 선언
			//-------------------------------------------
			PosMenuSalesDTO posMenuSalesDTO
	,HttpSession session 
	) {
		//개수저장할 변수 선언
		int salesRegCnt = 0;
		
		  for(int i=0; i<posMenuSalesDTO.getSales_count().length; i++) {
		  System.out.println("getSales_count ===> " +
		  posMenuSalesDTO.getSales_count()[i]); } for(int i=0;
		  i<posMenuSalesDTO.getMenu_name().length; i++) {
		  System.out.println("getMenu_name ===> " + posMenuSalesDTO.getMenu_name()[i]);
		 }
		 
		String business_no = (String)session.getAttribute("pos_business_no");
		posMenuSalesDTO.setBusiness_no(business_no);
		
 
		
	try {
			/* String business_no = (String)session.getAttribute("pos_business_no"); */
		  salesRegCnt = this.posPayService.updateSalesNo(posMenuSalesDTO); 
		
		
		}catch(Exception e) {
			System.out.println("<에러발생>");
			System.out.println(e.getMessage());
			
			salesRegCnt=-1;
		}
		return salesRegCnt;
	}
	
	
	
	//포스 매출리스트 가져오기 이동
	@RequestMapping(value ="/posRefundForm.do")
	public ModelAndView posReFundForm(
			PosSearchDTO posSearchDTO,
			HttpSession session 
	) {
		System.out.println("posRefundForm");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("posRefundForm.jsp");
 
	    	  
		
		
		String business_no = (String)session.getAttribute("pos_business_no");
		
		
		try {
		 
			
			posSearchDTO.setBusiness_no(business_no);
	 
		 
			 
			List<Map<String,String>> posSalesList = this.posPayService.getPosSalesList(posSearchDTO);
			int posSalesAllCnt = this.posPayService.getPosSalesAllCnt(posSearchDTO);
			

	    	 if( posSalesAllCnt>0 ) {
	    		 // 선택한 페이지 번호 구하기
		         int selectPageNo = posSearchDTO.getSelectPageNo();
		         // 한 화면에 보여지는 행의 개수 구하기
		         int rowCntPerPage = posSearchDTO.getRowCntPerPage();
		         // 검색할 시작행 번호 구하기
		         int beginRowNo = selectPageNo*rowCntPerPage - rowCntPerPage + 1;
		         // 검색한 총 갯수보다 검색할 시작행의 번호가 크면
				 if(beginRowNo>posSalesAllCnt ) {
					 // 선택한 페이지 번호를 '1'로 초기화 해줌.
					 posSearchDTO.setSelectPageNo(1);
				 }
	    	 }
			mav.addObject("posSalesList", posSalesList); 
			mav.addObject("posSalesAllCnt", posSalesAllCnt); 
			mav.addObject("business_no", business_no);
			mav.addObject("qstnSearchDTO", posSearchDTO);
 
			
		}catch(Exception e){
			System.out.println("<posReFundForm 에러발생>");
			System.out.println(e.getMessage());
			
		}
		
		return mav;
	}
	
	
	
	//상세 내역
	//---------------------------------------------
	// 가상주소 /posbis/posDetailRegProc.do 로 접근하면 호출되는 메소드 선언.
	//---------------------------------------------
	@RequestMapping(
			value="/posDetailRegProc.do"			// 접속하는 클래스의 URL 주소 설정
			,method=RequestMethod.POST		// 접속하는 클래스의 파마리터값 전송 방법
			,produces="application/json;charset=UTF-8"	// 응답할 데이터 종류 설정
	)
	@ResponseBody
	public List<Map<String,String>> posDetailList(
			//-------------------------------------------
			// 파라미터값을 저장할 [BoardDTO 객체]를 매개변수로 선언
			//-------------------------------------------
			@RequestParam(value = "business_no") String business_no
			,@RequestParam(value = "sales_date") String sales_date
			,HttpSession session 
	) {
		
		//메뉴리스트 선언
 
		System.out.println("business_no = " + business_no);
		System.out.println("sales_date = " + sales_date);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("business_no", business_no);
		map.put("sales_date", sales_date);
		
		List<Map<String,String>> posDetailList = new ArrayList<Map<String,String>>();
		
	
	try {
		
		posDetailList = this.posPayService.getPosDetailList(map);
		System.out.println("posDetailList.size() : " + posDetailList.size());
	
		}catch(Exception e) {
			System.out.println("<에러발생>");
			System.out.println(e.getMessage());
 
		}
		 
	System.out.println("posDetailList: " + posDetailList);
		return posDetailList;
	
	}
	
	
	//삭제하기
	//---------------------------------------------
	// 가상주소 /posbis/posDeleteRegProc.do 로 접근하면 호출되는 메소드 선언.
	//---------------------------------------------
	@RequestMapping(
			value="/posDeleteRegProc.do"			// 접속하는 클래스의 URL 주소 설정
			,method=RequestMethod.POST		// 접속하는 클래스의 파마리터값 전송 방법
			,produces="application/json;charset=UTF-8"	// 응답할 데이터 종류 설정
	)
	@ResponseBody
	public int posDeleteCnt(
			PosMenuListDTO posMenuListDTO
	){
			
		
		System.out.println("getDeleteCnt 시작");
			int deleteCnt=0;
			for(int i=0; i<posMenuListDTO.getSales_count().length; i++) {System.out.println("getSales_count ===> " +posMenuListDTO.getSales_count()[i]); } 
			for(int i=0; i<posMenuListDTO.getSales_count().length; i++) {System.out.println("getBusiness_no ===> " +posMenuListDTO.getBusiness_no()[i]); }
			for(int i=0; i<posMenuListDTO.getSales_count().length; i++) {System.out.println("getSales_date ===> " +posMenuListDTO.getSales_date()[i]); }

		try {
			
			deleteCnt = this.posPayService.getDeleteCnt(posMenuListDTO);
		 
			
		
		}catch(Exception e) {
				System.out.println("<에러발생>");
				System.out.println(e.getMessage());
				
				deleteCnt=-1;
		 
		}
		  
			  
	return deleteCnt;
	
	
	}
			

}
