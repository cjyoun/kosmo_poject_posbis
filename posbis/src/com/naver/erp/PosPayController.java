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
	
	
	
	
	
	
	
	

}
