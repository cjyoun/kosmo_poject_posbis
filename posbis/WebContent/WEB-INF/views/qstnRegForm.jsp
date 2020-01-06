<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
 
  <title>메인</title>
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
  <link href="resources/sidetopbar/css/style-responsive.css" rel="stylesheet" />
  <link href="resources/sidetopbar/css/xcharts.min.css" rel=" stylesheet">
  <link href="resources/sidetopbar/css/jquery-ui-1.10.4.min.css" rel="stylesheet"> 
  
  <link rel="stylesheet" type="text/css" href="resources/intro/css/util.css">
 
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
 