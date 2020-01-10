package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface PosLoginDAO {

	//  로그인시 사업자번호, 암호 확인=========================
	int getAdminNoCnt(PosLoginDTO posLoginDTO);
	//============================================
	
}
