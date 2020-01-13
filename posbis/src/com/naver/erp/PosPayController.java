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
	@Autowired
	private SalesService salesService;
	
	
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
			
			// 가게 이름 얻기
			String business_name = this.posPayService.getBusiness_name(business_no);
			mav.addObject("business_name", business_name);
			System.out.println(business_name);

//	      		 //================[메뉴 총 개수] 얻기=====================
//				int posMenuAllCnt = this.posPayService.getPosMenuAllCnt(business_no);
//				mav.addObject("posMenuAllCnt", posMenuAllCnt);
//				//================끝  [메뉴 총 개수] 얻기=====================
//

				//=====================[메뉴 목록] 얻기===========================
				List<Map<String,String>> posMenuList = this.posPayService.getPosMenuList(business_no);
				mav.addObject("posMenuList", posMenuList);  
				System.out.println(posMenuList);
				//===================끝  [메뉴 목록] 얻기===========================
					

			
		}
		catch(Exception e) {
			System.out.println("preResultList <에러발생>");
			System.out.println(e.getMessage());
		}
		
		return mav;
		
	}

	//--------------------------------------------------------------------------------------------------------
	
 /////////////////////////////////////////////////////////////
//메뉴 클릭시 정보 불러 오기
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
			 * set 메소드로 답기- preChart cont -> 리턴 ajax-> dto.이름
			 */
		 
		} catch (Exception e) {
			
			System.out.println("<posPerMenuList 에러발생>");
			System.out.println(e.getMessage());
		}

		System.out.println(posPerMenuList);
		return posPerMenuList;

	}
	
	//---------------------------------------------
	// 가상주소 /posbis/posSalesRegProc.do 로 접근하면 호출되는 메소드 선언.
	//---------------------------------------------
	@RequestMapping(
			value="/posSalesRegProc.do"			// 접속하는 클래스의 URL 주소 설정
			,method=RequestMethod.POST		// 접속하는 클래스의 파마리터값 전송 방법
			,produces="application/json;charset=UTF-8"	// 응답할 데이터 종류 설정
	)
	@ResponseBody
	public int insertSales(
			SalesDTO salesDTO			
	) {
		//[게시판 입력 적용행의 개수]저장할 변수 선언
		int salesRegCnt = 0;
	
	try {
		
			
		salesRegCnt = this.salesService.insertSales(salesDTO);
		}catch(Exception e) {
			System.out.println("<에러발생>");
			System.out.println(e.getMessage());
			
			salesRegCnt=-1;
		}
		return salesRegCnt;
	}
	
}
