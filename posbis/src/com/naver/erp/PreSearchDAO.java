package com.naver.erp;
import java.util.*;

public interface PreSearchDAO {

	   // user_id 를 가지고 u_no 얻기
	   int getUserNo(String user_id);

	   // u_no을 가지고 business_no 과 business_name 얻기
	List<Map<String, String>> getBusinessNoList(int user_no);
	
	
	List<Map<String,String>> getPreResultList(PreSearchDTO preSearchDTO);
	
	//[검색한 게시판 목록 개수] 리턴하는 메소드 선언
	int getPreResultAllCnt(PreSearchDTO preSearchDTO);
	
	//[검색한 게시판 목록 for MAP] 리턴하는 메소드 선언
	List<Map<String, String>> getPreResultMAPList(PreSearchDTO preSearchDTO);
	
	//[select문 사업자번호, 가게 이름] 얻기
	List<Map<String,String>> getBusinessInfoList(int u_no);

	//[select / addrGu1]얻기
	List<Map<String,String>> getAddrGu1List();
	

	//[select / BusinessTypeName1List]얻기
	List<String> getBusinessTypeName1List();

	// select  / BusinessTypeName2 얻기
	List<String> getBusinessTypeName2(String business_type_name1);
	
	// select / AddrDong1 얻기
	List<String> getAddrDong1(String addr_gu1);

	//bestMenuList 얻기
	List<String> getBestMenuList(PreSearchDTO preSearchDTO);
	
	//구 별 점포수
	List<Map<String, String>> getCntPerGu(PreSearchDTO preSearchDTO);
	
	
}