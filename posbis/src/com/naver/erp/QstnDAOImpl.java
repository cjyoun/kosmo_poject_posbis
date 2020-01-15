package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



// @Repository 를 붙임으로써 DAO 클래스 임을 지정하게되고 bean 태그로 자동 등록된다.
//==================================================================================================================
@Repository
public class QstnDAOImpl implements QstnDAO{
   
   // 속변 sqlSession 선언하고 , SqlSessionTemplate 객체를 생성해 저장.
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   
   // 검색한 게시판 목록 리턴하는 메소드 선언
   public List<Map<String,String>> getQstn(QstnSearchDTO qstnSearchDTO){
      
       List<Map<String,String>> qstn = this.sqlSession.selectList(
             "com.naver.erp.QstnDAO.getQstn"      // 실행할 SQL 구문의 위치 지정 
            , qstnSearchDTO                      // 실행할 SQL 구문에서 사용할 데이터 지정
      );
       
      return qstn;      
   }
   
   
//--------------------------------------------------------------------------------------------------   

   //---------------------------------------------------------
   // 검색한 게시판 목록 개수 리턴하는 메소드 선언
   //---------------------------------------------------------
   @Override
   public int getQstnAllCnt(QstnSearchDTO qstnSearchDTO) {

      
      // QstnDAO 인터페이스를 구현한 객체의  getQstnAllCnt 메소드를 호출하여 검색한 게시판 목록 총 개수를 얻는다.
      int qstnAllCnt = this.sqlSession.selectOne(
             "com.naver.erp.QstnDAO.getQstnAllCnt"      // 실행할 SQL 구문의 위치 지정
            , qstnSearchDTO                            // SQL 구문의 parameterType 지정.
         );
      

      return qstnAllCnt;
   }

   
   

   
//--------------------------------------------------------------------------------------------------   
   
   
   // 대댓글
   // [1개 게시판 글 출력번호 수정하고 수정 행의 개수]를 리턴하는 메소드 선언.
   public int updatePrintNo(QstnDTO qstnDTO) {
      int updatePrint_noCnt = this.sqlSession.update(
             "com.naver.erp.QstnDAO.updatePrintNo"      // 실행할 SQL 구문의 위치 지정
            , qstnDTO    
         );
            
      return updatePrint_noCnt;
   }



//--------------------------------------------------------------------------------------------------   
   
   // [1개 게시판 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언
   public int insertQstn(QstnDTO qstnDTO) {
      System.out.println("DAO insertQstn 시작");
      // [SqlSessionTemplate 객체]의 insert(~,~) 를 호출하여 [게시판 글 입력 후 입력 적용 행의 개수] 얻기
      //--------------------------------------------------------------------------------------------------
      // int insert (
      //      "쿼리문 설정 XML 파일 안에 mapper 태그의 namespace 속성값. insert 태그 id 속성값"
      //      , insert 쿼리에 삽입되는 외부 데이터 자료형
      //   )
      //--------------------------------------------------------------------------------------------------
      int qstnRegCnt = this.sqlSession.insert(
             "com.naver.erp.QstnDAO.insertQstn"      // 실행할 SQL 구문의 위치 지정
            , qstnDTO    
      );
      
      System.out.println("DAO qstnRegCnt : " + qstnRegCnt);
      
      return qstnRegCnt;

      
   }
   



//--------------------------------------------------------------------------------------------------   


   // [게시판 글 조회수 증가하고 수정행의 개수] 리턴하는 메소드 선언.
   public int updateReadcount(int qna_no) {
      // [SqlSessionTemplate 객체]의 update(~,~) 를 호출하여 [조회수 증가] 하기
      int readcount = this.sqlSession.update(
             "com.naver.erp.QstnDAO.updateReadcount"      // 실행할 SQL 구문의 위치 지정
            , qna_no    
      );
      
      return readcount;
      
   }
   
   
//--------------------------------------------------------------------------------------------------   
 
   
   // [1개 게시판 글 정보] 리턴하는 메소드 선언
   public QstnDTO getQstnDTO(int qna_no) {
      // [SqlSessionTemplate 객체]의 selectOne(~,~) 를 호출하여 [1개 게시판 글 정보] 얻기
      QstnDTO qstnDTO = this.sqlSession.selectOne(
             "com.naver.erp.QstnDAO.getQstnDTO"      // 실행할 SQL 구문의 위치 지정
            , qna_no    
      );
      
      return qstnDTO;
   }


   
   
//--------------------------------------------------------------------------------------------------    
   
   // 게시판 수정 후 수정행의 적용 개수를 리턴하는 메소드 선언.
   public int updateQstn(QstnDTO qstnDTO) {
      
      int updateCnt = this.sqlSession.update(
          "com.naver.erp.QstnDAO.updateQstn"      // 실행할 SQL 구문의 위치 지정
         , qstnDTO    
      );
      
      return updateCnt;
   }
   
   
   

//--------------------------------------------------------------------------------------------------    

   // 삭제/수정할 게시판의 존재 개수를 리턴하는 메소드 선언.
   public int getQstnCnt(QstnDTO qstnDTO) {
     
      int qstnCnt = this.sqlSession.selectOne(      // 1행 1열이니까 selectOne
          "com.naver.erp.QstnDAO.getQstnCnt"      // 실행할 SQL 구문의 위치 지정
         , qstnDTO    
      );
      
      return qstnCnt;
   }

   

//--------------------------------------------------------------------------------------------------    

   // 삭제할 게시판의 비밀번호 존재 개수를 리턴하는 메소드 선언.
   public int getPwdCnt(QstnDTO qstnDTO) {
      
      int pwdCnt = this.sqlSession.selectOne(
          "com.naver.erp.QstnDAO.getPwdCnt"      // 실행할 SQL 구문의 위치 지정
         , qstnDTO    
      );
      
      return pwdCnt;
   }

   
//--------------------------------------------------------------------------------------------------    
   
   // 삭제할 게시판의 아들글 존재 개수를 리턴하는 메소드 선언
   public int getSonCnt(QstnDTO qstnDTO) {
     
      int sonCnt = this.sqlSession.selectOne(
          "com.naver.erp.QstnDAO.getSonCnt"      // 실행할 SQL 구문의 위치 지정
         , qstnDTO    
      );
      
      return sonCnt;
   }

   
//--------------------------------------------------------------------------------------------------    

   // 삭제될 게시판 이후 글의 출력 순서번호를 1씩 감소 시킨 후 수정 적용행의 개수를 리턴하는 메소드 선언
   public int downPrintNo(QstnDTO qstnDTO) {
      
      int upPrintNoCnt = this.sqlSession.update(
          "com.naver.erp.QstnDAO.downPrintNo"      // 실행할 SQL 구문의 위치 지정
         , qstnDTO    
      );
      
      return upPrintNoCnt;
   }
      

   
//--------------------------------------------------------------------------------------------------    

   // 게시판 삭제 명령한 후 삭제 적용행의 개수를 리턴하는 메소드 선언
   public int deleteQstn(QstnDTO qstnDTO) {
      int deleteQstnCnt = sqlSession.delete(
             "com.naver.erp.QstnDAO.deleteQstn"      // 실행할 SQL 구문의 위치 지정
            , qstnDTO    
      );
      
      return deleteQstnCnt;
   }

//--------------------------------------------------------------------------------------------------
   // 관리자 계정 개수를 리턴하는 메소드 선언
   public int masterQstn(QstnDTO qstnDTO) {
         // [SqlSessionTemplate 객체]의 update(~,~) 를 호출하여 [조회수 증가] 하기
          System.out.println("DAO/DTO.user_id==========>"+qstnDTO.getUser_id());
         int masterCnt = this.sqlSession.selectOne(
                "com.naver.erp.QstnDAO.masterQstn"      // 실행할 SQL 구문의 위치 지정
              , qstnDTO    
         );
         System.out.println("DAO/masterCnt====>"+masterCnt);
         return masterCnt;
         
      }
   
   public String writer(QstnDTO qstnDTO) {
         // [SqlSessionTemplate 객체]의 update(~,~) 를 호출하여 [조회수 증가] 하기
          
         String writer = this.sqlSession.selectOne(
                "com.naver.erp.QstnDAO.writer"      // 실행할 SQL 구문의 위치 지정
              , qstnDTO    
         );
         System.out.println("DAO/masterCnt====>"+writer);
         return writer;
         
      }

 //-------------------------------성유진-------------------------------------------------------------------   
   // 검색한 게시판 목록 리턴하는 메소드 선언
   public List<Map<String,String>> getMyQstnList(MyQstnSearchDTO myQstnSearchDTO){
      
       List<Map<String,String>> myQstnList = this.sqlSession.selectList(
             "com.naver.erp.QstnDAO.getMyQstnList"      // 실행할 SQL 구문의 위치 지정 
            , myQstnSearchDTO                      // 실행할 SQL 구문에서 사용할 데이터 지정
      );
       
      return myQstnList;      
   }
   
   
   //---------------------------------------------------------
   // 검색한 게시판 목록 개수 리턴하는 메소드 선언
   //---------------------------------------------------------
   @Override
   public int getMyQstnAllCnt(MyQstnSearchDTO myQstnSearchDTO) {

      //System.out.println(qstnSearchDTO.getU_no());
      // QstnDAO 인터페이스를 구현한 객체의  getQstnAllCnt 메소드를 호출하여 검색한 게시판 목록 총 개수를 얻는다.
     // System.out.println("qstnSearchDTO-==>"+ qstnSearchDTO);
      int myQstnAllCnt = this.sqlSession.selectOne(
             "com.naver.erp.QstnDAO.getMyQstnAllCnt"      // 실행할 SQL 구문의 위치 지정
            , myQstnSearchDTO                            // SQL 구문의 parameterType 지정.
            
         );
      System.out.println("myQstnAllCnt"+myQstnAllCnt);

      return myQstnAllCnt;
   }
   
   
   
   
   //-----------성유진----------------
   
   // 내가쓴글 목록 및 댓글 리턴하는 메소드 선언
   public List<Map<String,String>> getMyQstnList2(MyQstnSearchDTO myQstnSearchDTO){
      
       List<Map<String,String>> myQstnList2 = this.sqlSession.selectList(
             "com.naver.erp.QstnDAO.getMyQstnList2"      // 실행할 SQL 구문의 위치 지정 
            , myQstnSearchDTO                      // 실행할 SQL 구문에서 사용할 데이터 지정
      );
       
      return myQstnList2;      
   }
   
   
   //---------------------------------------------------------
   // 검색한 게시판 목록 개수 리턴하는 메소드 선언
   //---------------------------------------------------------
   @Override
   public int getMyQstnAllCnt2(MyQstnSearchDTO myQstnSearchDTO) {

      //System.out.println(qstnSearchDTO.getU_no());
      // QstnDAO 인터페이스를 구현한 객체의  getQstnAllCnt 메소드를 호출하여 검색한 게시판 목록 총 개수를 얻는다.
     // System.out.println("qstnSearchDTO-==>"+ qstnSearchDTO);
      int myQstnAllCnt2 = this.sqlSession.selectOne(
             "com.naver.erp.QstnDAO.getMyQstnAllCnt2"      // 실행할 SQL 구문의 위치 지정
            , myQstnSearchDTO                            // SQL 구문의 parameterType 지정.
            
         );
      System.out.println("myQstnAllCnt2"+myQstnAllCnt2);

      return myQstnAllCnt2;
   }
   
    //-----------성유진끝----------------
   
   
   
   ///-----------------------------------------------최수현/////////////////////////////////
   // 내가 로그인한 정보의 group_no 가져오기
   //-----------------------------------------
   public List<Map<String,String>> getQstnGroupNo(String user_id) {
      List<Map<String,String>> group_no =this.sqlSession.selectList("com.naver.erp.QstnDAO.getQstnGroupNo",user_id);
   return group_no;
   }
   
   
   
   

   // 로그인한 자가 관리자인지///이정숙
   //***************************************************************
   public String getUserMaster(String user_id) {
      String userMaster = this.sqlSession.selectOne("com.naver.erp.QstnDAO.getUserMaster",user_id);
      return userMaster;
   }
   //***************************************************************

   
  
   

}