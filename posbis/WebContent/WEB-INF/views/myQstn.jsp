

<!-- 
JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 
****************************************************************************************
현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-9 방식으로 인코딩한다 라고 설정함
현재 이 JSP 페이지는 UTF-8 방식으로 인코딩한다
UTF-8 인코딩 방식은 한글을 포함 전세계 모든 문자열을 부호화할 수 있는 방법이다
(language="java"는 생략해도 들어감 default라서)
-->
<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기-->
<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
<%@include file="/WEB-INF/views/common.jsp"  %>


<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->   
<!-- 로그인 화면 구성하는 HTML 태그 코딩하기 -->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->   
<html>
<head>


  <style>
 .loginmaintaining {
 
	color: #6c757d;
    width: 11%;
    
    float: right;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
	
    text-align: right;

	border-top:1px solid #eeeeee ;

	border-left:1px solid #eeeeee ;

    border-right:1px solid #eeeeee ;

	border-bottom:1px solid #eeeeee ;

 
    
   background-color: #f5f8fd;

}
  </style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">
   <title>문의사항</title>
   <script>
      //===============================================================
      // boay 태그 안의 모든 태그를 읽어들인 후 실행할 자스 코딩 설정
      //===============================================================
      $(document).ready(function(){
         //-----------------------------------------------------------------------
         // name="rowCntPerPage"에 change 이벤트가 발생하면 실행할 코드 설정하기
         //-----------------------------------------------------------------------
         $('[name=rowCntPerPage]').change(function(){
            goSearch();
         });
         
         //--------------------------------------------------------------------------
         // 페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기
         // -------------------------------------------------------------------------
         $(".pagingNumber").html(
               getPagingNumber(                        
                  "${qstnAllCnt}"               // 검색 결과 총 행 개수
                  ,"${myQstnSearchDTO.selectPageNo}"  // 선택된 현재 페이지 번호
                  ,"${myQstnSearchDTO.rowCntPerPage}" // 페이지 당 출력행의 개수
                  ,"15"                              // 페이지 당 보여줄 페이지 번호 개수
                  ,"goSearch();"                     // 페이지 번호 클릭 후 실행할  자스코드
         ));
         
         //---------------------------------------------------------------------------------------
         // 게시판 목록을 보여주는 table의 헤더행, 짝수행, 홀수행, 마우스온일 때 배경색 설정하기
         //---------------------------------------------------------------------------------------
         setTableTrBgColor(
               "qstnTable"         // 테이블 class 값
               ,"${headerColor}"      // 헤더 tr 배경색
               ,"${oddTrColor}"      // 홀수행 배경색
               ,"${evenTrColor}"      // 짝수행 배경색
               ,"${mouseOverColor}"   // 마우스온 시 배경색
         );
         
         //-------------------------------------------------------
         // 클라이언트가 보낸 검색 조건을 입력 양식에 넣어 주기
         //-------------------------------------------------------
/* 
         $('[name=rowCntPerPage]').val("${qstnSearchDTO.rowCntPerPage}");
         $('[name=keyword1]').val("${qstnSearchDTO.keyword1}");
         $('[name=selectPageNo]').val("${qstnSearchDTO.selectPageNo}");
         
         <c:forEach items="${qstnSearchDTO.date}" var="date">
            $('[name=date]').filter("[value='${date}']").prop("checked",true);
         </c:forEach>
         
         <c:forEach items="${qstnSearchDTO.readCnt}" var="readCnt">
            $('[name=readCnt]').filter("[value=${readCnt}]").prop("checked",true);
         </c:forEach>
   
*/
         
          inputData( "[name=selectPageNo]","${myQstnSearchDTO.selectPageNo}" );
          inputData( "[name=rowCntPerPage]","${myQstnSearchDTO.rowCntPerPage}" );
          inputData( "[name=keyword1]","${myQstnSearchDTO.keyword1}" );
          /* inputData( "[name=keyword2]","${qstnSearchDTO.keyword2}" );
          inputData( "[name=orAnd]","${qstnSearchDTO.orAnd}" );
          <c:forEach items="${qstnSearchDTO.date}" var="date">
             inputData("[name=date]","${date}");
         </c:forEach>
          <c:forEach items="${qstnSearchDTO.readCnt}" var="readCnt">
             inputData("[name=readCnt]","${readCnt}");
         </c:forEach> */   
});//$(document).ready(function(){
      
         

         
      //*******************************************
      // [게시판 목록 화면]으로 이동하는 함수 선언
      //*******************************************
      function goSearch(){
         //------------------------------------------------------------------------------
         // 만약 키워드가 공백 또는 길이가 없다면 길이 없는 데이터로 셋팅하기
         // 공백 상태에서 서버로 전송되면 공백을 가지고 DB 검색한다
         // 이 현상을 막기 위해 공백 또는 길이가 없다면 길이 없는 데이터로 통일해서 셋팅
         //------------------------------------------------------------------------------
         if( is_empty("[name=myQstn] [name=keyword1]") ){
            $("[name=qstnForm] [name=keyword1]").val("");
         }
         
         //-------------------------------------------------------------------------------
         // 키워드 앞뒤에 공백이 있으면 제거하고 다시 넣어주기
         //-------------------------------------------------------------------------------
         var keyword1 = $("[name=myQstn] [name=keyword1]").val();
         keyword1 = $.trim(keyword1);
         $("[name=myQstn] [name=keyword1]").val(keyword1);
         //----------------------------------------------------------------------------
         /* 위 코드는 아래처럼도 가능.
            $("[name=qstnForm] [name=keyword1]").val(
               $.trim($("[name=qstnForm] [name=keyword1]").val()  )
            ); 
         */
         
      /*    if( is_empty("[name=qstnForm] [name=keyword2]") ){
            $("[name=qstnForm] [name=keyword2]").val("");
         }
         //-------------------------------------------------------------------------------
         // 키워드 앞뒤에 공백이 있으면 제거하고 다시 넣어주기
         //-------------------------------------------------------------------------------
         var keyword2 = $("[name=qstnForm] [name=keyword2]").val();
         keyword2 = $.trim(keyword2);
         $("[name=qstnForm] [name=keyword2]").val(keyword2); */
         //----------------------------------------------------------------------------
         // name=qstnForm 을 가진 form 태그의 action 값의 URL로 웹서버에 접속하기
         //----------------------------------------------------------------------------
         document.qstnForm.submit();
      }
      
      
      
      //*********************************************
      // [모두 검색] 버튼 누르면 호출되는 함수 선언
      //*********************************************
      function goSearchAll(){
         //--------------------------------------------------------------------------
         // name=qstnForm 을 가진 form 태그의 내부의 모든 입력양식 중에
         // 체크박스나 라디오는 체크를 풀고 그 외 입력양식은 value 속성값을 비운다
         //--------------------------------------------------------------------------
         document.qstnForm.reset();
         //---------------------------------------------------------------------
         // 선택페이지 번호와 페이지당 보여지는 행의 개수는 비우면 안 되므로
         // 기본값을 넣어 준다. 이게 없으면 DB 연동을 할 수 없기 떄문이다
         //---------------------------------------------------------------------
         $("[name=myQstn] [name=selectPageNo]").val("1");
         $("[name=myQstn] [name=rowCntPerPage]").val("10");
         goSearch(); 
      }
      //*********************************************
      // [게시판 입력 화면]으로 이동하는 함수 선언
      //*********************************************
      function goQstnRegForm(){
         // get 방식으로 파값이 전혀 없는 상태에서 웹서버에 괄호 안 url 주소로 접근해서 걔가 나한테 던져준 html으로 새로운 화면을 열겠다
         location.replace("/posbis/qstnRegForm.do")
      }
      function goQstnForm(){
            location.replace("/posbis/qstnForm.do");
         }
      //**********************************************************************************
      // [1개의 게시판 내용물]을 보여주는 [게시판 상세 보기 화면]으로 이동하는 함수 선언
      //**********************************************************************************
     function goQstnContentForm(qna_no, writer_id){ 
       var user_id = new String("${sessionScope.user_id}");
       //alert( writer_id );
       if( user_id != writer_id && user_id!='master40' && user_id!='master35'){
           alert("게시글에 대한 권한이 없습니다.");
           return;
     }
         //------------------------------------------------------------------------
         // 상세보기 화면으로 이동할 떄 가져갈 파라미터값을 만든다
         // qna_no는 필수이고 나머지는 검색 조건 관련 파라미터값이다
         // 검색조건 관련 파라미터값을 가지고 가야 다시 이리로 올 때 검색 조건들을
         // 넣어 줄 수 있다
         //------------------------------------------------------------------------
         var str = "qna_no=" + qna_no + "&" + $("[name=myQstn]").serialize();
         
         /* $(".xxx").remove();
         $("body").prepend("<div class=xxx><hr>" + str + "<hr></div>");
         return; */
         
         location.replace( "/posbis/qstnContentForm.do?" + str );
      /*    alert(qna_no)
         var selectPageNo = $("[name=qstnForm] [name=selectPageNo]").val()
         var rowCntPerPage = $("[name=qstnForm] [name=rowCntPerPage]").val()
         location.replace(
               "${ctRoot}/qstnContentForm.do?qna_no=" + qna_no + "&" 
                                 + $("[name=qstnForm]").serialize() 
         */
      }
      
      
   //--------------------------------------------------------
	   //로고 클릭시
	     function goMainForm(){
	        //alert("메인으로 이동");
	        location.replace("/posbis/mainForm.do");
	     }
		
		//회사소개-pobis 클릭시
		
		function goIntroForm(){
	        //alert("회사소개로 이동");
	        location.replace("/posbis/introForm.do");
	     }
		
		//마이페이지-매출관리
	    function goSalesForm(){
	        //alert("매출관리로 이동");
	        location.replace("/posbis/salesForm.do");
	     } 
		//마이페이지-메뉴관리
		function goMenuForm(){
	        //alert("메뉴관리로 이동");
	        location.replace("/posbis/menuForm.do");
	     }
		//분석현황-검색관리 (프리미엄으로 이동 시일반 회원은 프리미엄 부분에 들어가지 못함)
   		function goPreSearchForm(){
   	        //alert("검색관리로 이동");
   			var rank_code = ${rank_code};
	         if(rank_code == 2){
	        	 location.replace("/posbis/preSearchForm.do");
	         }
	         else{
	        	 if(confirm("프리미엄 회원 등록을 위해 카드결제 화면으로 이동하시겠습니까?")==false) {
						return;
					}
	        	 else{
	        		 location.replace("/posbis/payForm.do");
	             }
	         }
   	        
   	     }
   		//분석현황-차트관리 (프리미엄으로 이동 시일반 회원은 프리미엄 부분에 들어가지 못함)
   		function goPreChartForm(){
   	        //alert("차트관리로 이동");
   			var rank_code = ${rank_code};
	         if(rank_code == 2){
	         	location.replace("/posbis/preChartForm.do");
	         }
	         else{
	        	 if(confirm("프리미엄 회원 등록을 위해 카드결제 화면으로 이동하시겠습니까?")==false) {
						return;
					}
	        	 else{
	        		 location.replace("/posbis/payForm.do");
	             }
	         }
   	     }
		//내정보관리-내정보 보기
		function goMyPageForm(){
	        //alert("내정보 보기으로 이동");
	        location.replace("/posbis/myPageForm.do");
	     }

		//qna 게시판- 질문하기
		function goqstnRegForm(){
	        //alert("질문하기으로 이동");
	        location.replace("/posbis/qstnRegForm.do");
	     }
		//qna 게시판- 내글보기
		 function goMyQstnForm(){
	        //alert("내글보기으로 이동");
	        location.replace("/posbis/myQstn.do");
	     }
		//qna 게시판- 전체 질문보기
		 function goQstnForm(){
	        //alert("전체 질문보기으로 이동");
	        location.replace("/posbis/qstnForm.do");
	     }
		//qna 게시판- 자주 묻는 질문
		 function goFAQForm(){
		        //alert("전체 질문보기으로 이동");
		        location.replace("/posbis/FAQForm.do");
		     }
		 
		//통합 관리
		 function goHomePageForm(){
		    //alert("통합 관리으로 이동");
		    location.replace("/posbis/homePageForm.do");
		 }
		//--------------------------------------------------------
 
      
      
   </script>
   <!-- ---------------------------------------------------------------------------------------------------------- -->   
     <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
<!--   <link href="resources/intro/img/favicon.png" rel="icon"> -->
  <link href="resources/intro/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="resources/intro/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="resources/intro/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="resources/intro/lib/animate/animate.min.css" rel="stylesheet">
  <link href="resources/intro/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="resources/intro/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="resources/intro/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="resources/intro/css/style.css" rel="stylesheet">
  
  
  
  
   <!-- Bootstrap CSS -->
  <link href="resources/sidetopbar/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="resources/sidetopbar/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="resources/sidetopbar/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="resources/sidetopbar/css/font-awesome.min.css" rel="stylesheet" />
  <!-- full calendar css-->
  <link href="resources/sidetopbar/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
  <link href="resources/sidetopbar/assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
  <!-- easy pie chart-->
  <link href="resources/sidetopbar/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen" />
  <!-- owl carousel -->
<!--   <link rel="stylesheet" href="css/owl.carousel.css" type="text/css"> -->
<!--   <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet"> -->
  <!-- Custom styles -->
 <!--  <link rel="stylesheet" href="css/fullcalendar.css"> -->
  <link href="resources/sidetopbar/css/widgets.css" rel="stylesheet">
  <link href="resources/sidetopbar/css/style.css" rel="stylesheet"> 
<!--   <link href="resources/sidetopbar/css/style-responsive.css" rel="stylesheet" />
  <link href="resources/sidetopbar/css/xcharts.min.css" rel=" stylesheet">
  <link href="resources/sidetopbar/css/jquery-ui-1.10.4.min.css" rel="stylesheet"> -->
  <!-- =======================================================-->
  
   <!-- JavaScript Libraries -->
  <script src="resources/intro/lib/jquery/jquery.min.js"></script>
  <script src="resources/intro/lib/jquery/jquery-migrate.min.js"></script>
  <script src="resources/intro/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/intro/lib/easing/easing.min.js"></script>
  <script src="resources/intro/lib/mobile-nav/mobile-nav.js"></script>
  <script src="resources/intro/lib/wow/wow.min.js"></script>
  <script src="resources/intro/lib/waypoints/waypoints.min.js"></script>
  <script src="resources/intro/lib/counterup/counterup.min.js"></script>
  <script src="resources/intro/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="resources/intro/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="resources/intro/lib/lightbox/js/lightbox.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="resources/intro/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="resources/intro/js/main.js"></script>

   
  <!-- Bootstrap CSS -->
  <link href="resources/table/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="resources/table/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="resources/table/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="resources/table/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="resources/table/css/style.css" rel="stylesheet">
  <link href="resources/table/css/style-responsive.css" rel="stylesheet" />
   

   
   
</head>
   
<!--==========================
  Header
  ============================-->
  <header id="header">

         <div id="topbar">
           <div class="container">
          
           </div>
         </div>

       <div class="header">
 

           <div class="logo float-left">
             <!-- Uncomment below if you prefer to use an image logo -->
             <h1 style="cursor:pointer"  class="text-light"><a  onClick="goHomePageForm();" class="scrollto"><span>POSBIS</span></a></h1>
             <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
           </div>
   
          	   <div   class= "loginmaintaining">
                      <a><i class="icon_profile"></i>&nbsp;&nbsp;&nbsp;<b>${user_id}</b> 님 반갑습니다</a><br><br>                     
                  <div style="float:right">   
                     <a style="cursor:pointer"  onClick="goMyPageForm();">[내정보 보기]</a>                        
                     <a style="cursor:pointer"  onClick="goMainForm();"> [로그아웃] </a> 
				 </div>  
                </div>
   
           <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li style="cursor:pointer"  class="drop-down" ><a href="">회사소개</a>
            <ul>
              <li style="cursor:pointer" onClick="goIntroForm();"><a href="#">POSBIS</a></li>
             <br>
            </ul>
          </li>
		     <li style="cursor:pointer"  class="drop-down"><a href="#">업체동향</a>
		            <ul>
		              <li style="cursor:pointer" ><a onClick="goPreSearchForm();">시장분석</a></li>
		              <li style="cursor:pointer" ><a onClick="goPreChartForm();">비교차트</a></li>
 						<br>
		            </ul>
		          </li>
           <li style="cursor:pointer"  class="drop-down"><a href="#">매장관리</a>
            <ul>
              <li style="cursor:pointer" ><a onClick="goMenuForm();">메뉴 관리</a></li>
              <li style="cursor:pointer" ><a onClick="goSalesForm();">매출 관리</a></li>
               <br>
            </ul>
          </li>
    
           <li style="cursor:pointer"  class="drop-down"><a href="#">마이페이지</a>
            <ul>
              <li style="cursor:pointer" ><a onClick="goMyPageForm();">내정보보기</a></li>
           	  <li style="cursor:pointer" ><a onClick="goMyQstnForm();">문의내역확인</a></li>
           	  <br>
            </ul>
          </li>
          
           <li style="cursor:pointer"  class="drop-down"><a href="#">고객센터</a>
            <ul>
              <li style="cursor:pointer" ><a onClick="goQstnForm();">Q&A 목록보기</a></li>
           	  <li style="cursor:pointer" ><a onClick="goFAQForm();">자주 묻는 질문</a></li>
           	  <li style="cursor:pointer" ><a onClick="goqstnRegForm();">문의하기</a></li>
           	   <br> 
            </ul>
          </li>
 
 
        </ul>
      </nav><!-- .main-nav -->
           
         </div>
       </header><!-- #header -->

 <!--==========================
    Intro Section
  ============================-->
  <section id="intro" class="clearfix">
    <div class="container d-flex h-100">
      <div class="row justify-content-center align-self-center">
        <div class="col-md-6 intro-info order-md-first order-last">  
        </div>
      </div>
    </div>
  </section> 
  
<!--==========================
    Q&A 게시판
    ============================-->
 
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">내가 쓴글 보기</a>
              </header>
              
              <div class="panel-body">   
        
          <form name="myQstn" method="post" action="/posbis/myQstnForm.do">
          <div  class="form-group">
               <!-------------------------------->
         <!-- 키워드 검색 입력 양식 표현 -->
         <!-------------------------------->
         [키워드] : <input type="text" name="keyword1" class="keyword1">
         
         <!-------------------------------->
         <!-------- 버튼 표현하기 --------->
         <!-------------------------------->
         <input type="button" value="검색" class="qstnSearch"  onClick="goSearch();">&nbsp;
         <input type="button" value="     모두검색     " onClick="goSearchAll();">&nbsp;
         <a href="javascript:goQstnRegForm();">[새글쓰기]</a>&nbsp;&nbsp;<br>
          <!--------------------------------------------------->
         <!-- 어제 또는 오늘 게시판 글을 검색하는 조건 표현 -->
         <!--------------------------------------------------->
   <!--       [등록일]:
         <input type="checkbox" name="date" class="date" value="오늘">오늘
         <input type="checkbox" name="date" class="date" value="어제">어제
         <input type="checkbox" name="date" class="date" value="이번달" >이번 달
         <input type="checkbox" name="date" class="date" value="이번달이외">이번 달 이외 &nbsp;&nbsp;&nbsp;
         [조회수]:
         <input type="checkbox" name="readCnt" class="readCnt" value="조회수100이상">조회수 100 이상 &nbsp;&nbsp;&nbsp; -->
         <!------------------------------------------------------------>
         <!----- 선택한 페이지 번호가 저장되는 입력 양식 표현하기 ----->
         <!-- 선택한 페이지 번호는 DB 연동시 아주 중요한 역할을 한다 -->
         <!------------------------------------------------------------>
         <input type="hidden" name="selectPageNo"></div></br>
         <!-- 개발시에는 hidden을 text로 잠시 바꿔놓고 개발하면 눈에 보이니까 아주 편하다 -->
       <div class="col-sm-12">
         <table align=right >
         <tr>
            <td align=right>

              [총 개수] : ${myQstnAllCnt}&nbsp;&nbsp;&nbsp;
               <select name="rowCntPerPage">
                  <option value="10">10
                  <option value="15">15
                  <option value="20">20
                  <option value="25">25
                  <option value="30">30
               </select> 행보기
      </table>
      </form>
      </div></br>

   <div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
   
   <table><tr height=10><td></table>
   
   <div class="col-sm-10" align="center">
      
              <table class="table table-striped table-advance table-hover">
                  <tr>
                    <th align=center>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>등록일</th>
                    <th>조회수</th>
                    <c:forEach items="${myQstnList}" var="myQstn" varStatus="loopTagStatus">
                    <tr style="cursor:pointer" 
                        onClick="goQstnContentForm(${myQstn.qna_no}, '${myQstn.user_id}');">
                     <td align=center>
   <!-- ************************************************ -->
               <!-- 게시판 검색 목록 중에 각 행의 역순 일련번호 출력 -->
               <!-- ************************************************ -->
                 ${myQstnAllCnt-(myQstnSearchDTO.selectPageNo*myQstnSearchDTO.rowCntPerPage-myQstnSearchDTO
                 .rowCntPerPage+1+loopTagStatus.index)+1} <!-- index 대신 count 넣으면 1부터 시작 -->

               <td align=center> 
                     <c:if test="${myQstn.print_level>0}">
                        <c:forEach begin="0" end="${myQstn.print_level}">
                             &nbsp;&nbsp;
                        </c:forEach>
                        ㄴ
                     </c:if> 
                     <!--------------------------------------------->
                     <!-- 게시판 검색 목록 중에 각 행의 제목 출력 -->
                     <!--------------------------------------------->
                     ${myQstn.subject}
               <!----------------------------------------------->
               <!-- 게시판 검색 목록 중에 각 행의 글쓴이 출력 -->
               <!----------------------------------------------->
               <td align=center>${myQstn.user_id}
               <!----------------------------------------------->
               <!-- 게시판 검색 목록 중에 각 행의 등록일 출력 -->
               <!----------------------------------------------->
               <td align=center>${myQstn.qna_date}
               <!----------------------------------------------->
               <!-- 게시판 검색 목록 중에 각 행의 조회수 출력 -->
               <!----------------------------------------------->
               <td align=center>${myQstn.readcount}
         
         </c:forEach> 
   </table><br>
              
     
           
              
               
         <!-- 만약에 검색된 게시판 총 개수가 0개면 "검색 결과 없습니다" 출력하기 -->
            <c:if test="${empty myQstnList}">
                검색 결과가 없습니다
            </c:if>
      <br><br>

</div>
</section>

            </div>
            </div>
 
          </div>
        </div>
</section>
</section>
 
</main>
 

  <!--==========================
    꼬리말
  ============================-->
  <footer id="footer" class="section-bg">
    <div class="footer-top">
      <div class="container">

        <div class="row">

          <div class="col-lg-12">

            <div class="row">

                <div class="col-sm-8">

                  <div class="footer-info">
                    <h3>POSBIS</h3>
                    <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus. Scelerisque felis imperdiet proin fermentum leo. Amet volutpat consequat mauris nunc congue.</p>
                  </div>
                </div>
				  <div class="col-sm-4">
            <div class="footer-links"  style="float:right">
                    <h4>연락망</h4>
                    <p>
                      월드메르디앙벤쳐 2차 
                      Korea, Seoul 가산디지털단지역<br>
                      <strong>Phone:</strong> +1 5589 55488 55<br>
                      <strong>Email:</strong> info@example.com<br>
                    </p>
                    
                 
                  </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>POSBIS</strong>. All Rights Reserved <br> BootstrapMade
      </div>
     </div>
    
 
 
  </footer><!-- #footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <!-- Uncomment below i you want to use a preloader -->
  <!-- <div id="preloader"></div> -->

  <!-- JavaScript Libraries -->
  <script src="resources/intro/lib/jquery/jquery.min.js"></script>
  <script src="resources/intro/lib/jquery/jquery-migrate.min.js"></script>
  <script src="resources/intro/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/intro/lib/easing/easing.min.js"></script>
  <script src="resources/intro/lib/mobile-nav/mobile-nav.js"></script>
  <script src="resources/intro/lib/wow/wow.min.js"></script>
  <script src="resources/intro/lib/waypoints/waypoints.min.js"></script>
  <script src="resources/intro/lib/counterup/counterup.min.js"></script>
  <script src="resources/intro/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="resources/intro/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="resources/intro/lib/lightbox/js/lightbox.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="resources/intro/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="resources/intro/js/main.js"></script>
  
  

</body>
</html>
 