package com.naver.erp;

import java.util.List;
import java.util.Map;

//-----------------------------------------------------------------
// [DAO 인터페이스] 선언
//----------------------------------------------------------------

public interface PreChartDAO {

	// user_id 를 가지고 u_no 얻기
	int getUserNo(String user_id);

	
	// u_no을 가지고 business_no 과 business_name 얻기
	List<Map<String, String>> getBusinessNoList(int user_no);
	// List<String> getBusinessNoList(int user_no);


	List<Map<String, String>> getSalesMonthList(String changeBusinessNo);
	//List<String> getSalesMonthList(String changeBusinessNo);


	List<Map<String, String>> getAllSalesMonthList(String changeBusinessNo);
		

}
