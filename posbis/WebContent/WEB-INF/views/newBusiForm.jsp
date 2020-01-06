<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ include file="common.jsp"%>

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
  <!-- ====================================================== -->
  
  
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
      $(document).ready(function() {
    
    
         $("[name=business_no]").val("123-45-12345");
         $("[name=business_name]").val("회원가입테스트 가게");
         
         $("[name=addr_detail]").val("회원가입테스드 상세주소");
         $("[name=store_tel_num]").val("123456");
        
        
        //  구 검색시 동 구하기 -------------------------------------------------------
        $("[name=addr_gu]").change(function(){
    
            //alert($(this).val());
            $("[name=addr_dong]").empty();
           

             $.ajax({ 
                   url : "/posbis/addrDongProc.do"
                   //,datatype:"json"
                   ,type : "post"   
                   ,data : "addr_gu=" + $(this).val() 
                  , success : function(addrDongList) {   
                         //$("[name=addr_dong]").append('<option value=''>--동 선택--</option>');   
                         
                         var str="--동 선택--";
                         
                      for(var i=0; i<addrDongList.length; i++){
                      
                        $("[name=addr_dong]").append('<option value='+addrDongList[i]+'>'+addrDongList[i]+'</option>');
                            
                         
                      }
                     if(addrDongList[0]!=str){
                        $("[name=addr_dong]").prepend("<option value='' selected>"+str+"</option>");   
                     }
           
                }   
                    , error : function(){
                     alert("서버 접속 실패");
                  }
             }); /*  $.ajax({  */     
           
        });/* $("[name=addr_gu]").change(function(){ */
           
           
       //  업종1 검색시 업종2 구하기 -------------------------------------------------------   
         $("[name=business_type_name1]").change(function(){
           
           /*alert($(this).val())*/
          //alert($(this).val());
            $("[name=business_type_name2]").empty();
              
            $.ajax({ 
                   url : "/posbis/businessTypeName2Proc.do"
                   ,type : "post"   
                   ,data : "business_type_name1=" + $(this).val() 
                  , success : function(businessTypeList2) {
                     
                     var str="--업종2 선택--";
                   
                   
                      
                      for(var i=0; i<businessTypeList2.length; i++){
                        $("[name=business_type_name2]").append('<option value='+businessTypeList2[i]+'>'+businessTypeList2[i]+'</option>');
                            
                         
                      }
                     if(businessTypeList2[0]!=str){
                       $("[name=business_type_name2]").prepend("<option value='' selected>"+str+"</option>");   
                    }
                      
                  }, error : function(){
                     alert("서버 접속 실패");
                    }
             }); /*  $.ajax({  */
           
           
           
        }); /* $("[name=business_type_name1]").change(function(){ */
           
         
      });/*  $(document).ready(function() { */ 
      
      
   //*************************************************************************************   
      //사업자번호 중복확인 여부를 저장할 변수 선언
      var busiCheck = false;
      
 		function checkBusinessNo(){

	         if( is_empty(".business_no") ){
	              alert(" 사업자번호 입력 요망");
	              $(".business_no").val("");
	              return;
	         }
   
          $.ajax({
              url : "/posbis/chekckBusinessNoProc.do"
             , type : "post"
             , data : $("[name=newBusiForm]").serialize()
             , success : function(businessnoCnt) {
                if( businessnoCnt==1 ){
                	busiCheck = false;
                   alert("이미 등록된 사업자번호 입니다.재 입력 바랍니다.");
                   location.replace('/posbis/newBusiForm.do');
                }else if(businessnoCnt == 0) {
                	busiCheck = true;
                    alert("등록가능한 사업자번호 입니다.");
 
                }else {
                      alert("서버 오류 발생!! 관리자에게 문의 바랍니다.");
                }
             }, error : function(){
                  alert("서버 접속 실패");
             	}
             
           });
     
      }  /* function checkBusinessNo(){ */

      
      function checkNewBusiForm(){
     
         //회원가입 양식 빈칸체크
        if( is_empty(".user_pwd") ){
             alert("암호 입력 요망");
             $(".user_pwd").val("");
             return;
          }
 /*       if(is_valid_pattern("[name=user_pwd]", /^[0-9]{10}$/) == false){
            alert("암호는 숫자 10개를 입력해주세요");
            return;
      	  }*/
        if( is_empty(".business_no") ){
             alert("사업자번호 입력 요망");
             $(".business_no").val("");
             return;
          }
        if( is_empty(".business_name") ){
             alert("상호명 입력 요망");
             $(".business_name").val("");
             return;
          }
 
        
        if( is_empty(".addr_gu") ){
             alert("주소 체크 요망");
             $(".addr_gu").val("");
             return;
          }
        if( is_empty(".addr_dong") ){
             alert("주소 체크  요망");
             $(".addr_dong").val("");
             return;
          }
        if( is_empty(".addr_detail") ){
             alert("상세주소 입력  요망");
             $(".addr_detail").val("");
             return;
          }
        if( is_empty(".business_type_name1") ){
             alert("업종1 체크  요망");
             $(".business_type_name1").val("");
             return;
          }
        if( is_empty(".business_type_name2") ){
             alert("업종2 체크  요망");
             $(".business_type_name2").val("");
             return;
          }
        if( is_empty(".store_tel_num") ){
             alert("매장번호 입력  요망");
             $(".store_tel_num").val("");
             return;
          }

        if( busiCheck == false ){
            alert("사업자등록번호 중복확인을 해주세요");
            return;
         }
		        $.ajax({
		            url : "/posbis/chekckBusinessNoProc.do"
		           , type : "post"
		           , data : $("[name=newBusiForm]").serialize()
		           , success : function(businessnoCnt) {
		              if( businessnoCnt==1 ){
		              	busiCheck = false;
		                 alert("사업자등록번호 중복확인을 해주세요");
		                 location.replace('/posbis/newBusiForm.do');
		              }else if(businessnoCnt == 0) {

		                  //가게 추가 ajax
		                  $.ajax({
		                        url : "/posbis/newBusiProc.do"
		                        , type : "post"
		                        , data : $("[name=newBusiForm]").serialize()
		                        , success : function(newBusiCnt){
		      						if(newBusiCnt==1){
		      							alert("추가 성공");
		      							location.replace("/posbis/myPageForm.do");
		      						}else if(newBusiCnt==-1){
		      							alert("비밀번호가 잘못 입력 되었습니다");
		      						}else{
		      							alert("서버쪽 DB 연동 실패");
		      						}
		      					
		      				}, error : function(){
		                              alert("서버 접속 실패");
		                        }
		                     });  
			              	
		
		              }else {
		                    alert("서버 오류 발생!! 관리자에게 문의 바랍니다.");
		              }
		           }, error : function(){
		                alert("서버 접속 실패");
		           	}
		           
		         });
      //*************************************************************************************   

      }
//*************************************************************************************   
//취소 클릭     
    function goMainForm(){
         location.replace("/posbis/homePageForm.do");
      }
    
  //--------------------------------------------------------------------------------------------------
    
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
 

//************************************************************************
//--------------------------------------------------------------------------------------------------
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
  사업자 번호 추가
============================-->

   <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-6" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">사업자 번호 추가</a>
              </header> 
  
 	<div class="panel-body">
      <FORM class="newBusiForm form-horizontal" method="post" name="newBusiForm"
         action="/posbis/newBusiForm.do">

		<input type="hidden" name="user_id" value="${user_id}">  
            <div class="form-group">
             <label class="col-sm-2 control-label">사업자 번호</label>
             <div class="col-sm-6">
                     <input type="text" name="business_no" class="business_no form-control" placeholder="(10자리, 000-00-0000)" maxlength="12" required/>
             </div>
					<a class="btn btn-default"onclick="checkBusinessNo();" title="Bootstrap 3 themes generator" name="checkOverlapBusinessNo" class="checkOverlapBusinessNo">사업자 번호 중복확인</a>
         	</div>
			
			 <div class="form-group">
			 	<label class="col-sm-2 control-label">상호명</label>
      		<div class="col-sm-6">
	  				<input type="text" name="business_name" class="business_name form-control" placeholder="상호명"/> 
            </div>
            </div>
            
        <div class="form-group">
                    <label class="col-sm-2 control-label">주소</label>
                    <div class="col-lg-6">
                       <select class="form-control m-bot15 addr_gu" name="addr_gu">
                                              <option>--구 선택--</option>
                                              <c:forEach items="${addrListGu}" var="addrGu">
													<option value="${addrGu.addr_gu}">${addrGu.addr_gu}</option>
											  </c:forEach>
                       </select>
                       
                       <select class="form-control m-bot15 addr_dong" name="addr_dong" >
                                              <option>--동 선택--</option>
 
                       </select>
                    </div>
                  </div>
			 <div class="form-group">
			  	<label class="col-sm-2 control-label">상세주소</label>
			 <div class="col-sm-6">
			 	<input type="text" size=50 name="addr_detail"
                     class="addr_detail form-control" />
			 </div>
			 </div>
			 
			  <div class="form-group">
                    <label class="col-sm-2 control-label">업종</label>
                    <div class="col-lg-6">
                       <select class="form-control m-bot15 business_type_name1" name="business_type_name1">
                                              <option>--선택--</option>
                                              <c:forEach items="${businessTypeList1}" var="busiType1">
													<option value="${busiType1.business_type_name1}">${busiType1.business_type_name1}
													</option>
											 </c:forEach>
                       </select>
                  <select name="business_type_name2" class="business_type_name2 form-control"
                     onchange="getbusiListname2();">
                        <option value="">--선택--</option>

                  </select> 
                  <!--********************************************************************** -->
				</div>
				</div>

				<div class="form-group">
                    <label class="col-sm-2 control-label">매장번호</label>
                    <div class="col-sm-6">
                    <input type="text" size="12" name="store_tel_num"
                     class="store_tel_num form-control" />
                    *숫자만 입력하세요
                </div>
                </div>
                
 
               <div class="form-group">
                    <label class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-6">
                   <input type="password" name="user_pwd" class="user_pwd form-control"
                     placeholder="PASSWORD"  maxlength="10" required /> *사용자 확인을 위해 비밀번호를 입력하세요 
              	</div>
              	</div>
         
 

         <div style="height: 20;"></div>

		<div style="float:right">
		<button class="btn btn-info" type="button" value="저장" onClick="checkNewBusiForm();" >저장 </button> 
 	 	<button class="btn btn-primary" type="reset" value="다시작성"  >다시작성 </button> 
	 	<button class="btn btn-danger" type="button" value="취소" onClick="goMyPageForm();" >취소 </button>
 
            </div>
         <!--  <input type="hidden" name=u_no value=""> -->

      </form>
 
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
 