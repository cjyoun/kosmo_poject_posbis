<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   <!--page language="java" 생략 가능 -->
<%@ page import="java.util.*" %>
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp" %>


<html>
   <head>
   
      <script type = "text/javascript" src = "https://www.gstatic.com/charts/loader.js">
      </script>
      <script type = "text/javascript">
         google.charts.load('current', {packages: ['corechart']});     
      </script>
      
      
       <title> new document </title>
      <meta charset="utf-8">
      <script>         
      
		$(document).ready(function(){
			
//=====================================================================================================
      
//=====================================================================================================
	});
		 function goMainForm(){
	           location.replace("/posbis/mainForm.do");
	        }

	       function goMenuForm(){
	          location.replace("/posbis/menuForm.do")
	       }
	     
	       function goSalesForm(){
	          location.replace("/posbis/salesForm.do")
	       }
	     
	       // 프리미엄으로 이동 시일반 회원은 프리미엄 부분에 들어가지 못하게 하는 함수
		    function goPreChartForm(){
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

	       function goMainForm(){
	          location.replace("/posbis/mainForm.do")
	       }
	       
	       function goInfoUpdateForm(){
	          location.replace("/posbis/infoUpdateForm.do")
	       }
	       
	       function gowithdrawalForm(){
	          location.replace("/posbis/withdrawalForm.do")
	       }

      </script>

   </head>


   <body><center>
    <div class="right"><input type=button value="메인으로" onClick="goMainForm()"></div>&nbsp;&nbsp;
    
    
      <div style="border:1px solid; 20px, margin:10px; height:100%; width: 100%; ">

         <!---------------- 상단바 ------------------------->
         <div style="float: left; border:1px solid; 20px, margin:10px; height:15%; width: 100%; ">
         <center><h2>상단바</h2></center>
         </div>
      
         <div style="display:table; border:1px solid; 20px, margin:10px; height:85%; width: 100%;">
            <!------------------ 사이드바 ---------------------->
            <div style="float:left; width: 15%; border:1px solid; padding:30px; height:90%;"><br><Br>
               <h3>마이페이지</h3><br>
                  <a onClick="goMyPageForm()">내 정보관리</a><br><br>
                  <a onClick="goMenuForm()">메뉴관리</a><br><br>
                  <a onClick="goSalesForm()">매출관리</a><br><br>
                  <a onClick="goPreChartForm()">프리미엄</a><br><br>
            </div>
       
		<table id="myStore" border=1 cellspacing=0 cellpadding=0 align=center width="1200">
			<tr>
				<td colspan="2" height="285"> [내 가게]
				
				
				
				
				
				
			<tr>
				<td width="600" height="300">
				
      <div id = "container" style = "width: 550px; height: 270px; margin: 0 auto">
      </div>
      <script language = "JavaScript">
         function drawChart() {
            // Define the chart to be drawn.
            var data = google.visualization.arrayToDataTable([
               ['판매일자(월)', '매출액(원)'],
               [${salesNow[0].now_sales_date} + ' 총매출',  ${salesNow[0].now_sales_amount}],
               [${salesNow[0].now_sales_date} + ' 순매출',  ${salesNow[0].now_sales_income}],
               [${salesNow[1].now_sales_date} + ' 총매출',  ${salesNow[1].now_sales_amount}],
               [${salesNow[1].now_sales_date} + ' 순매출',  ${salesNow[1].now_sales_income}]
            ]);

            var options = {title: '전월대비 당월 매출현황'}; 

            // Instantiate and draw the chart.
            var chart = new google.visualization.BarChart(document.getElementById('container'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
      </script>
				
				
		
				<td width="600" height="300"> [내가 쓴 글]
				
			

	
	
    
   </body>

</html>