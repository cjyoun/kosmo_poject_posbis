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
  <link href="resources/sidetopbar/css/style-responsive.css" rel="stylesheet" />
  <link href="resources/sidetopbar/css/xcharts.min.css" rel=" stylesheet">
  <link href="resources/sidetopbar/css/jquery-ui-1.10.4.min.css" rel="stylesheet"> 
  
  
 

 
<!-- ------------------------------------------------------------------ -->
<!-- 만약에 상세보기할 게시판 글이 없으면 경고 후 이전 화면으로 이동하기-->
<!-- ------------------------------------------------------------------ -->
<%--   <c:if test="${empty qstnDTO}">
	<script>
		alert("게시판 글이 삭제되었습니다.");
		location.replace("/posbis/qstnForm.do")
	</script>
</c:if>
  --%>

<html>
<head>
   <title> 게시판 수정/삭제 </title>
   <script>
   //NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
   // [게시판 수정/삭제 화면]에 입력된 데이터의 유효성 체크 함수 선언
   //NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
   function checkQstnUpDelForm(upDel){
     //----------------------------------------------------------------------------
     // 매개변수로 들어온 upDel 에 "del"이 저장되었으면
     // 즉, 삭제 버튼을 눌렀으면 암호 확인하고 삭제 여부를 물어보기
     //----------------------------------------------------------------------------
     if(upDel=="del"){
        if( is_empty("[name=qna_pwd]") ){
           alert("암호를 입력해 주세요");
           $("[name=qna_pwd]").focus();
           return;
        }
        
        //-------------------------------------------
        // name=upDel 을 가진 양식에 "del" 저장하기
        //-------------------------------------------
           // <주의> 아래 코드를 생략하면 일어나는 일
           //-----------------------------------------------------------------
           // 수정 버튼을 누르고 취소하게 되면 name=upDel 에 "up"이 들어간다
           // 그리고 삭제 버튼을 누르면 name=upDel 에 "up" 이 들어간 상태에서
           // 삭제가 진행되므로 올바른 삭제가 진행되지 않는다
        $("[name=upDel]").val("del");
        
        if(confirm("정말 삭제하시겠습니까?")==false) {return;}
     }
     //----------------------------------------------------------------------------
     // 매개변수로 들어온 upDel 에 "up"이 저장되었으면
     // 즉, 수정 버튼을 눌렀으면 각 입력양식의 유효성 체크하고 수정 여부 물어보기
     //----------------------------------------------------------------------------
     else if(upDel=="up"){
        //-------------------------------------------
        // name=upDel 을 가진 양식에 "up" 저장하기
        //-------------------------------------------
           // <주의> 아래 코드를 생략하면 일어나는 일
           //-----------------------------------------------------------------
           // 삭제 버튼을 누르고 취소하게 되면 name=upDel 에 "del"이 들어간다
           // 그리고 수정 버튼을 누르면 name=upDel 에 "del" 이 들어간 상태에서
           // 수정이 진행되므로 올바른 수정이 진행되지 않는다
        $("[name=upDel]").val("up");
           
        if(is_empty("[name=user_id]")){
              alert("이름을 입력해 주세요.");
              $("[name=wirter]").focus();
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
           
           if(confirm('정말 수정하시겠습니까?') == false){ return; }
     }
     //=================================================================================
     // 현재 화면에서 페이지 이동 없이 서버쪽 "${ctRoot}/qstnUpDelProc.do"를 호출하여
     // [게시판 수정 또는 삭제 적용 개수]를 받는다
     //=================================================================================
     //alert($('[name=qstnUpDelForm]').serialize());
     
     $.ajax({
        //------------------------------
        // 호출할 서버쪽 URL 주소 설정
        //------------------------------
        url : "/posbis/qstnUpDelProc.do"
        //-----------------
        // 전송 방법 설정
        //-----------------
        , type : "post"
        //---------------------------------------------
        // 서버로 보낼 파라미터명과 파라미터값을 설정
        //---------------------------------------------
        , data : $('[name=qstnUpDelForm]').serialize()
        //----------------------------------------------------------------------
        // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
        // 매개변수 upDelCnt 에는 [게시판 수정 또는 삭제 적용 개수]가 들어온다
        //----------------------------------------------------------------------
        , success: function(upDelCnt){
           if(upDel=="up"){

              if(upDelCnt==1){
                 alert("수정 성공!");
                 location.replace("/posbis/qstnForm.do");
              }else if(upDelCnt==-1){
                 alert("게시물이 삭제되어 수정할 수 없습니다!");
              }else if(upDelCnt==-2){
                 alert("비밀번호가 잘못 입력되었습니다!");
              }else{
                 alert("서버쪽 DB 연동 실패!");
              }
           }else if(upDel=="del"){
              if(upDelCnt==1){
                 alert("삭제 성공!");
                 location.replace("/posbis/qstnForm.do");
              }else if(upDelCnt==-1){
                 alert("이미 삭제된 게시물입니다!");
              }else if(upDelCnt==-2){
                 alert("비밀번호가 잘못 입력되었습니다!");
              }else if(upDelCnt==-3){
                 alert("댓글이 있어 삭제 불가능합니다!");
              }else{
                 alert("서버쪽 DB 연동 실패!");
              }
              
           }
        }
        //---------------------------------------------------
        // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
        //---------------------------------------------------
        , error : function(){
           alert("서버와 통신 실패!");
        }
     });
     
   }

   function goQstnForm(){
      location.replace("/posbis/qstnForm.do");
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
		//분석현황-검색관리
		function goPreSearchForm(){
	        //alert("검색관리로 이동");
	        location.replace("/posbis/preSearchForm.do");
	     }
		//분석현황-차트관리
		function goPreChartForm(){
	        //alert("차트관리로 이동");
	        location.replace("/posbis/preChartForm.do");
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
		 function goQstnForm(){
	        //alert("내글보기으로 이동");
	        location.replace("/posbis/myQstn.do");
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
</head>

<body>
<!--==========================
  Header
  ============================-->
  <header id="header">

    <div id="topbar">
      <div class="container">
        <div class="social-links">
          <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
          <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
          <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
          <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
        </div>
      </div>
    </div>

    <div class="container">
      
      <div class="logo float-left">
        <!-- Uncomment below if you prefer to use an image logo -->
        <h1 class="text-light"><a  onClick="goMainForm();" class="scrollto"><span> POSBIS</span></a></h1>
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
              <li><a onClick="gohomepageForm();">통합 관리</a></li>
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
           	  <li><a onClick="goQstnForm();">내글보기</a></li>
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
          <h2>Q&A<br>In<br><span>POSBIS</span></h2>
        
        </div>
  
        <div class="col-md-6 intro-img order-md-last order-first">
          <img src="resources/intro/img/intro-img.svg" alt="" class="img-fluid">
        </div>
      </div>

    </div>
  </section><!-- #intro -->
  
  <!-------------------------------------------------------------------------------->
<main id="main">
   <section id="main-content">
   <section class="wrapper">
     <div class="row">
           <div class="col-lg-10" align="center">
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">Q&A게시판</a></li>
              <li><i class="fa fa-user-md"></i>내글보기</li>
              <li><i class="fa fa-user-md"></i>글 수정/삭제</li>
            </ol>
          </div>
        </div>
    <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	    Q&A 게시판
              </header>
              <div class="panel-body">
 

      <div class="container">

      <div class="container">
      <c:if test = "${!empty qstnDTO}">
    <form:form name="qstnUpDelForm" method="post" commandName="qstnDTO"
                                action="/posbis/qstnUpDelProc.do">

   
         <!----------------------------------------------------------------->
         <!--  파라미터명이 qna_no인 파라미터값을 저장할 hidden 태그 선언 
              댓글 쓸 경우 qna_no라는 파라미터명에는 엄마 글의 글 번호가 들어온다  -->
         <!----------------------------------------------------------------->
       <input type="hidden" name="qna_no" value="${(empty param.qna_no)?0:param.qna_no}"> 
       <!-- 파명만 있고 파값 없으면 DTO의 속성변수에 null값만 들어감 -->
       <!-- [입]컨트롤러 클라스 안의 특정 메소드가 단 한 줄도 실행되지 않는 이유는?
           => 파값이 저장되는 매개변수 안에 파값과 매개변수 자료형이 일치가 안 돼서 실패한 것 
           첫줄에 메세지를 넣어서 시작되는지 확인부터 -->
         
         <!----------------------------------------------------------------->
         <!-- 커스텀태그의 일종인 JSTL C코어 태그를 사용하여
             파라미터명이 qna_no인 파라미터값이 비어있으면 새글쓰기 출력하고
             파라미터명이 qna_no인 파라미터값이 있으면 댓글쓰기 출력하기   -->
         <!----------------------------------------------------------------->
         
      <input type="hidden" name="qna_no" value="${qstnDTO.qna_no}">
   <div class="row" align="center">
          <div class="col-sm-6">
            <section class="panel">
              <header class="panel-heading no-border">
               문의사항 수정/삭제
              </header>
              <table class="table table-bordered">
               <tr>
                  <th>이름
                  <td><form:input path="user_id" className="user_id"/>
               <tr>
                  <th>제목
                  <td><form:input path="subject" className="subject"/>
               
               <tr>
                  <th>내용
                  <td><form:textarea path="content" className="content" rows="13" cols="40"/>
               <tr>
                  <th>비밀번호
                  <td><form:password path="qna_pwd" className="qna_pwd"/>
              </table>
            </section>
          </div>
   </div>  
   
   <br><br><br><br>             
          
          
          
      <!-- -------------------- -->
      <table><tr height=4><td></table>
      <!-- -------------------- -->
      <input type="hidden" name="upDel" value="up">
      <input type="hidden" name="qna_no" value="${qstnDTO.qna_no}">
      <!-- -------------------- -->
      <button class="btn btn-info" type="button"value="수정"  onClick="checkQstnUpDelForm('up')">수정</button>
       <button class="btn btn-danger" type="button" value="삭제"  onClick="checkQstnUpDelForm('del')">삭제</button>
      <button class="btn btn-primary" type="button"v value="목록보기" onClick="location.replace('/posbis/qstnForm.do')">목록보기</button>
   </form> 
   
        </form:form>
     </c:if>
     <form name="qstnForm" method="post" action="/posbis/qstnForm.do">
      <input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
      <input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
    </form>
   
   
      
       
       
       
      </div>

    </section><!-- #about -->
  
 
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
                      <li><a onClick="goIntroForm();">회사소개 </a></li>
                      <li><a onClick="goMainForm();">로그인</a></li>
                      <li><a onClick="goqstnRegForm();">질문하기</a></li>
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