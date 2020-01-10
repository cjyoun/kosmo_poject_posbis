package com.naver.erp;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PosLoginDAOImpl implements PosLoginDAO{

	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	//  로그인시 사업자번호, 암호 확인=========================
	public int getAdminNoCnt(PosLoginDTO posLoginDTO) {
		
		int adminCnt = this.sqlSession.selectOne(
				"com.naver.erp.PosLoginDAO.getAdminNoCnt"
				,posLoginDTO
				);
		System.out.println("DAO/adminCnt"+adminCnt);
		return adminCnt;
		};
		//=============================================
	 
 
		
		
}
