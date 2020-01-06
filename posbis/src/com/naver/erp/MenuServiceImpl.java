package com.naver.erp;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuDAO menuDAO;

	//--------------------------------------------
	// [검색한 게시판 목록 개수] 리턴하는 메소드 선언
	//--------------------------------------------
	public int getMenuListAllCnt(MenuSearchDTO menuSearchDTO){

		// [검색한 메뉴 목록 개수]를 리턴 받는다.
		int menuListAllCnt = this.menuDAO.getMenuListAllCnt(menuSearchDTO);

		// [검색한 메뉴 목록 총 개수] 를 리턴한다.
		return menuListAllCnt;
	}
		
	//--------------------------------------------
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	//--------------------------------------------
	public List<Map<String,String>> getMenuList(MenuSearchDTO menuSearchDTO){
		System.out.println("service : getMenuList 시작");
		List<Map<String,String>> menuList = this.menuDAO.getMenuList(menuSearchDTO);
		System.out.println("service : getMenuList 끝");
		return menuList;
	}
	
	
	// [메뉴 등록 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	public int insertMenu(MenuDTO menuDTO){
			
		int menu_no = menuDTO.getMenu_no();

		// 1개의 메뉴 등록 후 적용 행의 개수 리턴하기
		int menuRegCnt = this.menuDAO.insertMenu(menuDTO);
		return menuRegCnt;
	}
	
	//--------------------------------------------
	// 1개 메뉴를 리턴하는 메소드 선언
	//--------------------------------------------
	public MenuDTO getMenuDTO(int menu_no) {
		System.out.println("menu_no====>"+menu_no);
		// [MenuDTOImple] 객체의 getMenuDTO 메소드를 호출하여
		// [1개 게시판 글] 을 얻는다.
		MenuDTO menuDTO = this.menuDAO.getMenuDTO(menu_no);
	
		// 1개의 메뉴가 저장된 menuDTO 객체 리턴하기
		System.out.println("menuDTO=====>"+menuDTO);
		return menuDTO;
	}
	
	//-------------------------------------------
	// 1개 메뉴를 리턴하는 메소드 선언
	//-------------------------------------------
	public MenuDTO getMenuDTO_upDel(int menu_no) {
		
		//-------------------------------------------
		// [BoardDAO 인터페이스]를 구현한 객체의 getBoardDTO 메소드를 호출하여
		// 조회수 증가 없이 [1개 게시판 글]을 얻는다.
		//-------------------------------------------
		MenuDTO menuDTO = this.menuDAO.getMenuDTO(menu_no);
		//-------------------------------------------
		// [1개 게시판 글] 이 저장된 BoardDTO 객체 리턴하기
		//-------------------------------------------
		return menuDTO;
	}
	
	//-------------------------------------------
	// [1개 게시판] 수정 후 수정 적용행의 개수를 리턴하는 메소드 선언 
	//-------------------------------------------
	public int updateMenu(MenuDTO menuDTO) {
		
		// [MenuDAOImpl]객체의 getMenuCnt 메소드를 호출하여
		// 메뉴 존재 개수를 얻는다.
		System.out.println("updateMenu");
		int menuCnt = this.menuDAO.getMenuCnt(menuDTO);
		if(menuCnt==0) {return -1;}
		

		// [MenuDAOImpl]객체의 getMenuCnt 메소드를 호출하여
		// 메뉴 수정 존재 개수를 얻는다.
		System.out.println("updateCnt");
		int updateCnt = this.menuDAO.updateMenu(menuDTO);
		
		// 메뉴 수정 명령 후 수정 적용행의 개수를 얻는다.
		return updateCnt;
	}
	
	
	// [1개 게시판] 삭제 후 삭제 적용행의 개수를 리턴하는 메소드 선언 

	public int deleteMenu(MenuDTO menuDTO) {

		// [BoardDAOImpl]객체의 getMenuCnt 메소드를 호출하여
		// 수령할 게시판의 존재 개수를 얻는다.

		int menuCnt = this.menuDAO.getMenuCnt(menuDTO);
		if(menuCnt==0) {return -1;}


		int deleteCnt = this.menuDAO.deleteMenu(menuDTO);
		return deleteCnt;
		
	}

	
   // user_id 를 가지고 u_no 얻기
   @Override
   public int getUserNo(String user_id) {
      System.out.println("service : "+user_id);
      int user_no = this.menuDAO.getUserNo(user_id);
      
      return user_no;
   }
   
   // u_no을 가지고 business_no 과 business_name 얻기   
   @Override
   public List<Map<String, String>> getBusinessNoList(int u_no) {
      System.out.println("service : businessNoList 시작");
      List<Map<String,String>> businessNoList = this.menuDAO.getBusinessNoList(u_no);
      System.out.println("service : businessNoList 끝"); 
      return businessNoList;
      
   }
   
   //대분류 데이터 가져오기
   
   public List<Map<String,String>> getMenuCategory1(){
      List<Map<String,String>> menuCategory1 = this.menuDAO.getMenuCategory1();
         return menuCategory1;
   };
   
   //중분류 데이터 가져오기
   public List<String> getMenuCategory2(String main_category_name){
      List<String> menuCategory2 = this.menuDAO.getMenuCategory2(main_category_name);
         return menuCategory2;
   };
   
   // 소분류 데이터 가져오기
   public List<String> getMenuCategory3(String mid_category_name){
      List<String> menuCategory3 = this.menuDAO.getMenuCategory3(mid_category_name);
         return menuCategory3;
   }

}
	
