<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Rapid Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="resources/intro/img/favicon.png" rel="icon">
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
  <link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
  <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
  <!-- Custom styles -->
  <link rel="stylesheet" href="css/fullcalendar.css">
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
</head>

<script type = "text/javascript" src = "https://www.gstatic.com/charts/loader.js">
      </script>
      <script type = "text/javascript">
         google.charts.load('current', {packages: ['corechart']});     
      </script>
      
       
   <script>         
      
		$(document).ready(function(){
			
			
			  //alert("xdxx");
//=====================================================================================================
      
//=====================================================================================================
	});



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
	   		//--------------------------------------------------------

	   		
	   		function goMessageForm(){
	   		    alert("건의사항이 접수 되었습니다. 감사합니다");
	   	 
	   		 }
	   				


	       </script>

 


   <body>
   <!--==========================
  Header
  ============================-->
  <header id="header">

         <div id="topbar">
           <div class="container">
          
           </div>
         </div>

         <div class="container">

           <div class="logo float-left">
             <!-- Uncomment below if you prefer to use an image logo -->
             <h1 class="text-light"><a  onClick="goMainForm();" class="scrollto"><span>POSBIS</span></a></h1>
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
		              <li><a onClick="goHomePageForm();">통합 관리</a></li>
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
           	  <li><a onClick="goMyQstnForm();">내글보기</a></li>
           	  <li><a onClick="goQstnForm();">목록보기</a></li>
            </ul>
          </li>
          
          
          <li  class="drop-down"> <a href=""><i class="icon_profile"></i> ${user_id} 님</a> 
           <ul>
           		
              <li><a onClick="goMyPageForm();"><i class="icon_profile"></i>&nbsp;&nbsp;내정보 보기</a></li>
           		<li><a onClick="goHomePageForm();"><i class="icon_documents_alt"></i>&nbsp;&nbsp;통합관리</a></li>
           	  <li><a onClick="goMainForm();"><i class="icon_key_alt"></i>&nbsp;&nbsp;Log Out</a></li>
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
          <h2>MYPAGE<br>In <span>POSBIS</span></h2>
 
        </div>
  
        <div class="col-md-6 intro-img order-md-last order-first">
          <img src="resources/intro/img/intro-img.svg" alt="" class="img-fluid">
        </div>
      </div>

    </div>
  </section> 
 


    <!--==========================
      통합관리
    ============================-->

  <main id="main">
   <section id="main-content">
   <section class="wrapper">
     <div class="row">
           <div class="col-lg-10" align="center">
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">마이페이지</a></li>
              <li><i class="icon_documents_alt"></i>통합관리</li>
            </ol>
                      </div>
        </div>
       <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   통합관리
              </header>
              
              <div class="panel-body">
 

      <div class="container">
 <div class="row" align="center">
          <div class="col-sm-10">
            <section class="panel">
              <header class="panel-heading no-border">
              통합 개인정보
              </header>
 
 
	   <table  class="table table-bordered"   id="mystore">
            <c:forEach items="${myStoreInfoList}" var="myStoreInfo" varStatus="status">
               <!-- <script>alert("${status.count}"%3);</script> -->
               <c:if test="${status.index%3==0}">
                  <tr cellpadding=15>
               </c:if>
               
            
               
               <td> 업종별 이미지
               <td> 상호명 : ${myStoreInfo.business_name} <br>
                     사업자 번호 : ${myStoreInfo.business_no} <br>
                     업종 : ${myStoreInfo.business_type_name1}&nbsp;>&nbsp;${myStoreInfo.business_type_name2}<br>
                     주소 : ${myStoreInfo.addr_gu}&nbsp;${myStoreInfo.addr_dong}&nbsp;${myStoreInfo.addr_detail}<br>
                     전화번호 : ${myStoreInfo.store_tel_num}   
            </c:forEach>
       </table>        
				
				
      <div id = "container" style = "width: 550px; height: 270px; margin: 0 auto">
      </div>
      <script language = "JavaScript">
         function drawChart() {
            // Define the chart to be drawn.
            var data = google.visualization.arrayToDataTable([
               ['판매일자(월)', '매출액(원)'],
               [ ${salesNow[0].now_sales_date} + ' 총매출',  ${salesNow[0].now_sales_amount}],
               [ ${salesNow[0].now_sales_date} + ' 순매출',  ${salesNow[0].now_sales_income}],
               [ ${salesNow[1].now_sales_date} + ' 총매출',  ${salesNow[1].now_sales_amount}],
               [ ${salesNow[1].now_sales_date} + ' 순매출',  ${salesNow[1].now_sales_income}]
            ]);

            var options = {title: '전월대비 당월 매출현황'}; 

            // Instantiate and draw the chart.
            var chart = new google.visualization.BarChart(document.getElementById('container'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
      </script>
  
 

      <div class="container">
 <div class="row" align="center">
         <div class="col-sm-10">
            <section class="panel">
              <header class="panel-heading no-border">
            내가 쓴글 보기
              </header>
 
	   <table  class="table table-bordered"  align=center id="mystore">
	   
	   <form name="myQstnList" method="post" action="/posbis/homePageForm.do" align="center" ><br>
<!-- 				<b>내가 쓴 글</b> -->
				<table border=0 width="500" align="center">
				<tr><td align = right>
				[나의글 총개수] : ${myQstnAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
				</table>
				
				<div style="border: 0px solid;">&nbsp;<span class="pagingNumber"></span> &nbsp;
				</div>
				<table border=1 cellspacing=0 cellpadding=5 width="500" align="center">
					<tr>
						<th>번호
						<th>글제목
						<th>등록일
						<th>댓글수
					<c:forEach items="${myQstnList}" var="myQstn" varStatus="loopTagStatus">
					<tr>
						<td align=center>
						${myQstn.selectPageNo*myQstn.rowCntPerPage-
									 				myQstn.rowCntPerPage+1+loopTagStatus.index}
						<td align=center>${myQstn.subject}
						<td align=center>${myQstn.qna_date}
						<td align=center>${myQstn.reply_cnt}
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
                      <li><a href="#">홈</a></li>
                      <li><a href="#login">로그인</a></li>
                      <li><a href="#FAQ">자주 묻는 질문</a></li>
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
 