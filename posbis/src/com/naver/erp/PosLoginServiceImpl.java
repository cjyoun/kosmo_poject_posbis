package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PosLoginServiceImpl implements PosLoginService {
	
		@Autowired
		private PosLoginDAO posLoginDAO;


		//  로그인시 사업자번호, 암호 확인=========================
		public int getAdminNoCnt(PosLoginDTO posLoginDTO) {
			System.out.println("serviceimp");
			int adminNoCnt = this.posLoginDAO.getAdminNoCnt(posLoginDTO);
			return adminNoCnt;
		};
		//=============================================
 
		
 
}
