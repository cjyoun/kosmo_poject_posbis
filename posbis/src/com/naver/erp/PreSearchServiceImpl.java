package com.naver.erp;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Service
@Transactional
public class PreSearchServiceImpl implements PreSearchService{

	
	//속성변수 boardDAO 선언하고, [BoardDAO 인터페이스]를 구현한 클래스를 객체화해서 저장
	@Autowired
	private PreSearchDAO preSearchDAO;


	//--------------------------------------------------------------------------------------------------   
	
	
	//[검색한 게시판 목록 개수] 리턴하는 메소드 선언
	public int getPreResultAllCnt(PreSearchDTO preSearchDTO) {
		//System.out.println("Service/getPreResultAllCnt 시 작");
		//[BoardDAO 인터페이스]를 구현한 객체의 getBoardListAllCnt 메소드 호출
		//[검색한 게시판 목록 개수] 를 얻는다
		//[검색한 게시판 목록 개수] 를 리턴받는다
		int preResultAllCnt = this.preSearchDAO.getPreResultAllCnt(preSearchDTO);
		
		//[검색한 게시판 목록 총 개수]를 리턴한다
		return preResultAllCnt;
	}
	
	

	//--------------------------------------------------------------------------------------------------   
	

	//[검색한 게시판 목록 for MAP] 리턴하는 메소드 선언
	public List<Map<String, String>> getPreResultMAPList(PreSearchDTO preSearchDTO) {
		List<Map<String, String>> preResultMAPList = this.preSearchDAO.getPreResultMAPList(preSearchDTO);
		
		//[검색한 게시판 목록 총 개수]를 리턴한다
		return preResultMAPList;
	}
	
	

	//--------------------------------------------------------------------------------------------------   
	
	
	//[검색한 게시판 목록] 리턴하는 메소드 선언
	public List<Map<String, String>> getPreResultList(PreSearchDTO preSearchDTO){
		List<Map<String, String>> preResultList = this.preSearchDAO.getPreResultList(preSearchDTO);
		//.out.println("Service//"+preResultList);
		return preResultList;
	}
	
	

	//--------------------------------------------------------------------------------------------------   
	
	//[select문 사업자번호, 가게 이름] 얻기
	public List<Map<String,String>> getBusinessInfoList(int u_no){
		List<Map<String, String>> businessInfoList = this.preSearchDAO.getBusinessInfoList(u_no);
		//System.out.println("Service//businessInfoList//==="+businessInfoList);
		return businessInfoList;
	}
	

	//--------------------------------------------------------------------------------------------------   

	//[select / addrGu1]얻기
	public List<Map<String,String>> getAddrGu1List(){
		List<Map<String,String>> addrGu1List = this.preSearchDAO.getAddrGu1List();
		return addrGu1List;
	}
	

	
	//--------------------------------------------------------------------------------------------------   
	
	
	   
   // user_id 를 가지고 u_no 얻기
   @Override
   public int getUserNo(String user_id) {
      //System.out.println("service : "+user_id);
      int user_no = this.preSearchDAO.getUserNo(user_id);
      
      return user_no;
   }
	   
	//--------------------------------------------------------------------------------------------------   
	   
   // u_no을 가지고 business_no 과 business_name 얻기   
   @Override
   public List<Map<String, String>> getBusinessNoList(int user_no) {
      //System.out.println("service : businessNoList 시작");
      List<Map<String,String>> businessNoList = this.preSearchDAO.getBusinessNoList(user_no);
     // System.out.println("service : businessNoList 끝"); 
      return businessNoList;
      
   }
   
   
	//--------------------------------------------------------------------------------------------------     

   
	//[select / getBusinessTypeName1List]얻기
	public List<String> getBusinessTypeName1List(){
	      //System.out.println("service : getBusinessTypeName1List 시작");
	      List<String> businessTypeName1List = this.preSearchDAO.getBusinessTypeName1List();
	      //System.out.println("service : businessNoList 끝"); 
	      return businessTypeName1List;
	}
	

	//--------------------------------------------------------------------------------------------------   
	
	

	// select  / BusinessTypeName2 얻기
	public List<String> getBusinessTypeName2(String business_type_name1) {
		List<String> businessTypeName2List;
		businessTypeName2List = this.preSearchDAO.getBusinessTypeName2(business_type_name1);
		return businessTypeName2List;
	}
	

	//--------------------------------------------------------------------------------------------------   
	
	

	// select / AddrDong1 얻기
	public List<String> getAddrDong1(String addr_gu1) {
		List<String> addrDong1List;
		addrDong1List = this.preSearchDAO.getAddrDong1(addr_gu1);
		return addrDong1List;
	}
	

	//--------------------------------------------------------------------------------------------------   
	
	
	
	//bestMenuList 얻기
	public List<String> getBestMenuList(PreSearchDTO preSearchDTO){
		List<String> bestMenuList;
		bestMenuList = this.preSearchDAO.getBestMenuList(preSearchDTO);
		return bestMenuList;
	}
	

	//--------------------------------------------------------------------------------------------------   
	
	
	 //구 별 점포수
	public List<Map<String,String>> getCntPerGu(PreSearchDTO preSearchDTO){
		
		List<Map<String,String>> cntPerGu = new ArrayList<Map<String,String>>();
		//Map<String,String> addr_gu = new HashMap<String,String>();
		//System.out.println(preSearchDTO.getAddrGuList().size());
		for(int i=0; i<preSearchDTO.getAddrGuList().size(); i++) {
			preSearchDTO.setStrGu(preSearchDTO.getAddrGuList().get(i).get("addr_gu1"));
			
			//addr_gu.put("addr_gu",preSearchDTO.getAddrGuList().get(i).get("addr_gu1") );
			//cntPerGu.add(i, addr_gu);
			
			List<Map<String, String>> input = this.preSearchDAO.getCntPerGu(preSearchDTO);
			cntPerGu.add(i,input.get(0));
		}

		//System.out.println("Service/cntPerGu22222"+cntPerGu);
		//System.out.println(cntPerGu.size());
		return cntPerGu;	 
	 }
	 
	
}