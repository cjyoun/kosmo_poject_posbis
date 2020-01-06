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
  <!-- =======================================================-->

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


<script>
	function checkWithdrawal(){
		
		if(is_empty("[name=user_pwd]")){
			alert("비밀번호를 입력해주세요.");
			$("[name=user_pwd]").focus();
			return;
		}
		if(is_empty("[name=withdrawalReason]")){
			alert("탈퇴사유를 선택해주세요.");
			$("[name=withdrawalReason]").focus();
			return;
		}
		exitPopup();	
	}


	function exitPopup(){
	
		if (confirm("정말 탈퇴하시겠습니까??") == true){
			goWithdrawalForm();
		}else{
		    return;
		}
	}

	function goWithdrawalForm(){

 //*************************************************************************************   
 //ajax를 통해 아이디 암호 맞는 사용자 삭제하기     
   		 $.ajax({ 
   			url : "/posbis/withdrawalProc.do"
			, type : "post"
			, data : $("[name=withdrawalForm]").serialize()
			, success : function(withdrawalCnt){
				
				if(withdrawalCnt == 1){
					alert("탈퇴 완료 되었습니다. \n그동안 POSBIS 를 이용해주셔서 감사합니다.");
					location.replace("/posbis/mainForm.do")
				
				}else if(withdrawalCnt==-1){
						alert("이미 탈퇴한 회원 또는 등록된 사용자가 아닙니다.");
						location.replace("/posbis/withdrawalForm.do")
				
				}else if(withdrawalCnt==0){
						alert("입력하신 비밀번호가 일치하지 않습니다.");
						location.replace("/posbis/withdrawalForm.do")
				}else {
					alert("서버쪽 DB 연동 실패!");
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
	
	
	
	//qna 게시판- 자주묻는 질문 보기
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

       <div class="header">
 

           <div class="logo float-left">
             <!-- Uncomment below if you prefer to use an image logo -->
             <h1 style="cursor:pointer"  class="text-light"><a  onClick="goMainForm();" class="scrollto"><span>POSBIS</span></a></h1>
             <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
           </div>
   
          	   <div   class= "loginmaintaining">
                      <a  "><i class="icon_profile"></i>&nbsp;&nbsp;&nbsp;<b>${user_id}</b> 님 반갑습니다</a><br><br>                     
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
		회원탈퇴
============================-->
     <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-6" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">회원탈퇴</a>
              </header>
             <div class="panel-body"> 
			
      <div class="container">
                  <form name="withdrawalForm" class="form-validate form-horizontal" id="feedback_form"  >
                  
                  <div class="form-group"> 
                    <label for="cname" class="control-label col-lg-2">아이디 <span class="required">*</span></label>
                    <div class="col-lg-6">
                        ${user_id}
                      </div> 
                  </div>
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">비밀번호<span class="required">*</span></label>
                    <div class="col-lg-6">
                        <input type="password"  name="user_pwd" class="form-control" id="exampleInputEmail1"  >
                      </div> 
                  </div>
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">탈퇴사유 <span class="required">*</span></label>
                    <div class="col-lg-6">
                     <!--    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
                        
                        <select name="withdrawalReason" size=1 class="form-control" id="exampleInputEmail1" > 
			                  <option value="" selected> ---- 탈퇴사유를 선택해주세요 ----</option>
			                  <option value="1">컨텐츠 부족</option>
			                  <option value="2">이용불편</option>
			                  <option value="3">사용빈도수 낮음</option>
			                  <option value="4">폐업</option>
			             </select>
                      </div> 
                  </div>
                  
 
                  
        			<input type="text" name="user_id" value="${user_id}">
        			<input type="text" name="u_no" value="${u_no}">
        			
        		  <div style="float:right">	
                    <button class="btn btn-primary" type="button" value="탈퇴" onClick="checkWithdrawal()"> 탈퇴 </button>&nbsp;&nbsp;
 					<button class="btn btn-danger" type="button" value="최소" onClick="goMyPageForm()"> 취소 </button>
                	</div>
                </form>

              </div>
            </section>
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
 