<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<meta name="description" content="loans HTML Template">
<meta name="keywords" content="loans, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link href="resources/bootstrap/img/favicon.ico" rel="shortcut icon" />

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="resources/bootstrap/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="resources/bootstrap/css/owl.carousel.min.css" />
<link rel="stylesheet" href="resources/bootstrap/css/flaticon.css" />
<link rel="stylesheet" href="resources/bootstrap/css/slicknav.min.css" />

<!-- Main Stylesheets -->
<link rel="stylesheet" href="resources/bootstrap/css/style.css" />

<!-- ------------------------------------------------------------------------------- -->


<!-- 	<link rel="shortcut icon" href="img/favicon.png">
 -->
<!-- Bootstrap CSS -->
<link href="resources/tableBoot/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="resources/tableBoot/css/bootstrap-theme.css"
	rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="resources/tableBoot/css/elegant-icons-style.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/daterangepicker.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/bootstrap-datepicker.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/bootstrap-colorpicker.css"
	rel="stylesheet" />
<!-- date picker -->

<!-- color picker -->

<!-- Custom styles -->
<link href="resources/tableBoot/css/style.css" rel="stylesheet">
<link href="resources/tableBoot/css/style-responsive.css"
	rel="stylesheet" />

<!-- =======================================================
      Theme Name: NiceAdmin
      Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
      Author: BootstrapMade
      Author URL: https://bootstrapmade.com
    ======================================================= -->
  
 <!-- 회원등급 표시 아이콘 -->   
<link rel="stylesheet" href="resources\pos\assets\vendor\fonts\themify-icons\themify-icons.css">
  
  
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
    
    
   <script>
         /* $(document).ready(function(){
            $("[name=u_no]").val("7");
            $("[name=subject]").val("QQQ");
            $("[name=content]").val("내용");
            $("[name=qna_pwd]").val("1111");
         });  */                                                                                         
      //=======================================================================
         // 게시판 등록 화면  에 입력된 데이터 유효성 체크 함수 선언
      //=======================================================================
         function checkQstnRegForm(){
            
        	 if(is_empty("[name=user_id]")){
                 alert("이름을 입력해 주세요.");
                 $("[name=writer]").focus();
                 return;
              }
            if(is_empty("[name=subject]")){
               alert("제목을 입력해 주세요.");
               $("[name=subject]").focus();
               return;
            }
            /* return; */
            if(is_empty("[name=content]")){
               alert("내용 입력해 주세요.");
               $("[name=content]").focus();
               return;
            }
            if(is_valid_pattern("[name=qna_pwd]", /^[0-9]{4}$/) == false){
               alert("암호는 숫자 4개를 입력해주세요");
               return;
            }
            
            if(confirm('정말 저장하시겠습니까?') == false){
               return;
            }
            
            
            /*  alert( $('[name=qstnRegForm]').serialize() );
            return;  */
            
            //===========================================================================
            // 현재 화면에서 페이지 이동 없이 서버쪽 "${ctRoot}/qstnRegProc.do"를 호출하여 
            // 게시판 글을 입력하고 [게시판 입력 행 적용 개수]를 받기
            //===========================================================================
            
            $.ajax({
               // 접속할 서버 쪽 URL 주소 설정
               url : "/posbis/qstnRegProc.do"
               // 전송 방법 설정
               , type : "post"
               // 서버로 보낼 파라미터명과 파라미터값을 설정
               , data : $("[name=qstnRegForm]").serialize()
               // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
               // 매개변수 qstnRegCnt 에는 입력 행의 개수가 들어온다.
               , success : function(qstnRegCnt){
                  // 게시판 입력 행 적용 개수가 1개면(=insert가 한번 성공했다는 뜻)
                  if(qstnRegCnt == 1){
                     alert("새 글 등록 성공!");
                 location.replace("/posbis/qstnForm.do");
                  }
                  // 게시판 새 글 입력 행 적용 개수가 1개가 아니면 경고하기
                  else{
                     alert("게시판 글 등록 실패! 관리자에게  문의 바랍니다.");
                  }
               }
               // 서버의 응답을 못받았을 경우 실행할 익명함수 설정.
               , error : function(){
                  alert("서버 접속 실패");
               }
            });
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
	        		 location.replace("/posbis/payFormLogin.do");
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
	        		 location.replace("/posbis/payFormLogin.do");
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
   
    
 
</head>

<body> 
 <!-- Header Section -->
	<header class="header-section">
		<a onClick="goHomePageForm();" class="site-logo" style="cursor:pointer;">
			<img src="resources/bootstrap/img/POSBIS_logo.png" alt="">
		</a>
		<nav class="header-nav">
			<ul class="main-menu">
				<li><a class="active">INFO</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goIntroForm();">POSBIS 소개</a></li>
						<li><a onClick="goHomePageForm();">Home 화면</a></li>
					</ul>
				</li>
				<li><a href="#">마이페이지</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goMyPageForm();">내정보보기</a></li>
						<li><a onClick="goMyQstnForm();">문의내역확인</a></li>
					</ul>
				</li>
				
				<li><a href="#">매장관리</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goMenuForm();">메뉴 관리</a></li>
						<li><a onClick="goSalesForm();">매출 관리</a></li>
					</ul>
				</li>
				<li><a href="#">업체동향</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goPreSearchForm();">시장분석</a></li>
						<li><a onClick="goPreChartForm();">비교차트</a></li>
					</ul>
				</li>
				<li><a href="#">고객센터</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goQstnForm();">Q&A 목록보기</a></li>
						<li><a onClick="goFAQForm();">자주 묻는 질문</a></li>
						<li><a onClick="goqstnRegForm();">문의하기</a></li>
					</ul>
				</li>
			</ul>
			<div class="header-right">

				<div class="hr-text">
				<c:if test = "${rank_code eq '1'}">
	               <i class="ti-user">&nbsp;</i>
	            </c:if>
	               
	            <c:if test = "${rank_code eq '2'}">
	               <i class="ti-crown">&nbsp;</i>
	            </c:if>
	            
	            <b>${user_id}</b> 님 반갑습니다
                	
					<br>
                     <a style="cursor:pointer"  onClick="goMyPageForm();">[내정보 보기]</a>                        
                    &nbsp;
                     <a style="cursor:pointer"  onClick="goMainForm();"> [로그아웃] </a> 
				</div>
				<!-- <a href="#" class="hr-btn"><i class="flaticon-029-telephone-1"></i>Call us now! </a>
				<div class="hr-btn hr-btn-2">+45 332 65767 42</div> -->

			</div>
		</nav>
	</header>
	<!-- Header Section end -->

<!-- Page top Section end -->
	<section class="page-top-section set-bg"
		data-setbg="resources/bootstrap/img/page-top-bg/1.jpg">
		<div class="container">
			<h2>Q&A</h2>
			<nav class="site-breadcrumb">
				<a class="sb-item" href="#">고객센터</a>&nbsp; > &nbsp; <span class="sb-item active">Q&A 등록</span>
			</nav>
		</div>
	</section>
	<!-- Page top Section end -->



 <!--==========================
	질문하기
    ============================-->

  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-8" align="center">
            <section class="panel">
              <header class="panel-heading">
                      <a href="">글 쓰기</a>
              </header>   
              <div class="panel-body">
 

      <div class="container">


<form method="post" name="qstnRegForm" action="/posbis/qstnRegProc.do">
   

      <input type="hidden" name="qna_no" value="${qstnDTO.qna_no}">
   <div class="row" align="center">
          <div class="col-sm-6">
            <section class="panel">
            <input type="hidden" name="qna_no" value="${(empty param.qna_no)?0:param.qna_no}"> 
              <c:if test="${empty param.qna_no}"> <!-- empty는 존재하지 않거나 null이거나 길이가 없으면 (사용할 만한 데이터가 아니면) 무조건 true 리턴-->
             <header class="panel-heading">[새 글쓰기]</header>
         </c:if>
         <c:if test="${param.qna_no>0}"> <!-- 무조건 test 오른쪽은 EL이 나온다. EL 영역 안에 처음과 맨 끝에 공백 넣으면 안 됨 -->
           <header class="panel-heading">[답글쓰기]</header>
         </c:if>
             
              
   
              <table class="table table-bordered"  align=center>
                  <tr>
                     <th>이 름
                     <td><input type="text" size="10" maxlength="10" name="user_id" value="${user_id}">
                  <tr>
                     <th>제 목
                    <td><input type="text" size="40" maxlength="50" name="subject">
                  <tr>
                    <th>내 용
                     <td><textarea name="content" rows="13" cols="40"></textarea>
                  <tr>
                     <th>비밀번호
                     <td><input type="password" size="8" maxlength="12" name="qna_pwd">
              </table>
            </section>
          
        <div style="float:center">     
      <button class="btn btn-info" type="button" value="저장"  onClick="checkQstnRegForm()">저장</button>
      <button class="btn btn-primary" type="reset"value="다시작성">다시작성</button>
      <button class="btn btn-danger" type="button" value="목록보기" onClick="location.replace('/posbis/qstnForm.do')">목록보기</button>
 

 
 
 
   </div>
   </form>
   </div>
   </div>
   </section>
   </div>
   
   
   <!--============================================= 사이드바 김수민================================================-->
   <div style="float:right">
           <section class="panel">
           <header class="panel-heading" align="center">[POSBIS INFO]</header>
   
              <table class="table table-bordered" align="right" width="200" height="400">
                  <tr align="center" valign="middle">
                     <th>address
                     <td>월드메르디앙벤쳐 2차<br>
                   Korea, Seoul<br>
                   가산디지털단지역<br>
                   용기의 방, 409호
                  <tr align="center" valign="middle">
                     <th>business<br>hours
                    <td>9:30 ~ 18:30
                  <tr align="center" valign="middle">
                    <th>tel
                     <td>+1 5589 55488 55
                  <tr align="center" valign="middle">
                     <th>e-mail
                     <td>info@example.com
              </table>
            </section>
   </div>
   <!--================================================================================================================-->
   
   
   
 
  </main>
<!--==========================
    꼬리말
  ============================-->
	<footer class="footer-section">
		<div class="container">
			<img class="footer-logo" src="resources/bootstrap/img/POSBIS_logo.png" alt="">
			<div class="row">

				<div class="footer-widget">

					<p>Cras fermentum odio eu feugiat lide par naso tierra. Justo
						eget nada terra videa magna derita valies darta donna mare
						fermentum iaculis eu non diam phasellus. Scelerisque felis
						imperdiet proin fermentum leo. Amet volutpat consequat mauris nunc
						congue.</p>
					<p>
						월드메르디앙벤쳐 2차 Korea, Seoul 가산디지털단지역<br> <strong>Phone:</strong>
						+1 5589 55488 55<br> <strong>Email:</strong> info@example.com<br>
					</p>
				</div>


			</div>
			<div class="copyright">
				Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
				Copyright &copy;
				2020
				All rights reserved | This template is made with <i
					class="fa fa-heart-o" aria-hidden="true"></i> by <a
					href="https://colorlib.com" target="_blank">Colorlib</a>
				Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
			</div>
		</div>
	</footer>
	<!-- #footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <!-- Uncomment below i you want to use a preloader -->
  <!-- <div id="preloader"></div> -->

  <!--====== Javascripts & Jquery ======-->
	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/bootstrap/js/jquery.slicknav.min.js"></script>
	<script src="resources/bootstrap/js/owl.carousel.min.js"></script>
	<script src="resources/bootstrap/js/jquery-ui.min.js"></script>
	<script src="resources/bootstrap/js/main.js"></script>
	<!-- ---------------------------------------------------------------------- -->

	<!-- javascripts -->
	<script src="resources/tableBoot/js/jquery.js"></script>
	<!-- nice scroll -->
	<script src="resources/tableBoot/js/jquery.scrollTo.min.js"></script>
	<script src="resources/tableBoot/js/jquery.nicescroll.js"
		type="text/javascript"></script>

	<!-- jquery ui -->
	<script src="resources/tableBoot/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom checkbox & radio-->
	<script type="text/javascript" src="resources/tableBoot/js/ga.js"></script>
	<!--custom switch-->
	<script src="resources/tableBoot/js/bootstrap-switch.js"></script>
	<!--custom tagsinput-->
	<script src="resources/tableBoot/js/jquery.tagsinput.js"></script>

	<!-- colorpicker -->

	<!-- bootstrap-wysiwyg -->
	<script src="resources/tableBoot/js/jquery.hotkeys.js"></script>
	<script src="resources/tableBoot/js/bootstrap-wysiwyg.js"></script>
	<script src="resources/tableBoot/js/bootstrap-wysiwyg-custom.js"></script>
	<script src="resources/tableBoot/js/moment.js"></script>
	<script src="resources/tableBoot/js/bootstrap-colorpicker.js"></script>
	<script src="resources/tableBoot/js/daterangepicker.js"></script>
	<script src="resources/tableBoot/js/bootstrap-datepicker.js"></script>
	<!-- ck editor -->
	<script type="text/javascript"
		src="resources/tableBoot/assets/ckeditor/ckeditor.js"></script>
	<!-- custom form component script for this page-->
	<script src="resources/tableBoot/js/form-component.js"></script>
	<!-- custome script for all page -->
	<script src="resources/tableBoot/js/scripts.js"></script>
  
  

</body>
</html>
 