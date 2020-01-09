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
			
		     
			
			$('[name=menuRowCntPerPage]').change(function(){
			  	goSearch();
			});
			
			//==============================================================================================
			
			//페이징 처리 관련 HTML 소스를 class=pagingNumber2 가진 태그 안에 삽입하기			
			$(".pagingNumber2").html(
				getPagingNumber(
					"${menuSalesListAllCnt}"			//검색 결과 총 행 개수
					,"${menuSalesSearchDTO.selectPageNo}"	//선택된 현재 페이지번호
					,"${menuSalesSearchDTO.menuRowCntPerPage}"	//페이지 당 출력행의 개수
					,"15"								//페이지 당 보여줄 페이지번호 개수
					,"goSearch();" 				//페이지번호 클릭 후 실행할 자스코드
				)
			);

//=====================================================================================================
			//클라이언트가 보낸 검색 조건을 입력 양식에 넣어주기

			inputData("[name=selectPageNo]","${menuSalesSearchDTO.selectPageNo}");
			inputData("[name=menuRowCntPerPage]","${menuSalesSearchDTO.menuRowCntPerPage}");
			inputData("[name=keyword]","${menuSalesSearchDTO.keyword}");
			inputData("[name=sales_date]","${menuSalesSearchDTO.sales_date}");
			inputData("[name=sales_date_t1]","${menuSalesSearchDTO.sales_date_t1}");
			inputData("[name=sales_date_t2]","${menuSalesSearchDTO.sales_date_t2}");
			inputData("[name=chooseAllBusinessNo]","${menuSalesSearchDTO.chooseAllBusinessNo}");

			inputData("[name=sort]","${menuSalesSearchDTO.sort}");
			
			<c:forEach items="${menuSalesSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
				inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
			</c:forEach> 

			//==============================================================================================
			if($("[name=chooseBusinessNo]:checked").length==0){
				$("[name=chooseBusinessNo]").prop("checked",true);
				$("[name=chooseAllBusinessNo]").prop("checked",true);
				
		 		document.menuSalesForm.submit();
				MenuSalesSearchDTO.setChooseBusinessNo($("[name=menuSalesForm] [name=chooseBusinessNo]").val());
			} 

			var allbusi = $("[name=chooseAllBusinessNo]");
            allbusi.change(function() {
                $("[name=chooseBusinessNo]").prop( "checked", allbusi.is(":checked") );
             });
			
			if($("[name=chooseBusinessNo]:not(:checked)").length==0){
				$("[name=chooseAllBusinessNo]").prop("checked",true);
			} 
			
             $("[name=chooseBusinessNo]").change(function(){
                if( $("[name=chooseBusinessNo]:not(:checked)").length>0){
                   allbusi.prop("checked",false);
                }
                else{
                   allbusi.prop("checked",true);
                }
             });
             
//=====================================================================================================

    	  $(".menu_price").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });

		  $(".menu_sales_amount").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum + "원");
	      });
	      
	  	  $(".menu_sales_count").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum);
	      });
	  	  $(".menu_sales_income").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });
	      
  	  	$(".sumSales").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum);
	      });
	      
//=====================================================================================================

	});

      	function numberWithCommas(number) {
    	    var parts = number.toString().split(".");
    	    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	    return parts.join(".");
    	}
    	
//=====================================================================================================
    	
         // 검색 함수
         function goSearch(){
 			//만약 키워드가 공백 또는 길이가 없다면 길이없는 데이터로 세팅하기
 			//공백 상태에서 서버로 전송되면 공백을 가지고 DB를 검색한다.
 			//이 현상을 막기 위해 공백 또는 길이가 없다면 길이없는 데이터로 통일해서 세팅한다.
 			if(is_empty("[name=menuSalesForm] [name=keyword]")){
 				$("[name=menuSalesForm] [name=keyword]").val("");
 			}
 			//키워드 앞뒤에 공백이 있으면 제거하고 다시 넣어주기
 			var keyword = $("[name=menuSalesForm] [name=keyword]").val();
 			keyword = $.trim(keyword);
 			$("[name=menuSalesForm] [name=keyword]").val(keyword);

 			if(!is_empty("[name=menuSalesForm] [name=sales_date_t1]")){
 				$("[name=menuSalesForm] [name=sales_date]").val("");
 			}
  			if(!is_empty("[name=menuSalesForm] [name=sales_date_t2]")){
 				$("[name=menuSalesForm] [name=sales_date]").val("");
 			} 
 			 
  			
  			 
  			//ajax자리

			$.ajax({
				// 서버 쪽 호출 URL 주소 지정
				url : "/posbis/menuSalesProc.do"
				
				// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
				, type : "post"

				// 서버로 보낼 파라미터명과 파라미터 값을 설정
				, data : $("[name=menuSalesForm]").serialize()				
				
				// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
				// 익명함수의 매개변수 data에는 서버가 응답한 데이터가 들어온다.
				, success : function(menuSalesDTO){
					if(menuSalesDTO != null){
									$("body").load("/posbis/menuSalesForm.do",$("[name=menuSalesForm]").serialize());

					}
					else if (menuSalesForm == null){
						alert("실패");
					}
					else {
						alert("서버 오류 발생. 관리자에게 문의 바람");
					} 
				}
				
				// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				, error : function(request, error){
					alert("서버 접속 실패");
					
				}
				
			});
  			
  			
         }

//=====================================================================================================

//=====================================================================================================

		function goSearchAll(){
			inputData("[name=selectPageNo]","1");
			inputData("[name=menuRowCntPerPage]","${menuSalesSearchDTO.menuRowCntPerPage}");
			inputData("[name=keyword]","");
			$('[name=sales_date]').prop("checked",false);
			inputData("[name=sales_date_t1]","");
			inputData("[name=sales_date_t2]","");
			<c:forEach items="${menuSalesSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
				inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
			</c:forEach>
			goSearch();
		}

	 
		 
		 function dateChange(){
			 var minDate = new Date($('.sales_date_t1').val());
			 var selectDate = new Date($('.sales_date_t2').val());
			  if(minDate>selectDate){
					alert("올바른 기간으로 선택해주세요");
					$('.sales_date_t1').val("");
					$('.sales_date_t2').val("");
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
				<li><a class="active">회사소개</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goIntroForm();">POSBIS</a></li>
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
			<h2>매출관리</h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
				<span class="sb-item active">매장관리</span>&nbsp; > &nbsp; <span class="sb-item active">메뉴별 매출관리</span>
			</nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->

   <!--==========================
      매출관리
    ============================-->
    <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">매출관리</a>
              </header>
              
              <div class="panel-body">
				   	<form name="salesForm" method="post" action="/posbis/salesForm.do">
					</form>
   <form name = "menuSalesForm" method="post" action="/posbis/menuSalesForm.do">
					<div  class="form-group">
						<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
 
 
             <div style="float:right"><a href="javascript:;" onclick="goSalesForm();" >[매출관리]로 이동</a>&nbsp;&nbsp;&nbsp;</div><br><br> 
		<table>
			<tr>
				<td>
					<table><tr><td>
		               <a href="">[ 사업자 번호 ] :</a>
		                  <td><input type = "checkbox" name="chooseAllBusinessNo"> 모두선택
		               <tr>
		            <c:forEach items="${businessNoList}" var="businessNoList" varStatus="status">
		              <td><input type ="checkbox" name="chooseBusinessNo" value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})&nbsp;&nbsp;
		                    <c:if test="${(status.index+1)%3==0}">
		                     <c:if test="${!status.last }">
		                        <tr>
		                     </c:if>
		                  </c:if>   
		            </c:forEach>
		            </table>
		      <br><br>		      
			<tr>
				<td>
				   
				<a href="">[ 기간&nbsp;&nbsp;&nbsp;설정 ] : </a><input type="date" name="sales_date_t1" class="sales_date_t1" onchange="dateChange();">
				 ~ <input type="date" name="sales_date_t2" class="sales_date_t2" onchange="dateChange();"></span>
				<br><br>
			<tr>
				<td>	
								<a href="">[ 기간&nbsp;&nbsp;&nbsp;선택 ] : </a>
				               <input type = "radio" name="sales_date" class="sales_date" value="1" >금일매출&nbsp;
				               <input type = "radio" name="sales_date" class="sales_date" value="2" >최근 일주일매출&nbsp;
				               <input type = "radio" name="sales_date" class="sales_date" value="3" >이번달매출<br></span>
 				<br> 
			<tr>
				<td>			      
				             <a href="">[ 키&nbsp;&nbsp;&nbsp;워&nbsp;&nbsp;드 ] : </a>
				             <input type = "text" name="keyword" class="keyword">&nbsp;
				             <input type="button" value="검   색" onClick="goSearch();">&nbsp;
              				 <input type="button" value="모두 검색" onClick="goSearchAll();"></span></span>&nbsp;&nbsp;
              				 
       </table>
 <!-- =========================================================================================================================================================================== -->
 
 
						
						<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
						<!-- 선택한 페이지번호는 DB 연동시 아주 중요한 역할을 한다 -->
						<!-- 개발중에는 테스트를 위해 type을 text로 바꿔놓으면 눈에 보여서 편하다 -->
						<input type="hidden" name="selectPageNo"> 
						<input type="hidden" name="sort" value=“s.menu_name asc”> 
						<input type="hidden" name="user_id" value="${user_id}">  
						
					</div>	
					
					
					
     <div class="col-sm-12" align="center">
		      <table class="table table-striped table-advance table-hover" id="select">
                <thead>
			<tr>
             	<td align=center  class="sumSales">
            			[메뉴 수]: ${menuSalesListAllCnt}&nbsp;&nbsp;
			            [판매수량 합계] : ${menuSalesSum.sum_sales_count} &nbsp;&nbsp;
			            [총 매출  합계] : ${menuSalesSum.sum_sales_amount}원&nbsp;&nbsp;
			            [순 매출  합계] : ${menuSalesSum.sum_sales_income}원
            <!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력양식 표현하기 -->
            <!-- 행의 개수는 DB 연동시 아주 중요한 역할을 한다. -->
             <tr><br>     
                  <td align=right>
			            <br> <select name="menuRowCntPerPage" style="width:50px;">
			               <option value="10">10
			               <option value="15">15
			               <option value="20">20
			               <option value="25">25
			               <option value="30">30
			            </select> 행보기
			   </table>
			</form>
       <!-- ==================================================================================== -->         
            
                   <!-- 페이징 번호를 삽입할 span 태그 선언하기  -->
      <div class="pagingDiv2">&nbsp;<span class="pagingNumber2"></span>&nbsp;</div>
      	<table class="table table-striped table-advance table-hover " id="menuSales">
            <thead>
                <tr>
             <th>no
                <c:choose>
				<c:when test="${param.sort=='1 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('1 asc'); goSearch();">상호명 ▼
				</c:when>
				<c:when test="${param.sort=='1 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('1 desc'); goSearch();">상호명 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('1 asc'); goSearch();">상호명
				</c:otherwise>
				</c:choose>
				
                <c:choose>
				<c:when test="${param.sort=='2 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('2 asc'); goSearch();">메뉴 ▼
				</c:when>
				<c:when test="${param.sort=='2 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('2 desc'); goSearch();">메뉴 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('2 asc'); goSearch();">메뉴
				</c:otherwise>
				</c:choose>
				
                <c:choose>
				<c:when test="${param.sort=='3 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('3 asc'); goSearch();">가격 ▼
				</c:when>
				<c:when test="${param.sort=='3 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('3 desc'); goSearch();">가격 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('3 asc'); goSearch();">가격
				</c:otherwise>
				</c:choose>
				
                <c:choose>
				<c:when test="${param.sort=='4 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('4 asc'); goSearch();">수량 ▼
				</c:when>
				<c:when test="${param.sort=='4 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('4 desc'); goSearch();">수량 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('4 asc'); goSearch();">수량
				</c:otherwise>
				</c:choose>
				
                <c:choose>
				<c:when test="${param.sort=='5 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('5 asc'); goSearch();">총매출 ▼
				</c:when>
				<c:when test="${param.sort=='5 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('5 desc'); goSearch();">총매출 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('5 asc'); goSearch();">총매출
				</c:otherwise>
				</c:choose>
				
                <c:choose>
				<c:when test="${param.sort=='6 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('6 asc'); goSearch();">순매출 ▼
				</c:when>
				<c:when test="${param.sort=='6 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('6 desc'); goSearch();">순매출 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('6 asc'); goSearch();">순매출
				</c:otherwise>
				</c:choose>
                  </tr>
                </thead>
            <tbody>
                <c:forEach items="${menuSalesList}" var="menuSales" varStatus="loopTagStatus">  <!-- requestScope.은 생략 가능 -->
                  <tr>
                    <td>
					<%-- 게시판 목록 중에 각 행의 정순 일련번호 출력--%>
		${menuSalesSearchDTO.selectPageNo*menuSalesSearchDTO.menuRowCntPerPage-menuSalesSearchDTO.menuRowCntPerPage+1
																					+loopTagStatus.index}  
					<!-- 각 행의 상호명 출력 -->
					<td>${menuSales.business_name2}
					<!-- 각 행의 메뉴 이름 출력 -->
					<td>${menuSales.menu_name2}
					<!-- 각 행의 메뉴 가격 출력 -->
					<td  align=right   class="menu_price">${menuSales.menu_price2}
					<!-- 각 행의 판매 수량 출력 -->
					<td   align=right class="menu_sales_count">${menuSales.sales_count2}
					<!-- 각 행의 총매출 출력 -->
					<td   align=right class="menu_sales_amount">${menuSales.sales_amount2}
					<!-- 각 행의 순매출 출력 -->
					<td   align=right class="menu_sales_income">${menuSales.sales_income2}
					
					
                  </tr>
                 </c:forEach>
                 </tbody>
   
            </table>
         <c:if test="${empty menuSalesList}">
		검색결과 없음
		</c:if> 
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
 