package com.naver.erp;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SalesServiceImpl implements SalesService{
	//속성변수 boardDAO 선언하고, [BoardDAO 인터페이스]를 구현한 클래스를 객체화해서 저장한다.
	@Autowired
	private SalesDAO salesDAO;
	
	//[검색한 게시판 목록 총 개수] 리턴하는 메소드 선언
	public int getSalesListAllCnt(SalesSearchDTO salesSearchDTO) {
		
		//[BoardDAO 인터페이스]를 구현한  객체의 getBoardListAllCnt 메소드를 호출하여
		//[검색한 게시판 목록 개수]를 얻는다.
		//[검색한 게시판 목록 개수]를 리턴받는다.
		int salesListAllCnt= this.salesDAO.getSalesListAllCnt(salesSearchDTO);
		//[검색한 게시판 목록 개수]를 리턴한다.
		return salesListAllCnt;
		
	}
	
	//[검색한 게시판 목록] 리턴하는 메소드 선언
	public List<Map<String,String>> getSalesList(SalesSearchDTO salesSearchDTO){
	    //System.out.println("service : getSalesList 시작");
		List<Map<String,String>> salesList = this.salesDAO.getSalesList(salesSearchDTO);
	    //System.out.println("service : getSalesList 끝");
		return salesList;
	}
	

	public Map<String,String> getSalesSum(SalesSearchDTO salesSearchDTO){
		Map<String,String> salesSum = this.salesDAO.getSalesSum(salesSearchDTO);
		return salesSum;
	}
	
	
	//[검색한 게시판 목록 총 개수] 리턴하는 메소드 선언
	public int getMenuSalesListAllCnt(MenuSalesSearchDTO menuSalesSearchDTO) {
		
		//[BoardDAO 인터페이스]를 구현한  객체의 getBoardListAllCnt 메소드를 호출하여
		//[검색한 게시판 목록 개수]를 얻는다.
		//[검색한 게시판 목록 개수]를 리턴받는다.
		int menuSalesListAllCnt= this.salesDAO.getMenuSalesListAllCnt(menuSalesSearchDTO);
		//[검색한 게시판 목록 개수]를 리턴한다.
		return menuSalesListAllCnt;
		
	}
	
	//[검색한 게시판 목록] 리턴하는 메소드 선언
	public List<Map<String,String>> getMenuSalesList(MenuSalesSearchDTO menuSalesSearchDTO){
	    //System.out.println("service : getSalesList 시작");
		List<Map<String,String>> menuSalesList = this.salesDAO.getMenuSalesList(menuSalesSearchDTO);
	    //System.out.println("service : getSalesList 끝");
		return menuSalesList;
	}
	

	public Map<String,String> getMenuSalesSum(MenuSalesSearchDTO menuSalesSearchDTO){
		Map<String,String> menuSalesSum = this.salesDAO.getMenuSalesSum(menuSalesSearchDTO);
		return menuSalesSum;
	}
	
	
	
	
	   // user_id 를 가지고 u_no 얻기
	   @Override
	   public int getUserNo(String user_id) {
	      //System.out.println("service : "+user_id);
	      int user_no = this.salesDAO.getUserNo(user_id);
	      
	      return user_no;
	   }
	   
	//--------------------------------------------------------------------------------------------------   
	   
	   // u_no을 가지고 business_no 과 business_name 얻기   
	   @Override
	   public List<Map<String, String>> getBusinessNoList(int u_no) {
	      //System.out.println("service : businessNoList 시작");
	      List<Map<String,String>> businessNoList = this.salesDAO.getBusinessNoList(u_no);
	      //System.out.println("service : businessNoList 끝"); 
	      return businessNoList;
	   }

	   
	//--------------------------------------------------------------------------------------------------   

		// 홈페이지 매출 현황
	   public List<Map<String, String>> getSalesNow(int u_no){
		      List<Map<String,String>> salesNow = this.salesDAO.getSalesNow(u_no);

		      return salesNow;
	   }

		// 홈페이지 매출 현황
	   public List<Map<String, String>> getSalesWeek(int u_no){
		      List<Map<String,String>> salesWeek = this.salesDAO.getSalesWeek(u_no);

		      return salesWeek;
	   }
	   
	// 매출 등록 성유진 시작
	public int insertSales(SalesDTO salesDTO){

		// 1개의 메뉴 등록 후 적용 행의 개수 리턴하기
		int salesRegCnt = this.salesDAO.insertSales(salesDTO);
		return salesRegCnt;
	}
	// 성유진 끝
	
	
	// 마케팅폼!! 새로한거 !!!!!!!
	// 세트메뉴 리스트 리턴하는 메소드 선언
	public List<Map<String,String>> getSetMenuList(MarketingDTO marketingDTO){
			List<Map<String,String>> setMenuList = this.salesDAO.getSetMenuList(marketingDTO);
			
			return setMenuList;
	}	
	public List<Map<String,String>> getSetMenuListChart(MarketingDTO marketingDTO){
		List<Map<String,String>> setMenuList = this.salesDAO.getSetMenuListChart(marketingDTO);
		
		return setMenuList;
}	
	
}
