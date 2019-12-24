package com.naver.erp;
import java.util.*;

//-----------------------------------
// [MenuService 인터페이스] 선언
//-----------------------------------
public interface MenuService {
	
	// [검색한 메뉴 목록] 리턴하는 메소드 선언
	List<Map<String,String>> getMenuList(MenuSearchDTO menuSearchDTO);
	
	// [검색한 메뉴 목록 개수] 리턴하는 메소드 선언
	int getMenuAllCnt(MenuSearchDTO menuSearchDTO);
	
	// [메뉴 등록 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	int insertMenu(MenuDTO menuDTO);
	
	int getUserNo(String user_id);
	
	List<Map<String, String>> getBusinessNoList(int user_no);
	
	// [1개의 게시판 정보]를 리턴하는 메소드 선언
	MenuDTO getMenuDTO(int menu_no);

	//-------------------------------------------
	// 메누 수정 후 수정 적용행의 개수를 리턴하는 메소드 선언 
	//-------------------------------------------
	int updateMenu(MenuDTO menuDTO);
	
	//-------------------------------------------
	// 메뉴 삭제 후 삭제 적용행의 개수를 리턴하는 메소드 선언 
	//-------------------------------------------
	int deleteMenu(MenuDTO menuDTO);

	   // 메뉴 대분류 가져오기 
	   List<Map<String, String>> getMenuCategory1();

	   // 메뉴 중분류 가져오기
	   List<String> getMenuCategory2(String main_category_name);
	   
	   // 메뉴 소분류 가져오기
	   List<String> getMenuCategory3(String mid_category_name);


}
