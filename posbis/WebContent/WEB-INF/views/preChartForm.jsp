<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여  common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp" %>		<!-- 이것만 WEB-INF 경로를 사용할 수 있음. -->


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
  
   
  
  
  <title> PremiumChart </title>
  

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
							//alert("성공");

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
							//alert("성공2");
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
							//alert("성공3");
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
					//alert(sum);

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
        <div class="social-links">
          
        </div>
      </div>
    </div>
   <div class="container">
      
      <div class="logo float-left">
        <!-- Uncomment below if you prefer to use an image logo -->
        <h1 class="text-light"><a  onClick="goMainForm();" class="scrollto"><span> POSBIS</span></a></h1>
        <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
      </div>

      <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li class="drop-down"><a href="">회사소개</a>
            <ul>
              <li onClick="goIntroForm();"><a href="#">POSBIS</a></li>
            </ul>
          </li>
           <li class="drop-down"><a href="">마이페이지</a>
            <ul>
              <li><a onClick="goHomePageForm();">통합 관리</a></li>
              <li><a onClick="goSalesForm();">매출 관리</a></li>
              <li><a onClick="goMenuForm();">메뉴 관리</a></li>
              <li><a onClick="goMyPageForm();">내 정보 보기</a></li>
 
            </ul>
          </li>
                <li class="drop-down"><a href="">분석현황</a>
            <ul>
              <li><a onClick="goPreSearchForm();">검색관리</a></li>
              <li><a onClick="goPreChartForm();">차트관리</a></li>
            </ul>
          </li>
         <li class="drop-down"><a href="">Q&A게시판</a>
            <ul>
              <li><a onClick="goqstnRegForm();">질문하기</a></li>
           	  <li><a onClick="goMyQstnForm();">내글보기</a></li>
           	  <li><a onClick="goQstnForm();">목록보기</a></li>
            </ul>
          </li>   
         
          <li  class="drop-down"> <a href=""><i class="icon_profile"></i> ${user_id} 님</a> 
           <ul>
           		
              <li><a onClick="goMyPageForm();"><i class="icon_profile"></i>&nbsp;&nbsp;내정보 보기</a></li>
           		<li><a onClick="goHomePageForm();"><i class="icon_documents_alt"></i>&nbsp;&nbsp;통합관리</a></li>
           	  <li><a onClick="goMainForm();"><i class="icon_key_alt"></i>&nbsp;&nbsp;Log Out</a></li>
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
           <h2>SEARCH<br> In <span>POBIS</span></h2>
        
        </div>
  
        <div class="col-md-6 intro-img order-md-last order-first">
          <img src="resources/intro/img/intro-img.svg" alt="" class="img-fluid">
     

    </div>
  </section><!-- #intro -->  
  
   <!--==========================
	 분석 차트
  ============================--> 
 <main id="main">
   <section id="main-content">
   <section class="wrapper">
     <div class="row">
           <div class="col-lg-10" align="center">
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">분석현황</a></li>
              <li><i class="fa fa-user-md"></i>차트관리</li>
   
            </ol>
          </div>
        </div>
		    <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                	 차트관리
              </header>
              <div class="panel-body">
 

      <div class="container">
      
 
          
        
            <!------------------ 메인으로 보여줄 div -------------------->

            	 
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
								 		<!-- <option value="all">모두검색 -->
								 		<c:forEach items="${businessNoList}" var="businessNoList">
											
												<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
												</option>
										</c:forEach>
										
									</select> 
							</table>
						</form>
		
						
	             	  <br>
	               
				    <!--   <input type="button" value="검색페이지로가기" style="width=130" onClick="goPreSearchForm();">&nbsp;
				      <input type="button" value="마이페이지로가기" style="width=130" onClick="location.replace('/posbis/myPageForm.do')">&nbsp;
				      <input type="button" value="q&a로가기" style="width=130" onClick="location.replace('/posbis/qstnForm.do')">&nbsp; -->
				
				</div>
				<br><br>

					 <div class="panel-body">
				         <br><br><br>
				          <script>var today = new Date(); document.write( today.getFullYear() + "년 분석현황" ) </script> 
				         <br>
				         [월매출]<br>
				         <br><br>
				         <div id="chart_div1" style="width: 900px; height: 500px;"></div>
		
		
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
	   				
	   				 <div class="panel-body">


				         <br><br><br>
				          <script>var today = new Date(); document.write( today.getFullYear() + "년 분석현황" ) </script> 
				         <br>
				         [월매출]<br>
				         <br><br>
				         
				         
				         <table class="columns">
					      <tr>
					        <td><div id="chart_div2_1" style="width: 700px; height: 500px;"></div><br></td>
					       </tr>
					       <tr>
					        <td><div id="chart_div2_2" style="width: 700px; height: 500px;"></div><br></td>
					      </tr>
					       <tr>
					        <td><div id="chart_div3" style="width: 700px; height: 500px;"></div><br></td>
					      </tr>
					    </table>
			 
				        <!--  <br><br>
				         우리가게 인기메뉴<br>
				    	 <div id="chart_div2" style="width: 300px; height: 200px;"></div> -->
				    	 
				    	 <button class="btn btn-info" type="button" value="검색페이지로가기" style="width=130" onClick="goPreSearchForm();">검색페이지로가기</button>&nbsp;&nbsp;
				      <button class="btn btn-primary" type="button" value="마이페이지로가기" style="width=130" onClick="location.replace('/posbis/myPageForm.do')">마이페이지로가기</button>&nbsp;&nbsp;
				      <button class="btn btn-success"  value="q&a로가기" style="width=130" onClick="location.replace('/posbis/qstnForm.do')">q&a로가기</button>
	         	        
	          		<br>
	          		<br>
	   				</div>
	   				
	         	
	         	
	         	</div>



         </section>
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