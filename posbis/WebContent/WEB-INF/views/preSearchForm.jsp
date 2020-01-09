<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
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
				$.ajax({
					url : "/posbis/getPreResultProc.do"
						, type : "post"
						, data : $("[name=preSearchForm]").serialize() 
						, success : function(data){
							//alert("성공");

								
								$("body").load("/posbis/preSearchForm.do",$("[name=preSearchForm]").serialize());
							
							
						}
						, error : function(request,status,error){
							alert("서버 접속 실패");
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						
						}
					}) 
					
					//document.preSearchForm.submit(); 
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
		        		 location.replace("/posbis/payFormLogin.do");
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
		        		 location.replace("/posbis/payFormLogin.do");
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
<!-- Header Section -->
	<header class="header-section">
		<a onClick="goHomePageForm();" class="site-logo" style="cursor:pointer;">
			<img src="resources/bootstrap/img/POSBIS_logo.png" alt="">
		</a>
		<nav class="header-nav">
			<ul class="main-menu">
				<li><a class="active">INFO</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goIntroForm();">POSBIS 소개</a></li>
						<li><a onClick="goHomePageForm();">Home 화면</a></li>
					</ul>
				</li>
				<li><a href="#">마이페이지</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goMyPageForm();">내정보보기</a></li>
						<li><a onClick="goMyQstnForm();">문의내역확인</a></li>
					</ul>
				</li>
				
				<li><a href="#">매장관리</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goMenuForm();">메뉴 관리</a></li>
						<li><a onClick="goSalesForm();">매출 관리</a></li>
					</ul>
				</li>
				<li><a href="#">업체동향</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goPreSearchForm();">시장분석</a></li>
						<li><a onClick="goPreChartForm();">비교차트</a></li>
					</ul>
				</li>
				<li><a href="#">고객센터</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goQstnForm();">Q&A 목록보기</a></li>
						<li><a onClick="goFAQForm();">자주 묻는 질문</a></li>
						<li><a onClick="goqstnRegForm();">문의하기</a></li>
					</ul>
				</li>
			</ul>
			<div class="header-right">

				<div class="hr-text">
				<i class="flaticon-029-telephone-1"></i><b>${user_id}</b> 님 반갑습니다                	
					<br>
                     <a style="cursor:pointer"  onClick="goMyPageForm();">[내정보 보기]</a>                        
                    &nbsp;
                     <a style="cursor:pointer"  onClick="goMainForm();"> [로그아웃] </a> 
				</div>
				<!-- <a href="#" class="hr-btn"><i class="flaticon-029-telephone-1"></i>Call us now! </a>
				<div class="hr-btn hr-btn-2">+45 332 65767 42</div> -->

			</div>
		</nav>
	</header>
	<!-- Header Section end -->


<!-- Page top Section end -->
	<section class="page-top-section set-bg"
		data-setbg="resources/bootstrap/img/page-top-bg/1.jpg">
		<div class="container">
			<h2>시장분석</h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
				<span class="sb-item active">업체동향</span> &nbsp; > &nbsp; <span class="sb-item active">시장분석</span>
			</nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->
 

  <!--==========================
	검색관리
  ============================-->
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">프리미엄 검색</a>
              </header>
              
              <div class="panel-body">
         
      <div class="container">
 	<!--======================-->
					<!------검     색        조      건-------------->
					<!--======================-->

					<!-- 검색조건 form -->
					<form name="preSearchForm" method="post"
						action="/posbis/preSearchForm.do">

			 
							<table>
								<tr>
									<td><span class="help-block"> [지 &nbsp; &nbsp;역]&nbsp;&nbsp;:&nbsp;&nbsp;</span>
									<td><select name="addr_gu1">
												<option value="">----구선택----</option>
												<c:forEach items="${addrGu1List}" var="addrGu1">
													<option value="${addrGu1.addr_gu1}">${addrGu1.addr_gu1}</option>
												</c:forEach>
										  </select> &nbsp;
								
										<select name="addr_gu2">
											<option value="">----구선택----</option>
										</select>	
								<tr>
									<td><span class="help-block"> [업 &nbsp; &nbsp; 종]&nbsp;&nbsp;:&nbsp;&nbsp;</span>
									<td> <select name="business_type_name1">
												<option value="">----대분류----
													<c:forEach items="${businessTypeName1List}"
														var="businessTypeName1">
														<option value="${businessTypeName1.business_type_name1}">${businessTypeName1.business_type_name1}
														</option>
													</c:forEach>
									   	</select> &nbsp; 
										<select name="business_type_name2">
												<option value="">----소분류----
										</select> &nbsp;
								<tr>
									<td><span class="help-block">[&nbsp;월&nbsp;매&nbsp;출&nbsp;]&nbsp;&nbsp;:&nbsp;&nbsp;<br>(지난달 기준)</span>
									<td> <input type="radio" id="month_sales_all" name="month_sales" class="month_sales" value="0"><label for="month_sales_all"> 모두 </label>
															<input type="radio" id="month_sales_2"  name="month_sales" class="month_sales" value="20000"><label for="month_sales_2"> 20,000이상</label>
															<input type="radio" id="month_sales_all_5"  name="month_sales" class="month_sales" value="50000"><label for="month_sales_all_5"> 50,000이상 </label>
															<input type="radio" id="month_sales_all_10"  name="month_sales" class="month_sales" value="100000"><label for="month_sales_all_10"> 100,000이상</label>
								<tr>
									<td>
									<td> <input type="button" value="검색" style="" onClick="goPreSearch();">&nbsp;
										 <input type="button" value="모두검색" style="" onClick="goPreSearchAll();">&nbsp;
							</table>
						 <br><br>
						
						
						  <div class="col-sm-12" align="center">
						 
				  <table class="table table-striped table-advance table-hover"  id="select">
							 <thead>
                  				<tr>
								<td align=right>
									<!-- EL 문법으로 게시판 검색 총 개수 출력 -->
									<!-- 달러{boardListAllCnt}(EL은 주석문에서 유효) 은 컨트롤러 클래스 내부에
										ModelAndView 객체에 boardListAllCnt 라는 키갑스올 저장된 데이터를
										EL 로 표현하여 삽입 -->	
									[검색 총 개수] : ${preResultAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
									<!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력 양식 -->
									<!-- 선택한 페이지 번호는 DB 연동시 아주 중요한 역할 -->	
									<select name="rowCntPerPage">
										<option value="10">10&nbsp;
										<option value="15">15&nbsp;
										<option value="20">20&nbsp;
										<option value="25">25&nbsp;
										<option value="30">30&nbsp;
									</select> 행보기
						</table>
						
			
					
						<input type="hidden" name="selectPageNo">		
						<input type="hidden" name="sort" value="ranking asc">		
					</form>
					<!-- /preSearchForm  -->


					
					
					<!-- 페이징 번호 삽입할 span 태그 선언 -->
					<div class="pagingDiv">&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
					
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
	<footer class="footer-section">
		<div class="container">
			<a href="index.html" class="footer-logo"> 
			<img src="resources/bootstrap/img/POSBIS_logo.png" alt="">
			</a>
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
 