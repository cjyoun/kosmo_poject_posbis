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
public class PreSearchDAOImpl implements PreSearchDAO{
	
	
	//속성변수 sqlSession 선언하고, [SqlSessionTemplate 인터페이스]를 구현한 클래스를 객체화해서 저장
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	

	//--------------------------------------------------------------------------------------------------   

	//[검색한 게시판 목록] 리턴하는 메소드 선언
	public List<Map<String, String>> getPreResultList(PreSearchDTO preSearchDTO){
		//System.out.println("DAO/DTO.business_name1===>"+preSearchDTO.getBusiness_type_name1());
		//System.out.println("DAO  getPreResultList 호출");
		//System.out.println("DAO/DTO.sort==>"+preSearchDTO.getSort());
		List<Map<String, String>> preResultList = this.sqlSession.selectList(
				"com.naver.erp.PreSearchDAO.getPreResultList"  
				, preSearchDTO				
		);
		//System.out.println("DAO/preResultList===>"+preResultList);
		return preResultList;
	}
	
	
	//[검색한 게시판 목록 for MAP] 리턴하는 메소드 선언
	public List<Map<String, String>> getPreResultMAPList(PreSearchDTO preSearchDTO){
		//System.out.println("DAO/DTO.business_name1===>"+preSearchDTO.getBusiness_type_name1());
		//System.out.println("DAO  getPreResultList 호출");
		//System.out.println("DAO/DTO.sort==>"+preSearchDTO.getSort());
		List<Map<String, String>> preResultMAPList = this.sqlSession.selectList(
				"com.naver.erp.PreSearchDAO.getPreResultMAPList"  
				, preSearchDTO				
		);
		//System.out.println("DAO/preResultList===>"+preResultList);
		return preResultMAPList;
	}
	
	//--------------------------------------------------------------------------------------------------   
	//[select문 사업자번호, 가게 이름] 얻기
	public List<Map<String,String>> getBusinessInfoList(int u_no){
		List<Map<String, String>> businessInfoList = this.sqlSession.selectList(
				"com.naver.erp.PreSearchDAO.getBusinessInfoList"  
				,u_no);
		return businessInfoList;
	}

	


	//--------------------------------------------------------------------------------------------------   
	
	
	//[검색한 게시판 목록 개수] 리턴하는 메소드 선언
	public int getPreResultAllCnt(PreSearchDTO preSearchDTO) {    //예외가 발생하면 서비스층으로 넘김
		//[BoardDAO 인터페이스]를 구현한 객체의 getBoardListAllCnt 메소드 호출
		//System.out.println("DAO  getPreResultAllCnt 호출");
		int preResultAllCnt = this.sqlSession.selectOne(
				"com.naver.erp.PreSearchDAO.getPreResultAllCnt"   //실행할 SQL 구문의 위치 지정
				, preSearchDTO						//실행할 SQL 구문에서 사용할 데이터 지정
		);
		
		//[검색한 게시판 목록 총 개수]를 리턴한다
		return preResultAllCnt;
		
	}
	

	//--------------------------------------------------------------------------------------------------   
	

	//[select / addrGu1]얻기
	public List<Map<String,String>> getAddrGu1List(){
		//System.out.println("DAO  getAddrGu1List 호출");
		List<Map<String,String>> addrGu1List = this.sqlSession.selectList(
				"com.naver.erp.PreSearchDAO.getAddrGu1List"
		);
		return addrGu1List;
	}
	
	
	   
	//--------------------------------------------------------------------------------------------------   
	   
	   // user_id 를 가지고 u_no 얻기
	   @Override
	   public int getUserNo(String user_id) {
	      //System.out.println("getUserNo 메소드 시작");
	      int user_no = this.sqlSession.selectOne(
	             "com.naver.erp.PreSearchDAO.getUserNo"      // 실행할 SQL 구문의 위치 지정
	            , user_id    
	         );
	

	      return user_no;
	   }

	//--------------------------------------------------------------------------------------------------   

	   
	   // u_no을 가지고 business_no 과 business_name 얻기
	   @Override
	   public List<Map<String, String>> getBusinessNoList(int user_no) {
	      //System.out.println("DAO : businessNoList 시작");
	      List<Map<String,String>> businessNoList = this.sqlSession.selectList(
	             "com.naver.erp.PreSearchDAO.getBusinessNoList"      // 실행할 SQL 구문의 위치 지정 
	            , user_no                      // 실행할 SQL 구문에서 사용할 데이터 지정
	      );
	     // System.out.println("DAO : businessNoList 끝");
	      
	      return businessNoList;
	   }
	
	   
	 //--------------------------------------------------------------------------------------------------   
		

		//[select / BusinessTypeName1List]얻기
		public List<String> getBusinessTypeName1List(){
			//System.out.println("DAO  getBusinessTypeName1List 호출");
			List<String> businessTypeName1List = this.sqlSession.selectList(
					"com.naver.erp.PreSearchDAO.getBusinessTypeName1List"
			);
			return businessTypeName1List;
		}
		
		
		 //-------------------------------------------------------------------------------------------------- 		

		
		// select  / BusinessTypeName2 얻기
		public List<String> getBusinessTypeName2(String business_type_name1) {
			//System.out.println("getBusinessTypeName2 호출");
			//System.out.println("DAO/business_type_name1===>"+business_type_name1);
			List<String> businessTypeName2List;
			businessTypeName2List = this.sqlSession.selectList(
				"com.naver.erp.PreSearchDAO.getBusinessTypeName2"
				, business_type_name1
			);
			//System.out.println("DAO/businessTypeName2List==>"+businessTypeName2List);
			return businessTypeName2List;
		}
		

		//--------------------------------------------------------------------------------------------------   
		
		

		// select / AddrDong1 얻기
		public List<String> getAddrDong1(String addr_gu1) {
			//System.out.println("DAO/addr_gu1===>"+addr_gu1);
			List<String> addrDong1List;
			addrDong1List = this.sqlSession.selectList(
					"com.naver.erp.PreSearchDAO.getAddrDong1"
					, addr_gu1
			);
			return addrDong1List;
		}
		

		//--------------------------------------------------------------------------------------------------   
		
		
		
		//bestMenuList 얻기
		public List<String> getBestMenuList(PreSearchDTO preSearchDTO){
			List<String> bestMenuList;
			bestMenuList = this.sqlSession.selectList(
					"com.naver.erp.PreSearchDAO.getBestMenuList"
					,preSearchDTO
			);
			return bestMenuList;
		}
		

		//--------------------------------------------------------------------------------------------------   
		
		
		
		//구 별 점포 수 얻기
		public List<Map<String,String>> getCntPerGu(PreSearchDTO preSearchDTO){
			List<Map<String,String>> cntPerGu = this.sqlSession.selectList(
					"com.naver.erp.PreSearchDAO.getCntPerGu"
					,preSearchDTO
			);
			//System.out.println("DAO/cntPerGu"+cntPerGu);
			return cntPerGu;
		}
		
	
}
