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

//	       //================[메뉴 총 개수] 얻기=====================
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
	
}
