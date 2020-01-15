package com.naver.erp;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class QstnServiceImpl implements QstnService {
   
   //******************************************************************************************
   // 속성변수 qstnDAO 선언하고, [QstnDAO 인터페이스]를 구현한 클래스를 객체화해서 저장한다
   //******************************************************************************************
   @Autowired
   private QstnDAO qstnDAO;
   //*************************************************
   // [검색한 게시판 목록] 리턴하는 메소드 선언
   //*************************************************
   @Override
   public List<Map<String,String>> getQstn(QstnSearchDTO qstnSearchDTO){
      //------------------------------------------------------------------------------
      // [QstnDAO 인터페이스]를 구현한 객체의 getQstnAllCnt 메소드를 호출하여
      // [검색한 게시판 목록 개수]를 얻는다
      // [검색한 게시판 목록 개수]를 리턴 받는다
      //------------------------------------------------------------------------------
      List<Map<String,String>> qstn = this.qstnDAO.getQstn(qstnSearchDTO);
      //-----------------------------------------
      // [검색한 게시판 목록 총 개수]를 리턴한다
      //-----------------------------------------
      return qstn;
   }
   
   
   
   //*************************************************
   // [검색한 게시판 목록 개수] 리턴하는 메소드 선언
   //*************************************************
   @Override
   public int getQstnAllCnt (QstnSearchDTO qstnSearchDTO){
      int qstnAllCnt = this.qstnDAO.getQstnAllCnt(qstnSearchDTO);
      
      return qstnAllCnt;
   }
   
   
   
   // 성유진   
   //*************************************************
   // 내가쓴글 및 내글에 달린 목록 불러오기 
   //*************************************************
   @Override
   public List<Map<String,String>> getMyQstnList2(MyQstnSearchDTO myQstnSearchDTO){
      
      List<Map<String,String>> myQstnList2 = this.qstnDAO.getMyQstnList2(myQstnSearchDTO);

      return myQstnList2;
   }
   
   //*************************************************
   // 내가쓴글 및 내글에 달린 목록 개수 불러오기
   //*************************************************
   @Override
   public int getMyQstnAllCnt2 (MyQstnSearchDTO myQstnSearchDTO){
      int myQstnAllCnt2 = this.qstnDAO.getMyQstnAllCnt2(myQstnSearchDTO);
      
      return myQstnAllCnt2;
      }
   // 성유진 끝
   
   
   
   //***************************************************************
   // [게시판 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언 
   //***************************************************************
   public int insertQstn (QstnDTO qstnDTO) {
      
      int qna_no = qstnDTO.getQna_no();
      //------------------------------------------------------------------------------------
      // 댓글일 경우 기존 게시판의 출력순서 번호를 1씩 증가 수정하고 수정 적용행의 개수 리턴하기
      //------------------------------------------------------------------------------------
      if(qna_no>0) {
         //
         // [QstnDAOImpl] 객체의 updatePrintNo 메소드를 호출하여
         // 출력 순서 번호를 1 증가시키고 수정행에 적용 개수를 리턴 받는다
         // 게시판 글이 입력되는 부분 이후 글들은 출력 순서번호를 1씩 증가하여야 한다
         //
         int updatePrintNo = this.qstnDAO.updatePrintNo(qstnDTO);
      }
      System.out.println("Service insertQstn 시작");
      //----------------------------------------------------
      // 1개 게시판 글 입력 후 입력 적용 행의 개수 리턴하기
      //----------------------------------------------------
         // [QstnDTO 인터페이스]를 구현한 객체의 insertQstn 메소드를 호출하여
         // 1개 게시판 글 입력 후 입력 적용 행의 개수를 리턴 받는다.
      int qstnRegCnt = this.qstnDAO.insertQstn(qstnDTO);
      return qstnRegCnt;
   }
   //***************************************************************
   // [1개 게시판 글] 리턴하는 메소드 선언 
   //***************************************************************
   public QstnDTO getQstnDTO(int qna_no) {
      // [QstnDTOImpl 객체]의 updateReadcount 메소드를 호출하여
      // [조회수 증가]하고 수정한 행의 개수를 얻는다
      int readcount = this.qstnDAO.updateReadcount(qna_no);
      //----------------------------------------------------
      // [QstnDTOImpl 객체]의 getQstnDTO 메소드를 호출하여
      // [1개 게시판 글]을 얻는다
      //----------------------------------------------------
      QstnDTO qstnDTO = this.qstnDAO.getQstnDTO(qna_no);
      //----------------------------------------------------
      // [1개 게시판 글]이 저장된  QstnDTO 객체 리턴하기
      //----------------------------------------------------
      return qstnDTO;
   }
   
   //-------------------------------------------------------
   // 조회수 증가 없이 [1개 게시판 글] 리턴하는 메소드 선언
   //-------------------------------------------------------
   public QstnDTO getQstnDTO_without_upReadcount(int qna_no) {
      //---------------------------------------------------------------------
      // [QstnDAO 인터페이스]를 구현한 객체의 getQstnDTO 메소드를 호출하여
      // 조회수 증거 없이 [1개 게시판 글]을 얻는다
      //---------------------------------------------------------------------
      QstnDTO qstnDTO = this.qstnDAO.getQstnDTO(qna_no);
      //----------------------------------------------------
      // [1개 게시판 글]이 저장된 QstnDTO 객체 리턴하기
      //----------------------------------------------------
      return qstnDTO;
   }
   //*******************************************************************
   // [1개 게시판 글] 수정 후 수정 적용행의 개수를 리턴하는 메소드 선언
   //*******************************************************************
   public int updateQstn(QstnDTO qstnDTO) {
      //------------------------------------------------------
      // [QstnDAOImpl] 객체의 getQstnCnt 메소드를 호출하여
      // 수정할 게시판의 존재 개수를 얻는다
      //------------------------------------------------------
      int qstnCnt = this.qstnDAO.getQstnCnt(qstnDTO);
      System.out.println("qstnCnt : " + qstnCnt);
      if(qstnCnt==0) {return -1;}
      //------------------------------------------------------
      // [QstnDAOImpl] 객체의 getPwdCnt 메소드를 호출하여
      // 수정할 게시판의 비밀번호 존재 개수를 얻는다
      //------------------------------------------------------
      int pwdCnt = this.qstnDAO.getPwdCnt(qstnDTO);
      if(pwdCnt==0) {return -2;}
      //------------------------------------------------------
      // [QstnDAOImpl] 객체의 updateQstn 메소드를 호출하여
      // 게시판 수정 명령한 후 수정 적용행의 개수를 얻는다
      //------------------------------------------------------
      int updateCnt = this.qstnDAO.updateQstn(qstnDTO);
      //------------------------------------------------------
      // 게시판 수정 명령한 후 수정 적용행의 개수를 리턴하기
      //------------------------------------------------------
      return updateCnt;
   }
   //***************************************************************
   // [1개 게시판 글] 삭제 후 삭제 적용행의 개수를 리턴하는 메소드 선언
   //***************************************************************
   public int deleteQstn(QstnDTO qstnDTO) {
      //------------------------------------------------------
      // [QstnDAOImpl] 객체의 getQstnCnt 메소드를 호출하여
      // [삭제할 게시판의 존재 개수]를 얻는다
      //------------------------------------------------------
      int qstnCnt = this.qstnDAO.getQstnCnt(qstnDTO);
      if(qstnCnt==0) {return -1;}
      //------------------------------------------------------
      // [QstnDAOImpl] 객체의 getPwdCnt 메소드를 호출하여
      // [삭제할 게시판의 비밀번호 존재 개수]를 얻는다
      //------------------------------------------------------
      int pwdCnt = this.qstnDAO.getPwdCnt(qstnDTO);
      if(pwdCnt==0) {return -2;}
      //------------------------------------------------------
      // [QstnDAOImpl] 객체의 getSonCnt 메소드를 호출하여
      // [삭제할 게시판의 아들 글 존재 개수]를 얻는다
      //------------------------------------------------------
      int sonCnt = this.qstnDAO.getSonCnt(qstnDTO);
      if(pwdCnt==0) {return -3;}
      //------------------------------------------------------
      // [QstnDAOImpl] 객체의 downPrintNo2 메소드를 호출하여
      // [삭제할 게시판 이후 글의 출력 순서번호를 1씩 감소 시킨 후 수정 적용행의 개수]를 얻는다
      //------------------------------------------------------
      int downPrintNoCnt = this.qstnDAO.downPrintNo(qstnDTO);
      //------------------------------------------------------
      // [QstnDAOImpl] 객체의 deleteQstn 메소드를 호출하여
      // [삭제할 삭제 명령한 후 삭제 적용행의 개수]를 얻는다
      //------------------------------------------------------
      int deleteCnt = this.qstnDAO.deleteQstn(qstnDTO);
      return deleteCnt;
   }
   
   
   //***************************************************************
   // [관리자 계정 개수] 리턴하는 메소드 선언 
   //***************************************************************
   public int masterQstn (QstnDTO qstnDTO) {
      //----------------------------------------------------
      // 관리자 계정 개수 리턴하기
      //----------------------------------------------------
         // [QstnDTO 인터페이스]를 구현한 객체의 masterQstn 메소드를 호출하여
         // 관리자 계정 개수를 리턴 받는다.
      int masterCnt = this.qstnDAO.masterQstn(qstnDTO);
      //System.out.println(masterCnt);
      return masterCnt;
   }
   
   public String writer (QstnDTO qstnDTO) {
      //----------------------------------------------------
      // 관리자 계정 개수 리턴하기
      //----------------------------------------------------
         // [QstnDTO 인터페이스]를 구현한 객체의 masterQstn 메소드를 호출하여
         // 관리자 계정 개수를 리턴 받는다.
      String writer = this.qstnDAO.writer(qstnDTO);
      //System.out.println(masterCnt);
      return writer;
   }
   
////////////////////////////////////성유진//////////////////////////////////////////////////
   
   //*************************************************
   // 내가쓴글 목록 불러오기 
   //*************************************************
   @Override
   public List<Map<String,String>> getMyQstnList(MyQstnSearchDTO myQstnSearchDTO){
      
      List<Map<String,String>> myQstnList = this.qstnDAO.getMyQstnList(myQstnSearchDTO);

      return myQstnList;
   }
   
   //*************************************************
   // 내가쓴글 목록 개수 불러오기
   //*************************************************
   @Override
   public int getMyQstnAllCnt (MyQstnSearchDTO myQstnSearchDTO){
      int myQstnAllCnt = this.qstnDAO.getMyQstnAllCnt(myQstnSearchDTO);
      
      return myQstnAllCnt;
   }
   
   
   ///-----------------------------------------------최수현/////////////////////////////////
   // 내가 로그인한 정보의 group_no 가져오기
   //-----------------------------------------
   public List<Map<String,String>> getQstnGroupNo(String user_id) {
      List<Map<String,String>> group_no = this.qstnDAO.getQstnGroupNo(user_id);
      return group_no;
   }
   
   
   
   

   // 로그인한 자가 관리자인지///이정숙
   //***************************************************************
   public String getUserMaster(String user_id) {
      String userMaster = this.qstnDAO.getUserMaster(user_id);
      return userMaster;
   }
   //***************************************************************

   
}





   