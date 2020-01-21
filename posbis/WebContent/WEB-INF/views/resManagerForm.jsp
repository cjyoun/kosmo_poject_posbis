<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 관리</title>
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

<!-- 예약관리 부트스트랩 -->
<link rel="stylesheet" href="resources/pos/assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="resources/pos/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/pos/assets/libs/css/style.css">
<link href='resources/pos/assets/vendor/full-calendar/css/fullcalendar.css' rel='stylesheet' />
<link href='resources/pos/assets/vendor/full-calendar/css/fullcalendar.print.css' rel='stylesheet' media='print' />

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
    
<!-- 아이콘 -->   
<link rel="stylesheet" href="resources/pos/assets/vendor/fonts/themify-icons/themify-icons.css">
<link rel="stylesheet" href="resources/pos/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet" href="resources/pos/assets/vendor/fonts/simple-line-icons/css/simple-line-icons.css">


<style type="text/css">

/* 핍업 css */
#popup{overflow:hidden; height:auto; display:block; border-radius:3px; box-shadow:0px 1px 1px #333; width: 410px; z-index:100; position:absolute;  top:20%; left:10%;}
#popup h4{background: #6993DA; font-size: 19px; height: 36px;  padding: 8px 0 2px 15px; color: #FFF; font-weight:normal; margin: 0;}
#popup h4 a.close{float:right; padding-right:8px; color:#FFF; font-family:verdana}
  .popCont{display:block; background: #FFF; border:2px solid #659fd5; padding:10px 10px 0px 10px;  }
  .popCont li{height:24px; width:100%; display:inline-block; margin:0; border-top:1px solid #eaeaea;  font-size:12px; }
  .popCont li:last-child{border-bottom:1px solid #eaeaea; padding-bottom:3px;}
  .popCont strong{float:left; width:30%; background: #aaa; color:#FFF; padding:7px 0; text-align:center; border-right:1px solid #eaeaea; }
  .popCont span{display:block; float:left; padding:7px 0  7px 8px;} 

#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 


.window{
    display: none;
    position:absolute;  
/* /*     left:50%;
    top:50px; */ */
    margin-left: -500px;
    width:fit-content;
    height:fit-content;
    background-color:#6993DA;
    z-index:10000;   
 }

/* 핍업 css */

</style>

  
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
  
select { 
    -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
    -moz-appearance: none; 
    appearance: none;
     background: url("resources/selectImg.jpg") no-repeat 93% 50%; /* 화살표 모양의 이미지 */ 
} 
select::-ms-expand { display: none; }
  
  </style>
 
         <script>

	 	    $(document).ready(function(){

	 	        // 팝업창 띄운 후 검은 막 띄우기
	 	        $(".openMask").click(function(e){
	 	            e.preventDefault();
	 	            wrapWindowByMask();
	 	        });
	 	 
	 	        //닫기 버튼을 눌렀을 때
	 	        $(".window .close").click(function (e) {  
	 	            //링크 기본동작은 작동하지 않도록 한다.
	 	            e.preventDefault();  
	 	            $("#mask, .window").hide();  
	 	        });       
	 	 
	 	        //팝업창 외에 뒤에있는 검은색 배경 눌렀을 때 
	 	        $("#mask").click(function () {  
	 	            $(this).hide();  
	 	            $(".window").hide();  
	 	 
	 	        });   

				// 선택한 사업자 번호를 popup_business_no로 넣어준다
				$('#select_business_no').change(function(){
					//alert(this.value);
					$('#select_business_no').val(this.value);
					$('#popup_business_no').val(this.value);
					fn_get_events(0, this.value);
				});

				$('#calendar').fullCalendar({
					
		 	 	   //달력에서 월, 일자에 따른 예약건수 캘린더에 입력 넣기
		 	 		  dayClick: function(date) {
		 	 		  	console.log('Clicked on: ' + date.format());
		 	 		  },
		 	 	     eventClick: function(calEvent, jsEvent, view) { 
			 	 	   console.log('click', calEvent.start);
			 	 	 goResList(calEvent.start);
			 	 	    }
			 	 });

				// 전달 버튼을 클릭하였을 경우
		        $("button.fc-prev-button").click(function() {
		            var date = $("#calendar").fullCalendar("getDate");
		            convertDate(date);
		            var date2 = parseInt(convertDate(date));
					console.log(date2);

					fn_get_events(date2, $('#select_business_no').val());
		        });

		        // 다음달 버튼을 클릭하였을 경우
		        $("button.fc-next-button").click(function() {
		            var date = $("#calendar").fullCalendar("getDate");
		            convertDate(date);
		            var date2 = parseInt(convertDate(date));
					//console.log(date2);
					fn_get_events(date2, $('#select_business_no').val());
		        });

		     	// 다음달 버튼을 클릭하였을 경우
		        $("button.fc-today-button").click(function() {
		            var date = $("#calendar").fullCalendar("getDate");
		            convertDate(date);
		            var date2 = parseInt(convertDate(date));
					//console.log(date2);
					fn_get_events(date2, $('#select_business_no').val());
		        });
		        	
	 	    }); //$(document).ready(function(){ 끝
	 	    
		        // 받은 날짜값을 date 형태로 형변환 해주어야 한다.
		        function convertDate(date) {
		            var date = new Date(date);
		            //console.log(date.yyyymmdd());
		            return date.yyyymmdd();
		        }
		        
		        Date.prototype.yyyymmdd = function() {
		            var yyyy = this.getFullYear().toString();
		            var mm = (this.getMonth() + 1).toString();
		            var dd = this.getDate().toString();
		            return (mm[1] ? mm : "0" + mm[0]);
		        }

				var tempCal;
		 	   	function fn_get_events(current_month, business_no){
		 			if(tempCal != null){
		 				$('#calendar').fullCalendar('removeEventSource',tempCal);
			 		}
					var m;
					if(current_month>0){
						m = current_month;
					}else{
			 		var date = new Date();
			 		m = date.getMonth()+1;
			 		}
			 		var user_id = $('[name=user_id]').val();
			 		var data = "month="+m+"&user_id="+user_id+"&business_no="+business_no
					
				 	console.log(data);	
		 			$.ajax({
		 				url: '/posbis/resCntProc.do' 
		 				,Type: "post" 
		 				,data : data
		 				,dataType:"json"
		 				,success : function(data){
							/* console.log("#@# === " + data.data.length);
							console.log(data.data); */
						tempCal = data.data;
		 				$('#calendar').fullCalendar('addEventSource',data.data);
		 				}
		 				,error:function(request,status,error){
		 			        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		 		       }
		 			}); 
	 			}

		 	 

		   		function goResList(date) {
					// 날짜 클릭시 예약 목록 불러올 함수 넣기
					alert("goResList"+date);
				}

			   // 사업자 번호 선택여부 확인
			   function checkBusiNo(){
					
					if(is_empty("[name=business_no]")){
						alert("사업자 번호를 선택해주세요.");
						$("[name=business_no]").focus();
						return;
					}
					wrapWindowByMask();	
				}

			   // 사업자 번호 선택 후 메뉴등록 화면 띄우기
	     	   function wrapWindowByMask(){
     		   
	     	        //화면의 높이와 너비를 구한다.
	     	        var maskHeight = $(document).height();  
	     	        var maskWidth = $(window).width();
	     	        var popupX = (window.screen.width / 2) - (200 / 2);
		     	   // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		
		     	    var popupY= (window.screen.height / 2) - (300 / 2);
		     	   // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		     	   
	     	        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	     	        $("#mask").css({"width":maskWidth,"height":maskHeight});
	     	 
	     	        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
	     	 
	     	        $("#mask").fadeIn(0);      
	     	        $("#mask").fadeTo("slow",0.6);    
	
		     	    $(".window").css({"left":popupX+"px"});
					$(".window").css({"top":popupY+"px"});
	     	 
	     	        //윈도우 같은 거 띄운다.
	     	        $(".window").show();
	     	       	console.log("popupX" +popupX);
	     	        console.log("popupY" + popupY);
     	 
     	    	}

   	    	// 예약하기 화면에서 예약 클릭시 유효성 체크 및 예약등록
   	    	function checkReservation(){

   	    		var business_no = $('[name=business_no]').val();
   				var user_id = $('[name=user_id]').val();
				var res_name = $('[name=res_name]').val();
				var res_year = $('[name=res_year]').val();
				var res_month = $('[name=res_month]').val();
				var res_day = $('[name=res_day]').val();
				var res_guest = $('[name=res_guest]').val();
				var res_text = $('[name=res_text]').val();
				var phone1 = $('[name=phone1]').val();
				var phone2 = $('[name=phone2]').val();
				var phone3 = $('[name=phone3]').val();
				var res_date = res_year+res_month+res_day
				var res_time = res_date+" "+$('[name=res_time]').val();
				var res_phone = phone1+"-"+phone2+"-"+phone3
				
				var data = "business_no="+business_no+"&user_id="+user_id+"&res_name="+res_name+"&res_date="+res_date+"&res_time="+res_time+"&res_guest="+res_guest+"&res_phone="+res_phone+"&res_text="+res_text;
   				//console.log(data);
   				
   	    		if(is_empty("[name=res_name]")){
   					alert("예약자 이름을 입력해주세요.");
   					$("[name=res_name]").focus();
   					return;
   				}
   				if(is_empty("[name=res_guest]")){
   					alert("인원수를 입력해주세요.");
   					$("[name=res_guest]").focus();
   					return;
   				}
   				if(is_empty("[name=phone1]")){
   					alert("전화번호를 입력해주세요");
   					$("[name=phone1]").focus();
   					return;
   				}
   				if(is_empty("[name=phone2]")){
   					alert("전화번호를 입력해주세요");
   					$("[name=phone2]").focus();
   					return;
   				}
   				if(is_empty("[name=phone3]")){
   					alert("전화번호를 입력해주세요");
   					$("[name=phone3]").focus();
   					return;
   				}
   				if(is_empty("[name=res_year]")){
   					alert("예약년도 입력해주세요.");
   					$("[name=res_year]").focus();
   					return;
   				}
   				if(is_empty("[name=res_month]")){
   					alert("예약월을 입력해주세요");
   					$("[name=res_month]").focus();
   					return;
   				}
   				if(is_empty("[name=res_day]")){
   					alert("예약일자를 입력해주세요");
   					$("[name=res_day]").focus();
   					return;
   				}
   				if(is_empty("[name=res_time]")){
   					alert("예약시간을 입력해주세요");
   					$("[name=res_time]").focus();
   					return;
   				}

    				$.ajax({
   					// 서버 쪽 호출 URL 주소 지정
   					url : "/posbis/resRegProc.do"
   						
   					// 전송 방법 설정
   					, type : "post"
   						
   					// 서버로 보낼 파라미터명과 파라미터값을 설정
   					
   					, data : data
   					
   					, success : function(resRegCnt){
   						alert("등록 하시겠습니까?");

   						if(resRegCnt==1){
   							alert(res_name+"님 예약이 완료되었습니다.");
   							location.replace("/posbis/resManagerForm.do");
   						}
   					// [메뉴 등록 행 적용 개수]가 1개가 아니면 경고하기
   						else{
   							alert("메뉴 등록 실패! 관리자에게 문의 바랍니다.");
   						}
   					}
   					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
   					, error : function(){
   						alert("서버 접속에 실패하였습니다.");
   					}
   				});

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
   				//예약관리
   			 	function goResManagerForm(){
   			        //alert("예약관리로 이동");
   			        location.replace("/posbis/resManagerForm.do");
   			     }
                
               //통합 관리
                function goHomePageForm(){
                   //alert("통합 관리으로 이동");
                   location.replace("/posbis/homePageForm.do");
                }
               //--------------------------------------------------------
               
             // 마케팅 전략
                function goMarketingForm(){
                    //alert("마케팅 전략 으로 이동");
                    location.replace("/posbis/marketingForm.do");
                 }
               
               
      </script>
      
   </head>

<body>
<!-- Header Section -->
	<header class="header-section">
		<a onClick="goHomePageForm();" class="site-logo" style="cursor:pointer;">
			<img src="resources/bootstrap/img/POSBIS_logo.png" alt="">
		</a>
		<nav class="header-nav" style="height:98;">
			<ul class="main-menu">
				<li>

					<a style="color:#fff; cursor:pointer; font-size:20; margin:-3 80 4 0">INFO</a>

					<ul class="sub-menu" style="cursor:pointer; ">
						<li><a onClick="goIntroForm();">POSBIS 소개</a></li>
						<li><a onClick="goHomePageForm();">Home 화면</a></li>
					</ul>
				</li>
				<li><a style="color:#fff; cursor:pointer; font-size:20; margin:-3 80 4 0">마이페이지</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goMyPageForm();">내정보보기</a></li>
						<li><a onClick="goMyQstnForm();">문의내역확인</a></li>
					</ul>
				</li>
				
				<li><a style="color:#fff; cursor:pointer; font-size:20; margin:0 80 4 0">매장관리</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goMenuForm();">메뉴 관리</a></li>
						<li><a onClick="goSalesForm();">매출 관리</a></li>
					</ul>
				</li>
				<li><a style="color:#fff; cursor:pointer; font-size:20; margin:-3 80 4 0">업계동향</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goPreSearchForm();">시장분석</a></li>
						<li><a onClick="goPreChartForm();">비교차트</a></li>
						<li><a onClick="goMarketingForm();">마케팅 전략</a></li>
						
					</ul>
				</li>
			
				<li>
					<a class="active" style="cursor:pointer; font-size:20; margin:0 55 4 0">예약관리</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goResManagerForm();">예약목록</a></li>
					</ul>				
				</li>
				<li><a style="color:#fff; cursor:pointer; font-size:20; margin:0 55 4 0">고객센터</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goQstnForm();">Q&A 목록보기</a></li>
						<li><a onClick="goFAQForm();">자주 묻는 질문</a></li>
						<li><a onClick="goqstnRegForm();">문의하기</a></li>
					</ul>
				</li>
				
			</ul>
			<div class="header-right">

				<div class="hr-text" style="margin:-17 0 -15 0">
				<c:if test = "${rank_code eq '1'}">
	               <i class="ti-user">&nbsp;</i>
	            </c:if>
	               
	            <c:if test = "${rank_code eq '2'}">
	               <i class="ti-crown">&nbsp;</i>
	            </c:if>
	            
	            <b>${user_id}</b> 님 반갑습니다
                	
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
		<div class="container"  style="margin: -25px 0 0 250px;">
			<h2 style="font-size:65px"><strong>예약관리</strong></h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="fas fa-calendar-check"></i> 예약관리 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="fas fa-list-alt"></i> 예약목록</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->

  
<!--==========================
      예약관리
    ============================-->
<main id="main">
<section id="main-content">
<section class="wrapper">
     <div class="col-lg-11" align="center">
          <section class="panel">
          <header class="panel-heading">
              	   <a href="">예약관리</a>
            </header>
       		<div class="panel-body">
         
                <!-- ============================================================== -->
                <!-- events calendar -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
	                        <!-- 사업자 번호 선택 -->
	                        <div style="width:100%; height:7%;">
						  		<select id="select_business_no" name=business_no style="width:200px;height:25px; text-align-last: center">	<!-- 중요! -->
							 		<option value="">사업자 번호를 선택해주세요
							 		<c:forEach items="${businessNoList}" var="businessNoList">
											<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
											</option>
									</c:forEach>
									
								</select>
							</div>
						<!-- 달력 및 예약내역 form -->
                            <div class="card-body">
                                <div id='wrap' class='cal'>
                                	<form id="resManager">
                                    <div id='calendar' style="width:45%; float:left;"></div> 
                                    <div style="width:55%; height:50%; float:right; margin: -8px;">
                                    <font style="font-size: 27px;; color:#3D405C;">예약내역
                                    </font>
									<input type="button"  value="예약" style="width:60px; height:30px; float:right; margin: 8 0 18 0;" onClick="checkBusiNo();")>
                                    <table class="table table-striped table-advance table-hover">
							            <thead>
							            <tr>
							              <th align=center>no</th>
							              <th align=center>예약자</th>
							              <th align=center>예약일자</th>
							              <th align=center>예약시간</th>
							              <th align=center>인원수</th>
							              <th align=center>휴대폰번호</th>
							              <th align=center>비고</th>
							            </tr>
							            </thead>
							            <tbody style="cursor:pointer" onClick="goResInfoForm();">
							               <!----- 불러온 메뉴 list 보여주기 ----->
							                  <tr>
								                  <!-- 번호 정순 출력 -->
								                  <td align=center width="3%"></td>
								                  <!-- 매장명출력 -->
								                  <td align=center width="13%"></td>
								                  <!-- 대분류출력 -->
								                  <td align=center width="8%"></td>
								                  <!-- 각 행의 메뉴 중분류 출력  -->
								                  <td align=center width="11%"></td>
								                  <!-- 각 행의 메뉴 소분류 출력  -->
								                  <td align=center width="10%"></td>
								                  <!-- 각 행의 메뉴 이름 출력  -->
								                  <td align=center width="15%"></td>
								                  <!-- 각 행의 메뉴 가격 출력  -->
												  <td align=center width="15%"></td>
											</tr>
							  	 	</table>
							  	 	
										<c:if test="${empty resList}">
											예약내역이 없습니다.
										</c:if>
									
                                    </div>
                                    <div style='clear:both'></div>
                                   	</form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end events calendar -->
                <!-- ============================================================== -->
            	</div>
            </div>
            
            <!-- 예약하기 팝업 -->
			
			<div id ="wrap"> 
        		<div id = "container">  
            		<div id="mask"></div>
            			<form name = "resRegForm" method="post" action="/posbis/resRegProc.do">
            			<div class="window">
			                <p style="width:fit-content; height:fit-content; text-align:center;vertical-align:middle; color: aliceblue; font-size:17px;">예약하기
			                <a href="#" class="close" style="color: aliceblue; font-size:30px;">X&nbsp;</a>
			                <table class="popCont" >
					        	<tr>
					        		<th colspan="2">
								<tr>
									<th>예&nbsp;&nbsp;&nbsp;약&nbsp;&nbsp;&nbsp;자&nbsp;
									<td><input type="text" size="30" maxlength="20" name="res_name" style="height: 25px;">
								<tr>
									<th>예약&nbsp;&nbsp;&nbsp;일자&nbsp;
									<td>
									    <select name="res_year" style="width:60px">
										<option value = "">
											<script>
												for(var i=2019; i<=new Date().getFullYear()+5; i++){
													document.write("<option value="+i+">"+i);
												}
											</script>
										</select>&nbsp;년&nbsp;
										<select name="res_month" style="width:40px">
										<option value = "">
											<script>
												for(var i=1; i<=12; i++){
													var m = (i<10)?"0"+i:i;
													document.write("<option value="+m+">"+m);
												}
											</script>
										</select>&nbsp;월&nbsp;
										<select name="res_day" style="width:40px">
										<option value = "">
											<script>
												for(var i=1; i<=31; i++){
													var d = (i<10)?"0"+i:i;
													document.write("<option value="+d+">"+d);
												}
											</script>
										</select>&nbsp;일&nbsp;
										
										<select name="res_time" style="width:74px">
										<option value = "">
											<script>
												for (i = 0; i < 48; i++) {
												    var hour = '';
												    var min = ':00';

												    if ((Math.ceil(i / 2)) < 13) {
												        hour = (Math.floor(i / 2));
												    } else {
												        hour = (Math.floor(i / 2));
												    }
												    if (i % 2 != 0) {
												        min = ':30';
												    }

												    if(hour<10){
														hour = "0" + hour;
													}
													if(min<10){
														min = "0" + min;
													}
												    document.write('<option value=' + hour + min + '>' + hour + min + '</option>');
												}	
											</script>
										</select>
								<tr>
									<th>인&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;수&nbsp;
									<td><input type="text" size="28" maxlength="20" name="res_guest" style="height: 25px;">명
								<tr>
									<th>휴대폰번호&nbsp;
									<td><input type="text" size="30" maxlength="3" name="phone1" style="height: 25px; width:89px">&nbsp;-&nbsp;
										<input type="text" size="30" maxlength="4" name="phone2" style="height: 25px; width:89px">&nbsp;-&nbsp;
										<input type="text" size="30" maxlength="4" name="phone3" style="height: 25px; width:89px">
								<tr>
									<th>비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고&nbsp;
									<td><textarea rows="5" cols="35" name= "res_text" maxlength="200" width="200"></textarea>
								<tr>
									<th colspan="2"><input type="button" value="등록" onClick="checkReservation();" style="width:60px; height:30px; float:right; margin: 8 0 18 0;">
									<input type="hidden" id="popup_business_no" readonly>
									<input type="hidden" name="user_id" value="${user_id}">
							</table>
			                </p>
			           	</div>
			            </form>
        		</div> 
        		<br>
    		</div>
    		
    		<!-- 예약하기 팝업 끝 -->
    		
		

</main>
<br><br><br>	

<!--==========================
    꼬리말
  ============================-->
	<footer class="footer-section">
		<div class="container">
			<img class="footer-logo" src="resources/bootstrap/img/POSBIS_logo.png" alt="">
			<div class="row">

				<div class="footer-widget">

					<p>POSBIS는 항상 도전하는 정신으로 고객 편의성 증대를 위하여 혁신 기술을 도입하고, 세련된 디자인과 높은 성능으로 국내의 POS 통계 분석 업계 표준을 설정 및 유지해 나가고 있습니다. 항상 행복과 고객님의 사업이 번창하시기를 기원합니다.</p>
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
  
  	<!-- 예약관리 부트스트랩 -->
  	<script src="resources/pos/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="resources/pos/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="resources/pos/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src='resources/pos/assets/vendor/full-calendar/js/moment.min.js'></script>
    <script src='resources/pos/assets/vendor/full-calendar/js/fullcalendar.js'></script>
    <script src='resources/pos/assets/vendor/full-calendar/js/jquery-ui.min.js'></script>
    <script src='resources/pos/assets/vendor/full-calendar/js/calendar.js'></script>
    <script src="resources/pos/assets/libs/js/main-js.js"></script>

</body>
</html>
 