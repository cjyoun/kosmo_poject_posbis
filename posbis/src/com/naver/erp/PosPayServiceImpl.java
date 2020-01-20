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
	
	
	
	//매출 등록
	public int updateSalesNo(PosMenuSalesDTO posMenuSalesDTO) {
		System.out.println("posservice insertPosSales 시작");
		int salesRegCnt=0;
	
		for(int i=0; i<posMenuSalesDTO.getSales_count().length; i++) {	
			posMenuSalesDTO.setMenu_name1(posMenuSalesDTO.getMenu_name()[i]);
			posMenuSalesDTO.setSales_count1(posMenuSalesDTO.getSales_count()[i]);		
		 salesRegCnt+=this.posPayDAO.updateSalesNo(posMenuSalesDTO);
		}
	 
		
		System.out.println("posservice insertPosSales 끝");	
		if(posMenuSalesDTO.getSales_count().length!=salesRegCnt) {
			return -1;
		}
		return salesRegCnt;
	};
	
	
	//매출메뉴 리스트
	public List<Map<String, String>> getPosSalesList(PosSearchDTO posSearchDTO) {
		List<Map<String, String>> posSalesList = this.posPayDAO.getPosSalesList(posSearchDTO);
		return posSalesList;
	}
	//매출메뉴 리스트 총개수
	public int getPosSalesAllCnt(PosSearchDTO posSearchDTO) {
		int posSalesAllCnt = this.posPayDAO.getPosSalesAllCnt(posSearchDTO);
		return posSalesAllCnt;
	}
	
	//메뉴상세리스트
	public List<Map<String, String>> getPosDetailList(Map<String, String> busi_no_date) {
		
		System.out.println(" 서비스 getPosDetailList 시작");
		List<Map<String, String>> posDetailList = this.posPayDAO.getPosDetailList(busi_no_date);
		
		/* System.out.println(" 서비스 getPosDetailList 끝"); */
		return posDetailList;
	}
	
	//메뉴삭제
	public int getDeleteCnt(PosMenuListDTO posMenuListDTO) {
		System.out.println(" 서비스 getDeleteCnt 시작");
		
		//sales 메뉴 삭제 리턴
		int deleteCnt=0;
				
		for(int i=0; i<posMenuListDTO.getSales_count().length; i++) {	
			posMenuListDTO.setSales_count1(posMenuListDTO.getSales_count()[i]);
			posMenuListDTO.setBusiness_no1(posMenuListDTO.getBusiness_no()[i]);
			posMenuListDTO.setSales_date1(posMenuListDTO.getSales_date()[i]);
			
			System.out.println(posMenuListDTO.getBusiness_no1());
			System.out.println(posMenuListDTO.getSales_date1());
			System.out.println(posMenuListDTO.getSales_count1());
			
			deleteCnt+=this.posPayDAO.getDeleteCnt(posMenuListDTO);
			
			
		}
		
		System.out.println("서비스 getDeleteCnt  끝");	
		if(posMenuListDTO.getSales_count().length!=deleteCnt) {
			return -1;
		}
		
		
		return deleteCnt;
	};
	
	
 

}