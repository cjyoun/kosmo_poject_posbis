package com.naver.erp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QstnController {
    //-- 내가 쓴글 및 내가쓴글에 달린 답글 보기 
      // 성유진 

      @Autowired
      private SalesService salesService;
      
      
      @RequestMapping( value="/myQstn.do" )
      public ModelAndView myQstn(
            //---------------------------------------------------------------------------------------------------
            // 파라미터값이 저장되는 [QstnSearchDTO 객체]를 매개변수로 선언
            //---------------------------------------------------------------------------------------------------
               // [파라미터명]과 [QstnSearchDTO 객체]의 [속성변수명]이 같으면 ,
               // setter 메소드가 작동되어 [파라미터값]이 [속성변수]에 저장된다.
               // [속성변수명]에 대응하는[ 파라미터명]이 없으면 setter 메소드가 작동되지 않는다.
               // [속성변수명]에 대응하는 [파라미터명]이 있는데 [파라미터값]이 없으면,
               // [속성변수]의 자료형에 관계없이 무조건 null 값이 저장된다.
               //      이때 [속성변수]의 자료형이 기본형일 경우 null 값이 저장될 수 없어 에러가 발생한다
               //      이런 에러를 피하려면 파라미터값이 기본형이거나 속성변수의 자료형을 String으로 해야 한다
               //      이런 에러가 발생하면 메소드 안의 실행구문은 하나도 실행되지 않음에 주의한다
            MyQstnSearchDTO myQstnSearchDTO
               //-----------------------------------------------
               // HttpSession 객체가 저장되는 매개변수 선언하기
               //-----------------------------------------------
               ,HttpSession session
         ){
            //------------------------------------------------------
            // [ModelAndView 객체] 생성하기
            // [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
            //------------------------------------------------------
            ModelAndView mav = new ModelAndView();
            mav.setViewName("myQstn.jsp");
            String user_id = (String) session.getAttribute("user_id");


              int u_no = this.salesService.getUserNo(user_id);
              System.out.println("user_no : " + u_no);
            

               String rank_code = (String)session.getAttribute("rank_code");
               mav.addObject("rank_code",rank_code);
            try {
               
               
               //최수현
                 
                myQstnSearchDTO.setU_no(u_no);
                      int myQstnAllCnt = this.qstnService.getMyQstnAllCnt(myQstnSearchDTO);
                      System.out.println("myQstnAllCnt==>"+myQstnAllCnt);
                      if(myQstnAllCnt>0) {
                         // 선택한 페이지 번호 구하기
                         int selectPageNo = myQstnSearchDTO.getSelectPageNo();
                         // 한 화면에 보여지는 행의 개수 구하기
                         int rowCntPerPage = myQstnSearchDTO.getRowCntPerPage();
                         // 검색할 시작행 번호 구하기
                         int beginRowNo = selectPageNo*rowCntPerPage - rowCntPerPage + 1;
                         // 만약 검색한 총 개수가 검색할 시작행 번호 보다 작으면
                         // 선택한 페이지 번호를 1로 세팅하기
                         if(myQstnAllCnt < beginRowNo) {
                            myQstnSearchDTO.setSelectPageNo(1);
                         }
                      }
                      
                      List<Map<String,String>> myQstnList = this.qstnService.getMyQstnList(myQstnSearchDTO);
                      System.out.println("myQstnList.size()=>" +myQstnList.size());
                      
                      
                      System.out.println("getU_no ====> "+ myQstnSearchDTO.getU_no());
                      System.out.println("getSelectPageNo ====> "+ myQstnSearchDTO.getSelectPageNo());

                      
                      mav.addObject("myQstnList", myQstnList);
                      mav.addObject("myQstnAllCnt", myQstnAllCnt);
                      mav.addObject("myQstnSearchDTO", myQstnSearchDTO);
                      
                      
                      // 최수현 끝
                    
                      myQstnSearchDTO.setU_no(u_no);
                      int myQstnAllCnt2 = this.qstnService.getMyQstnAllCnt2(myQstnSearchDTO);
                      System.out.println("myQstnAllCnt2==>"+myQstnAllCnt2);
                      if(myQstnAllCnt2>0) {
                        // 선택한 페이지 번호 구하기
                        int selectPageNo = myQstnSearchDTO.getSelectPageNo();
                        // 한 화면에 보여지는 행의 개수 구하기
                        int rowCntPerPage = myQstnSearchDTO.getRowCntPerPage();
                        // 검색할 시작행 번호 구하기
                        int beginRowNo = selectPageNo*rowCntPerPage - rowCntPerPage + 1;
                        // 만약 검색한 총 개수가 검색할 시작행 번호 보다 작으면
                        // 선택한 페이지 번호를 1로 세팅하기
                        if(myQstnAllCnt2 < beginRowNo) {
                           myQstnSearchDTO.setSelectPageNo(1);
                        }
                     }
                     
                     List<Map<String,String>> myQstnList2 = this.qstnService.getMyQstnList2(myQstnSearchDTO);
                     System.out.println("myQstnList2.size()=>" +myQstnList2.size());
                     
                     
                     System.out.println("getU_no ====> "+ myQstnSearchDTO.getU_no());
                     System.out.println("getSelectPageNo ====> "+ myQstnSearchDTO.getSelectPageNo());

                     
                     mav.addObject("myQstnList2", myQstnList2);
                     mav.addObject("myQstnAllCnt2", myQstnAllCnt2);
                     mav.addObject("myQstnSearchDTO", myQstnSearchDTO);

            }catch(Exception e) {
               //-------------------------------------------------
               // try 구문에서 예외가 발생하면 실행할 구문 설정
               //-------------------------------------------------
               System.out.println("11111<에러발생>");
               System.out.println("!!! : " + e.getMessage());
            }
            //--------------------------------
            // [ModelAndView 객체] 리턴하기
            //--------------------------------
            
            return mav;
         }
      
      
      
      
         //-- 성유진 끝
   
   
   //NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
   // 속성변수 qstnService 선언하고 [QstnService 인터페이스]를 구현받은 객체를 생성해 저장
   // 관용적으로 [qstnService 인터페이스]를 구현받은 객체명은 qstnServiceImpl이다
   //NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
   @Autowired
   private QstnService qstnService;
   
   @RequestMapping( value="/qstnForm.do" )
   public ModelAndView getQstn(
         //---------------------------------------------------------------------------------------------------
         // 파라미터값이 저장되는 [QstnSearchDTO 객체]를 매개변수로 선언
         //---------------------------------------------------------------------------------------------------
            // [파라미터명]과 [QstnSearchDTO 객체]의 [속성변수명]이 같으면 ,
            // setter 메소드가 작동되어 [파라미터값]이 [속성변수]에 저장된다.
            // [속성변수명]에 대응하는[ 파라미터명]이 없으면 setter 메소드가 작동되지 않는다.
            // [속성변수명]에 대응하는 [파라미터명]이 있는데 [파라미터값]이 없으면,
            // [속성변수]의 자료형에 관계없이 무조건 null 값이 저장된다.
            //      이때 [속성변수]의 자료형이 기본형일 경우 null 값이 저장될 수 없어 에러가 발생한다
            //      이런 에러를 피하려면 파라미터값이 기본형이거나 속성변수의 자료형을 String으로 해야 한다
            //      이런 에러가 발생하면 메소드 안의 실행구문은 하나도 실행되지 않음에 주의한다
            QstnSearchDTO qstnSearchDTO
            //-----------------------------------------------
            // HttpSession 객체가 저장되는 매개변수 선언하기
            //-----------------------------------------------
            ,HttpSession session
      ){
         //------------------------------------------------------
         // [ModelAndView 객체] 생성하기
         // [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
         //------------------------------------------------------
         ModelAndView mav = new ModelAndView();
         mav.setViewName("qstnForm.jsp");
         
         String user_id = (String) session.getAttribute("user_id");
         

            String rank_code = (String)session.getAttribute("rank_code");
            mav.addObject("rank_code",rank_code);
         try {
            // HttpSession 객체에 uri라는 키값으로 저장된 문자열 꺼내기
            String uri=(String)session.getAttribute("uri");
            // 만약 꺼낸 문자열이 null이거나 "qstnForm"이라면
            // 매개변수로 받은 qstnSearchDTO를 HttpSession 객체에
            // qstnSearchDTO라는 키값으로 저장하기
            if(uri==null || uri.equals("qstnForm.do") ){
               session.setAttribute("qstnSearchDTO",qstnSearchDTO);
            }
            // 만약 꺼낸 문자열이 null도 아니고 "qstnForm.do"도 아니라면
            // HttpSession 객체에 QstnSearchDTO라는 키값으로 저장된 놈 꺼내서
            // 매개변수 qstnSearchDTO에 저장하기
            else {
               qstnSearchDTO = (QstnSearchDTO)session.getAttribute("qstnSearchDTO");
            }
            // HttpSession 객체에 uri라는 키값으로 "qstnForm.do" 문자열 저장하기
            session.setAttribute("uri","qstnForm.do");
            
            
            //-------------------------------------
            // [검색된 게시판의 검색 총 개수] 얻기
            //-------------------------------------
            // QstnServiceImpl 객체 소유의 getQstnAllCnt 메소드 호출로
            // 게시판 검색 개수를 얻기
            int qstnAllCnt = this.qstnService.getQstnAllCnt(qstnSearchDTO);
            
            
            
            ///-----------------------------------------------최수현/////////////////////////////////
            // 내가 로그인한 정보의 group_no 가져오기
            //-----------------------------------------
            System.out.println("user_id==>"+user_id);
            List<Map<String,String>> group_no = this.qstnService.getQstnGroupNo(user_id);
            mav.addObject("group_no", group_no);
            System.out.println("group_no===>"+group_no);
           ///-----------------------------------------------최수현/////////////////////////////////
            

            //-------------------------------------------------------------------------------------------
            // [선택된 페이지 번호] 보정하기
            // [선택된 페이지 번호]와 총 개수 간의 관계가 이상할 경우 있다
            // 예> 검색 총 개수 3개인데 선택페이지번호가 2페이지일 경우 (단, 보여질 행의 개수 10개일 떄)
            // 모순이다. 2페이지라면 11행부터 20행까지 잘라서 가져오란 얘기인데
            // 현재 3행밖에 없는데 어떻게 가져올 수 있냐 이 얘기이다
            //-------------------------------------------------------------------------------------------
            if( qstnAllCnt>0) {
            // 선택한 페이지 번호 구하기
            int selectPageNo = qstnSearchDTO.getSelectPageNo();
            // 한 화면에 보여지느 행의 개수 구하기
            int rowCntPerPage = qstnSearchDTO.getRowCntPerPage();
            // 검색할 시작행 번호 구하기
            int beginRowNo = selectPageNo * rowCntPerPage - rowCntPerPage + 1 ;
            // 만약 검색한 총 개수가 검색할 시작 행 번호보다 작으면
            // 선택한 페이지 번호를 1로 세팅하기
            if( qstnAllCnt < beginRowNo ) {
                qstnSearchDTO.setSelectPageNo(1);
            }
         }
            
            // System.out.println( "qstnAllCnt => " + qstnAllCnt);
            
            //---------------------------
            // [검색된 게시판 목록] 얻기
            //---------------------------
            List<Map<String,String>> qstn = this.qstnService.getQstn(qstnSearchDTO);
            // System.out.println( "qstn.size() => " + qstn.size() );
            
//            if(qstnSearchDTO.getDate()==null) {
//               System.out.println("null");
//            } else {
//               for(String tmp : qstnSearchDTO.getDate()) {
//                  System.out.println(tmp);
//               }
//            }
            
            //----------------------------------------------------------
            // ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
            // ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 
            // EL 문법으로 아래처럼 꺼낼 수 있다.
            // ${저장키값명}
            //----------------------------------------------------------
            mav.addObject("qstn", qstn);
            mav.addObject("qstnAllCnt", qstnAllCnt);
            mav.addObject("qstnSearchDTO", qstnSearchDTO);
            
         }catch(Exception e) {
            //-------------------------------------------------
            // try 구문에서 예외가 발생하면 실행할 구문 설정
            //-------------------------------------------------
            System.out.println("11111<에러발생>");
            System.out.println("!!! : " + e.getMessage());
         }
         //--------------------------------
         // [ModelAndView 객체] 리턴하기
         //--------------------------------
         
         return mav;
      }
   // --------------------------------------------------------
      // 가상 주소 /qstnRegForm.do 로 접근하면 호출되는 메소드 선언
      // --------------------------------------------------------
      @RequestMapping(value = "/qstnRegForm.do")
      public ModelAndView goQstnRegForm(QstnDTO qstnDTO , HttpSession session) {
         // --------------------------------------------------------
         // [ModelAndView 객체] 생성하기
         // [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
         // --------------------------------------------------------
         ModelAndView mav = new ModelAndView();
         mav.setViewName("qstnRegForm.jsp");

         String rank_code = (String)session.getAttribute("rank_code");
       String user_id = (String)session.getAttribute("user_id");
       mav.addObject("rank_code",rank_code);
       mav.addObject("user_id",user_id);
         String writer = null;
         try {
            System.out.println("writer 시작");
            // [QstnServiceImpl 객체]의 masterQstn 메소드 호출로 게시판 입력하고 [관리자 계정의 개수] 얻기
            writer = this.qstnService.writer(qstnDTO);
         } catch (Exception e) {
            System.out.println("<에러발생>");
            System.out.println("writer에서 에러 발생: " + e.getMessage());
            System.out.println(writer);

         }
         mav.addObject("writer", writer);
         // --------------------------------------------------------
         // [ModelAndView 객체] 리턴하기
         // --------------------------------------------------------
         return mav;
      }
         
      //*****************************************************
      // /qstnRegProc.do 로 접근하면 호출되는 메소드 선언
      //*****************************************************
      @RequestMapping(
            value = "/qstnRegProc.do"   
            ,method = RequestMethod.POST
            ,produces = "application/json; charset=UTF-8"
      )
      @ResponseBody
      public int insertQstn(
            //-------------------------------------------------------
            // 파라미터값을 저장할 [QstnDTO 객체]를 매개변수로 선언
            //-------------------------------------------------------
            QstnDTO qstnDTO
            
      ){
         System.out.println("Controller시작/DTO.user_id====>"+qstnDTO.getUser_id());
         // [게시판 입력 적용행의 개수] 저장할 변수 선언
         int qstnRegCnt = 0;
         try {
            System.out.println("insertQstn 시작");
            // [QstnServiceImpl 객체]의 insertQstn 메소드 호출로 게시판 입력하고 [게시판 입력 적용 행의 개수] 얻기
            qstnRegCnt = this.qstnService.insertQstn(qstnDTO);
          //System.out.println(qstnDTO.getQna_no()+"--------------------------"); 
         }catch(Exception e) {
            System.out.println("insertQstn에서 <에러발생>");
            System.out.println( e.getMessage() );
            qstnRegCnt = -1;
         }
         return qstnRegCnt;
         
      }
      
      
      
      
      @RequestMapping(
              value = "/qstnMasterRegProc.do"   
              ,method = RequestMethod.POST
              ,produces = "application/json; charset=UTF-8"
        )
        @ResponseBody
        public int masterQstn(
              //-------------------------------------------------------
              // 파라미터값을 저장할 [masterQstn 객체]를 매개변수로 선언
              //-------------------------------------------------------
              QstnDTO qstnDTO
              ,HttpSession session
        ){
           String user_id = (String) session.getAttribute("user_id");
           qstnDTO.setUser_id(user_id);
           int masterCnt = 0;
           try {
              System.out.println("masterQstn 시작");
              // [QstnServiceImpl 객체]의 masterQstn 메소드 호출로 게시판 입력하고 [관리자 계정의 개수] 얻기
              masterCnt = this.qstnService.masterQstn(qstnDTO);
           }catch(Exception e) {
              System.out.println("<에러발생>");
              System.out.println( "masterQstn에서 에러 발생: "+e.getMessage() );
              System.out.println(masterCnt);
              masterCnt = -1;
           }
           return masterCnt;
        }

      //*****************************************************
      // /qstnContentForm.do 로 접속 시 호출되는 메소드 선언
      //*****************************************************
      @RequestMapping(value="/qstnContentForm.do") // method = ? 를 입력하지 않으면 하나만 하지 않고 get 또는 post 둘 다 허용한다는 의미
      public ModelAndView goQstnContentForm(
         // qna_no 라는 파라미터명에 해당하는 파라미터값이 저장되는 매개변수 qna_no 선언
         // 관용적으로 파라미터명과 파라미터값은 스펠링은 동일하게 준다
         // 게시판 PK 번호가 매개변수로 들어오므로 매개변수 자료형은 int로 한다
         // String으로 받아도 문제 없다
         @RequestParam(value="qna_no") int qna_no
         //------------------------------------------------
         // HttpSession 객체가 저장되는 매개변수 선언하기
         //------------------------------------------------
         ,HttpSession session
      ) {
         //-------------------------------------------------------         
         // [ModelAndView 객체] 생성하기
         // [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
         //-------------------------------------------------------      
         ModelAndView mav = new ModelAndView();
         mav.setViewName("qstnContentForm.jsp");

         String rank_code = (String)session.getAttribute("rank_code");
       String user_id = (String)session.getAttribute("user_id");
       mav.addObject("rank_code",rank_code);
       mav.addObject("user_id",user_id);
       
       
       String userMaster = this.qstnService.getUserMaster(user_id);
       mav.addObject("userMaster",userMaster);
       
       
         try {
            session.setAttribute("uri","qstnContentForm.do");
            //----------------------------------------------------------------
            // [QstnServiceImpl 객체]의 getQstnDTO 메소드 호출로 1개의 글을
            // qstnDTO 객체에 담아오기
            //----------------------------------------------------------------
            QstnDTO qstnDTO = this.qstnService.getQstnDTO(qna_no);
            //----------------------------------------------------------------
            // [ModelAndView 객체]에 1개의 게시판 글을 담고 있는 QstnDTO 객체 저장하기
            //----------------------------------------------------------------
            mav.addObject("qstnDTO", qstnDTO);
         }catch(Exception e) {
            System.out.println("<goQstnContentForm 메소드>에 <에러발생>");
         }
         //-------------------------------
         // [ModelAndView 객체] 리턴하기
         //-------------------------------
         return mav;
      }
      
      
      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      // /qstnUpDelForm.do 접속 시 호출되는 메소드 선언
      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
      @RequestMapping(value="/qstnUpDelForm.do",method=RequestMethod.POST)
      public ModelAndView goQstnUpDelForm(
         // "qna_no" 라는 파라미터명의 파라미터값이 저장되는 매개변수 qna_no 선언
         @RequestParam(value="qna_no") int qna_no
         //-----------------------------------------------
         // HttpSession 객체가 저장되는 매개변수 선언하기
         //-----------------------------------------------
         ,HttpSession session
   ) {
      //******************************************************
      // [ModelAndView 객체]에 생성하기
      // [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
      //******************************************************
      ModelAndView mav = new ModelAndView();
      mav.setViewName("qstnUpDelForm.jsp");

      String rank_code = (String)session.getAttribute("rank_code");
      String user_id = (String)session.getAttribute("user_id");
      mav.addObject("rank_code",rank_code);
      mav.addObject("user_id",user_id);
      try {
         session.setAttribute("uri","qstnUpDelForm.do");
         //******************************************
         // [수정/삭제할 1개의 게시판 글 정보] 얻기
         //******************************************
         // [QstnServiceImpl 객체]의 getQstnDTO_without_upReadcount 메소드를 호출하여 얻는다
         QstnDTO qstnDTO = this.qstnService.getQstnDTO_without_upReadcount(qna_no);
         //******************************************************************
         // [ModelAndView 객체]에 JSP 페이에서 꺼내볼 각종 데이터 저장하기
         //******************************************************************
         mav.addObject("qstnDTO",qstnDTO);
         
         System.out.println("<접속성공> [접속 URI]->/qstnUpDelForm.do  [호출메소드]->QstnController.goQstnUpDelForm(~) \n\n\n" );
         
      }catch(Exception e) {
         //********************************
         // 예외 발생 시 실행할 코드 설정
         //********************************
         System.out.println("<접속실패> [접속 URI]->/qstnUpDelForm.do  [호출메소드]->QstnController.goQstnUpDelForm(~) \n\n\n" );
         System.out.println(e.getMessage());
      }
      return mav;
   }
      
      
      
      
      //***************************************************
      // /qstnUpDelProc.do 접속 시 호출되는 메소드 선언
      //***************************************************
      @RequestMapping(
            value="/qstnUpDelProc.do"
            ,method=RequestMethod.POST
            ,produces="application/json; charset=UTF-8"
      )
      @ResponseBody
      public int qstnUpDelProc(
            QstnDTO qstnDTO   
            ,@RequestParam(value="upDel") String upDel
      ) {
             System.out.println("DTO.user_id=======>"+qstnDTO.getUser_id());
         //-------------------------------------------------------
         // 수정 또는 삭제 적용행의 개수가 저장되는 변수 선언
         //-------------------------------------------------------
         int qstnUpDelCnt=0;
         try {
            //------------------------------------------------------------
            // 만약 수정 모드이면 수정 실행하고 수정 적용행의 개수를 저장
            //------------------------------------------------------------
            if(upDel.equals("up")) {
               qstnUpDelCnt = this.qstnService.updateQstn(qstnDTO);
               System.out.println("qstnUpDelCnt : " + qstnUpDelCnt);
            }
            //------------------------------------------------------------
            // 만약 삭제 모드이면 삭제 실행하고 삭제 적용행의 개수를 저장
            //------------------------------------------------------------
            else {
               qstnUpDelCnt = this.qstnService.deleteQstn(qstnDTO);
            }
         }catch(Exception e) {
            System.out.println("<에러발생>");
               System.out.println(e.getMessage());
               qstnUpDelCnt = -1;
         }
         //------------------------------------
         // 수정 또는 삭제 적용행의 개수 리턴
         //------------------------------------
         return qstnUpDelCnt;
         
      }
      
      
      
//================================김수민=============================================
      
      @RequestMapping( value="/FAQForm.do" )
      public ModelAndView FAQForm(

               HttpSession session

         ){
            //------------------------------------------------------
            // [ModelAndView 객체] 생성하기
            // [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
            //------------------------------------------------------
            ModelAndView mav = new ModelAndView();
            mav.setViewName("FAQForm.jsp");
            String user_id = (String) session.getAttribute("user_id");


              int u_no = this.salesService.getUserNo(user_id);
              System.out.println("user_no : " + u_no);
            

               String rank_code = (String)session.getAttribute("rank_code");
               mav.addObject("rank_code",rank_code);
            try {

            }catch(Exception e) {

            }
            //--------------------------------
            // [ModelAndView 객체] 리턴하기
            //--------------------------------
            
            return mav;
         }
      
//====================================================================================
      
      
}


   
      
