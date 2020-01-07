
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
                  "${myQstnAllCnt2}"                     // 검색 결과 총 행 개수
                  ,"${myQstnSearchDTO.selectPageNo}"  // 선택된 현재 페이지 번호
                  ,"${myQstnSearchDTO.rowCntPerPage}" // 페이지 당 출력행의 개수
                  ,"15"                               // 페이지 당 보여줄 페이지 번호 개수
                  ,"goSearch();"                      // 페이지 번호 클릭 후 실행할  자스코드
         ));
         

          inputData( "[name=selectPageNo]","${myQstnSearchDTO.selectPageNo}" );
          inputData( "[name=rowCntPerPage]","${myQstnSearchDTO.rowCntPerPage}" );
          inputData( "[name=keyword1]","${myQstnSearchDTO.keyword1}" );

   
	}); //$(document).ready(function(){
         

         
      //*******************************************
      // [게시판 목록 화면]으로 이동하는 함수 선언
      //*******************************************
      function goSearch(){

         if( is_empty("[name=myQstn] [name=keyword1]") ){
            $("[name=myQstn] [name=keyword1]").val("");
         }
         var keyword1 = $("[name=myQstn] [name=keyword1]").val();
         keyword1 = $.trim(keyword1);
         $("[name=myQstn] [name=keyword1]").val(keyword1);

         document.myQstn.submit();
      }
      
      
      
      //*********************************************
      // [모두 검색] 버튼 누르면 호출되는 함수 선언
      //*********************************************
      function goSearchAll(){

         $("[name=myQstn] [name=selectPageNo]").val("1");
         $("[name=myQstn] [name=rowCntPerPage]").val("15");
         goSearch(); 
      }
      //*********************************************
      // [게시판 입력 화면]으로 이동하는 함수 선언
      //*********************************************
      function goQstnRegForm(){
         location.replace("/posbis/qstnRegForm.do")
      }
      function goQstnForm(){
            location.replace("/posbis/qstnForm.do");
      }

  	  // goQstnContentForm 수정 
  	  // 성유진
      function goQstnContentForm(qna_no){ 
    	  var str = "qna_no=" + qna_no + "&" + $("[name = myQstn]").serialize();
          location.replace("/posbis/qstnContentForm.do?" + str + "&my=true");
      }
      // 성유진 끝
      
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

		 
		//통합 관리
		 function goHomePageForm(){
		    //alert("통합 관리으로 이동");
		    location.replace("/posbis/homePageForm.do");
		 }
			//qna 게시판- 자주 묻는 질문
		 function goFAQForm(){
		        //alert("전체 질문보기으로 이동");
		        location.replace("/posbis/FAQForm.do");
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
                	   <a href="">내가쓴글</a>
              </header>   
              <div class="panel-body">   
          <div class="container">
          <form name="myQstn" method="post" action="/posbis/myQstn.do">
          <div  class="form-group">	

         <!-- 키워드 검색 입력 양식 표현 -->
         [키워드] : <input type="text" name="keyword1" class="keyword1">
         
         <!-------------------------------->
         <!-------- 버튼 표현하기 --------->
         <!-------------------------------->
         <input type="button" value="검    색" class="qstnSearch"  onClick="goSearch();">&nbsp;
         <input type="button" value="모두검색" onClick="goSearchAll();">&nbsp;
         <a href="javascript:goQstnRegForm();">[문의하기]</a>&nbsp;&nbsp;<br>
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

              [총 개수] : ${myQstnAllCnt2}&nbsp;&nbsp;&nbsp;

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
         
   <!-- 페이징 처리 -->
   <div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
   
   <table><tr height=10><td></table>
   
   <div class="col-sm-10-1" align="center">
      
        <table class="table table-striped table-advance table-hover">
            <tr>
              <th align=center>번호</th>
              <th>제목</th>
              <th>글쓴이</th>
              <th>등록일</th>
              <th>조회수</th>
              <c:forEach items="${myQstnList2}" var="myQstn" varStatus="loopTagStatus">
               <tr style="cursor:pointer" 
               onClick="goQstnContentForm(${myQstn.qna_no});">
              <td align=center>
			     ${myQstnAllCnt2-(myqstnSearchDTO.selectPageNo*myqstnSearchDTO.rowCntPerPage
			     							-myqstnSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1}

              <td> 
                 <c:if test="${myQstn.print_level>0}">
                    <c:forEach begin="0" end="${myQstn.print_level}">
                         &nbsp;&nbsp;
                    </c:forEach>
                    ㄴ
                 </c:if> 
                 ${myQstn.subject}
               <!-- 각 행의 유저 아이디 출력 -->
               <td align=center>${myQstn.user_id}            
               <!-- 각 행의 등록일 출력 -->
               <td align=center>${myQstn.qna_date}
               <!-- 각 행의 조회수 출력 -->
               <td align=center>${myQstn.readcount}
         </c:forEach> 
  	 </table><br>
              
         <!-- 만약에 검색된 게시판 총 개수가 0개면 "검색 결과 없습니다" 출력하기 -->
            <c:if test="${empty myQstnList2}">
                검색 결과가 없습니다
            </c:if>
      <br><br>  

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
 