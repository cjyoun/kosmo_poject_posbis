<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디/암호 찾기</title>
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
  </head>
      <script>
         function findIdPwdStart(){
        	 
 			 //alert("아이디/비밀번호 찾기 시작")
	    	  
	    	  $.ajax({
	         	 url : "/posbis/findIDPassword.do"
	         	, type : "post"
	         	, data : $("[name=findIdPwdForm]").serialize()
	         	, success : function(findIDPassword) {
	         		if( findIDPassword.user_id!=null && findIDPassword.user_pwd!=null ){
	         			alert("등록된 아이디는 "+findIDPassword.user_id+"\n비밀번호는 "+findIDPassword.user_pwd+" 입니다");
	         			
	         			location.replace('/posbis/findIdPwdForm.do');
	         			
	         		}else if( findIDPassword.user_id==null && findIDPassword.user_pwd==null ) {
	         			alert("해당 아이디, 비밀번호, 사업자 등록번호가 존재하지 않습니다.");
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
               //alert(" 페이지로 이동합니다. 감사합니다");
               location.replace("/posbis/joinForm.do");

            }


         
      </script>
 

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
			<h2 style="font-size:65px"><strong>아이디/비밀번호 찾기</strong></h2>
		</div>
	</section>
	<!-- Page top Section end -->

  
    <!--==========================
      아이디 비밀번호 찾기
    ============================-->  
  
  
    <main id="main">
	
	 <section id="main-content">
	      <section class="wrapper">
	      
         <div class="col-lg-8" align="center" style="margin:0 0 0 320">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                <font color="#39485f">[아이디/비밀번호 찾기]</font> 
              </header>
              <div class="panel-body"> 
                  <form name="findIdPwdForm" class="form-validate form-horizontal" id="feedback_form"  >
                  
                  <div class="form-group"> 
                    <label for="cname" class="control-label col-lg-2" style="margin:0 30 0 80">이름 <span class="required">*</span></label>
                    <div class="col-lg-6">
                        <input type="text" name="user_name" class="form-control" id="exampleInputEmail1"  >
                      </div> 
                  </div>
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2" style="margin:0 30 0 80">사업자 등록 번호 <span class="required">*</span></label>
                    <div class="col-lg-6">
                        <input type="text"  name="business_no" class="form-control" id="exampleInputEmail1"  >
                      </div> 
                  </div>
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2" style="margin:0 30 0 80">질문 <span class="required">*</span></label>
                    <div class="col-lg-6">
                     <!--    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
                        
                        <select name="question_code" size=1 class="form-control" id="exampleInputEmail1" > 
			                  <option value=''>---질문을 선택해주세요---</option>
                              <option value="1">내가 졸업한 초등학교 이름은?</option>
                              <option value="2">나의 보물 1호는?</option>
                              <option value="3">가장 기억에 남는 선생님의 이름은?</option>
                              <option value="4">가장 감명깊게 본 영화는?</option>
			             </select>
                      </div> 
                  </div>
                  
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2" style="margin:0 30 0 80">답변 <span class="required">*</span></label>
                    <div class="col-lg-6">
                        <input type="text" name="answer" class="form-control" id="exampleInputEmail1"  >
                      </div> 
                  </div>
                  
        			 <div style="margin:30 0 0 0">
                   <button class="btn btn-default" type="button" value="메인으로" onClick="findIdPwdStart();" style="margin:0 50 0 0" >아이디 비밀번호 찾기 </button>
 				  <button class="btn btn-default" type="button" value="메인으로" onClick="goMainForm();" >로그인 하기 </button>
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
 