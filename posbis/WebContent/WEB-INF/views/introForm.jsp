<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>소개</title>
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
   

  <!-- =======================================================  -->
  <style>
  .loginmaintaining {
 
	color: #6c757d;
    width: 12%;
    
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
	//내정보관리-내정보 보기
	function goMyPageForm(){
        //alert("내정보 보기으로 이동");
        location.replace("/posbis/myPageForm.do");
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
      Features Section
    ============================-->
   <br><br><br><br><main id="main">
      <section id="main-content">
		<section class="wrapper">
   		 <div class="col-lg-10" align="center">
         <section class="panel">
           <header class="panel-heading">
           </header>
            
     <div class="panel-body">
      <div class="container">
      <div class="row" align="center">
          <div class="col-sm-10">
    
           <header class="section-header">
          <h3>POSBIS</h3>
          <p>Laudem latine persequeris id sed, ex fabulas delectus quo. No vel partiendo abhorreant vituperatoribus.</p>
        </header>
    <section id="features">
 
      <div class="container">
   

        <div class="row feature-item">
          <div class="col-lg-6 wow fadeInUp">
            <img src="resources/intro/img/features-1.svg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 wow fadeInUp pt-5 pt-lg-0">
            <h4>요즘 어떤 업종이 <br>성장하고 있을까?</h4><br>
                  업종 트렌드 분석<br>
            <p>
              소상공인이 가장 많이 창업하는 73개 업종의 점포수 추이,<br>
                  매출액 추이, 점포증감률, 개/폐업률 등을 비교하여 업종의<br>
                  전반적인 트렌드를 비교 파악할 수 있습니다.
            </p>
            <p>
              Ad vitae recusandae odit possimus. Quaerat cum ipsum corrupti. Odit qui asperiores ea corporis deserunt veritatis quidem expedita perferendis. Qui rerum eligendi ex doloribus quia sit. Porro rerum eum eum.
            </p>
          </div>
        </div>

        <div class="row feature-item mt-5 pt-5">
          <div class="col-lg-6 wow fadeInUp order-1 order-lg-2">
            <img src="resources/intro/img/features-2.svg" class="img-fluid" alt="">
          </div>

          <div class="col-lg-6 wow fadeInUp pt-4 pt-lg-0 order-2 order-lg-1">
            <h4>업종에 맞는 상권을 쉽게 찾을 수<br> 있는 방법은 없을까?</span></h4>
            <p>
             바로 상권 분석</span>
                  소상공인이 가장 많이 창업하는 73개 업종의 창업위험지수<br>
                  성장성, 안정성, 구매력, 점포수 증감, 개/폐업률, 업력 등을<br>
                  비교하여 업종의 전반적인 트렌드를 비교 파악할 수 있습니다. 
            </p>
            <p>
              Voluptas saepe natus quidem blanditiis. Non sunt impedit voluptas mollitia beatae. Qui esse molestias. Laudantium libero nisi vitae debitis. Dolorem cupiditate est perferendis iusto.
            </p>
            <p>
              Eum quia in. Magni quas ipsum a. Quis ex voluptatem inventore sint quia modi. Numquam est aut fuga mollitia exercitationem nam accusantium provident quia.
            </p>
          </div>
          
        </div>

      </div>
    </section><!-- #about -->
   <!--==========================
      Services Section
    ============================-->
    <section id="services" class="section-bg">
      <div class="container">

        <header class="section-header">
          <h3>Services</h3>
          <p>Laudem latine persequeris id sed, ex fabulas delectus quo. No vel partiendo abhorreant vituperatoribus.</p>
        </header>

        <div class="row">

          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #fceef3;"><i class="ion-ios-analytics-outline" style="color: #ff689b;"></i></div>
              <h4 class="title"><a href="">내 점포 마케팅 분석</a></h4>
              <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #fff0da;"><i class="ion-ios-bookmarks-outline" style="color: #e98e06;"></i></div>
              <h4 class="title"><a href="">업종 변경 분석</a></h4>
              <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #e6fdfc;"><i class="ion-ios-paper-outline" style="color: #3fcdc7;"></i></div>
              <h4 class="title"><a href="">소상공인 지원 서비스</a></h4>
              <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
            </div>
          </div>
      
        </div>

      </div>
    </section><!-- #services -->
    <!--==========================
      Team Section
    ============================-->
    <section id="team" class="section-bg">
      <div class="container">
        <div class="section-header">
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
      자주 묻는 질문 FAQ
    ============================-->
    <a name="FAQ">
    <section id="faq">
      <div class="container"><!--==========================
      Clients Section
    ============================-->
    <section id="clients" class="wow fadeInUp">
      <div class="container">

        <header class="section-header">
          <h3>고객사</h3>
        </header>

        <div class="owl-carousel clients-carousel">
          <img src="resources/intro/img/clients/client-1.png" alt="">
          <img src="resources/intro/img/clients/client-2.png" alt="">
          <img src="resources/intro/img/clients/client-3.png" alt="">
          <img src="resources/intro/img/clients/client-4.png" alt="">
          <img src="resources/intro/img/clients/client-5.png" alt="">
          <img src="resources/intro/img/clients/client-6.png" alt="">
          <img src="resources/intro/img/clients/client-7.png" alt="">
          <img src="resources/intro/img/clients/client-8.png" alt="">
        </div>

      </div>
    </section><!-- #clients -->
        <header class="section-header">
          <h3>FAQ</h3>
          <p>자주 묻는 질문</p>
        </header>

        <ul id="faq-list" class="wow fadeInUp">
          <li>
            <a data-toggle="collapse" class="collapsed" href="#faq1">회원탈퇴 후 언제 재가입 가능한가요? <i class="ion-android-remove"></i></a>
            <div id="faq1" class="collapse" data-parent="#faq-list">
              <p>
                개인정보는 한 달간 보관합니다. 한 달 후에 재가입 가능합니다. 
              </p>
            </div>
          </li>

          <li>
            <a data-toggle="collapse" href="#faq2" class="collapsed">아침은 먹고 일하시는 건가요?<i class="ion-android-remove"></i></a>
            <div id="faq2" class="collapse" data-parent="#faq-list">
              <p>
                늘상 챙기려 노력합니다.
              </p>
            </div>
          </li>

          <li>
            <a data-toggle="collapse" href="#faq3" class="collapsed">Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi? <i class="ion-android-remove"></i></a>
            <div id="faq3" class="collapse" data-parent="#faq-list">
              <p>
                Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
              </p>
            </div>
          </li>

          <li>
            <a data-toggle="collapse" href="#faq4" class="collapsed">Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla? <i class="ion-android-remove"></i></a>
            <div id="faq4" class="collapse" data-parent="#faq-list">
              <p>
                Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
              </p>
            </div>
          </li>

          <li>
            <a data-toggle="collapse" href="#faq5" class="collapsed">Tempus quam pellentesque nec nam aliquam sem et tortor consequat? <i class="ion-android-remove"></i></a>
            <div id="faq5" class="collapse" data-parent="#faq-list">
              <p>
                Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in
              </p>
            </div>
          </li>

          <li>
            <a data-toggle="collapse" href="#faq6" class="collapsed">Tortor vitae purus faucibus ornare. Varius vel pharetra vel turpis nunc eget lorem dolor? <i class="ion-android-remove"></i></a>
            <div id="faq6" class="collapse" data-parent="#faq-list">
              <p>
                Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Nibh tellus molestie nunc non blandit massa enim nec.
              </p>
            </div>
          </li>

        </ul>

      </div>
    </section><!-- #faq -->
    
     <section id="clients" class="wow fadeInUp">
      <div class="container">

        <header class="section-header">
          <h3 style="cursor:pointer" onClick="goJoinForm();">SIGN UP</h3>
        </header>
        </div>
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
 