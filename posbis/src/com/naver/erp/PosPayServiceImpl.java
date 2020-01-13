package com.naver.erp;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Service
@Transactional
public class PosPayServiceImpl implements PosPayService{

	
	//속성변수 boardDAO 선언하고, [BoardDAO 인터페이스]를 구현한 클래스를 객체화해서 저장
	@Autowired
	private PosPayDAO posPayDAO;

	//[검색한 게시판 목록 개수] 리턴하는 메소드 선언
	public int getPosMenuAllCnt(String business_no) {
		//System.out.println("Service/getPreResultAllCnt 시 작");
		//[BoardDAO 인터페이스]를 구현한 객체의 getBoardListAllCnt 메소드 호출
		//[검색한 게시판 목록 개수] 를 얻는다
		//[검색한 게시판 목록 개수] 를 리턴받는다
		int posMenuAllCnt = this.posPayDAO.getPosMenuAllCnt(business_no);
		
		//[검색한 게시판 목록 총 개수]를 리턴한다
		return posMenuAllCnt;
	}
	
	//--------------------------------------------------------------------------------------------------   
	
	
	//[검색한 게시판 목록] 리턴하는 메소드 선언
	public List<Map<String, String>> getPosMenuList(String business_no){
		List<Map<String, String>> posMenuList = this.posPayDAO.getPosMenuList(business_no);
		//.out.println("Service//"+preResultList);
		return posMenuList;
	}
	
	

	//--------------------------------------------------------------------------------------------------   
	

	
	 /////////////////////////////////////////////////////////////
		//메뉴 클릭시 정보 불러 오기
		////////////////////////////////////////////////////////////
		
	public List<Map<String,String>> getPosPerMenuList(PosMenuDTO posMenuDTO){
		System.out.println("posservice 시작");
		List<Map<String,String>> posPerMenuList = this.posPayDAO.getPosPerMenuList(posMenuDTO);
		System.out.println("posservice 끝");
	      return posPerMenuList;
	}
	
	//가게이름 불러오기
	public String getBusiness_name(String business_no) {
		String business_name = this.posPayDAO.getBusiness_name(business_no);
	      
	    return business_name;
	}

}