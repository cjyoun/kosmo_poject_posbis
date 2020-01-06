package com.naver.erp;
import java.util.List;
import java.util.Map;

//-----------------------------------
// [DAO 인터페이스] 선언
//-----------------------------------
public interface MenuDAO {
	
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	List<Map<String,String>> getMenuList(MenuSearchDTO menuSearchDTO);

	// [검색한 게시판 목록 개수] 리턴하는 메소드 선언
	int getMenuListAllCnt(MenuSearchDTO menuSearchDTO);

	// 메뉴 입력 후 입력 적용 행의 개수 리턴하는 메소드 선언
	int insertMenu(MenuDTO menuDTO);
	
	// 유저 정보를 를 리턴하는 메소드 선언
	int getUserNo(String user_id);

	List<Map<String, String>> getBusinessNoList(int u_no);
	
	// 1개의 메뉴 정보를 리턴하는 메소드 선언
	MenuDTO getMenuDTO(int menu_no);

	// 수정할 메뉴 존재 개수를 리턴하는 메소드 선언
	int updateMenu(MenuDTO menuDTO);
	
	// 삭제할 메뉴의 존재 개수를 리턴하는 메소드 
	int getMenuCnt(MenuDTO menuDTO);
	
	// 메뉴 삭제 명령한 후 삭제 적용행의 개수를 리턴하는 메소드 선언
	int deleteMenu(MenuDTO menuDTO);

	// 1개의 메뉴 출력번호 수정하고 수정 행의 개수 리턴하는 메소드 선언
	int updatePrintNo(MenuDTO menuDTO);
	
	   // 대분류 데이터 가져오기
	   List<Map<String, String>> getMenuCategory1();

	   // 중분류 데이터 가져오기
	   List<String> getMenuCategory2(String main_category_name);

	   // 소분류 데이터 가져오기
	   List<String> getMenuCategory3(String mid_category_name);

}
