package com.naver.erp;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



//[DAO 클래스]인 [BoardDAOImple 클래스] 선언
	//@Repository 를 붙임으로써 [DAO 클래스]임을 지정하게 되고, bean 태그로 자동 등록된다
@Repository
public class PosPayDAOImpl implements PosPayDAO{
	
	
	//속성변수 sqlSession 선언하고, [SqlSessionTemplate 인터페이스]를 구현한 클래스를 객체화해서 저장
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//[select문 사업자번호, 가게 이름] 얻기-------------------------------------------------------   
	public List<Map<String,String>> getPosMenuList(String business_no){
		List<Map<String, String>> posMenuList = this.sqlSession.selectList(
				"com.naver.erp.PosPayDAO.getPosMenuList"  
				,business_no);
		
		return posMenuList;
	}
	//--------------------------------------------------------------------------------------------------   
	
	
	//[메뉴 목록 개수] 리턴하는 메소드 선언-------------------------------------------------------   
	public int getPosMenuAllCnt(String business_no) {  
		int posMenuAllCnt = this.sqlSession.selectOne(
				"com.naver.erp.PosPayDAO.getPosMenuAllCnt"  
				, business_no					
		);
		
		return posMenuAllCnt;
		
	}
	//-------------------------------------------------------------------------------------------------- 
	
	//메뉴 클릭시 정보 불러 오기	
	public List<Map<String,String>> getPosPerMenuList(PosMenuDTO posMenuDTO){
		
		System.out.println("podao 시작");
		
		List<Map<String,String>> posPerMenuList = this.sqlSession.selectList(
				"com.naver.erp.PosPayDAO.getPosPerMenuList"
				,posMenuDTO
				);
		System.out.println("podao 끝");
		return posPerMenuList;
	}	
		
	//--------------------------------------------------------------------------
	// 가게이름 불러오기

	public String getBusiness_name(String business_no) {
		String business_name = this.sqlSession.selectOne(
				"com.naver.erp.PosPayDAO.getBusiness_name"  
				, business_no					
		);
		
		return business_name;
	}
	

	//매출 등록
	public int updateSalesNo(PosMenuSalesDTO posMenuSalesDTO) {		
		System.out.println("dao updateSalesNo 시작");
		int salesRegCnt = this.sqlSession.insert(
				"com.naver.erp.PosPayDAO.updateSalesNo"    // 실행할 SQL 구문의 위치 지정
				,posMenuSalesDTO								// 실행할 SQL 구문에서 사용할 데이터 지정	
		);		
		System.out.println("dao updateSalesNo 끝");
		return salesRegCnt;
	};
	
	//매출 메뉴 리스트
	public List<Map<String,String>> getPosSalesList(PosSearchDTO posSearchDTO){
		
		List<Map<String,String>> posSalesList = this.sqlSession.selectList(
				"com.naver.erp.PosPayDAO.getPosSalesList" 
				,posSearchDTO
		);	
		
		return posSalesList;
	};
	
	//메뉴 총 개수 
	public int getPosSalesAllCnt(PosSearchDTO posSearchDTO) {
		
		int posSalesAllCnt=this.sqlSession.selectOne(
				"com.naver.erp.PosPayDAO.getPosSalesAllCnt"
				,posSearchDTO
		);
		return posSalesAllCnt;
	};
		
 
	
	//메뉴 상세리스트
	public List<Map<String,String>> getPosDetailList(Map<String, String> busi_no_date){
		
		System.out.println(" DAO getPosDetailList 시작");
		List<Map<String,String>> posDetailList = this.sqlSession.selectList(
				"com.naver.erp.PosPayDAO.getPosDetailList" 
				,busi_no_date
		);	
		System.out.println(" DAO getPosDetailList 끝");
		return posDetailList;
	};
	
	
	
	
	//메뉴 삭제 
	public int getDeleteCnt(PosMenuListDTO posMenuListDTO) {
		
		System.out.println(" DAO getDeleteCnt 시작");
		int deleteCnt=this.sqlSession.delete(
				"com.naver.erp.PosPayDAO.getDeleteCnt" 
				,posMenuListDTO	
		);
		System.out.println(" DAO getPosDetailList 끝");
		return deleteCnt;
		
	};
	
	
	
	
	
}
