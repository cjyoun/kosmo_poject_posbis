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
<link href="resources/intro/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="resources/intro/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="resources/intro/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resources/intro/lib/animate/animate.min.css"
	rel="stylesheet">
<link href="resources/intro/lib/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link href="resources/intro/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="resources/intro/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="resources/intro/css/style.css" rel="stylesheet">




<!-- Bootstrap CSS -->
<link href="resources/sidetopbar/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="resources/sidetopbar/css/bootstrap-theme.css"
	rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="resources/sidetopbar/css/elegant-icons-style.css"
	rel="stylesheet" />
<link href="resources/sidetopbar/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- full calendar css-->
<link
	href="resources/sidetopbar/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css"
	rel="stylesheet" />
<link
	href="resources/sidetopbar/assets/fullcalendar/fullcalendar/fullcalendar.css"
	rel="stylesheet" />
<!-- easy pie chart-->
<link
	href="resources/sidetopbar/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen" />
<!-- owl carousel -->
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
<!-- Custom styles -->
<link rel="stylesheet" href="css/fullcalendar.css">
<link href="resources/sidetopbar/css/widgets.css" rel="stylesheet">
<link href="resources/sidetopbar/css/style.css" rel="stylesheet">
<link href="resources/sidetopbar/css/style-responsive.css"
	rel="stylesheet" />
<link href="resources/sidetopbar/css/xcharts.min.css" rel=" stylesheet">
<link href="resources/sidetopbar/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet">



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


<!-- ------------------------------------------------------------------ -->
<!-- 만약에 상세보기할 게시판 글이 없으면 경고 후 이전 화면으로 이동하기-->
<!-- ------------------------------------------------------------------ -->
<c:if test="${empty qstnDTO}">
	<script>
		alert("게시판 글이 삭제되었습니다.");
		location.replace("/posbis/qstnForm.do")
 
	</script>
</c:if>


<title>게시판 상세 보기</title>
<script>


	// 성유진 
	// 들어온 경로에 따라 목록보기 클릭시 내글보기 또는 모든글보기로 이동하는 함수 선언
	var my = getParameters("my");
	function getParameters(paramName) {
	    // 리턴값을 위한 변수 선언
	    var returnValue;
	
	    // 현재 URL 가져오기
	    var url = location.href;
	
	    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
	
	    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
	    for (var i = 0; i < parameters.length; i++) {
	        var varName = parameters[i].split('=')[0];
	        if (varName.toUpperCase() == paramName.toUpperCase()) {
	            returnValue = parameters[i].split('=')[1];
	            return decodeURIComponent(returnValue);
	        }
		}
	}// 성유진 끝
	
	  

	  
      // 게시판 수정 화면으로 이동하는 함수 선언
      function goQstnUpDelForm(){
         // name=qstnUpDelForm 을 가진 form 태그의 action 값을 URL로 서버에 접속하라
         document.qstnUpDelForm.submit();
      }
      
      // 게시판 답글 화면으로 이동하는 함수 선언
      function goQstnRegForm(){
               
         $.ajax({
              // 접속할 서버 쪽 URL 주소 설정
              url : "/posbis/qstnMasterRegProc.do"
              // 전송 방법 설정
              , type : "post"
              // 서버로 보낼 파라미터명과 파라미터값을 설정
              , data : $("[name=qstnContentForm]").serialize()
              // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
              // 매개변수 masterCnt 에는 입력 행의 개수가 들어온다.
              , success : function(masterCnt){
                 // 관리자 계정의 개수가 1개면(=insert가 한번 성공했다는 뜻)
                 if(masterCnt == 1){
                    document.qstnRegForm.submit();
                 }
                 // 관리자 계정의 개수 1개가 아니면 경고하기
                 else{
                    alert("관리자의 권한이 필요합니다.");
                    return;
                 }
              }
              // 서버의 응답을 못받았을 경우 실행할 익명함수 설정.
              , error : function(){
                 alert("서버 접속 실패");
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

		// 조건에 따른 목록 보기 함수 
 
		function goListForm(){
			if (my == "true") {
				location.replace("/posbis/myQstn.do");		
				}else {
				location.replace("/posbis/qstnForm.do");	
				}
		}

		//qna 게시판- 자주 묻는 질문
		 function goFAQForm(){
		        //alert("전체 질문보기으로 이동");
		        location.replace("/posbis/FAQForm.do");
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
   글 상세보기
    ============================-->


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
 
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">Q&A게시판</a>
              </header>
              
					<div class="panel-body">


						<div class="container">


							<form class=qstnContentForm name="qstnContentForm" method="post"
								action="/posbis/qstnRegForm.do">
								<input type="hidden" name="qna_no" value="${qstnDTO.qna_no}">
								<div class="row">
									<div class="col-sm-6">
										<section class="panel">
											<header class="panel-heading no-border"> 글 상세보기 </header>
											<table class="table table-bordered" align=>
												<tr align=center>
													<th width=60>글번호</th>
													<td width=150>${qstnDTO.qna_no}
													<th width=60>조회수</th>
													<td width=150>${qstnDTO.readcount}
												</tr>
												<tr align=center>
													<th width=60>작성자
													<td width=150>${qstnDTO.user_id}
													<th width=60>작성일
													<td width=150>${qstnDTO.qna_date}
												</tr>
												<tr>
													<th>글제목
													<td width=150 colspan=3>${qstnDTO.subject}
												</tr>
												<tr>
													<th>글내용
													<td width=150 colspan=3><textarea name="content"
															rows="13" cols="45" style="border: 0" readonly>${qstnDTO.content}</textarea>
											</table>
										</section>
									</div>

								</div>

								<div style="float: center">
									<button class="btn btn-info" type="button" value="답글쓰기"
										onClick="goQstnRegForm();">답글쓰기</button>
									<button class="btn btn-danger" type="button" value="수정/삭제"
										onClick="goQstnUpDelForm();">수정/삭제</button>
									<!-- onClick 시 함수 변경 성유진-->
									<button class="btn btn-primary" type="button" value="목록보기"
										onClick="goListForm();">목록보기</button>
										<!-- onClick 시 함수 변경 성유진 끝-->
								</div>
								<input type="hidden" name="user_id" value="${user_id}">
							</form>

							<!--       <input type="button" value="답글쓰기" onClick="goQstnRegForm();">&nbsp;
      <input type="button" value="수정/삭제" onClick="goQstnUpDelForm();">&nbsp;
      <input type="button" value="목록보기" onClick="document.qstnForm.submit();">
    
       <input type="text" name="user_id" value="master40">
   </form>  -->


							<form name="qstnForm" method="post" action="/posbis/qstnForm.do">

							</form>

							<!--**************************************************-->
							<!--  수정/삭제 화면으로 이동하기 위한 form 태그 선언 -->
							<!--**************************************************-->
							<form name="qstnUpDelForm" method="post"
								action="/posbis/qstnUpDelForm.do">
								<!-- 게시판 상세보기 화면을 구성하는 글의 고유번호를 hidden 태그에 저장 -->
								<!-- 수정/삭제를 하려면 현재 글의 고유번호를 알아야 하기 떄문 -->
								<input type="hidden" name="qna_no" value="${param.qna_no}">
								<input type="hidden" name="selectPageNo"
									value="${param.selectPageNo}"> <input type="hidden"
									name="rowCntPerPage" value="${param.rowCntPerPage}">
							</form>
							<!--**************************************************************************-->
							<!-- 이전 페이지에서 온 게시판 선택 페이지 번호를 지정한 hidden 태그 출력하고 -->
							<!-- [게시판 목록] 화면으로 이동하는 form 태그 선언 ---------------------------->
							<!--**************************************************************************-->
							<form name="qstnRegForm" method="post"
								action="/posbis/qstnRegForm.do">
								<!-- 게시판 상세보기 화면을 구성하는 글의 [고유번호]를 hidden 태그에 저장 -->
								<!-- 댓글을 달려면 주인 글의 고유번호를 알아야 하기 때문 -->
								<input type="hidden" name="qna_no" value="${param.qna_no}">
							</form>
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
 