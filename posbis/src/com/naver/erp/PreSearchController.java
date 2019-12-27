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
public class PreSearchController {
	
	
	@Autowired
	private PreSearchService preSearchService;
		
	

	@RequestMapping(value ="/preSearchForm.do")
	public ModelAndView getSearchList(
		PreSearchDTO preSearchDTO
		, HttpSession session
		, HttpServletResponse response 
	) {
		System.out.println("Controller/getSearchList 호출");
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "preSearchForm.jsp");
		
		
		
		try {
			
			
			
			//===================select / 사업자번호 얻기==================
			String user_id = (String)session.getAttribute("user_id");
	        // String user_id = "user10";
	         System.out.println("user_no 얻기 시작");
	        // System.out.println(user_id);
	         
	         // user_id 를 가지고 u_no 값 얻기
	         int user_no = this.preSearchService.getUserNo(user_id);
	         //System.out.println("user_no : " + user_no);
	         
	         // u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>> .  N행 1열이면 List<String> )
	         List<Map<String,String>> businessNoList = this.preSearchService.getBusinessNoList(user_no);
	         //List<String> businessNoList = this.preChartService.getBusinessNoList(user_no);

	         System.out.println("Controller/businessNoList 끝");
	         
	         
	         mav.addObject("businessNoList" , businessNoList);
	         
	         
	   //      mav.addObject("boardListAllCnt" , boardListAllCnt);
	         //System.out.println(businessNoList);
	         //System.out.println( "businessNoList.size()=>" + businessNoList.size());
	         //System.out.println( "businessNoList.get(\"business_no\")=>" + businessNoList.get(0).get("business_no") );

			//=================끝 select / 사업자번호 얻기============
	         

				
				
				
				
				//=====================[검색 목록] 얻기===========================
				List<Map<String,String>> preResultList = this.preSearchService.getPreResultList(preSearchDTO);
				mav.addObject("preResultList", preResultList);  
				//System.out.println("preResultList.size() => " + preResultList.size() );
				//System.out.println("Controller/preResultList===>"+preResultList);
				//===================끝  [검색 목록] 얻기===========================
 
	         
	         
	
			//================[프리미엄 검색 총 개수] 얻기=====================
			int preResultAllCnt = this.preSearchService.getPreResultAllCnt(preSearchDTO);
			mav.addObject("preResultAllCnt", preResultAllCnt);
			//System.out.println("Controller/preResultAllCnt===>"+preResultAllCnt);
			//================끝  [프리미엄 검색 총 개수] 얻기=====================
			
			
			// 총 개수와 선택한 페이지 번호간의 이상관계 시 보정
			
					if(preResultAllCnt>0) {
						int selectPageNo =  preSearchDTO.getSelectPageNo();
						int rowCntPerPage = preSearchDTO.getRowCntPerPage();
						int beginRowNo = selectPageNo*rowCntPerPage-rowCntPerPage+1;
						
						if( beginRowNo < selectPageNo ) {
							preSearchDTO.setSelectPageNo(1);
						}
					}
			
			
			
			//=====================[select / addrGu1]얻기====================
			List<String> addrGu1List = this.preSearchService.getAddrGu1List();
			mav.addObject("addrGu1List", addrGu1List);
			//System.out.println("Controller/addrGu1List///"+addrGu1List);
			//================= 끝  [select / addrGu1]얻기====================
			
			
			//=====================[select / businessTypeName1List]얻기====================
			List<String> businessTypeName1List = this.preSearchService.getBusinessTypeName1List();
			mav.addObject("businessTypeName1List", businessTypeName1List);
			//System.out.println("Controller/businessTypeName1List///"+businessTypeName1List);
			//================= 끝  [select / businessTypeName1List]얻기====================
			
			
			
			System.out.println("Controller/preSearchDTO.rowCntPerPage===>"+preSearchDTO.getRowCntPerPage());
			System.out.println("Controller/preSearchDTO.selectPageNo===>"+preSearchDTO.getSelectPageNo());
			
			
			mav.addObject("preSearchDTO", preSearchDTO);
			//System.out.println("Controller/preSearchDTO==>"+preSearchDTO.getBusiness_type_name2());
			//System.out.println("Controller/preSearchDTO.getSelectPageNo==>"+preSearchDTO.getSelectPageNo());
			
		}
		catch(Exception e) {
			System.out.println("preResultList <에러발생>");
			System.out.println(e.getMessage());
		}
		
		return mav;
		
	}
	
	

	
	// select  / BusinessTypeName2 얻기
	@RequestMapping( value="/getBusinessTypeName2.do" //접속하는 클래스의 URL 주소 설정
		 		,method=RequestMethod.POST //접속하는 클래스의 파라미터값 전송 방법
		 	,produces="application/json;charset=UTF-8" //응답할 데이터 종류 설정(여기선 json) )
	)
	@ResponseBody 
	public List<String> getBusinessTypeName2(
			//파라미터값을 저장할 [BoardDTO 객체]를 매개변수로 선언
			@RequestParam(value="business_type_name1") String business_type_name1 
	) {
		System.out.println("Controller/business_type_name1"+business_type_name1);
		List<String> businessTypeName2List;
		try {
			businessTypeName2List = this.preSearchService.getBusinessTypeName2(business_type_name1);
		}
		catch(Exception e) {
			System.out.println("getBusinessTypeName2 <에러발생>");
			System.out.println(e.getMessage());
			businessTypeName2List = null;
		}
		System.out.println("Controller/businessTypeName2List===>"+businessTypeName2List);
		return businessTypeName2List;
	}
	
	
	
	 
}
