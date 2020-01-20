package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface PosPayService {
	
	
	//메뉴 총 개수=============================================
	int getPosMenuAllCnt(String business_no);
	//====================================================
	
	
	//메뉴 리스트=============================================
	List<Map<String,String>> getPosMenuList(String business_no);
	//====================================================

 
	//메뉴 클릭시 정보 불러 오기
	List<Map<String,String>> getPosPerMenuList(PosMenuDTO posMenuDTO);

	
	//가게이름 불러오기
	String getBusiness_name(String business_no);

	//매출 등록
	int updateSalesNo(PosMenuSalesDTO posMenuSalesDTO);
	
	//메뉴 리스트 
	List<Map<String,String>> getPosSalesList(PosSearchDTO posSearchDTO);
 
	
	//메뉴 총 개수 
	int getPosSalesAllCnt(PosSearchDTO posSearchDTO);
 
	
	//메뉴 상세리스트
	List<Map<String,String>> getPosDetailList(Map<String, String> busi_no_date);
	
	//메뉴 삭제
	int getDeleteCnt(PosMenuListDTO posMenuListDTO);
	

	
}
