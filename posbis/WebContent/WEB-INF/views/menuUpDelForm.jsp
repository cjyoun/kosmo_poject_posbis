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
  
   <head>
       <title> 메뉴 수정/삭제 </title>
      <meta charset="utf-8">
      <script>
		$(document).ready(function(){
			
			var main ='<c:out value="${menuDTO.main_category_name}"/>';
			var mid = '<c:out value="${menuDTO.mid_category_name}"/>';
			var sub = '<c:out value="${menuDTO.sub_category_name}"/>';
			var mcn = "";"WebContent/WEB-INF/views/menuUpDelForm2.jsp"
			var scn = "";
			
			if( main != ""){
				mcn = main; 
			}
			if( mid != ""){
				scn = mid;
			}
					
				$.ajax({
					url : "/posbis/middleProc.do"
					,type : "post"
					,data : "main_category_name=" + mcn
					, success : function(menuCategory2) {
						for(var i=0; i<menuCategory2.length; i++){
						$("[name=mid_category_name]").append('<option value='+menuCategory2[i]+'>'+menuCategory2[i]+'</option>');
						inputData("[name=mid_category_name]", "${menuDTO.mid_category_name}");
						}
					} //success
					, error : function(){
						alert("서버 접속 실패");
					} //error
				});
				
				$.ajax({
					url : "/posbis/subProc.do"
					,type : "post"
					,data : "mid_category_name=" + scn
					, success : function(menuCategory3) {
						for(var i=0; i<menuCategory3.length; i++){
							$("[name=sub_category_name]").append('<option ${scn eq menuCategory3[i] ? 'selected' :''} value='+menuCategory3[i]+'>'+menuCategory3[i]+'</option>');
							inputData("[name=sub_category_name]", "${menuDTO.sub_category_name}");
						}
					} //success
					, error : function(){
						alert("서버 접속 실패");
					} //error
				}); // $.ajax

				
				$("[name=main_category_name]").change(function(){
	   				alert($(this).val());
	   				$("[name=mid_category_name]").empty();
	   			$.ajax({
	      
	      			url : "/posbis/middleProc.do"
	      			,type : "post"
	      			,data : "main_category_name=" + $(this).val()
	      			, success : function(menuCategory2) {
	         			var str="--중분류--";
	         			for(var i=0; i<menuCategory2.length; i++){
	            			$("[name=mid_category_name]").append("<option value="+menuCategory2[i]+">"+menuCategory2[i]+"</option>");
	      				}
	         			if(menuCategory2[0]!=str){
	            			$("[name=mid_category_name]").prepend("<option value='' selected>"+str+"</option>");
	         			}
	      			} //success
	      			, error : function(){
	          			alert("서버 접속 실패");
	      			} //error
	      
	   			}); // $.ajax({
	   
			}); //$("[name=main_category_name]").change(function(){

	   
			$("[name=mid_category_name]").change(function(){
	   			alert($(this).val());
	   			$("[name=sub_category_name]").empty();
	   
		  			 $.ajax({
		      
		      			url : "/posbis/subProc.do"
		      			,type : "post"
		      			,data : "mid_category_name=" + $(this).val()
		      			, success : function(menuCategory3) {
		         			var str="--소분류--";
		         			for(var i=0; i<menuCategory3.length; i++){
		            			$("[name=sub_category_name]").append('<option value='+menuCategory3[i]+'>'+menuCategory3[i]+'</option>');
		         			}
		         			if(menuCategory3[0]!=str){
		            			$("[name=sub_category_name]").prepend("<option value='' selected>"+str+"</option>");
		         			}
		      			} //success
		      			, error : function(){
		          			alert("서버 접속 실패");
		      			} //error
		      
		   			}); // $.ajax({
		           
		        }); //$("[name=main_category_name]").change(function(){ 

		     }); //$(document).ready(function(){
		     
		         // 메뉴관리 페이지로 이동
		         function goMenuForm(){
		            location.replace( "/posbis/menuForm.do" );
		         }
				// 메뉴판 수정/삭제 유효성 체크 함수 선언
				function checkMenuUpDelForm(upDel){

					// 삭제 버튼 눌렀을 경우
					if(upDel=='del'){
						$("[name=upDel]").val("del");
						if(confirm("정말 삭제 하시겠습니까?")==false) {return;}
						
					}else if(upDel=="up"){
						if(is_empty("[name=main_category_name]")){
							alert("대분류를 선택해주세요");
							$("[name=middle_category]").focus();
							return;
						}
						
						if(is_empty("[name=mid_category_name]")){
							alert("중분류를 선택해주세요");
							$("[name=sub_category]").focus();
							return;
						}
						
						if(is_empty("[name=sub_category_name]")){
							alert("소분류를 선택해주세요.");
							$("[name=menu_name]").focus();
							return;
							
						}
						if(is_empty("[name=menu_name]")){
							alert("메뉴이름을 입력해주세요.");
							$("[name=menu_price]").focus();
							return;
						}
						
						if(is_empty("[name=menu_price]")){
							alert("메뉴가격을 입력해주세요.");
							$("[name=menu_cost]").focus();
							return;
						}
						
						if(is_empty("[name=menu_cost]")){
							alert("메뉴원가를 입력해주세요.");
							return;
						}
					}
					$.ajax({
						//--------------------------
						// 서버 쪽 호출 URL 주소 지정
						//--------------------------
						url : "/posbis/menuUpDelProc.do"
						//--------------------------
						// 전송 방법 설정
						//--------------------------
						, type : "post"
						//--------------------------
						// 서버로 보낼 파라미터명과 파라미터값을 설정
						//--------------------------
						, data : $('[name=menuUpDelForm]').serialize()
						//--------------------------
						// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
						// 매개변수upDelCnt 에는 입력 행의 개수가 들어온다.
						//--------------------------
						, success : function(upDelCnt){
							if(upDel=="up"){
								if(upDelCnt==1){
								alert("메뉴 수정이 완료되었습니다.");
								location.replace("/posbis/menuForm.do");
								}else{
									alert("서버쪽 DB 연동 실패!");
								}
							}else if(upDel=="del"){
								if(upDelCnt==1){
								alert("메뉴가 삭제되었습니다.");
								location.replace("/posbis/menuForm.do");
								}else{
									alert("서버쪽 DB 연동 실패!");
								}
							}
						}
						//--------------------------
						// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
						//--------------------------
						, error : function(){
							alert("서버와 통신 실패");
						}
					}); //$.ajax({
					
				} //function checkBoardUpDelForm(upDel){

					
				 // 프리미엄으로 이동 시일반 회원은 프리미엄 부분에 들어가지 못하게 하는 함수
			    function goPreChartForm(){
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
        <h1 class="text-light"><a href="#intro" class="scrollto" onClick="goMainForm();"><span>POSBIS</span></a></h1>
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
        
                  
          <li  class="drop-down"> <a href=""><i class="icon_profile"></i> 김수정 님</a> 
           <ul>
           		
              <li><a onClick="goMyPageForm();"><i class="icon_profile"></i>&nbsp;&nbsp;내정보 보기</a></li>
           		<li><a href="login.html"><i class="icon_documents_alt"></i>&nbsp;&nbsp;통합관리</a></li>
           	  <li><a href="login.html"><i class="icon_key_alt"></i>&nbsp;&nbsp;Log Out</a></li>
            </ul>  
          </li>     
        
        </ul>
      </nav><!-- .main-nav -->
      
    </div>
  </header><!-- #header -->  
   
   
   
   <center><br>
		<!-- 메뉴 수정/삭제 form -->
		<form name = "menuUpDelForm" method="post" action="/posbis/menuUpDelProc.do">
		<h2>[메뉴 수정/삭제]</h2><br>
		<!------------------------------------------------------------->
		<table class = "tbcss1" border=1 bordercolor=grary cellspacing=0 cellpadding=5 align=center>
			<tr>
				<th bgcolor="FFEFDC">메뉴사용여부
				<td><!--메뉴 사용여부 -->
				<c:choose>
					<c:when test="${menuDTO.menu_using == 'Y'}">
						<input type ="radio" id="menu_using_y" name="menu_using" value="Y" checked ><label for="menu_using_y">Y</label>
						<input type ="radio" id="menu_using_n" name="menu_using" value="N"><label for="menu_using_n">N</label>
					</c:when>
					<c:otherwise>
						<input type ="radio" id="menu_using_y" name="menu_using" value="Y"><label for="menu_using_y">Y</label>
						<input type ="radio" id="menu_using_n" name="menu_using" value="N" checked><label for="menu_using_n">N</label>
					</c:otherwise>
				</c:choose>
				
				
			<tr>
			<th bgcolor="FFEFDC">분류
 				<td><!-- 대분류 -->
				<select name="main_category_name" class="main_category_name">
					<c:forEach items="${menuCategory1}" var="menucate">
						<option value="${menucate.main_category_name}"
						<c:if test="${menuDTO.main_category_name == menucate.main_category_name}">
							selected
						</c:if>
						>${menucate.main_category_name}</option>
					</c:forEach>
				</select>
				<!-- 중분류 -->
				<select name="mid_category_name" class="mid_category_name">
				</select>
				<!-- 소분류 -->
				<select name="sub_category_name" class="sub_category_name">
				</select>
				<!-- 메뉴이름 -->
				<tr>
					<th bgcolor="FFEFDC">메뉴이름
					<td><input type="text" size="40" maxlength="50" name="menu_name" value="${menuDTO.menu_name}">
					
				<!-- 메뉴가격 -->
				<tr>
					<th bgcolor="FFEFDC">메뉴가격
					<td><input type="text" size="40" maxlength="50" name="menu_price" value="${menuDTO.menu_price}">원
					
				<!-- 메뉴원가 -->
				<tr>
					<th bgcolor="FFEFDC">메뉴원가
					<td><input type="text" size="40" maxlength="50" name="menu_cost" value="${menuDTO.menu_cost}">원
		</table><br>
			<!------------------------------------------------------------->
			<table><tr height=4><td></table>
			<input type ="hidden" name="upDel" value="up">
			<input type ="hidden" name="menu_no" value="${param.menu_no}">
			<%-- <div>
			${menuDTO.main_category_name}
			${menuDTO.mid_category_name}
			${menuDTO.sub_category_name}
			${menuDTO.menu_name}
			${menuDTO.menu_price}
			${menuDTO.menu_cost}
			${menuDTO.menu_no}
			${menuDTO.menu_using}
			
			</div> --%>
			<!------------------------------------------------------------->
			<input type="button" value="메뉴수정" onClick="checkMenuUpDelForm('up')">
			<input type="button" value="메뉴삭제" onClick="checkMenuUpDelForm('del')">
			<input type="reset" value="목록보기" onClick="document.menuForm.submit();">
			<!------------------------------------------------------------->
		</form>
		<form name="menuForm" method="post" action="/posbis/menuForm.do" >
			<input type="hidden" name="selectPageNo" value="${param.selectPageNo}" }>
		      <input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}" }>
		      <input type="hidden" name="keyword" value="${param.keyword}" }>
		</form>
		 		 
   		 
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
                    <p>난 너를 믿었던 만큼 난 내 친구도 믿었기에 난 아무런 부담없이 널 내 친구에게 소개 시켜줬고 그런 만남이 있은 후로부터 우리는 자주 함께 만나며 즐거운 시간을 보내며 함께 어울렸던 것뿐인데</p>
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