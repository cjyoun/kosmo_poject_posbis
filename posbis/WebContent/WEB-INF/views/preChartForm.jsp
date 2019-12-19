<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여  common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp" %>		<!-- 이것만 WEB-INF 경로를 사용할 수 있음. -->


<html>
 <head>
  <title> PremiumChart </title>
      <meta charset="utf-8">

      <script type="text/javascript" src="https://www.google.com/jsapi"></script>

     <script>

	 	google.load("visualization", "1", {packages:["corechart"]});
   	    google.setOnLoadCallback(drawChart1);
   	    google.setOnLoadCallback(drawChart2);
		
	     
	     function drawChart1() {
	
				/* var data = new google.visualization.DataTable();
				data.addRows([
					[1,30], [2,50], [3,45], [4,60], [5,77]
					, [8,70], [9,50], [10,87], [11,68], [12,60]
				]); */
	
	
		   var data1 = google.visualization.arrayToDataTable([
		   	 ['Month', 'My Store', 'Others Store'],
	         ['1월',  1000,      400],
	         ['2월',  1170,      460],
	         ['3월',  660,       1120],
	         ['4월',  1030,      540],
	         ['5월',  1030,      540],
	         ['6월',  1030,      540],
	         ['7월',  1030,      540],
	         ['8월',  1030,      540],
	         ['9월',  1030,      540],
	         ['10월',  1030,      540],
	         ['11월',  1030,      540],
	         ['12월',  1030,      540],
	       ]);
	
	       
	
	       var options1 = {
	         	title: '[월 매출]'
		        , curveType : 'function'
		     
	       };
	
	       var chart1 = new google.visualization.LineChart(document.getElementById('chart_div1'));
	       chart1.draw(data1, options1);
	     }
	
	
	     function drawChart2() {
	
				/* var data = new google.visualization.DataTable();
				data.addRows([
					[1,30], [2,50], [3,45], [4,60], [5,77]
					, [8,70], [9,50], [10,87], [11,68], [12,60]
				]); */
	
	
		   var data2 = google.visualization.arrayToDataTable([
	         ['Year', 'Sales', 'Expenses'],
	         ['2004',  1000,      400],
	         ['2005',  1170,      460],
	         ['2006',  660,       1120],
	         ['2007',  1030,      540]
	       ]);

	
	       var options2 = {
	         	title: '[월 매출]'
		        
		     
	       };
	
	       var chart2 = new google.visualization.LineChart(document.getElementById('chart_div2'));
	       chart2.draw(data2, options2);
	     }
	     

	  	
	     $(document).ready(function(){	
//	    	 checkBusinessNoForm();
				// name="changeBusinessNo" 에 change 이벤트가 발생하면 실행할 코드 설정.
				$('[name=changeBusinessNo]').change(function(){
					checkBusinessNoForm();
				});	

				$('[name=changeBusinessNo]').change();
				
	
				
				
	  	});
     	

		
     	function checkBusinessNoForm(){
				alert($("[name=preChartForm]").serialize());

				
				//----------------------------------------------
				// 현재 화면에서 페이지 이동 없이(=비동기 방식으로) 
				// 서버쪽 loginProc.do 로 접속하여 아이디, 암호의 존재 개수를 얻기
				
				$.ajax({
					// 서버 쪽 호출 URL 주소 지정
					url : "/posbis/preChartProc.do"
					
					// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
					, type : "post"
					
					// 서버로 보낼 파라미터명과 파라미터 값을 설정
					, data : $("[name=preChartForm]").serialize()				
						// 위 코드는 아래로도 가능. 
						// data : "admin_id="+admin_id+"&pwd="+pwd
						// data : { 'admin_id':admin_id, 'pwd':pwd}
					
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
					// 익명함수의 매개변수 data에는 서버가 응답한 데이터가 들어온다.
					// 현재 data라는 매개변수에는 아이디, 암호의 존재 개수가 들어온다. 1:성공, 0:아이디,암호 없음 , 그외:에러
					, success : function(salesMonthList){
						
						// 아이디 존재 개수가 1개면 /z_spring/boardListForm.do 로 이동
						if(salesMonthList != null){
							alert("성공");
							alert(salesMonthList[0].sales_amount);
							//document.preChartForm.submit();
						}
						else if (salesMonthList.size() == 0){
							alert("사업자번호가 존재하지 않습니다.");
						}
						else {
							alert("서버 오류 발생. 관리자에게 문의 바람");
						} 
					}
					
					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
					, error : function(request, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						alert("서버 접속 실패");
						
					}
					
				});
				
				
			}		
			



     
	      function goPreSearchForm(){
	         location.replace("/posbis/preSearchForm.do");
	      }
	
	
	      function goMyPageForm(){
	          alert("goMyPageForm.jsp로 이동")
	          location.replace("/posbis/myPageForm.do")
	       }
	
	       function goMenuForm(){
	          alert("goMenuForm.jsp로 이동")
	          location.replace("/posbis/menuForm.do")
	       }
	     
	       function goSalesForm(){
	          alert("goSalesForm.jsp로 이동")
	          location.replace("/posbis/salesForm.do")
	       }
	     
	       function goPreChartForm(){
	          alert("goPreChartForm.jsp로 이동")
	          location.replace("/posbis/preChartForm.do")
	       }
	
	       function goMainForm(){
	          alert("goMainForm.jsp로 이동")
	          location.replace("/posbis/mainForm.do")
	       }
	       
	       function goInfoUpdateForm(){
	          alert("goInfoUpdateForm.jsp로 이동")
	          location.replace("/posbis/infoUpdateForm.do")
	       }
	       
	       function gowithdrawalForm(){
	          alert("gowithdrawalForm.jsp로 이동")
	          location.replace("/posbis/withdrawalForm.do")
	       }
	
	
	       function goMainForm(){
	           alert("메인으로 이동");
	           location.replace("/posbis/mainForm.do");
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

            <!------------------ 메인으로 보여줄 div -------------------->
            <div style="float: right; border:1px solid; 20px, margin:10px; width: 80%; height:100%;"><br>
            	<form name="preChartForm" method="post" action="/posbis/preChartForm.do"> 

					<table border=0 width=700  >
						<tr>
							<td align=right>
								사업자번호 : 
								<select name="changeBusinessNo">	<!-- 중요! -->
									<!-- ************************************************************************************** -->
									<!-- 사용자 정의 태그인 JSTL C코어 태그 중 <forEach> 태그를 사용하여 ModelAndView 객체에    -->
									<!-- "boardList" 라는 키값으로 저장된 List<Mpa<Stirng,String>> 객체의 데이터를 출력하기.    -->
									<!-- ************************************************************************************** -->
									<%-- <c:forEach> 태그의 속성 설명 --%>
									<%-- 	
										<c:forEach 
											items="${ModelAndView 객체에 저장한 객체의 키값명으로 주로 List객체의 키값명이 삽입됨}" 
											var="items 속성에 설정한 List 객체 안의 i번째 데이터가 저장될 지역변수명" 
											varStatus="loopTagStatus"
										> 
											
										- items는 키값명과 일치 시켜야하고 var는 지역변수기 때문에 내맘대로 이름을 주어도 됨.	
										- LoopTagStatus 라는 일련번호를 생성해주는 객체가 있는데 이것의 메위주를 loopTagStatus 변수명에 담음.	
												
										* EL 태그를 사용하는 이 방법을 사용할 시 List가 DTO가 되어도 코딩의 변화 없이 잘 돌아간다.
										* 어느 부분이 틀리면 그 부분만 나오지 않고 다른 부분은 화면에 나옴.
									--%> 
							<!-- ------------------------------------------------------------------------------------------------------------------- -->
							 		
							 		<c:forEach items="${businessNoList}" var="businessNoList">
										
											<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
											</option>
									</c:forEach>
									
								</select> 
					</table>
				</form>

				
               <br>
               
		      <input type="button" value="검색페이지로가기" style="width=130" onClick="goPreSearchForm();">&nbsp;
		      <input type="button" value="마이페이지로가기" style="width=130" onClick="location.replace('/posbis/myPageForm.do')">&nbsp;
		      <input type="button" value="q&a로가기" style="width=130" onClick="location.replace('/posbis/qstnForm.do')">&nbsp;
		
		         <br><br><br>
		         [월매출]<br>
		         - 차트<br><br>
		         <div id="chart_div1" style="width: 700px; height: 200px;"></div>

		
		         [일매출]<br>
		         - 차트<br><br>
		    	 <div id="chart_div2" style="width: 300px; height: 200px;"></div>
		         
		         
		         우리점포 인기메뉴<br><br>
		         
		         매출 등..
		         
         
            </div>
         </div>
      </div>
    

         

 

 </body>
</html>