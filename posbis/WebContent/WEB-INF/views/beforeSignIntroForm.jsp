<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  
   <title>회사소개</title>

	<meta name="description" content="loans HTML Template">
	<meta name="keywords" content="loans, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Favicon -->
	<link href="resources/bootstrap/img/favicon.ico" rel="shortcut icon"/>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
 
	<!-- Stylesheets -->
	<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="resources/bootstrap/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="resources/bootstrap/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="resources/bootstrap/css/flaticon.css"/>
	<link rel="stylesheet" href="resources/bootstrap/css/slicknav.min.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="resources/bootstrap/css/style.css"/>

   

  <!-- =======================================================
    Theme Name: Rapid
    Theme URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
  
  <script>
  
//--------------------------------------------------------
  //로고 클릭시
    function goMainForm(){
       //alert("로그인 화면으로 이동");
       location.replace("/posbis/mainForm.do");
    }
	
 
    function goJoinForm(){
	    //alert("회원가입 페이지로 이동합니다. 감사합니다");
	    location.replace("/posbis/joinForm.do");

	 }
		

			
			
  </script>
  
  
  
</head>

<body>
    <!--==========================
  Header 상단 바
  ============================-->
	<header class="header-section">
		<a onClick="goMainForm();" class="site-logo" style="cursor:pointer;">
			<img src="resources/bootstrap/img/POSBIS_logo.png" alt="">
		</a>

		<a onClick="goJoinForm();" style="cursor:pointer; float:right; color:#fff; padding:30px 100px 30px 30px ">회원가입 하러 가기</a> 

	</header><!-- #header -->
    

	<!-- Page top Section end -->
	<section class="page-top-section set-bg" data-setbg="resources/bootstrap/img/page-top-bg/1.jpg">
		<div class="container"  style="margin: -25px 0 0 250px;">
			<h2 style="font-size:65px"><strong>회사소개</strong></h2>
		</div>
	</section>
	<!-- Page top Section end -->


    <!--==========================
      Features Section
    ============================-->
    <!--==========================
      Features Section
    ============================-->
    <header class="section-header"><center>
	    <br><br><br>
	    <br>
      	<h3>POSBIS</h3><br>
      	<p>POSBIS는 늘 가까이에서 당신의 사업을 응원합니다. POSBIS와 함께 걸어갈 날들을 환영합니다.</p>
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
						<h2>POSBIS is...</h2>
						<p>POSBIS는 서울의 소상공인을 위한 통계 및 분석 전문 기업으로서 포스 단말기 및 주변 기기기의 제조, 소프트웨어 개발 등 국내 유일의 POS 토탈 서비스 회사입니다.
						<br>POSBIS는 항상 도전하는 정신으로 시장을 리드하는 제품 개발과 동시에 소상공인을 위한 통계 분석에 총력을 기울이고 있습니다.
							소상공인 여러분들이 쉽고 간단하게 고도의 정보를 활용하여 유통정보화 시대에 대응할 수 있는 새로운 경영 전략을 확립하실 수 있도록 돕기 위해 늘 최선을 다하고 있습니다.
						<br>POS가 설치된 불특정 다수의 가맹점으로부터 데이터를 전송받아 종래의 POS 시스템으로는 불가능했던 판매 동향, 매출 추이 등의 분석 데이터를 제공하여 전략적 경영합리화의 구축을 가능하게 해주는 네트워크 POS 시스템을 운영하고 있습니다.</p>
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
          <center><h3>Services</h3><br>
          <p>저희 POSBIS가 제공하는 서비스들입니다. 항상 여러분께 도움이 되는 서비스로 다가가겠습니다.</p></center>
        </header>

        <div class="row">

          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-duration="1.4s">
          
            <div class="box">
            
              <div class="icon" style="background: #fceef3;"><i class="ion-ios-analytics-outline" style="color: #ff689b;"></i></div>
              <br>
              <h4 class="title">내 점포 마케팅 분석</h4><br>
              <p class="description">내 점포 마케팅 분석으로 여러분의 상점을 분석해드립니다.<br>우리 점포에서 가장 많이 나가는 제품이 무엇인지, 가장 많은 매출을 달성한 달이 언제인 지 상세하게 분석해드립니다.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #fff0da;"><i class="ion-ios-bookmarks-outline" style="color: #e98e06;"></i></div>
              <br>
              <h4 class="title">업종 변경 분석</h4><br>
              <p class="description">주변 상권에서 가장 잘나가는 업종이 무엇인지도 알려드립니다. 만약 업종을 변경하고 싶으시다면 POSBIS가 정답입니다.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #e6fdfc;"><i class="ion-ios-paper-outline" style="color: #3fcdc7;"></i></div>
              <br>
              <h4 class="title">소상공인 지원 서비스</h4><br>
              <p class="description">POSBIS는 항상 소상공인 여러분을 응원합니다.<br>소상공인들을 위해 각종 소상공인 사이트와의 연결고리가 되어 드리겠습니다.</p>
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
<!--     ==========================
      Team Section
    ============================
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
              <img src="resources/bootstrap/img/team-1.jpg" class="img-fluid" alt="">
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
              <img src="resources/bootstrap/img/team-2.jpg" class="img-fluid" alt="">
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
              <img src="resources/bootstrap/img/team-3.jpg" class="img-fluid" alt="">
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
              <img src="resources/bootstrap/img/team-4.jpg" class="img-fluid" alt="">
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
              <img src="resources/bootstrap/img/testimonial-1.jpg" class="img-fluid" alt="">
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
              <img src="resources/bootstrap/img/testimonial-2.jpg" class="img-fluid" alt="">
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
              <img src="resources/bootstrap/img/testimonial-3.jpg" class="img-fluid" alt="">
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
    </section>#team -->
    
    
    <section>
	    <div class="map" style="width:1200; margin:60 0 120 351">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3166.238950154267!2d126.87645931558676!3d37.478687236911554!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b61fcb47b582b%3A0x536ee2f714c1e156!2z7JuU65Oc66mU66W065SU7JWZ67Kk7LKY7IS87YSwMuywqA!5e0!3m2!1sko!2skr!4v1578973183240!5m2!1sko!2skr" style="border:0" allowfullscreen></iframe>		</div>
	</section>
<!--    ===============
    꼬리말
  ============================-->
	<footer class="footer-section">
		<div class="container">
			
			<img class="footer-logo" src="resources/bootstrap/img/POSBIS_logo.png" alt="">

			<div class="row">

				<div class="footer-widget">

					<p>POSBIS는 항상 도전하는 정신으로 고객 편의성 증대를 위하여 혁신 기술을 도입하고, 세련된 디자인과 높은 성능으로 국내의 POS 통계 분석 업계 표준을 설정 및 유지해 나가고 있습니다. 항상 행복과 고객님의 사업이 번창하시기를 기원합니다.</p>
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

</body>
</html> 