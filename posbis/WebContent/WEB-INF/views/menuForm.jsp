<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
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
               <td> <a href="">[사업자&nbsp;&nbsp;번호]&nbsp;&nbsp;:&nbsp;&nbsp;</a>
               <td><input type="checkbox" name="chooseAllBusinessNo" id="business_no_all"><label for="business_no_all">모두선택</label>
                     <c:forEach items="${businessNoList}" var="businessNoList">
                  <input type="checkbox" name="chooseBusinessNo" id="${businessNoList.business_no}"
                     value="${businessNoList.business_no}"><label for="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})</label>
               </c:forEach>
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
                  <select name="rowCntPerPage">
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
 