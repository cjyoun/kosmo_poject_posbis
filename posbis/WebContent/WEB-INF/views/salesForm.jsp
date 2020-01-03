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
		 
						
			//name="rowCntPerPage"에 change 이벤트가 발생하면 실행할 코드 설정하기
			$('[name=rowCntPerPage]').change(function(){
				goSearch();
			});
			//==============================================================================================
			//페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기
			$(".pagingNumber").html(
				getPagingNumber(
					"${salesListAllCnt}"				//검색 결과 총 행 개수
					,"${salesSearchDTO.selectPageNo}"	//선택된 현재 페이지번호
					,"${salesSearchDTO.rowCntPerPage}"	//페이지 당 출력행의 개수
					,"15"								//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지번호 클릭 후 실행할 자스코드
				)
			);

//=====================================================================================================
			//클라이언트가 보낸 검색 조건을 입력 양식에 넣어주기
			
			//inputData("[name=user_id]","${salesSearchDTO.user_id}");
			inputData("[name=selectPageNo]","${salesSearchDTO.selectPageNo}");
			inputData("[name=rowCntPerPage]","${salesSearchDTO.rowCntPerPage}");
			inputData("[name=keyword]","${salesSearchDTO.keyword}");
			inputData("[name=sales_date]","${salesSearchDTO.sales_date}");
			inputData("[name=sales_date_t1]","${salesSearchDTO.sales_date_t1}");
			inputData("[name=sales_date_t2]","${salesSearchDTO.sales_date_t2}");
			inputData("[name=chooseAllBusinessNo]","${salesSearchDTO.chooseAllBusinessNo}");
			
			inputData("[name=sort]","${salesSearchDTO.sort}");

			<c:forEach items="${salesSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
				inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
			</c:forEach>

			//==============================================================================================
			if($("[name=chooseBusinessNo]:checked").length==0){
				$("[name=chooseBusinessNo]").prop("checked",true);
				$("[name=chooseAllBusinessNo]").prop("checked",true);
				
		 		document.salesForm.submit();
				SalesSearchDTO.setChooseBusinessNo($("[name=salesForm] [name=chooseBusinessNo]").val());
			} 
			
			if($("[name=chooseBusinessNo]:not(:checked)").length==0){
				$("[name=chooseAllBusinessNo]").prop("checked",true);
			} 

			var allbusi = $("[name=chooseAllBusinessNo]");
            allbusi.change(function() {
                $("[name=chooseBusinessNo]").prop( "checked", allbusi.is(":checked") );
             });
             $("[name=chooseBusinessNo]").change(function(){
                if( $("[name=chooseBusinessNo]:not(:checked)").length>0){
                   allbusi.prop("checked",false);
                }
                else{
                   allbusi.prop("checked",true);
                }
             });
 			//==============================================================================================

 
			
	       var sumC = 0;
	       $('tr').find('.sales_count').each(function () {
	           var sales_count = $(this).text();
	           if (!isNaN(sales_count) && sales_count.length !== 0) {
	        	   sumC += parseFloat(sales_count);
	           }
	       });
	       $('.total-sales_count').html(sumC);

	       var sumA = 0;
	       $('tr').find('.sales_amount').each(function () {
	           var sales_amount = $(this).text();
	           if (!isNaN(sales_amount) && sales_amount.length !== 0) {
	        	   sumA += parseFloat(sales_amount);
	           }
	       });
	       $('.total-sales_amount').html(sumA);

	       var sumI = 0;
	       $('tr').find('.sales_income').each(function () {
	           var sales_income = $(this).text();
	           if (!isNaN(sales_income) && sales_income.length !== 0) {
	        	   sumI += parseFloat(sales_income);
	           }
	       });
	       $('.total-sales_income').html(sumI);



//=====================================================================================================
    	  $(".sales_amount").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum + "원");
	      });
    	  $(".total-sales_amount").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });
    	  $(".menu_price").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });
  	  	  $(".sales_count").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum);
	      });
  	  	  $(".total-sales_count").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum);
	      });
  	  	  $(".sales_income").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });
	  	  $(".total-sales_income").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
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
 			if(is_empty("[name=salesForm] [name=keyword]")){
 				$("[name=salesForm] [name=keyword]").val("");
 			}
 			//키워드 앞뒤에 공백이 있으면 제거하고 다시 넣어주기
 			var keyword = $("[name=salesForm] [name=keyword]").val();
 			keyword = $.trim(keyword);
 			$("[name=salesForm] [name=keyword]").val(keyword);

 			if(!is_empty("[name=salesForm] [name=sales_date_t1]")){
 				$("[name=salesForm] [name=sales_date]").val("");
 			}
  			if(!is_empty("[name=salesForm] [name=sales_date_t2]")){
 				$("[name=salesForm] [name=sales_date]").val("");
 			} 
 			//name=salesForm을 가진 form 태그의 action 값의 URL로 웹서버에 접속하기
  			$.ajax({
				// 서버 쪽 호출 URL 주소 지정
				url : "/posbis/salesProc.do"
				
				// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
				, type : "post"

				// 서버로 보낼 파라미터명과 파라미터 값을 설정
				, data : $("[name=salesForm]").serialize()				
				
				// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
				// 익명함수의 매개변수 data에는 서버가 응답한 데이터가 들어온다.
				, success : function(salesDTO){
					if(salesDTO != null){
									//alert("성공");
									//alert( $("[name=salesForm]").serialize() );
									//$("body").remove(".right");
									$("body").load("/posbis/salesForm.do",$("[name=salesForm]").serialize());

					}
					else if (salesDTO == null){
						alert("실패");
					}
					else {
						alert("서버 오류 발생. 관리자에게 문의 바람");
					} 
				}
				
				// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				, error : function(request, error){
					alert("서버 접속 실패");
					alert($("[name=salesForm]").serialize());
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					
				}
				
			});
 			
         }

//=====================================================================================================
       
//=====================================================================================================

		function goSearchAll(){
			inputData("[name=selectPageNo]","1");
			inputData("[name=rowCntPerPage]","${salesSearchDTO.rowCntPerPage}");
			inputData("[name=keyword]","");
			$('[name=sales_date]').prop("checked",false);
			inputData("[name=sales_date_t1]","");
			inputData("[name=sales_date_t2]","");
			<c:forEach items="${salesSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
				inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
			</c:forEach>
			goSearch();
		}

		function showMenuSales(){
			
			document.menuSalesForm.submit();
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
           <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	 <a href="">매출관리</a>
              </header>
			<div class="panel-body"> 
				 <form name = "salesForm" method="post" action="/posbis/salesForm.do">
					<div  class="form-group">
						<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
						 
            					  
       			<div style="float:right"> <a href="javascript:;" onclick="showMenuSales();" >[메뉴별 매출관리]로 이동 &nbsp;&nbsp;&nbsp;</a></div><br><br> 
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
				   
				<a href="">[ 기간&nbsp;&nbsp;&nbsp;설정 ] : </a><input type="date" name="sales_date_t1" class="sales_date_t1"> ~ <input type="date" name="sales_date_t2" class="sales_date_t2" onchange="dateChange();"></span>
						      
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
				             <a href="">[ 키&nbsp;&nbsp;&nbsp;워&nbsp;&nbsp;드 ] : </a><input type = "text" name="keyword" class="keyword">&nbsp;
				             <input type="button" value="검   색" onClick="goSearch();">&nbsp;
              				 <input type="button" value="모두 검색" onClick="goSearchAll();"></span></span>&nbsp;&nbsp;
              				
              			</table>
 <!-- =========================================================================================================================================================================== -->
 
 
 
 
 
 
 
 
 
 
 
 
						
						<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
						<!-- 선택한 페이지번호는 DB 연동시 아주 중요한 역할을 한다 -->
						<!-- 개발중에는 테스트를 위해 type을 text로 바꿔놓으면 눈에 보여서 편하다 -->
						<input type="hidden" name="selectPageNo"> 
						<input type="hidden" name="sort" value=“s.sales_date_desc”> 
						<input type="hidden" name="user_id" value="${user_id}">  
						
					</div>	

<!--************************************************************************************************************************-->
              <div class="col-sm-12" align="center">
            
              <table class="table table-striped table-advance table-hover" id="select">
                <thead>
                  <tr>
                  <td align=right>
                  <!-- EL 문법으로 게시판 검색 총 개수 출력하기 -->
            <!-- 달러{salesAllCnt} 은  컨트롤러 클래스 내부에 -->       <!-- EL문법은 주석문 안에 들어가더라도 소스보기 했을 때 실행결과가 삽입된다. 문법에 맞지 않는 내용을 삽입할 시에는 에러발생 -->
            <!-- ModelAndView 객체에 salesAllCnt 라는 키값으로 저장된 -->
            <!-- 데이터를 EL로 표현하여 삽입하라는 뜻이다. -->
            		[거래 건수]: ${salesListAllCnt}&nbsp;&nbsp;

            <!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력양식 표현하기 -->
            <!-- 행의 개수는 DB 연동시 아주 중요한 역할을 한다. -->
			            <select name="rowCntPerPage">
			               <option value="10">10
			               <option value="15">15
			               <option value="20">20
			               <option value="25">25
			               <option value="30">30
			            </select> 행보기
			   </table>
			</form>
   	<form name="menuSalesForm" method="post" action="/posbis/menuSalesForm.do">
					</form>      
            <!-- 페이징 번호를 삽입할 span 태그 선언하기  -->
      <div class="pagingDiv">&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
      	<table class="table table-striped table-advance table-hover " id="sales">
            <thead>
                <tr>
             <th>no
                <c:choose>
				<c:when test="${param.sort=='b.business_name desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('b.business_name asc'); goSearch();">상호명 ▼
				</c:when>
				<c:when test="${param.sort=='b.business_name asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('b.business_name desc'); goSearch();">상호명 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('b.business_name asc'); goSearch();">상호명
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='s.menu_category_code desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.menu_category_code asc'); goSearch();">카테고리 ▼
				</c:when>
				<c:when test="${param.sort=='s.menu_category_code asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.menu_category_code desc'); goSearch();">카테고리 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.menu_category_code asc'); goSearch();">카테고리
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='s.menu_name desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.menu_name asc'); goSearch();">메뉴 ▼
				</c:when>
				<c:when test="${param.sort=='s.menu_name asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.menu_name desc'); goSearch();">메뉴 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.menu_name asc'); goSearch();">메뉴
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='4 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('4 asc'); goSearch();">가격 ▼
				</c:when>
				<c:when test="${param.sort=='4 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('4 desc'); goSearch();">가격 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('4 asc'); goSearch();">가격
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='5 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('5 asc'); goSearch();">수량 ▼
				</c:when>
				<c:when test="${param.sort=='5 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('5 desc'); goSearch();">수량 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('5 asc'); goSearch();">수량
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='6 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('6 asc'); goSearch();">총매출 ▼
				</c:when>
				<c:when test="${param.sort=='6 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('6 desc'); goSearch();">총매출 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('6 asc'); goSearch();">총매출
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='7 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('7 asc'); goSearch();">순매출 ▼
				</c:when>
				<c:when test="${param.sort=='7 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('7 desc'); goSearch();">순매출 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('7 asc'); goSearch();">순매출
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='8 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('8 asc'); goSearch();">판매일 ▼
				</c:when>
				<c:when test="${param.sort=='8 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('8 desc'); goSearch();">판매일 ▲
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('8 asc'); goSearch();">판매일
				</c:otherwise>
				</c:choose>
                 
 
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${salesList}" var="sales" varStatus="loopTagStatus">  <!-- requestScope.은 생략 가능 -->
                  <tr>
                    <td >
					<%-- 게시판 목록 중에 각 행의 정순 일련번호 출력--%>
					${salesSearchDTO.selectPageNo*salesSearchDTO.rowCntPerPage-salesSearchDTO.rowCntPerPage+1
																					+loopTagStatus.index}  
					<!-- 각 행의 상호명 출력 -->
					<td  >${sales.business_name}
					<!-- 각 행의 메뉴카테고리 출력 -->
					<td  >${sales.menu_category_code}
					<!-- 각 행의 메뉴 이름 출력 -->
					<td  >${sales.menu_name}
					<!-- 각 행의 메뉴 가격 출력 -->
					<td align=right   class="menu_price">${sales.menu_price}
					<!-- 각 행의 판매 수량 출력 -->
					<td align=right   class="sales_count">${sales.sales_count}
					<!-- 각 행의 총매출 출력 -->
					<td align=right    class="sales_amount">${sales.sales_amount}
					<!-- 각 행의 순매출 출력 -->
					<td align=right    class="sales_income">${sales.sales_income}
					<!-- 각 행의 판매 날짜 출력 -->
					<td align=right   >${sales.sales_date}
					
					
                  </tr>
                 </c:forEach>
                 </tbody>
                 <tfoot>
                  <tr>
 				<td  >total
				<td >
				<td >
				<td >
				<td >
				<td align=right   class="total-sales_count">
				<td align=right   class="total-sales_amount">
				<td align=right   class="total-sales_income">
				<td>
                  </tr>
                 </tfoot>
              </table><br>
         <c:if test="${empty salesList}">
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