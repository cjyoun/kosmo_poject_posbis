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



  <script>

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
			<h2>회사소개</h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
				<span class="sb-item active">INFO</span>&nbsp; > &nbsp; <span class="sb-item active">POSBIS</span>
			</nav>
			</div>
			
		</div>
	</section>
	<!-- Page top Section end -->



    <!--==========================
      Features Section
    ============================-->
    <header class="section-header"><center>
	    <br><br><br>
	    <br>
      	<h3>POSBIS</h3>
      	<p>Laudem latine persequeris id sed, ex fabulas delectus quo. No vel partiendo abhorreant vituperatoribus.</p>
    </header>
    <!-- About Section end -->
	<section class="about-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-5">
					<img src="resources/bootstrap/img/about-img.jpg" alt="">
				</div>
				<div class="col-lg-7">
					<div class="about-text">
						<h2>A team to help you</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tem por incididunt ut labore et dolore mag na aliqua.  Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse potenti. Ut gravida mattis magna, non varius lorem sodales nec. In libero orci, ornare non nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tem por incididunt ut labore et dolore mag na aliqua.  Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse potenti. Ut gravida mattis magna, non varius lorem sodales nec. In libero orci, ornare non nisl.</p>
						<a href="#" class="site-btn">Find out more</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section end -->
	
	
   <!--==========================
      Services Section
    ============================-->
    <section id="services" class="section-bg">
      <div class="container">

        <header class="section-header">
        <br><br><br><br>
          <h3>Services</h3>
          <p>Laudem latine persequeris id sed, ex fabulas delectus quo. No vel partiendo abhorreant vituperatoribus.</p>
        </header>

        <div class="row">

          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-duration="1.4s">
          
            <div class="box">
            
              <div class="icon" style="background: #fceef3;"><i class="ion-ios-analytics-outline" style="color: #ff689b;"></i></div>
              <br>
              <h4 class="title"><a href="">내 점포 마케팅 분석</a></h4>
              <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #fff0da;"><i class="ion-ios-bookmarks-outline" style="color: #e98e06;"></i></div>
              <br>
              <h4 class="title"><a href="">업종 변경 분석</a></h4>
              <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #e6fdfc;"><i class="ion-ios-paper-outline" style="color: #3fcdc7;"></i></div>
              <br>
              <h4 class="title"><a href="">소상공인 지원 서비스</a></h4>
              <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
            </div>
          </div>
         <!--  <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #eafde7;"><i class="ion-ios-speedometer-outline" style="color:#41cf2e;"></i></div>
              <h4 class="title"><a href="">Magni Dolores</a></h4>
              <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.2s" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #e1eeff;"><i class="ion-ios-world-outline" style="color: #2282ff;"></i></div>
              <h4 class="title"><a href="">Nemo Enim</a></h4>
              <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.2s" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #ecebff;"><i class="ion-ios-clock-outline" style="color: #8660fe;"></i></div>
              <h4 class="title"><a href="">Eiusmod Tempor</a></h4>
              <p class="description">Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi</p>
            </div>
          </div>
 -->
        </div>

      </div>
    </section><!-- #services -->
    <!--==========================
      Team Section
    ============================-->
    <section id="team" class="section-bg">
      <div class="container">
        <div class="section-header">
        <br><br><br><br>
          <h3>Team</h3>
          <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
        </div>

        <div class="row">

          <div class="col-lg-3 col-md-6 wow fadeInUp">
            <div class="member">
              <img src="resources/intro/img/team-1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>채 재윤</h4>
                  <span>Chief Executive Officer</span>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
            <div class="member">
              <img src="resources/intro/img/team-2.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>성 유진</h4>
                  <span>Product Manager</span>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
            <div class="member">
              <img src="resources/intro/img/team-3.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>이 정숙</h4>
                  <span>CTO</span>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
            <div class="member">
              <img src="resources/intro/img/team-4.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김 수민</h4>
                  <span>Accountant</span>
                </div>
              </div>
            </div>
          </div>
         
      <br>
      
      <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
            <div class="member">
              <img src="resources/intro/img/testimonial-1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김 수정</h4>
                  <span>Accountant</span>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
            <div class="member">
              <img src="resources/intro/img/testimonial-2.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>최 수현</h4>
                  <span>Accountant</span>
                </div>
              </div>
            </div>
          </div>   
      
      
          
          <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
            <div class="member">
              <img src="resources/intro/img/testimonial-3.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김 윤미</h4>
                  <span>Accountant</span>
                </div>
              </div>
            </div>
          </div>   
        </div>

      </div>
    </section><!-- #team -->
    
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