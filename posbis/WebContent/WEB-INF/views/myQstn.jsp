

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





//---------------------------------------------------------------------------------------------


         var tableObj = $("#FAQ");
         if (tableObj.length==0)
         {
            alert("id=FAQ 를 가진 태그가 존재하지 않습니다. 점검 바람!");
            return;
         }
         // id=movieList 를 가진 태그 내부에 모든 tr 을 관리 JQuery 객체 메위주를 변수 trObj에 저장.
         var trObj = tableObj.find("tr");
            // 위 코딩은 아래와 같이 쓸 수 있으나 또다시 id = movieList를 가진
            // JQuery 객체를 생성하므로 비효율적이다.
            // var trObj = $("#movieList").find("tr");
            // var trObj = $(#movieList tr);
         // 홀수 tr 을 관리 JQuery  객체 메위주를 변수 trOddObj 에 저장
         var trOddObj = trObj.filter(":even");
         // 짝수 tr 을 관리 JQuery  객체 메위주를 변수 trEvenObj 에 저장
         var trEvenObj = trObj.filter(":odd");

         //짝수번째 tr 감추기
         trEvenObj.hide();

         // 홀수 tr 에 마우스 대면 마우스 댄 tr의 다음 tr만 보이기
         trOddObj.hover(
            function(){
               // 짝수 tr 감추기. 기존에 보여진 짝수 tr을 감추기 위함이다.
               trEvenObj.hide();
               // 마우스를 댄 홀수 tr 의 다음 짝수 tr 보이기
               $(this).next().show()
            }
            ,function(){
               
            }
         );
         // table 영역에서 마우스 빼면 짝수 tr 안 보이기
         tableObj.hover(
            function(){
               
            }
            ,function(){
               trEvenObj.hide();
            }
         );








//---------------------------------------------------------------------------------------------



         
   
});
         

         
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
 		//분석현황-검색관리
 		function goPreSearchForm(){
 	        //alert("검색관리로 이동");
 	        location.replace("/posbis/preSearchForm.do");
 	     }
 		//분석현황-차트관리
 		function goPreChartForm(){
 	        //alert("차트관리로 이동");
 	        location.replace("/posbis/preChartForm.do");
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
 		 function goQstnForm(){
 	        //alert("내글보기으로 이동");
 	        location.replace("/posbis/myQstn.do");
 	     }
 		 
 		//통합 관리
 		 function goHomePageForm(){
		    //alert("통합 관리으로 이동");
		    location.replace("/posbis/homePageForm.do");
		 }
 		//--------------------------------------------------------

 		
 		function goMessageForm(){
 		    alert("건의사항이 접수 되었습니다. 감사합니다");
 	 
 		 }
   	
   	
   	
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
  <!-- =======================================================
  
  

  <!-- =======================================================
    Theme Name: Rapid
    Theme URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
  
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
        <div class="social-links">
          <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
          <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
          <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
          <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
        </div>
      </div>
    </div>

    <div class="container">
      
      <div class="logo float-left">
        <!-- Uncomment below if you prefer to use an image logo -->
        <h1 class="text-light"><a  onClick="goMainForm();" class="scrollto"><span> POSBIS</span></a></h1>
        <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
      </div>

      <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li class="drop-down"><a href="">회사소개</a>
            <ul>
              <li onClick="goIntroForm();"><a href="#">POSBIS</a></li>
            </ul>
          </li>
           <li class="drop-down"><a href="">마이페이지</a>
            <ul>
              <li><a onClick="gohomepageForm();">통합 관리</a></li>
              <li><a onClick="goSalesForm();">매출 관리</a></li>
              <li><a onClick="goMenuForm();">메뉴 관리</a></li>
              <li><a onClick="goMyPageForm();">내 정보 보기</a></li>
 
            </ul>
          </li>
           <li class="drop-down"><a href="">분석현황</a>
            <ul>
              <li><a onClick="goPreSearchForm();">검색관리</a></li>
              <li><a onClick="goPreChartForm();">차트관리</a></li>
            </ul>
          </li>
 
           <li class="drop-down"><a href="">Q&A게시판</a>
            <ul>
              <li><a onClick="goqstnRegForm();">질문하기</a></li>
           	  <li><a onClick="goQstnForm();">내글보기</a></li>
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
          <h2>Q&A<br> In <br><span>POSBIS</span></h2>
        
        </div>
  
        <div class="col-md-6 intro-img order-md-last order-first">
          <img src="resources/intro/img/intro-img.svg" alt="" class="img-fluid">
        </div>
      </div>

    </div>
  </section><!-- #intro -->
 
<!--==========================
    Q&A 게시판
    ============================-->
 
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
     <div class="row">
           <div class="col-lg-10" align="center">
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">Q&A게시판</a></li>
              <li><i class="fa fa-user-md"></i>내글보기</li>
            </ol>
 
          <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	    내가 쓴 글
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
               <!---------------------------------------------------------------------->
               <!-----------    EL 문법으로 게시판 총 개수 출력하기   ----------------->
               <!--------------   (달러 표시)${qstnAllCnt}는    ------------------>
               <!------------------    컨트롤러 클래스 내부에   ----------------------->
               <!----    ModelAndView 객체에 qstnAllCnt 라는 키값으로 저장된   --->
               <!----------    데이터를 EL로 표현하여 삽입하라는 뜻이다   ------------->
               <!-- 키값은 mav.addObject("qstnAllCnt", qstnAllCnt); 코드의 -->
               <!--                  "qstnAllCnt"를 말한다                      -->
               <!---------------------------------------------------------------------->
              [총 개수] : ${myQstnAllCnt}&nbsp;&nbsp;&nbsp;
               <!---------------------------------------------------------------------->
               <!--    한 페이지에서 보이는 행의 개수가 저장되는 입력양식 표현하기   -->
               <!--------- 행의 개수는 DB 연동시 아주 중요한 역할을 한다 -------------->
               <!---------------------------------------------------------------------->
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
         
            <!-- *********************************** -->
   <!-- 페이징 번호를 삽입할 span 태그 선언 -->
   <!-- *********************************** -->
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

               <td> 
							<!------------------------------------------>
							<!-- 만약 들여쓰기 레벨 번호가 0보다 크면 -->
							<!-- 레벨번호 만큼의  &nbsp;를 삽입하라 ---->
							<!------------------------------------------>
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
            <section class="panel">
              <header class="panel-heading">
                	   FAQ
              </header>
              <div class="panel-body">  
                  <div class="col-sm-10" align="center">
      
              <table id="FAQ"class="table table-striped table-advance table-hover">
			<tr><td><b>Q.인간은 왜 일을 해야 하나요?
			<tr><td>&nbsp;&nbsp;A.돈 벌어야 되니까요.
			<tr><td><b>Q.life is egg라던데 사실인가요?
			<tr><td>&nbsp;&nbsp;A.네 사실입니다
			<tr><td><b>Q.요즘 입덕한 사람은 누군가요?
			<tr><td>&nbsp;&nbsp;A.양준일이요. 개착하고 개귀여워 ㅠㅠㅠ
		</table>
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

          <div class="col-lg-6">

            <div class="row">

                <div class="col-sm-6">

                  <div class="footer-info">
                    <h3>POSBIS</h3>
                    <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus. Scelerisque felis imperdiet proin fermentum leo. Amet volutpat consequat mauris nunc congue.</p>
                  </div>

                  <!-- <div class="footer-newsletter">
                    <h4>Our Newsletter</h4>
                    <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna veniam enim veniam illum dolore legam minim quorum culpa amet magna export quem.</p>
                    <form action="" method="post">
                      <input type="email" name="email"><input type="submit"  value="Subscribe">
                    </form>
                  </div> -->

                </div>

                <div class="col-sm-6">
                  <div class="footer-links">
                    <h4>빠른 이동</h4>
                    <ul>
                      <li><a onClick="goIntroForm();">회사소개 </a></li>
                      <li><a onClick="goMainForm();">로그인</a></li>
                      <li><a onClick="goqstnRegForm();">질문하기</a></li>
                    </ul>
                  </div>

                  <div class="footer-links">
                    <h4>연락망</h4>
                    <p>
                      월드메르디앙벤쳐 2차 <br>
                      Korea, Seoul 가산디지털단지역<br>
                      용기의 방, 409호 <br>
                      <strong>Phone:</strong> +1 5589 55488 55<br>
                      <strong>Email:</strong> info@example.com<br>
                    </p>
                  </div>

                  <div class="social-links">
                    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                    <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                    <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                    <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                  </div>

                </div>

            </div>

          </div>

          <div class="col-lg-6">

            <div class="form">
              
              <h4>건의 사항</h4>
              <p>POSBIS는 고객의 말에 늘 귀기울이고 있습니다. <br>불편한 점 또는 좋은 제안이 있으시다면 언제든지 건의해 주세요. </p>
              <form action="" method="post" role="form" class="contactForm">
                <div class="form-group">
                  <input type="text" class="form-control" name="name" id="name" placeholder="성함" data-rule="minlen:2" data-msg="2자 이상 입력해 주십시오" />
                  <div class="validation"></div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="이메일" data-rule="email" data-msg="이메일을 입력해 주십시오" />
                  <div class="validation"></div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="subject" id="subject" placeholder="제목" data-rule="minlen:4" data-msg="제목을 4자 이상 입력해 주십시오" />
                  <div class="validation"></div>
                </div>
                <div class="form-group">
                  <textarea class="form-control" name="message" rows="5" data-rule="required"  placeholder="내용" data-msg="내용을 입력해 주십시오"></textarea>
                  <div class="validation"></div>
                </div>

               <!--  <div id="sendmessage">건의사항이 무사히 전달됐습니다. 감사합니다!</div>
                <div id="errormessage"></div> -->

                <div class="text-center"><button type="submit" title="Send Message" onClick="goMessageForm();">전송</button></div>
              </form>
            </div>

          </div>

          

        </div>

      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>POSBIS</strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Rapid
        -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>

 
  </footer><!-- #footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <!-- Uncomment below i you want to use a preloader -->
  <!-- <div id="preloader"></div> -->

<!--   <!-- JavaScript Libraries -->
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
  Contact Form JavaScript File
  <script src="resources/intro/contactform/contactform.js"></script>

  Template Main Javascript File
  <script src="resources/intro/js/main.js"></script>
   -->
  

</body>
</html> 