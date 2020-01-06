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

			
	  	   $(document).ready(function(){
		  	   //alert("ready!");
		  	   
		  	   //월매출 콤마 넣기
	  		    $(".month_sales").each(function() {
                var num = $(this).text();
                var commaNum = numberWithCommas(num);
                $(this).text(commaNum+ "원");
        		 });
				

				
 	  		 	$('[name=rowCntPerPage]').change(function(){
	  		 		goPreSearch();
				}); 

 	  		 	
 	  			//페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입
					$(".pagingNumber").html(
						getPagingNumber(
							"${preResultAllCnt}"                //검색 결과 총 행 개수
							,"${preSearchDTO.selectPageNo}"	//선택된 현재 페이지 번호
							,"${preSearchDTO.rowCntPerPage}"	//페이지 당 출력행 개수
							,"15"								//페이지 당 보여줄 페이지번호 개수
							,"goPreSearch();"						//페이지 번호 클릭 후 실행할 자스코드
						)
					); 
 	  			

				
				
 				$('[name=business_type_name1]').change(function(){
					getBusinessTypeName2();
					
				}); 

 				$('[name=addr_gu1]').change(function(){
 					getAddrGu2();
				}); 
				
								

				
				inputData("[name=rowCntPerPage]","${preSearchDTO.rowCntPerPage}");
				inputData("[name=selectPageNo]","${preSearchDTO.selectPageNo}");
				inputData("[name=business_type_name1]","${preSearchDTO.business_type_name1}");
				 if("${preSearchDTO.business_type_name2}" == null){
					inputData("[name=business_type_name2]","${preSearchDTO.business_type_name2}");
					}else{
						getBusinessTypeName2();
				 }
				inputData("[name=addr_gu1]","${preSearchDTO.addr_gu1}");
				 inputData("[name=addr_gu2]","${preSearchDTO.addr_gu2}");
			    if("${preSearchDTO.addr_gu2}" == null){
			  	inputData("[name=addr_gu2]","${preSearchDTO.addr_gu2}");
			    }else{
			    	getAddrGu2();
				} 
				inputData("[name=month_sales]","${preSearchDTO.month_sales}");



	  	   });	 



	  	// addr_gu2 List
			function getAddrGu2(){

				$.ajax({
					url : "/posbis/getAddrGu2Proc.do"
					, type : "post"
					, data : "addr_gu1="+$('[name=addr_gu1]').val()
					, success : function(data){
							$("[name=addr_gu2]").empty();
							$("[name=addr_gu2]").append("<option value=''>----구선택----</option>");
							for( var i=0; data.length>i; i++){
								//alert();
								$('[name=addr_gu2]').append("<option value="+data[i]+">"+data[i])

							}
							if("${preSearchDTO.addr_gu2}"!=null){
								inputData("[name=addr_gu2]","${preSearchDTO.addr_gu2}");
							}
							else{
								inputData("[name=addr_gu2]","");
							}
							
					}
					, error : function(){
						alert("서버 접속 실패");
					}
				})
			}


	  	   
		
			// 업종 소분류
			function getBusinessTypeName2(){

				$.ajax({
					url : "/posbis/getBusinessTypeName2Proc.do"
					, type : "post"
					, data : "business_type_name1="+$('[name=business_type_name1]').val()
					, success : function(data){
							$("[name=business_type_name2]").empty();
							$("[name=business_type_name2]").append("<option value=''>----중분류----</option>");
							//alert("business_type_name2///"+data[0]);
							for( var i=0; data.length>i; i++){
								//alert();
								$('[name=business_type_name2]').append("<option value="+data[i]+">"+data[i])

							}
							if("${preSearchDTO.business_type_name2}"!=null){
								inputData("[name=business_type_name2]","${preSearchDTO.business_type_name2}");
							}
							else{
								inputData("[name=business_type_name2]","");
							}
							
					}
					, error : function(){
						alert("서버 접속 실패");
					}
				})
			}



			

			//월매출 콤마 넣기 함수
	         function numberWithCommas(number) {
	             var parts = number.toString().split(".");
	             parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	             return parts.join(".");
	         }

		   




				
	         function goPreSearch(){	 		
/*
			       	$.ajax({
						url : "/posbis/getPreResultProc.do"
						, type : "post"
						, data : $("[name=preSearchForm]").serialize() 
						, success : function(data){
							alert("성공");

							$("[name=preResultTable] tbody").empty();
					
							for ( var i=0; i<data.rowCntPerPage; i++){
								
								$("[name=preResultTable] tbody").append("<tr><td  align=center>"+data.preResultList[i].PAGINGRNUM
																												+"<td  align=center>"+data.preResultList[i].RANKING
																												+"<td  align=right class=month_sales>"+data.preResultList[i].MONTH_SALES
																												+"<td  align=center>"+data.preResultList[i].BUSINESS_TYPE
																												+"<td  align=center>"+data.preResultList[i].BEST_MENU_TYPE
																												+"<td  align=center>"+data.preResultList[i].ADDR_GU+" "+data.preResultList[i].ADDR_DONG+"</tr");
							
							}
							alert(data.selectPageNo)
							
						}
						, error : function(request,status,error){
							alert("서버 접속 실패");
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						
						}
					}) 
				*/
					
					document.preSearchForm.submit(); 
		      }   



	      

	      function goPreSearchAll(){
				document.preSearchForm.reset( );
				$("[name=preSearchForm] [name=selectPageNo]").val("1");
				$("[name=preSearchForm] [name=rowCntPerPage]").val("10");
				goPreSearch();
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
	검색관리
  ============================-->
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-8" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">프리미엄 검색</a>
              </header>
              
              <div class="panel-body">
         
      <div class="container">
 
					<!--======================-->
               <!--======검색결과=======-->
               <!--======================-->
               <form name="preResultForm">
                    <table class="table table-striped table-advance table-hover"  id="select">
                       <thead>
                            <tr>
                        <th> 순서 
                        
                     <!-- 순위-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='ranking desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('ranking asc'); goPreSearch();">매출순위▼
                           </c:when>
                           <c:when test="${param.sort=='ranking asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('ranking desc'); goPreSearch();">매출순위▲
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('ranking asc'); goPreSearch();">매출순위
                           </c:otherwise>
                        </c:choose>
                     <!-- 월매출-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='month_sales desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('month_sales asc'); goPreSearch();">월 매 출 ▼<br>(지난달 기준)
                           </c:when>
                           <c:when test="${param.sort=='month_sales asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('month_sales desc'); goPreSearch();">월 매 출 ▲<br>(지난달 기준)
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('month_sales asc'); goPreSearch();">월 매 출<br>(지난달 기준)
                           </c:otherwise>
                        </c:choose>
                        <!-- 업종-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='business_type1 desc, business_type2 desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('business_type1 asc, business_type2 asc'); goPreSearch();">업&nbsp;&nbsp;종▼
                           </c:when>
                           <c:when test="${param.sort=='business_type1 asc, business_type2 asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('business_type1 desc, business_type2 desc'); goPreSearch();">업&nbsp;&nbsp;종▲
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('business_type1 asc, business_type2 asc'); goPreSearch();">업&nbsp;&nbsp;종
                           </c:otherwise>
                        </c:choose>
                        <!-- 인기메뉴분류-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='best_menu_type desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('best_menu_type asc'); goPreSearch();">인기메뉴▼
                           </c:when>
                           <c:when test="${param.sort=='best_menu_type asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('best_menu_type desc'); goPreSearch();">인기메뉴▲
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('best_menu_type asc'); goPreSearch();">인기메뉴
                           </c:otherwise>
                        </c:choose>
                        <!-- 인기메뉴분류-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='addr_gu desc, addr_dong desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('addr_gu asc, addr_dong asc'); goPreSearch();">지역(동단위)▼
                           </c:when>
                           <c:when test="${param.sort=='addr_gu asc, addr_dong asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('addr_gu desc, addr_dong desc'); goPreSearch();">지역(동단위)▲
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('addr_gu asc, addr_dong asc'); goPreSearch();">지역(동단위)
                           </c:otherwise>
                        </c:choose>
                          </tr>
                         </thead>
                     <tbody>


                     <c:forEach items="${preResultList}" var="preResult" varStatus="loopTagStatus">
                     <tr>
                        <td  align=center>${preResult.PAGINGRNUM}
                        <td  align=center>${preResult.RANKING}
                        <td  align=right class=month_sales>${preResult.MONTH_SALES}
                        <td  align=left>${preResult.BUSINESS_TYPE1} > ${preResult.BUSINESS_TYPE2}
                        <td   align=center>${preResult.BEST_MENU_TYPE}
                        <td   align=center>${preResult.ADDR_GU} ${preResult.ADDR_DONG} 
                     </c:forEach>
                  </table>
               </form>
               <!-- /검색결과 form -->


               <c:if test="${empty preResultList}">
               검색 결과가 없습니다.
               </c:if>

					<br>
					<br>
					<br>
					<br>

<!--======================-->
<!-- 창업/ 뉴스 -->
<!--======================-->
<form name="preTrendForm">
	<a href="">[창업/소상공인 뉴스]</a>
</form>
	<!--==========================
      Services Section
    ============================-->
    <section id="services" class="section-bg">
      <div class="container">

        
        <div class="row">

         <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #eafde7;"><i class="ion-ios-speedometer-outline" style="color:#41cf2e;"></i></div>
              <h4 class="title"><a href="https://www.semas.or.kr/web/main/index.kmdc">소상공인시장진흥공단</a></h4>
              <p class="description">소상공인 육성, 전통시장과 상점가 지원 및 상권활성화를 구축하며 국민경제 활성화에 기여하는 준정부기관입니다.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.2s" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #e1eeff;"><i class="ion-ios-world-outline" style="color: #2282ff;"></i></div>
              <h4 class="title"><a href="http://www.sbiz.or.kr/sup/main.do">소상공인 마당</a></h4>
              <p class="description">소상공인을 위한 맞춤형 서비스와 정보접근성을 향상시켜 창업 및 운영 관련정보를 다양한 방식으로 제공받을 수 있는 포털사이트입니다.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.2s" data-wow-duration="1.4s">
            <div class="box">
              <div class="icon" style="background: #ecebff;"><i class="ion-ios-clock-outline" style="color: #8660fe;"></i></div>
              <h4 class="title"><a href="http://www.seoulsbdc.or.kr/main.do">소상공인 종합지원포털</a></h4>
              <p class="description">창업준비부터 사업의 운영까지 맞춤컨설팅 제공 및 창업자금, 멘토링 등 소상공인의 경쟁력강화를 위한 포털 사이트입니다.</p>
            </div>
          </div>
 
        </div>

      </div>
    </section><!-- #services -->
		
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
 