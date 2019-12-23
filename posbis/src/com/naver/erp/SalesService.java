package com.naver.erp;
import java.util.*;

//[BoardService 인터페이스] 선언
public interface SalesService {
	
	//[검색한 판매내역 목록] 리턴하는 메소드 선언
	List<Map<String,String>> getSalesList(SalesSearchDTO salesSearchDTO);
	
	//[검색한 판매내역 목록 개수] 리턴하는 메소드 선언
	int getSalesListAllCnt(SalesSearchDTO salesSearchDTO);
	
	// user_id 를 가지고 u_no 얻기
	int getUserNo(String user_id);
	   
	// u_no을 가지고 business_no 과 business_name 얻기 
	List<Map<String, String>> getBusinessNoList(int u_no);
	
}
