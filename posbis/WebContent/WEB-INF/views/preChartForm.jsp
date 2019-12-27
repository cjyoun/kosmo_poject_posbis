<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여  common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp" %>		<!-- 이것만 WEB-INF 경로를 사용할 수 있음. -->


<html>
 <head>
  <title> PremiumChart </title>
      <meta charset="utf-8">

      <script type="text/javascript" src="https://www.google.com/jsapi"></script>
      <!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->

     <script>

	 	google.load("visualization", "1", {"packages":["corechart"]});
	 	//google.charts.load('current', {'packages':['corechart']});
   	    google.setOnLoadCallback(drawChart1);
   		google.setOnLoadCallback(drawChart2);
   		google.setOnLoadCallback(drawChart3);

	  	
	     $(document).ready(function(){	
//	    	 checkBusinessNoForm();
				// name="changeBusinessNo" 에 change 이벤트가 발생하면 실행할 코드 설정.
				$('[name=changeBusinessNo]').change(function(){			
					checkBusinessNoForm();
					
				});	

				$('[name=changeBusinessNo]').change();
							
				
	  	});
     	

		// Controller에서 받아온 나의 가게 월별 매출을 담을 변수 선언.
		 var jjj = new Array();
	     

		// Controller에서 받아온 같은 동네, 같은 업종의 다른 가게들 평균 월별 매출을 담을 변수 선언.
	     var kkk = new Array();

		// Controller에서 받아온 나의 가게 인기메뉴, 판매횟수 담을 변수 선언.
	    var myMenuName = new Array();
		var myCount = new Array();
		// Controller에서 받아온 다른 가게 인기메뉴, 판매횟수 담을 변수 선언.
		var othersMenuName = new Array();
		var othersCount = new Array();

		// Controller에서 받아온 나의 가게 상품별 판매횟수, 이름 담을 변수 선언.
		var salesMenuName = new Array();
		var salesMenuCount = new Array();

		// Controller에서 받아온 나의 가게 상품별 순이익, 이름 담을 변수 선언.
		var benefitMenuName = new Array();
		var salesBenefitMenu = new Array();
	    
	     
     	function checkBusinessNoForm(){
				//alert($("[name=preChartForm]").serialize());

				$.ajax({
					// 서버 쪽 호출 URL 주소 지정
					url : "/posbis/preChartProc.do"
					
					// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
					, type : "post"

					, async : false
					// 서버로 보낼 파라미터명과 파라미터 값을 설정
					, data : $("[name=preChartForm]").serialize()				
						// 위 코드는 아래로도 가능. 
						// data : "admin_id="+admin_id+"&pwd="+pwd
						// data : { 'admin_id':admin_id, 'pwd':pwd}
					
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
					// 익명함수의 매개변수 data에는 서버가 응답한 데이터가 들어온다.
					// 현재 data라는 매개변수에는 아이디, 암호의 존재 개수가 들어온다. 1:성공, 0:아이디,암호 없음 , 그외:에러
					, success : function(preChartListDTO){
						//alert("salesMonthList : "+ preChartListDTO.salesMonthList[0].sales_amount);
						//alert("allSalesMonthList : "+ preChartListDTO.allSalesMonthList[0].sales_amount);
						// 아이디 존재 개수가 1개면 /z_spring/boardListForm.do 로 이동
						if(preChartListDTO != null){
							alert("성공");

							var xxx= preChartListDTO.salesMonthList.length;
							// Controller에서 가져온 DTO값들을 뽑아서 변수에 저장.
							// 나의 가게 월별 매출
							for(var i = 0; i<xxx; i++){
								jjj[i] = preChartListDTO.salesMonthList[i].sales_amount;
							}

							// 다른 가게들 월별 매출 평균
							for(var i = 0; i<xxx; i++){
								kkk[i] = preChartListDTO.allSalesMonthList[i].sales_amount;
							} 
			
							// 구글차트 1 실행
							drawChart1();
							

						}
						else if (preChartListDTO == null){
							alert("실패");
						}
						else {
							alert("서버 오류 발생. 관리자에게 문의 바람");
						} 
					}
					
					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
					, error : function(request, error){
						alert("서버 접속 실패");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						
						
					}
					
				});
				


				//-----------------------------------------------------------------
				// 두번째 ajax : 우리가게, 다른가게 인기메뉴, 점포 수 구하기
				

  				$.ajax({
					// 서버 쪽 호출 URL 주소 지정
					url : "/posbis/preChartProc2.do"
					
					// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
					, type : "post"

					, async : false
					// 서버로 보낼 파라미터명과 파라미터 값을 설정
					, data : $("[name=preChartForm]").serialize()				
						// 위 코드는 아래로도 가능. 
						// data : "admin_id="+admin_id+"&pwd="+pwd
						// data : { 'admin_id':admin_id, 'pwd':pwd}
					
					// myPopularityListDTO 안의 나의 가게 인기메뉴를 골라 class=myPopularityMenu안에 append로 입력.
					, success : function(myPopularityListDTO){
						//alert(typeof(myPopularityListDTO));


						if(myPopularityListDTO != null){
							alert("성공2");
							$(".menu").remove();
							$(".menu2").remove();
							$(".menu3").remove();

							// 우리가게 인기메뉴 가져와서 보여주기
							for(var i=0; i<myPopularityListDTO.myPopularityMenu.length; i++){
								myMenuName[i] = myPopularityListDTO.myPopularityMenu[i].MENU_NAME ;
								//("myMenuName => " + myMenuName[i]);
								myCount[i] = myPopularityListDTO.myPopularityMenu[i].SALES_COUNT ;
								//alert("myCount => " + myCount[i]);
								$('.myPopularityMenu').append('<tr class="menu2"><td align=center >'+ myMenuName[i] +'</td>');
							}
						
							
							// 다른가게 인기메뉴 가져와서 보여주기
							for(var i=0; i<myPopularityListDTO.othersPopularityMenu.length; i++){
								othersMenuName[i] = myPopularityListDTO.othersPopularityMenu[i].MENU_NAME ;
								//alert("othersMenuName => " + othersMenuName[i]);
								othersCount[i] = myPopularityListDTO.othersPopularityMenu[i].SALES_COUNT ;
								//alert("othersCount => " + othersCount[i]);
								$('.othersPopularityMenu').append('<tr class="menu2"><td align=center >'+ othersMenuName[i] +'</td>');
							}

							var storeCount = myPopularityListDTO.storeCount;
							//alert("storeCount => " + storeCount)
							$('.store_count').append('<td align=center class="menu3" >'+ storeCount +'</td>');

							
						}
						else if (myPopularityListDTO == null){
							alert("실패2");
						}
						else {
							alert("서버 오류 발생. 관리자에게 문의 바람");
						} 
					}
					
					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
					, error : function(request, error){
						alert("서버 접속 실패2");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);							
					}
					
				});	



  				//-----------------------------------------------------------------
				// 세번째 ajax : 상품별 판매 횟수, 순수익 비율 구하기
				

  				$.ajax({
					// 서버 쪽 호출 URL 주소 지정
					url : "/posbis/preChartProc3.do"
					
					// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
					, type : "post"

					, async : false
					// 서버로 보낼 파라미터명과 파라미터 값을 설정
					, data : $("[name=preChartForm]").serialize()				
						// 위 코드는 아래로도 가능. 
						// data : "admin_id="+admin_id+"&pwd="+pwd
						// data : { 'admin_id':admin_id, 'pwd':pwd}
					
					// myPopularityListDTO 안의 나의 가게 인기메뉴를 골라 class=myPopularityMenu안에 append로 입력.
					, success : function(mySalesRatioDTO){
						//alert(typeof(myPopularityListDTO));


						if(mySalesRatioDTO != null){
							alert("성공3");
							//alert(mySalesRatioDTO.menuSalesCount[0].MENU_NAME);

							// 우리가게 상품별 판매 횟수, 이름 구하기
							for(var i=0; i<mySalesRatioDTO.menuSalesCount.length; i++){
								salesMenuName[i] = mySalesRatioDTO.menuSalesCount[i].MENU_NAME ;
								//("myMenuName => " + myMenuName[i]);
								salesMenuCount[i] = mySalesRatioDTO.menuSalesCount[i].SALES_COUNT ;
								
							} 


							// 우리가게 상품별 순이익, 이름 구하기
							for(var i=0; i<mySalesRatioDTO.salesBenefit.length; i++){
								benefitMenuName[i] = mySalesRatioDTO.salesBenefit[i].MENU_NAME ;
								//("myMenuName => " + myMenuName[i]);
								salesBenefitMenu[i] = mySalesRatioDTO.salesBenefit[i].SALES_INCOME ;
								
							} 

							
							drawChart2();
							drawChart3();
							
						}
						else if (mySalesRatioDTO == null){
							alert("실패3");
						}
						else {
							alert("서버 오류 발생. 관리자에게 문의 바람");
						} 
					}
					
					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
					, error : function(request, error){
						alert("서버 접속 실패3");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);							
					}
					
				});		



					
				
				
			}	


//----------------------------------------     	
			
     		function drawChart1() {
     		
			/* var data = new google.visualization.DataTable();
			data.addRows([
				[1,30], [2,50], [3,45], [4,60], [5,77]
				, [8,70], [9,50], [10,87], [11,68], [12,60]
			]); */


			// 문자로 저장된 값들을 숫자로 변환.
			//	alert("jjj[0]====> " + jjj[0]);
				for(var i=0; i<jjj.length; i++){
					jjj[i] *=1;
				}
 
			//	alert("kkk[0] ====> " + kkk[0]);
				for(var i=0; i<kkk.length; i++){
					kkk[i] *=1;
				} 
				
			// 구글 차트 데이터 입력
			   var data1 = google.visualization.arrayToDataTable([
			   	 ['Month', 'My Store', 'Others Store'],
		         ['1월',  jjj[0],      kkk[0] ],
		         ['2월',  jjj[1],      kkk[1] ],
		         ['3월',  jjj[2],      kkk[2] ],
		         ['4월',  jjj[3],      kkk[3] ],
		         ['5월',  jjj[4],      kkk[4] ],
		         ['6월',  jjj[5],      kkk[5] ],
		         ['7월',  jjj[6],      kkk[6] ],
		         ['8월',  jjj[7],      kkk[7] ],
		         ['9월',  jjj[8],      kkk[8] ],
		         ['10월',  jjj[9],     kkk[9] ],
		         ['11월',  jjj[10],    kkk[10] ],
		         ['12월',  jjj[11],    kkk[11] ],
		       ]);
	       
		
		       var options1 = {
		         	title: '[월 매출]'
			        , curveType : 'function'
			     
		       };
		
		
		       var chart1 = new google.visualization.LineChart(document.getElementById('chart_div1'));
		       chart1.draw(data1, options1);

		       
		     }
		


//----------------------------------------
  	
		 
		     function drawChart2() {

/*
				   var data2 = google.visualization.DataTable();
				   alert("왜 안나오냐고!!!");
				   data2.addColumn('string', 'Topping');
			       data2.addColumn('number', 'Slices');
			       data2.addRows([
			         ['Mushrooms', 3],
			         ['Onions', 1],
			         ['Olives', 1],
			         ['Zucchini', 1],
			         ['Pepperoni', 2]
			       ]);
*/

					for(var i=0; i<salesMenuCount.length; i++){
						salesMenuCount[i] *=1;
					}
					
			       var data2 = google.visualization.arrayToDataTable([
					   	 ['메뉴', 					'개수(개)', 			   ],
				         [salesMenuName[0],     salesMenuCount[0],             ],
				         [salesMenuName[1],     salesMenuCount[1],             ],
				         [salesMenuName[2],     salesMenuCount[2],             ],
				         [salesMenuName[3],     salesMenuCount[3],             ],
				        
				       ]);
			
			       var options2_1 = {
			         	title: '[상품별 매출(%)]'				        
				     
			       };

			       var options2_2 = {
			         	title: '[상품별 매출(개수)]'
				        
				        , tooltip:{textStyle : {fontSize:12}, showColorCode : true}
			        	, legend: { position: "top" }
			      		, isStacked: false
			        	, animation: { //차트가 뿌려질때 실행될 애니메이션 효과
			                 startup: true,
			                 duration: 1000,
			                 easing: 'linear' }
				        , annotations: {
							textStyle: {
								fontSize : 13
								, bold: true
								, italic: true
								, color: '#871b47'
			                    ,  auraColor: '#d799ae'
			                    ,  opacity: 0.8

							}
					      } 	
				        
				     
			       };
			       
			       var chart2_1 = new google.visualization.PieChart(document.getElementById('chart_div2_1'));
			       chart2_1.draw(data2, options2_1);

			       var chart2_2 = new google.visualization.BarChart(document.getElementById('chart_div2_2'));
			       chart2_2.draw(data2, options2_2);
		     }	


		     
//----------------------------------------
  	    	
			 
		     function drawChart3() {

/*
				   var data2 = google.visualization.DataTable();
				   alert("왜 안나오냐고!!!");
				   data2.addColumn('string', 'Topping');
			       data2.addColumn('number', 'Slices');
			       data2.addRows([
			         ['Mushrooms', 3],
			         ['Onions', 1],
			         ['Olives', 1],
			         ['Zucchini', 1],
			         ['Pepperoni', 2]
			       ]);
*/
					
					var sum = 0;
					for(var i=0; i<salesBenefitMenu.length; i++){
		    	 		salesBenefitMenu[i] *=1;
		    	 		sum = sum + salesBenefitMenu[i];
					}
					alert(sum);

			       var data3 = google.visualization.arrayToDataTable([
					   	 ['메뉴', 				'총이익(원)',		'순이익(원)',     			 ],
				         [benefitMenuName[0],     sum,			salesBenefitMenu[0],             ],
				         [benefitMenuName[1],     sum,			salesBenefitMenu[1],             ],
				         [benefitMenuName[2],     sum,			salesBenefitMenu[2],             ],
				         [benefitMenuName[3],     sum,			salesBenefitMenu[3],             ],
				       ]);
			
			       var options3 = {
			         	title: '[상품별 순이익]'
				        
				     
			       };
			       
			       var chart3 = new google.visualization.ColumnChart(document.getElementById('chart_div3'));
			       chart3.draw(data3, options3);
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
		
         <!---------------- 상단바 ------------------------->
         <div style="float: left; border:1px solid;  height:10%; width: 100%; ">
         	<center><h2>상단바</h2></center>
         	
         </div>
      
         <div style="display:table; border:1px solid; height:90%; width: 100%;">
            <!------------------ 사이드바 ---------------------->
            <div style="float:left; width: 9%; border:1px solid;  height:100%;"><br><Br>
               <h3>마이페이지</h3><br>
                  <a onClick="goMyPageForm()">내 정보관리</a><br><br>
                  <a onClick="goMenuForm()">메뉴관리</a><br><br>
                  <a onClick="goSalesForm()">매출관리</a><br><br>
                  <a onClick="goPreChartForm()">프리미엄</a><br><br>
            </div>

            <!------------------ 메인으로 보여줄 div -------------------->

            	<div style="float: right; border:1px solid; width: 89%; height:10%;">
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
								 		<option value="all">모두검색
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
				</div>
			

					<div style="float: left; border:1px solid;  width: 45%; height:90%;">
				         <br><br><br>
				         <h1><script>var today = new Date(); document.write( today.getFullYear() + "년 분석현황" ) </script></h1>
				         <br>
				         [월매출]<br>
				         <br><br>
				         <div id="chart_div1" style="width: 700px; height: 200px;"></div>
		
		
				 		<br>    
				         
				         우리가게 인기메뉴<br>
				         <table border=1 width=200 class="myPopularityMenu"  >
			
				         </table>
				         
				         
				         <br><br>
				         다른 가게 인기메뉴<br>
				         <table border=1 width=200 class="othersPopularityMenu" >
				         		
				         </table>
				         
				         <br><br>
				         같은 동네, 같은 업종 의 점포수
				         <table border=1 width=200 >
				         	<tr class="store_count">		
				         </table>
				         
				         <br><br>
				        <!--  <br><br>
				         우리가게 인기메뉴<br>
				    	 <div id="chart_div2" style="width: 300px; height: 200px;"></div> -->
	   				</div>
	   				
	   				<div style="float: right; border:1px solid;  width: 45%; height:90%;">


				         <br><br><br>
				         <h1><script>var today = new Date(); document.write( today.getFullYear() + "년 분석현황" ) </script></h1>
				         <br>
				         [월매출]<br>
				         <br><br>
				         
				         
				         <table class="columns">
					      <tr>
					        <td><div id="chart_div2_1" style="width: 400px; height: 300px;"></div></td>
					        <td><div id="chart_div2_2" style="width: 400px; height: 250px;"></div></td>
					      </tr>
					    </table>
				       
					     
				 		<br>    
				         
				         <div id="chart_div3" style="width: 500px; height: 300px;"></div>
				        
				         
				         <br><br>
				        <!--  <br><br>
				         우리가게 인기메뉴<br>
				    	 <div id="chart_div2" style="width: 300px; height: 200px;"></div> -->
	   				</div>
	   				
	         	
	         	
	         	
	         	</div>



         

 

 </body>
</html>