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
 
    
   
 
   function checkCardInsert(){
	   
	   if( is_empty(".credit") ){
           alert("카드 체크 요망");
           $(".credit").val("");
           return;
        }
      
        for(var i=1; i<=4; i++){   
            if(is_valid_pattern("[name=creditNum"+i+"]",/^[0-9]{4}$/) == false){
               alert(" 카드번호 4자리를 입력해주세요");
               return;
            }
          }

            if(is_valid_pattern("[name=cvc_no]",/^[0-9]{3}$/) == false){
               alert(" CVC 카드 번호 3자리를 입력해주세요");
               return;
            }


           
           if(is_valid_pattern("[name=ex_month]",/^[0-9]{2}$/) == false){
              alert("숫자 2자리를 입력해주세요");
              return;
           }
          
          if($("[name=ex_month]").val()>12 || $("[name=ex_month]").val()<1 ){
             
             alert("해당하는 월이 존재하지 않습니다");
             return;
           }
          
       if(is_valid_pattern("[name=ex_year]",/^[0-9]{2}$/) == true){
            
            var today = new Date();  
         var thisyear=today.getFullYear().toString();
         var thisyear2=thisyear.substring(2.2);   
      
      
             if($("[name=ex_year]").val()<thisyear2){
                
                alert("해당카드는 기간이 만료된 카드입니다.");
                 return;
               }
            }else{
              alert("숫자 2자리를 입력해주세요");
        return;
         }
         
 
           if(is_valid_pattern("[name=jumin_no]",/^[0-9]{6}$/) == false){
              alert(" 주민번호 숫자 6자리를 입력해주세요");
              return;
           }
          
           if(is_valid_pattern("[name=credit_pwd]",/^[0-9]{2}$/) == false){
              alert(" 비밀번호 숫자 2자리를 입력해주세요");
              return;
           }

  	
	   
	   
       alert($("[name=payForm]").serialize());

       $.ajax({ 
           url : "/posbis/payProc.do"
           ,type : "post"   
           ,data : $("[name=payForm]").serialize()
          , success : function(insertCard) {
             

				if(insertCard == 1){
					alert("카드가 정상적으로 등록되었습니다.\n 프리미엄회원으로 정상처리 되었습니다 \n 로그인을 다시 해주세요.");
					location.replace("/posbis/mainForm.do");
				}
				
				else {
					alert("서버 오류 발생. 관리자에게 문의 바람");
				} 
              
          }, error : function(){
             alert("서버 접속 실패");
            }
     });
       
       
       
   }      
   
   
   function cardCancel(){
 	  
 	  if(confirm("카드 등록을 취소하시면 일반회원으로 등급이 변경/유지 됩니다. \n 정말 취소 하시겠습니까?")==false) {
				return;
			}
	  	 else{
	  		$.ajax({ 
	              url : "/posbis/payProc2.do"
	              ,type : "post"   
	              ,data : $("[name=payForm]").serialize()
	             , success : function(cardCancel) {
	                

	   				if(cardCancel == 1){
	   					alert("일반회원으로 변경됩니다.\n 로그인을 다시 해주세요.");
	   					location.replace("/posbis/mainForm.do");
	   				}
	   				else {
	   					alert("서버 오류 발생. 관리자에게 문의 바람");
	   				} 
	                 
	             }, error : function(){
	                alert("서버 접속 실패");
	               }
	        });
	       }
 	  
     
    	 
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
		
		//회사소개-pobis 클릭시
   		
   		

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
          
           </div>
         </div>

       <div class="header">
 

           <div class="logo float-left">
             <!-- Uncomment below if you prefer to use an image logo -->
             <h1 style="cursor:pointer"  class="text-light"><a  onClick="goHomePageForm();" class="scrollto"><img src="../resources/sidetopbar/img/POSBIS_logo.jpg"></a></h1>
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
      	결제창
    ============================-->   
   <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-6-2" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">프리미엄 회원 결제</a>
              </header>
                
              <div class="panel-body"> 
                 <div class="container">
                  <form name = "payForm" class="form-validate form-horizontal payForm" id="feedback_form"  >
                  
 
                  <div class="form-group"> 
                    <label for="cname" class="control-label col-lg-2">카드종류 <span class="required">*</span></label>
                     <div class="col-lg-2">
                     <!--    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
                        
                        <select name="credit"  size=1 class="form-control credit"> 
                          <option value="" selected> --선택요망--</option>
		                  <option value="BC">BC카드</option>
		                  <option value="SHINHAN">신한카드</option>
		                  <option value="KB">국민카드</option>
		                  <option value="SAMSUNG">삼성카드</option>
		                  <option value="HYUNDAI">현대카드</option>
		                  <option value="LOTTE">롯데카드</option>
		                  <option value="HANA_SK">하나카드</option>
		                  <option value="NH">농협카드</option>
		                  <option value="CITY">씨티카드</option>
		                  <option value="KakaoBank">카카오뱅크카드</option>
		                  <option value="K bank">케이뱅크카드</option>
		                  <option value="JEONBUK">전북은행카드</option>
		                  <option value="COMMUNITY_CREDIT_COOPERATIVES">새마을금고카드</option>
		                  <option value="ETC">기타(은행/증권)카드</option>
 
 
                      </select>
                      
                      
                      </div>
              
                  </div>
                   
                  <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">카드번호 <span class="required">*</span></label>
                    <div class="col-lg-2">
                        <input type="text"  name="creditNum1" size=4 maxlength=4 class="form-control creditNum1" placeholder="4자리"   >
 
                      </div>
                       <div class="col-lg-2">
                        <input type="text"  name="creditNum2" size=4 maxlength=4 class="form-control creditNum2" placeholder="4자리"     >
 
                      </div> 
                       <div class="col-lg-2">
                        <input type="text"  name="creditNum3" size=4 maxlength=4 class="form-control creditNum3"  placeholder="4자리"    >
 
                      </div> 
                      <div class="col-lg-2">
                        <input type="password"  name="creditNum4" size=4 maxlength=4 class="form-control creditNum4" placeholder="4자리"    >
 
                      </div> 
 
                  </div>
                  
                   
                  <div class="form-group">
                   <label for="cname" class="control-label col-lg-2">CVC <span class="required">*</span></label>
                      <div class="col-lg-2">
                        <input type="password"  name="cvc_no" size=3 maxlength=3 class="form-control cvc_no" placeholder="3자리"    >
 
                      </div> 
                  </div>
                  
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">유효기간 <span class="required">*</span></label>
                    <div class="col-lg-2">
                        <input type="text" name="ex_month" size=2 maxlength=2  placeholder="mm" class="form-control ex_month"    >
                      </div> 
                      
                     <div class="col-lg-2">
                        <input type="text" name="ex_year" size=2 maxlength=2  placeholder="yy" class="form-control ex_year"   >
                      </div> 
                  </div>
                  
                  <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">주민번호 <span class="required">*</span></label>
          		
          		 <div class="col-lg-2">
          		<input type="text" name="jumin_no" size=5 maxlength=6  class="form-control jumin_no" >
          		</div>
          		<div class="col-lg-2">
                    -&nbsp;******* 
                    </div>
 				</div>
          			<br>
                      <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">비밀번호 <span class="required">*</span></label>
                    
                    <div class="col-lg-2">
                        <input type="password" name="credit_pwd"   placeholder="앞 2자리" class="form-control credit_pwd"  size=3 maxlength=2 >
                      </div>
                    <div class="col-lg-2">
                    ** 
                    </div>
 
 
                  </div>
   
        		<div style="float:right">
                <button class="btn btn-success" type="button" value="등록" onClick="checkCardInsert();">등록 </button>
                <button class="btn btn-danger" type="button" value="취소" onClick="cardCancel();">취소 </button>
                </div>
                
                 <%-- <input type="text" name="user_id"  value="${param.user_id}"> --%>
                </form>
			 
              </div>
            </section>
          </div>
    </div>
 </section>
</section>
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
 