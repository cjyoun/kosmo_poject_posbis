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

function goInfoUpdateForm(){
    alert("goInfoUpdateForm.jsp로 이동");
    var str = "business_no=" + business_no;
    location.replace("/posbis/infoUpdateForm.do?"+str);
    
    
 }


      $(document).ready(function(){	
//	    	 checkBusinessNoForm();
				// name="changeBusinessNo" 에 change 이벤트가 발생하면 실행할 코드 설정.
				$('[name=changeBusinessNo]').change(function(){			
					checkBusinessNoForm();
					
				});	

				$('[name=changeBusinessNo]').change();
							
				
	  	});
	  	var b_no;

      function checkBusinessNoForm(){
			//alert($("[name=preChartForm]").serialize());

			$.ajax({
				// 서버 쪽 호출 URL 주소 지정
				url : "/posbis/myPageProc.do"
				
				// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
				, type : "post"

				, async : false
				// 서버로 보낼 파라미터명과 파라미터 값을 설정
				, data : $("[name=myPageForm]").serialize()				
					
				, success : function(myPageDTO){
					//alert("salesMonthList : "+ preChartListDTO.salesMonthList[0].sales_amount);
					//alert("allSalesMonthList : "+ preChartListDTO.allSalesMonthList[0].sales_amount);
					//alert("성공----------");
						$(".uid").empty();
						$(".uName").empty();
						$(".email").empty();
						$(".businessNo").empty();
						$(".businessName").empty();
						$(".addr").empty();
						$(".businessType").empty();
						$(".storeNum").empty();
						business_no = myPageDTO.myInfo[0].business_no;

					if(myPageDTO != null){
						

						var info = myPageDTO.myInfo[0];
						$('.uid').append(info.user_id);
						$('.uName').append(info.user_name);						
						$('.email').append(info.email);
						$('.businessNo').append(info.business_no);
						$('.businessName').append(info.business_name);
						$('.addr').append(info.store_addr);						
						$('.businessType').append(info.business_type);
						$('.storeNum').append(info.store_tel_num);
						
						
					}
					else if (myPageDTO == null){
						alert("실패");
					}
					else {
						alert("서버 오류 발생. 관리자에게 문의 바람");
					} 
				}
				
				// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				, error : function(request, error){
					alert("서버 접속 실패");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					
					
				}
				
			});
      }



      function gowithdrawalForm(){
         alert("withdrawalForm.jsp로 이동")
         location.replace("/posbis/withdrawalForm.do")
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

		
		function goMessageForm(){
		    alert("건의사항이 접수 되었습니다. 감사합니다");
	 
		 }


//=============================================김수민============================================================

		function delBusi(){
			var userPwd = prompt('해당 가게를 삭제하기 위해 본인 확인이 필요합니다.','사용자 암호를 입력해주세요');
			$("[name=myPageForm] [name=user_pwd]").val(userPwd+'');
							//alert($("[name=myPageForm]").serialize() );
			if(userPwd==null){ alert("삭제 취소"); }
			else{
		         $.ajax({
	                url : "/posbis/delBusiProc.do"
	                , type : "post"
	                , data : $("[name=myPageForm]").serialize()
	                , success : function(deleteBusiCnt){
							if(deleteBusiCnt==1){
								alert("삭제 성공");
								location.replace("/posbis/myPageForm.do");
							}else if(deleteBusiCnt==-1){
								alert("비밀번호가 잘못 입력 되었습니다");
							}else{
								alert("서버쪽 DB 연동 실패");
								alert(deleteBusiCnt);
							}
						
					}, error : function(){
	                      alert("서버 접속 실패");
	                }
	             });
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
     내 정보 보기
    ============================-->
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">내정보보기</a>
              </header>
			<div class="panel-body"> 
            <!------------------ 메인으로 보여줄 div -------------------->
               <form name="myPageForm" method="post" action="/posbis/myPageForm.do" class="form-horizontal"> 
            
               			<!-- 수민수민 -->
					 <input type="hidden" name="user_pwd" class="user_pwd">
					 <input type="hidden" name="user_id" class="user_id" value=${user_id}>
					 	<!-- ======== -->
					 	   <div class="form-group">
				             <label class="col-sm-2 control-label">사업자 번호</label>
				             <div class="col-sm-6">
									<select class="form-control addr_gu" name="changeBusinessNo" align="center">
								 		<c:forEach items="${businessNoList}" var="businessNoList">											
											<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
												</option>
										</c:forEach>
									</select> 				            
							 </div>
							 
									 	<button  class="btn btn-default" type="button" value="가게정보 삭제" onClick="delBusi();">가게정보 삭제</button>
										<button  class="btn btn-default" type="button" value="가게 추가"  onclick="location.replace('/posbis/newBusiForm.do');">가게 추가</button>
	 
							</div>
									 	

								 
				</form><br><br><br><br> 

               <!-- 회원정보 form 태그 -->
               <form class="cusForm" name = "cusForm" method="post" action=""><center>

                  <!-- 내정보 보기 -->
         
  <!-- page start-->
   
          <div class="col-sm-6">
            <section class="panel">
              <header class="panel-heading">
                	개인정보
              </header>
              
              <table class="table table-hover">
              
                     
                     <tr >
                        <th> ID
                        <td  name=uid class=uid>

                      <tr >
                         <th>  회원명
                        <td  name=uName class=uName>
                     
                      <tr >
                         <th>  이메일
                        <td   name=email class=email>


                  	 <tr >
                         <th>  사업자번호
                        <td  name=businessNo class=businessNo>

                        <tr >
                         <th>  상호명
                        <td   name=businessName class=businessName>

                        <tr >
                        <th>  가게주소
                        <td   name=addr class=addr>
                        
                       <tr >
                         <th> 업종
                        <td name=businessType class=businessType>
 
                       <tr >
                         <th>  매장번호
                        <td  name=storeNum class=storeNum>
                  </table> 
                   </section>
                   <br>
                   <button  class="btn btn-default" type="button" value="메인으로" onClick="goMainForm();" >메인으로</button>
                   <button  class="btn btn-default" type="button" value="정보수정" onClick="goInfoUpdateForm();" >정보수정</button>
                   <button  class="btn btn-default" type="button" value="회원탈퇴" onClick="gowithdrawalForm();" >회원탈퇴</button>
                
          </div>
          &nbsp;&nbsp;
          
 <div class=" col-md-6 portfolio-item filter-web" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <img src="resources/intro/img/features-1.svg" class="img-fluid" alt="">
              <div class="portfolio-info">

              </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            
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
 