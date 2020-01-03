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
<!--   <link href="resources/sidetopbar/css/style-responsive.css" rel="stylesheet" />
  <link href="resources/sidetopbar/css/xcharts.min.css" rel=" stylesheet">
  <link href="resources/sidetopbar/css/jquery-ui-1.10.4.min.css" rel="stylesheet"> -->
  <!-- =======================================================
  
  

  <!-- =======================================================
    Theme Name: Rapid
    Theme URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
  
  
 
  <style>
  .loginmaintaining {

    display: inline-block;
	color: #6c757d;
    width: 21%;
    
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
	
    text-align: left;

	border-top:1px solid #eeeeee ;

	border-left:1px solid #eeeeee ;

    border-right:1px solid #eeeeee ;

	border-bottom:1px solid #eeeeee ;

    display: inline-block;
    
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

         <div class="container">

           <div class="logo float-left">
             <!-- Uncomment below if you prefer to use an image logo -->
             <h1 style="cursor:pointer"  class="text-light"><a  onClick="goMainForm();" class="scrollto"><span>POSBIS</span></a></h1>
             <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
           </div>
  
          		<br>
          		<div style="float:right" class= "loginmaintaining">
    
                      <a style="float:right"><i class="icon_profile"></i>&nbsp;&nbsp;&nbsp;<b>${user_id}</b> 님 반갑습니다</a><br><br> 
                        
                       <label class="btn btn-default"><a onClick="goMyPageForm();"><i  ></i>&nbsp;&nbsp; 내정보 보기 </a></label>
                          <div style="float:right" >
                      <label class="btn btn-default"><a onClick="goMainForm();"><i class="icon_key_alt"></i>&nbsp;&nbsp;로그아웃</a></label>
 
                   </div>     
                
                </div>
                <br><br><br><br><br><br>
           
              

           <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li style="cursor:pointer"  class="drop-down"><a href="">회사소개</a>
            <ul>
              <li style="cursor:pointer" onClick="goIntroForm();"><a href="#">POSBIS</a></li>
            </ul>
          </li>
		     <li style="cursor:pointer"  class="drop-down"><a href="">마이페이지</a>
		            <ul>
		              <li style="cursor:pointer" ><a onClick="goHomePageForm();">통합 관리</a></li>
		              <li style="cursor:pointer" ><a onClick="goSalesForm();">매출 관리</a></li>
		              <li style="cursor:pointer" ><a onClick="goMenuForm();">메뉴 관리</a></li>
		              <li style="cursor:pointer" ><a onClick="goMyPageForm();">내 정보 보기</a></li>
 
		            </ul>
		          </li>
           <li style="cursor:pointer"  class="drop-down"><a href="">분석현황</a>
            <ul>
              <li style="cursor:pointer" ><a onClick="goPreSearchForm();">검색관리</a></li>
              <li style="cursor:pointer" ><a onClick="goPreChartForm();">차트관리</a></li>
            </ul>
          </li>
    
           <li style="cursor:pointer"  class="drop-down"><a href="">Q&A게시판</a>
            <ul>
              <li style="cursor:pointer" ><a onClick="goqstnRegForm();">질문하기</a></li>
           	  <li style="cursor:pointer" ><a onClick="goMyQstnForm();">내글보기</a></li>
           	  <li style="cursor:pointer" ><a onClick="goQstnForm();">목록보기</a></li>
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
          <h2>MYPAGE</h2>
 
        </div>
  <!-- 
        <div class="col-md-6 intro-img order-md-last order-first">
          <img src="resources/intro/img/intro-img.svg" alt="" class="img-fluid">
        </div> -->
      </div>

    </div>
  </section> 
 

   <!--==========================
      매출관리
    ============================-->
  <main id="main">
  
      <section id="main-content">
      <section class="wrapper">
        <!--overview start-->
 		  <div class="row">
          <div class="col-lg-10">
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">마이페이지</a></li>
              <li><i class="icon_documents_alt"></i>매출관리</li>
            </ol> 
  
  <center>

 <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	<a href="">메뉴별 매출관리</a>
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
							<a href="">[ 사업자 번호 ] :</a>
				       	<input type = "checkbox" name="chooseAllBusinessNo"> 모두선택
		      <c:forEach items="${businessNoList}" var="businessNoList">
		        <input type ="checkbox" name="chooseBusinessNo" value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})
		      </c:forEach>
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
             	<td align=left class="sumSales">
            			[메뉴 수]: ${menuSalesListAllCnt}&nbsp;&nbsp;
			            [판매수량 합계] : ${menuSalesSum.sum_sales_count} &nbsp;&nbsp;
			            [총 매출  합계] : ${menuSalesSum.sum_sales_amount}원&nbsp;&nbsp;
			            [순 매출  합계] : ${menuSalesSum.sum_sales_income}원
            <!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력양식 표현하기 -->
            <!-- 행의 개수는 DB 연동시 아주 중요한 역할을 한다. -->
                  <td align=right>
			            <select name="menuRowCntPerPage">
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
  <footer id="footer" class="section-bg">
    <div class="footer-top">
      <div class="container">

        <div class="row">

          <div class="col-lg-6">

            <div class="row">

                <div class="col-sm-6">

                  <div class="footer-info">
                    <h3>POSBIS</h3>
                    <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus. Scelerisque felis imperdiet proin fermentum leo. Amet volutpat consequat mauris nunc congue.</p>
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
                      <li><a onClick="goIntroForm();">회사소개 </a></li>
                      <li><a onClick="goMainForm();">로그인</a></li>
                      <li><a onClick="goqstnRegForm();">질문하기</a></li>
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