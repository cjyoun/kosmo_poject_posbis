<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
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
         
         
         $(document).ready(function() {
            
            $('[name = rowCntPerPage]').change(function() {
               goSearch();
            });
            
            // class=pagingNumber 안에 페이징 처리 소스 삽입 
            $(".pagingNumber").html(
               getPagingNumber(
                  "${menuListAllCnt}"            //검색 결과 총 행 개수
                  ,"${menuSearchDTO.selectPageNo}"   //선택된 현재 페이지번호
                  ,"${menuSearchDTO.rowCntPerPage}"   //페이지 당 출력행의 개수
                  ,"15"                        //페이지 당 보여줄 페이지번호 개수
                  ,"goSearch();"                  //페이지번호 클릭 후 실행할 자스코드
               )
            );
            
            
            var is_used = $('input[name="menu_using"]:checked').val();
            // 검색조건 입력양식에 넣어주기
            inputData("[name=selectPageNo]","${menuSearchDTO.selectPageNo}");
            inputData("[name=rowCntPerPage]","${menuSearchDTO.rowCntPerPage}");
            inputData("[name=keyword]","${menuSearchDTO.keyword}");
            inputData("[name=menu_using]","${menuSearchDTO.menu_using}");
            inputData("[name=chooseAllBusinessNo]","${menuSearchDTO.chooseAllBusinessNo}");
            <c:forEach items="${menuSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
               inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
            </c:forEach>

            
            // 사업자번호 체크시
            if($("[name=chooseBusinessNo]:checked").length==0){
               $("[name=chooseBusinessNo]").prop("checked",true);
               $("[name=chooseAllBusinessNo]").prop("checked",true);
                document.menuForm.submit();
                menuSearchDTO.setChooseBusinessNo($("[name=menuForm] [name=chooseBusinessNo]").val());
            }
            if($("[name=chooseBusinessNo]:not(:checked)").length==0){
               $("[name=chooseAllBusinessNo]").prop("checked",true);
            } 
            var allbusi = $("[name=chooseAllBusinessNo]");
            allbusi.change(function() {
               $("[name=chooseBusinessNo]").prop( "checked", allbusi.is(":checked") );
            });

            $("[name=chooseBusinessNo]").change(function(){
               if ($("[name=chooseBusinessNo]:not(:checked)").length > 0){
                  allbusi.prop("checked",false);
               }else{
                  allbusi.prop("checked",true);
               }
            });// 사업자번호 체크시 끝
            
            
            // 콤마처리 함수
            $(".price_amount").each(function() {
               var num = $(this).text();
               var commaNum = numberWithCommas(num);
               $(this).text(commaNum);
            });// 콤마처리 함수 끝
               
         }); // $(document).readuy(function() {

         
            // 콤마처리 함수
            function numberWithCommas(number) {
               var parts = number.toString().split(".");
               parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
               return parts.join(".");
            }

            
            // 검색 함수
            function goSearch() {
               if (is_empty("[name=menuForm] [name=keyword]")) {
                  $("[name=menuForm] [name=keyword]").val("");
               }

               var keyword = $("[name=menuForm] [name=keyword]").val();
                  keyword = $.trim(keyword);
                  $("[name=menuForm] [name=keyword]").val(keyword)
                  document.menuForm.submit();
            }
            
            // 모두검색 함수
            function goSearchAll(){
               document.menuForm.reset();
               $("[name=menuForm] [name=selectPageNo]").val("1");
               $("[name=menuForm] [name=rowCntPerPage]").val("15");
               $('[name=menu_using]').prop("checked",false);
               <c:forEach items="${salesSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
               inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
               </c:forEach>
               goSearch();
            }
            
            
            // 메뉴등록 페이지로 이동
            function goMenuRegForm(business_no) {
               var str = "business_no="+business_no+"&"+$("[name = menuForm]").serialize();
                  location.replace( "/posbis/menuRegForm.do?"+str );
            }
         
/*             // 메인페이지로 이동
            function goMainForm() {
               location.replace("/posbis/mainForm.do");
            }
            
            // 마이페이지로 이동
            function goMyPageForm() {
               location.replace("/posbis/myPageForm.do");
            }
         
            // 메뉴관리 페이지로 이동
            function goMenuForm() {
               location.replace("/posbis/menuForm.do");
            }
         
            // 매출관리 페이지로 이동
            function goSalesForm() {
               location.replace("/posbis/salesForm.do");
            }

            // 프리미엄으로 페이지로 이동
            // 이동 시일반 회원은 프리미엄 부분에 들어가지 못하게 하는 함수
            function goPreChartForm(){
               var rank_code = ${rank_code};
               if(rank_code == 2){
                  location.replace("/posbis/preChartForm.do");
                }else{
                  if(confirm("프리미엄 회원 등록을 위해 카드결제 화면으로 이동하시겠습니까?")==false) {
                     return;
                  }else{
                     location.replace("/posbis/payForm.do");
                  }
               }
            } */

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
			<h2>메뉴관리</h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
				<span class="sb-item active">매장관리</span>&nbsp; > &nbsp; <span class="sb-item active">메뉴관리</span>
			</nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->

  
<!--==========================
      메뉴관리
    ============================-->
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	   <a href="">메뉴관리</a>
              </header>
         <div class="panel-body">
         
      <div class="container">
          
         <form name="menuForm" method="post" action="/posbis/menuForm.do">
         <!-- 메뉴관리 검색 조건 및 메뉴등록  -->
         <div style="float:right"><a href = "javascript:goMenuRegForm();">[메뉴 등록]으로 이동 &nbsp;&nbsp;&nbsp;</a></div><br><br>
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
               <br> 
            <tr>
               <td> <a href="">[메뉴사용여부]&nbsp;&nbsp;:&nbsp;&nbsp;</a>
               <td><input type ="radio" id= "menu_using_all" name="menu_using" class="menu_using"  value="menu_using"><label for="menu_using_all">모두보기</label>
                  <input type ="radio" id= "menu_using_y" name="menu_using" class="menu_using" value="Y" checked><label for="menu_using_y">사용</label>
                  <input type ="radio" id= "menu_using_n" name="menu_using" class="menu_using" value="N"><label for="menu_using_n">미사용</label><br>
            <br>  
            <tr>
               <td> <a href="">[키&nbsp;&nbsp;&nbsp;워&nbsp;&nbsp;&nbsp;드]&nbsp;&nbsp;:&nbsp;&nbsp;</a>
               <td><input type="text" name="keyword" class="keyword">
                  <input type="button" value="검   색" onClick="goSearch();">&nbsp;
                  <input type="button" value="모두검색" onClick="goSearchAll();">&nbsp;
         <br></table><br>
            <!-- 메뉴관리 검색 조건 및 메뉴등록 끝 -->
              <div class="col-sm-12" align="center">
             <table class="table table-striped table-advance table-hover" id="select">
                    <thead>
                        <tr>
                        <td align=right>
                  <!-- 총개수 리턴 -->
                  [메뉴 총 개수] : ${menuListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
                  
                  <!-- 행보기 선택 select -->
                  <select name="rowCntPerPage" style="width:50px;">
                     <option value="10">10
                     <option value="15">15
                     <option value="20">20
                     <option value="25">25
                     <option value="30">30
                  </select> 행보기
            </table>
            
            
            <!------------------ 메뉴리스트 페이징 및 총개수 리턴 보여주기 ---------------------->
            <div class="pagingDiv">&nbsp; <span class="pagingNumber"></span> &nbsp;</div>
               
               
            
            
               <!-- 선택한 페이지 번호 저장되는 입력양식 -->
               <input type="hidden" name="selectPageNo">
               <input type="hidden" name="sort" value="business_name asc">
               <input type="hidden" name="user_id" value="${user_id}">
               <!------------------ 메뉴리스트 페이징 및 총개수 리턴 보여주기 끝---------------------->
            
      
         <!--======================-->
      <!--======검색결과=======-->
      <!--======================-->
         
      <table class="table table-striped table-advance table-hover"  id="menu">
         <thead>
                <tr>
          <th>번호
                  <!-- 매장이름 -->
                  <c:choose>
                     <c:when test="${param.sort=='business_name desc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('business_name asc'); goSearch();">매장이름▼
                     </c:when>
                     <c:when test="${param.sort=='business_name asc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('business_name desc'); goSearch();">매장이름▲
                     </c:when>
                     <c:otherwise>
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('business_name asc'); goSearch();">매장이름
                     </c:otherwise>
                  </c:choose>
                  
                  <!-- 대분류 -->
                  <c:choose>
                     <c:when test="${param.sort=='main_category_name desc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('main_category_name asc'); goSearch();">대분류▼
                     </c:when>
                     <c:when test="${param.sort=='main_category_name asc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('main_category_name desc'); goSearch();">대분류▲
                     </c:when>
                     <c:otherwise>
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('main_category_name asc'); goSearch();">대분류
                     </c:otherwise>
                  </c:choose>
                  
                  <!-- 중분류 -->
                  <c:choose>
                     <c:when test="${param.sort=='mid_category_name desc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('mid_category_name asc'); goSearch();">중분류▼
                     </c:when>
                     <c:when test="${param.sort=='mid_category_name asc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('mid_category_name desc'); goSearch();">중분류▲
                     </c:when>
                     <c:otherwise>
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('mid_category_name asc'); goSearch();">중분류
                     </c:otherwise>
                  </c:choose>
                  
                  <!-- 소분류 -->
                  <c:choose>
                     <c:when test="${param.sort=='sub_category_name desc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('sub_category_name asc'); goSearch();">소분류▼
                     </c:when>
                     <c:when test="${param.sort=='sub_category_name asc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('sub_category_name desc'); goSearch();">소분류▲
                     </c:when>
                     <c:otherwise>
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('sub_category_name asc'); goSearch();">소분류
                     </c:otherwise>
                  </c:choose>
                  
                  <!-- 메뉴이름 -->
                  <c:choose>
                     <c:when test="${param.sort=='menu_name desc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_name asc'); goSearch();">메뉴이름▼
                     </c:when>
                     <c:when test="${param.sort=='menu_name asc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_name desc'); goSearch();">메뉴이름▲
                     </c:when>
                     <c:otherwise>
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_name asc'); goSearch();">메뉴이름
                     </c:otherwise>
                  </c:choose>
                  
                  <!-- 메뉴가격 -->
                  <c:choose>
                     <c:when test="${param.sort=='menu_price desc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_price asc'); goSearch();">메뉴가격▼
                     </c:when>
                     <c:when test="${param.sort=='menu_price asc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_price desc'); goSearch();">메뉴가격▲
                     </c:when>
                     <c:otherwise>
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_price asc'); goSearch();">메뉴가격
                     </c:otherwise>
                  </c:choose>
                  
                  <!-- 메뉴원가 -->
                  <c:choose>
                     <c:when test="${param.sort=='menu_cost desc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_cost asc'); goSearch();">메뉴원가▼
                     </c:when>
                     <c:when test="${param.sort=='menu_cost asc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_cost desc'); goSearch();">메뉴원가▲
                     </c:when>
                     <c:otherwise>
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_cost asc'); goSearch();">메뉴원가
                     </c:otherwise>
                  </c:choose>
                  
                  <!-- 메뉴이익단가 -->
                  <c:choose>
                     <c:when test="${param.sort=='10 desc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('10 asc'); goSearch();">메뉴이익단가▼
                     </c:when>
                     <c:when test="${param.sort=='10 asc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('10 desc'); goSearch();">메뉴이익단가▲
                     </c:when>
                     <c:otherwise>
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('10 asc'); goSearch();">메뉴이익단가
                     </c:otherwise>
                  </c:choose>
                  
                  <!-- 사용여부 -->
                  <c:choose>
                     <c:when test="${param.sort=='menu_using desc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_using asc'); goSearch();">사용여부▼
                     </c:when>
                     <c:when test="${param.sort=='menu_using asc'}">
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_using desc'); goSearch();">사용여부▲
                     </c:when>
                     <c:otherwise>
                        <th style="cursor:pointer" 
                           onClick="$('[name=sort]').val('menu_using asc'); goSearch();">사용여부
                     </c:otherwise>
                  </c:choose>
                  
                  </tr>
                </thead>
            <tbody>
         
               <!----- 불러온 메뉴 list 보여주기 ----->
               <c:forEach items="${menuList}" var="menu" varStatus="loopTagStatus">
 
                  <tr style="cursor: pointer" onClick="goMenuUpDelForm(${menu.menu_no});">
                  <!-- 번호 정순 출력 -->
                  <td>
                  ${menuSearchDTO.selectPageNo*menuSearchDTO.rowCntPerPage-
                                        menuSearchDTO.rowCntPerPage+1+loopTagStatus.index}
                  <!-- 매장명출력 -->
                 <td>${menu.business_name}</td>
                  <!-- 대분류출력 -->
                  <td>${menu.main_category_name}</td>
                  <!-- 각 행의 메뉴 중분류 출력  -->
                  <td>${menu.mid_category_name}</td>
                  <!-- 각 행의 메뉴 소분류 출력  -->
                  <td>${menu.sub_category_name}</td>
                  <!-- 각 행의 메뉴 이름 출력  -->
                  <td>${menu.menu_name}</td>
                  <!-- 각 행의 메뉴 가격 출력  -->
                  <td  align=right class=price_amount>${menu.menu_price}원</td>
                  <!-- 각 행의 메뉴 원가 출력  -->
                  <td  align=right class=price_amount>${menu.menu_cost}원</td>
                  <!-- 각 행의 메뉴 이익 단가 출력  -->
                  <td  align=right class=price_amount>${menu.menu_avail}원</td>
                  <!-- 각 행의 메뉴 사용 여부 출력  -->
                  <td align=center class=menu_using value="${menu.menu_using}">
                           <c:if test="${menu.menu_using=='Y'}">
                              사용
                           </c:if>
                           <c:if test="${menu.menu_using=='N'}">
                              미사용
                           </c:if>
                      </td>
               </c:forEach>
            </table>
            
               <c:if test="${empty menuList}">
                  검색 결과가 없습니다.
               </c:if>
            
         </form>
         <script>
            // 메뉴 수정 화면 이동
            function goMenuUpDelForm(menu_no) {
               var str = "menu_no=" + menu_no + "&"
                     + $("[name = menuForm]").serialize();
               location.replace("/posbis/menuUpDelForm.do?" + str);
            }
         </script>
 </div><!-- 메인 div 끝 -->
         
      </div><!-- 화면전에 div 끝 -->
 
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
 