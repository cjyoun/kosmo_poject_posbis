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


	 /////////////////////////////////////////////////////////////
	//메뉴 클릭시 정보 불러 오기
	////////////////////////////////////////////////////////////
	List<Map<String,String>> getPosPerMenuList(PosMenuDTO posMenuDTO);
	
	
}