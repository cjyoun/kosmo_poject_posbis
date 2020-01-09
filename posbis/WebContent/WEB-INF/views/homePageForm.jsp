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
  
</head>

<script type = "text/javascript" src = "https://www.gstatic.com/charts/loader.js">
      </script>
      <script type = "text/javascript">
         google.charts.load('current', {packages: ['corechart']});     
      </script>
      
       
   <script>         
      
		$(document).ready(function(){
			
			//=============이정숙꺼=============================================
		 	  //alert("xdxx");
			//페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기
		/* 	$(".pagingNumber2").html(
				getPagingNumber2(
					"${myStoreInfoAllCnt}"				//검색 결과 총 행 개수
					,"${myStoreInfoDTO.selectPageNo2}"	//선택된 현재 페이지번호
					,"1"	//페이지 당 출력행의 개수
					,"15"								//페이지 당 보여줄 페이지번호 개수
					,"homeMyStoreInfoProc();"						//페이지번호 클릭 후 실행할 자스코드
				)
			);
			inputData("[name=selectPageNo2]","${myStoreInfoDTO.selectPageNo2}");  */

			//=============/이정숙꺼끝=============================================
	});

		
		//=============이정숙꺼=============================================
		function homeMyStoreInfoProc(){
			$.ajax({
				// 서버 쪽 호출 URL 주소 지정
				url : "/posbis/homeMyStoreInfoProc.do"
				
				// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
				, type : "post"

				// 서버로 보낼 파라미터명과 파라미터 값을 설정
				, data : $("[name=myStoreInfoForm]").serialize()				
				
				// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
				// 익명함수의 매개변수 data에는 서버가 응답한 데이터가 들어온다.
				, success : function(myStoreInfoDTO){
					if(myStoreInfoDTO != null){
									//alert("성공");
									//alert( $("[name=salesForm]").serialize() );
									//$("body").remove(".right");
									$("body").load("/posbis/homPageForm.do",$("[name=myStoreInfoForm]").serialize());

					}
					else if (myStoreInfoDTO == null){
						alert("실패");
					}
					else {
						alert("서버 오류 발생. 관리자에게 문의 바람");
					} 
				}
				
				// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				, error : function(request, error){
					alert("서버 접속 실패");
					alert($("[name=myStoreInfoForm]").serialize());
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					
				}
				
			});
		}
		//=============/이정숙꺼끝=============================================


			
			
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
 
   <body>
 <!-- Header Section -->
	<header class="header-section">
		<a onClick="goHomePageForm();" class="site-logo" style="cursor:pointer;">
			<img src="resources/bootstrap/img/POSBIS_logo.png" alt="">
		</a>
		<nav class="header-nav">
			<ul class="main-menu">
				<li><a class="active">회사소개</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goIntroForm();">POSBIS</a></li>
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
				<i class="flaticon-029-telephone-1"></i><b>${user_id}</b> 님 반갑습니다                	
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
			<h2>홈페이지</h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
				<span class="sb-item active">회원가입</span> &nbsp; > &nbsp; <span class="sb-item active">About us</span>
			</nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->



 
    <!--==========================
      통합관리
    ============================-->

  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">통합관리</a>
              </header>           
     <div class="panel-body">
      <div class="container">
		 <div class="row" align="center">
          <div class="col-sm-10-2">
            <section class="panel">
              <header class="panel-heading no-border">
              		 <a href="">통합 개인정보</a>
              </header>
 
  <!-- =========================================== -->
 <!-- =========                     이정숙꺼                   =========== -->
 <!-- =========================================== -->
	<div class="myStoreInfo">
		 	  <form name="myStoreInfoForm" method="post" action="/posbis/homeMyStoreInfoProc.do">	
		 	  			
				<table border=0 width="850" align="center">
				<tr><td align = right>
				[내 점포 수] : ${myStoreInfoAllCnt} 개
				</table>
		 			   <table  class="table table-bordered"   id="mystore">
			            <c:forEach items="${myStoreInfoList}" var="myStoreInfo" varStatus="status">
			               <!-- <script>alert("${status.count}"%3);</script> -->
			            <c:if test="${status.index%3==0}">
			                  <tr>
			               </c:if>
			               <td align=center>  
			         			       <img src="resources/business_type_img/${myStoreInfo.business_type_code}.jpg" class="img-fluid" alt="">   		
			               <td>상호명 : ${myStoreInfo.business_name} <br>
			                     사업자 번호 : ${myStoreInfo.business_no} <br>
			                     업종 : ${myStoreInfo.business_type_name1}&nbsp;>&nbsp;${myStoreInfo.business_type_name2}<br>
			                     주소 : ${myStoreInfo.addr_gu}&nbsp;${myStoreInfo.addr_dong}&nbsp;${myStoreInfo.addr_detail}<br>
			                     전화번호 : ${myStoreInfo.store_tel_num}   
			            </c:forEach>
			       </table>    	
					<div class="pagingDiv2">&nbsp;<span class="pagingNumber2"></span>&nbsp;</div>
	     			 <input type="hidden" name="selectPageNo2"> 
	     	</form>
       </div>      
 <!-- =========================================== -->
 <!-- ==========                    /이정숙꺼끝                =========== -->     
 <!-- =========================================== --> 	
 
 
				
      <div id = "container" style = "width: 550px; height: 270px; margin: 0 auto">
      </div>
      <script language = "JavaScript">
         function drawChart() {
            // Define the chart to be drawn.
           var data = google.visualization.arrayToDataTable([
               [         '판매일자(월)',                             '매출액(원)' ,             { role: 'style' },  { role: 'annotation' }         ],
               [ ${salesNow[0].now_sales_date} + ' 총매출',  ${salesNow[0].now_sales_amount},  'color: #7966e3;',  ${salesNow[0].now_sales_amount} ], 
               [ ${salesNow[0].now_sales_date} + ' 순매출',  ${salesNow[0].now_sales_income},  'color: #b2a9e7;',  ${salesNow[0].now_sales_income} ],
               [ ${salesNow[1].now_sales_date} + ' 총매출',  ${salesNow[1].now_sales_amount},  'color: #74a2f2;',  ${salesNow[1].now_sales_amount} ],
               [ ${salesNow[1].now_sales_date} + ' 순매출',  ${salesNow[1].now_sales_income},  'color: #9abbf4;',  ${salesNow[1].now_sales_income} ]
            ]);

           var options = {
                   title: '[전월대비 당월 매출현황(원)]'
                   , tooltip:{textStyle : {fontSize:12}, showColorCode : true}
                   , legend: { position: "none" }
                    , bar: {groupWidth: "42%"}
                     , isStacked: false
                     , animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                           startup: true,
                           duration: 1000,
                           easing: 'linear' }
                     , annotations: {
                      textStyle: {
                         fontSize : 13
                         , bold: true
                         , italic: true
                         , color: '#white'
                         ,  auraColor: '#black'
                         ,  opacity: 0.8

                      }
                      }    
                     
             }; 

            // Instantiate and draw the chart.
            var chart = new google.visualization.BarChart(document.getElementById('container'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
      </script>
  
 
 <br><br>
 
  <header class="panel-heading no-border">
             <a href="">내가 쓴글 보기</a>
              </header>
 		<div class="panel-body"> 
 		 <div class="col-sm-12" align="center">
	   <table  class="table table-bordered"  align=center id="mystore">
	   
	   <form name="myQstnList" method="post" action="/posbis/homePageForm.do" align="center" ><br>
<!-- 				<b>내가 쓴 글</b> -->
				<table border=0 width="500" align="center">
				<tr><td align = right>
				[나의글 총개수] : ${myQstnAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
				</table>
				
				<div style="border: 0px solid;">&nbsp;<span class="pagingNumber"></span> &nbsp;
				</div>
				<table class="table table-striped table-advance table-hover"> 
					<thead>
					<tr>
						<th align=right>번호
						<th align=right>글제목
						<th align=right>등록일
						<th align=right>댓글수
					<c:forEach items="${myQstnList}" var="myQstn" varStatus="loopTagStatus">
					 
					<tr style="cursor: pointer" onClick="goMyQstnForm();">
						<td >
						${myQstn.selectPageNo*myQstn.rowCntPerPage-
									 				myQstn.rowCntPerPage+1+loopTagStatus.index}
						<td  >${myQstn.subject}
						<td  >${myQstn.qna_date}
						<td >${myQstn.reply_cnt}
					</c:forEach>
				<!------------------------------------------------>
				</table>
					<c:if test="${empty myQstnList}">
						<br>
						고객님께서 쓰신글이 존재하지 않습니다.
					</c:if>
			</form>
  		<tr>
                  <th>
       </table>   		 
 
</section>
</div>
</div>
</div>
</section>
</section>
</main>

<!--==========================
    꼬리말
  ============================-->
	<footer class="footer-section">
		<div class="container">
			<a href="index.html" class="footer-logo"> 
			<img src="resources/bootstrap/img/POSBIS_logo.png" alt="">
			</a>
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
 