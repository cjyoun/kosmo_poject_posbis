package com.naver.erp;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAOImpl implements MenuDAO{
	
	// 속변 sqlSession 선언하고[sqlSessionTemplate 객체]를 생성해 저장
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	// [검색한 게시판 목록 개수] 리턴하는 메소드 선언
	public int getMenuListAllCnt(MenuSearchDTO menuSearchDTO) {
		int menuListAllCnt = this.sqlSession.selectOne(
				"com.naver.erp.MenuDAO.getMenuListAllCnt"   // 실행할 SQL 구문의 위치 지정
				,menuSearchDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		return menuListAllCnt;
	}
	
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	public List<Map<String,String>> getMenuList(MenuSearchDTO menuSearchDTO){
		System.out.println("menuSearchDTO===>"+menuSearchDTO);
		System.out.println("DAO/DTO.sort==>"+menuSearchDTO.getSort());
		List<Map<String,String>> menuList = this.sqlSession.selectList(
			
			"com.naver.erp.MenuDAO.getMenuList" // 실행할 SQL 구문의 위치 지정 
			,menuSearchDTO
			
		);
		System.out.println("menuListDAO===>"+menuList);
		return menuList;
	}	
	// [게시판 글 입력 후 입력 적용 행의 개수]를 리턴하는 메소드 선언
	public int insertMenu(MenuDTO menuDTO) {
		//System.out.println("12344=>" + menuDTO.getU_no());
		int menuRegCnt = this.sqlSession.insert(
				"com.naver.erp.MenuDAO.insertMenu"    // 실행할 SQL 구문의 위치 지정
				,menuDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		System.out.println(menuRegCnt);
		return menuRegCnt;
	}
	

	// [1개 메뉴]리턴하는 메소드 선언

	public MenuDTO getMenuDTO(int menu_no) {
		System.out.println("getMenuDTO시작==>" + menu_no);
		// [SqlSessionTemplate 객체]의 selectOne(~,~) 를 호출하여 1개의 메뉴 얻기
		MenuDTO menuDTO = this.sqlSession.selectOne(
				"com.naver.erp.MenuDAO.getMenuDTO"    // 실행할 SQL 구문의 위치 지정
				,menu_no								// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		System.out.println("getMenuDTO 끝==>" + menuDTO.getMenu_using());
		return menuDTO;
	}
	

	// 메뉴 수정 후 수정행의 적용 개수를 리턴하는 메소드선언

	public int updateMenu(MenuDTO menuDTO) {
		int updateCnt = this.sqlSession.update(
				"com.naver.erp.MenuDAO.updateMenu"    // 실행할 SQL 구문의 위치 지정
				,menuDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		return updateCnt;
	}
	
	// 삭제 수정할 메뉴의 존재 개수를 리턴하는 메소드 선언

	public int getMenuCnt(MenuDTO menuDTO) {
		int menuCnt = this.sqlSession.selectOne(
				"com.naver.erp.MenuDAO.getMenuCnt"    // 실행할 SQL 구문의 위치 지정
				,menuDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		return menuCnt;
	}
	
	
	// 삭제할 메뉴의 존재 개수를 리턴하는 메소드 선언

	public int deleteMenu(MenuDTO menuDTO) {
		int deletMenuCnt = this.sqlSession.delete(
				"com.naver.erp.MenuDAO.deleteMenu"    // 실행할 SQL 구문의 위치 지정
				,menuDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		return deletMenuCnt;
	}
	
	// [1개 메뉴 출력번호 수정하고 수정 행의 개수]를 리턴하는 메소드 선언
	public int updatePrintNo(MenuDTO menuDTO) {
		int menuPrintNo = this.sqlSession.update(
				"com.naver.erp.MenuDAO.updatePrintNo"    	// 실행할 SQL 구문의 위치 지정
				,menuDTO								// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		return menuPrintNo;
	}
	
	// user_id 를 가지고 u_no 얻기
	   @Override
	   public int getUserNo(String user_id) {
	      System.out.println(user_id);
	      System.out.println("getUserNo 메소드 시작");
	      int user_no = this.sqlSession.selectOne(
	             "com.naver.erp.MenuDAO.getUserNo"      // 실행할 SQL 구문의 위치 지정
	            , user_id    
	         );
	      System.out.println(user_no);

	      return user_no;
	   }
	   
	   // u_no을 가지고 business_no 과 business_name 얻기
	   @Override
	   public List<Map<String, String>> getBusinessNoList(int user_no) {
	      System.out.println("DAO : businessNoList 시작");
	      System.out.println("user_no : " + user_no);
	      List<Map<String,String>> businessNoList = this.sqlSession.selectList(
	             "com.naver.erp.MenuDAO.getBusinessNoList"      // 실행할 SQL 구문의 위치 지정 
	            , user_no                      // 실행할 SQL 구문에서 사용할 데이터 지정
	      );
	      System.out.println("DAO : businessNoList 끝");
	      
	      return businessNoList;
	   }
	   
       //-----------------------------
       //대분류 데이터 가져오기
	   //-----------------------------
    
    public List<Map<String,String>> getMenuCategory1(){
       List<Map<String, String>> menuCategory1 = this.sqlSession.selectList(
             "com.naver.erp.MenuDAO.getMenuCategory1" // 실행할 SQL 구문의 위치 지정
       );
       System.out.println("DAO / menuCategory1" + menuCategory1);
       return menuCategory1;
    };
    
       //-----------------------------
       //중분류 데이터 가져오기
    	//-----------------------------
    
    public List<String> getMenuCategory2(String main_category_name){
       List<String> menuCategory2 = this.sqlSession.selectList(
          "com.naver.erp.MenuDAO.getMenuCategory2" // 실행할 SQL 구문의 위치 지정
          ,main_category_name   
    );
    System.out.println("DAO / menuCategory2" + menuCategory2);
    return menuCategory2;
    };

       //-----------------------------
       //소분류 데이터 가져오기
    	//-----------------------------
    
    public List<String> getMenuCategory3(String mid_category_name){
       List<String> menuCategory3 = this.sqlSession.selectList(
          "com.naver.erp.MenuDAO.getMenuCategory3" // 실행할 SQL 구문의 위치 지정
          ,mid_category_name   
    );
    System.out.println("DAO / menuCategory3" + menuCategory3);
    return menuCategory3;
    }


		
}
