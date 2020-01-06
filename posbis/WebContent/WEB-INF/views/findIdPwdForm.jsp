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
  <!-- =======================================================  -->
  </head>
      <script>
         function findIdPwdStart(){
        	 
 			 //alert("아이디/비밀번호 찾기 시작")
	    	  
	    	  $.ajax({
	         	 url : "/posbis/findIDPassword.do"
	         	, type : "post"
	         	, data : $("[name=findIdPwdForm]").serialize()
	         	, success : function(findIDPassword) {
	         		if( findIDPassword.user_id!=null && findIDPassword.user_id!=null ){
	         			alert("등록된 아이디는"+findIDPassword.user_id+"비밀번호는"+findIDPassword.user_pwd+"입니다");
	         			location.replace('/posbis/findIdPwdForm.do');
	         			
	         		}else if( findIDPassword.user_id==null && findIDPassword.user_id==null ) {
	         			alert("해당 아이디, 비밀번호, 사업자 등록번호가 존재하지 않습니다. 재입력 바랍니다.");
	         			location.replace('/posbis/findIdPwdForm.do');
	         			
	         		}
	         		else {
	                     alert("서버 오류 발생!! 관리자에게 문의 바랍니다.");
	         		}
	         	
	         	}, error : function(){
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
       	
        
           function goJoinForm(){
       	    alert("로그인 페이지로 이동합니다. 감사합니다");
       	    location.replace("/posbis/mainForm.do");

       	 }

    		
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
             <h1 style="cursor:pointer"  class="text-light"><a  onClick="goMainForm();" class="scrollto"><span>POSBIS</span></a></h1>
             <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
           </div>

           <nav class="main-nav float-right d-none d-lg-block">
 
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
      아이디 비밀번호 찾기
    ============================-->  
  
  
    <main id="main">
	
	 <section id="main-content">
	      <section class="wrapper">
	      
         <div class="col-lg-6" align="center">
            <section class="panel">
              <header class="panel-heading">
                 [아이디/비밀번호 찾기]
              </header>
              <div class="panel-body"> 
                  <form name="findIdPwdForm" class="form-validate form-horizontal" id="feedback_form"  >
                  
                  <div class="form-group"> 
                    <label for="cname" class="control-label col-lg-2">이름 <span class="required">*</span></label>
                    <div class="col-lg-6">
                        <input type="text" name="user_name" class="form-control" id="exampleInputEmail1"  >
                      </div> 
                  </div>
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">사업자 등록 번호 <span class="required">*</span></label>
                    <div class="col-lg-6">
                        <input type="text"  name="business_no" class="form-control" id="exampleInputEmail1"  >
                      </div> 
                  </div>
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">질문 <span class="required">*</span></label>
                    <div class="col-lg-6">
                     <!--    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
                        
                        <select name="question_code" size=1 class="form-control" id="exampleInputEmail1" > 
			                  <option value="" selected> --선택요망--</option>
			                  <option value="1">자신의 보물 1호는?</option>
			                  <option value="2">졸업한 초등학교 이름은?</option>
			                  <option value="3">어머니의 이름은?</option>
			                  <option value="4">존경하는 인물은?</option>
			             </select>
                      </div> 
                  </div>
                  
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">답변 <span class="required">*</span></label>
                    <div class="col-lg-6">
                        <input type="text" name="answer" class="form-control" id="exampleInputEmail1"  >
                      </div> 
                  </div>
                  
        			 <div style="float:right">
                   <button class="btn btn-primary" type="button" value="메인으로" onClick="findIdPwdStart();"  >아이디 비밀번호 찾기 </button>
 				  <button class="btn btn-success" type="button" value="메인으로" onClick="goJoinForm();" >로그인 하기 </button>
 					</div>
 					
 					
 					
                </form>

              </div>
            </section>
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
 