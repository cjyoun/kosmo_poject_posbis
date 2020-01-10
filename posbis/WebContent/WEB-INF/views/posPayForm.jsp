<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
    
    
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>결제하기</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/pos/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="resources/pos/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/pos/assets/libs/css/style.css">
    <link rel="stylesheet" href="resources/pos/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">

	<script>

	
	   $(document).ready(function(){
		   
	  	   
	  	   //월매출 콤마 넣기
  		    $(".price").each(function() {
	            var num = $(this).text();
	            var commaNum = numberWithCommas(num);
	            $(this).text(commaNum);
	    		 });
   		 
		   })

	   
   			//월매출 콤마 넣기 함수
         function numberWithCommas(number) {
             var parts = number.toString().split(".");
             parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
             return parts.join(".");
         }
	
		
		//=====  오늘 날짜 시간 출력 ==============================================================================================
		//------------------------------------
		function showTime() {
			var today = new Date();
			//----------------------------
			var amPm = "오후";
			var year = today.getFullYear();
			var month = today.getMonth() + 1;
			var date = today.getDate();
			var hour = today.getHours();
			var minute = today.getMinutes();
			var second = today.getSeconds();
			var week = [ "일", "월", "화", "수", "목", "금", "토" ][today.getDay()]; //*************
	
			//var wee = new Array("일","월","화","수","목","금","토")[today.getDay()];//위에 한줄이랑 같은거
	
			//var arr= new Array("일","월","화","수","목","금","토");   //위에 한줄이랑 같은거
			//var week =arr[today.getDay()];
	
			if (month < 10) {
				month = "0" + month;
			}
			if (date < 10) {
				date = "0" + date;
			}
			if (hour < 12) {
				amPm = "오전";
			}
			if (hour > 12) {
				hour = hour - 12;
			}
			if (hour < 10) {
				hour = "0" + hour;
			}
			if (minute < 10) {
				minute = "0" + minute;
			}
			if (second < 10) {
				second = "0" + second;
			}
			//id="nowTime"가 있는 태그영역 내부에 시간 문자열 삽입
			document.getElementById("nowTime").innerHTML = year + "년 " + month
					+ "월 " + date + "일 (" + week + ")&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>" + amPm + " " + hour + "시 "
					+ minute + "분 " + second + "초&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		}
	
		//1초마다 showTime() 함수 호출하는 함수 선언
		//-----------------------------------
		function startTime() {
			showTime();
			//1초마다 showTime() 함수 호출
			//----------------------------
			//window.setInterval( "showTime()", 1000 );  //1000=1초 //밑에거랑 같아
			window.setInterval(function() {
				showTime();
			}, 1000); //익명함수
		}
		//===== / 오늘 날짜 시간 출력 끝==============================================================================================
		
		
		
		
		

		//전역변수 선언 클릭수 추가
		var count = 0

		function goMenuNameForm() {

			/* 	alert("시작")
			 alert($("[name=business_no]").val())*/
			 alert($("[name=menu_name]").val()) 
			
			$.ajax({
						url : "/posbis/posPerMenuProc.do",
						type : "post",
						data : $("[name=menuNameform]").serialize(),
						success : function(data) {

							if (data.length == 1) {
								/* 
								alert(data[0].menu_name);
								alert($("[name=tablelist] [name=perMenuList]").find("td").eq(1).text()); 
								alert($("[name=tablelist] [name=perMenuList]").find("td").find("[name=count_update]").val());*/

								if (data[0].menu_name == $(
										"[name=tablelist] [name=perMenuList]")
										.find("td").eq(1).text()) {

									var toStr = $(
											"[name=tablelist] [name=perMenuList]")
											.find("td").find(
													"[name=count_update]")
											.val()
									var toStrfinal = parseInt(toStr, 10);

									$("[name=tablelist] [name=perMenuList]")
											.find("td").find(
													"[name=count_update]").val(
													toStrfinal + 1)

									return;
								}

								/* 		if(data[0].menu_name==$("[name=tablelist] [name=menu_name]").find("<tr><td>"+data[0].menu_name)){
										alert(data[0].menu_name);
									}*/

								if ($("[name=tablelist] [name=perMenuList]")
										.find("td").find("[name=levelNum]")
										.val() == null) {

									$("[name=tablelist] [name=perMenuList]")
											.append("<tr>")
									$("[name=tablelist] [name=perMenuList]")
											.append("<td name=levelNum>" + 1)
									$("[name=tablelist] [name=perMenuList]")
											.append("<td>" + data[0].menu_name)
									$("[name=tablelist] [name=perMenuList]")
											.append("<td>" + data[0].menu_price)
									$("[name=tablelist] [name=perMenuList]")
											.append(
													"<td>"
															+ '<input type=text value=1 size=3 name=count_update>'
															+ '/'
															+ '<input type="button"  class="count_update" value="수정" onClick="goupdateForm();" >')
									$("[name=tablelist] [name=perMenuList]")
											.append(
													"<td>"
															+ '<input type="button"  class="menu_delete menu_deleteBtn" value="삭제"><br>')
								} else {
									$("[name=tablelist] [name=perMenuList]")
											.append("<tr>")
									$("[name=tablelist] [name=perMenuList]")
											.append(
													"<td name=levelNum>"
															+ (++count))
									$("[name=tablelist] [name=perMenuList]")
											.append("<td>" + data[0].menu_name)
									$("[name=tablelist] [name=perMenuList]")
											.append("<td>" + data[0].menu_price)
									$("[name=tablelist] [name=perMenuList]")
											.append(
													"<td>"
															+ '<input type=text value=1 size=3 name=count_update>'
															+ '/'
															+ '<input type="button"  class="count_update" value="수정" onClick="goupdateForm();" >')
									$("[name=tablelist] [name=perMenuList]")
											.append(
													"<td>"
															+ '<input type="button"  class="menu_delete menu_deleteBtn" value="삭제"><br>')

								}
							} else {
								alert("검색 실패");
							}
						},
						error : function(request, status, error) {
							alert("서버 접속 실패");
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);

						}

					});

		};

		$(document).on('click','.count_update',function() {

							if (is_valid_pattern("[name=count_update]",
									/^[0-9]$/) == false) {
								alert("숫자입력해주세요");
								$("[name=tablelist] [name=perMenuList]").find(
										"td").find("[name=count_update]").val(
										"").focus();

								return;
							}

							var confirmFlag = confirm("변경하시겠습니까?");
							if (confirmFlag) {
								alert("변경되었습니다.")
							} else {
								alert("감사합니다")

							}
						});

		$(document).on('click', '.menu_deleteBtn', function() {
			$(this).parent().parent().empty();
		});

		
	</script>







</head>

<body onLoad ="startTime()">
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
         <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
         <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="../index.html">가게 이름</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
  						      <div id="businessNo" align="right">사업자번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br> ${business_no}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </li>
                        <li class="nav-item dropdown notification">
	        				<div id="nowTime" align="right">nowDate</div>
                        </li>
                     </ul>
                       
                </div>
            </nav>
        </div>
        
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
      <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-item ">
                                <a class="nav-link active" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fas fa-calculator"></i>결제하기 <span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        
        
        
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <div class="row">
                    
                     <!-- ============================================================== -->
                    <!-- basic table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8">
                        <div class="card">
                            <h5 class="card-header">결제 목록</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                   <form name="posMenuForm" method="post" action="/z_spring/boardListForm.do">
                                    <table class="table table-striped table-bordered first tablelist" name="tablelist">
                                        <thead >
                                            <tr >
                                                <th>순서번호</th>
                                                <th>메뉴이름</th>
                                                <th>가격</th>
                                                <th>수량/수정</th>
                                                <th>삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody name="perMenuList" >
                                            <tr >
                                          
 
                                            </tr>
                                             
                                    </table>
                                   </form>
                                </div>
                            </div>
                            
                        </div>
                        <div class="card">
                            <h2 class="card-header">총 금 액&nbsp;&nbsp;&nbsp; </h2>
                        </div>
                        
                    </div>
                    
                    
                    <!-- ============================================================== -->
                    <!-- end basic table  -->
                    <!-- ============================================================== -->
                    
                    
                    
                    
                 	  <!-- ============================================================== -->
                        <!-- sidebar nav  -->
                        <!-- ============================================================== -->
                        <!-- ===================             메                            뉴            =============== -->
                         <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                            <div class="card">
                            <h5 class="card-header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뉴</h5>
                            <div class="sidebar-nav-fixed">
                            <div class="card-body">
                            <form id="form" data-parsley-validate="" novalidate="" name="menuNameform" method="post"    action="/posbis/menuNameform.do" >
                						     	<c:forEach items="${posMenuList}" var="posMenu">							             
                                    	     	   <div style="margin: 15px 25px 15px; float: left;" >
                                    	     	   		<input type="text" style="width:90pt;height:90pt;" value="${posMenu.MENU_NAME}" name="menu_name"  onClick="goMenuNameForm();"><h3><b>${posMenu.MENU_NAME}</b></h3><div class="price">${posMenu.MENU_PRICE} 원</div>
                                    	     	   </div> 
                                            	</c:forEach>


                             </form>
                             </div>   
                            </div>
                        </div>
                        
     
            </div>
                        <!-- =================         /        메    뉴     끝               ================ -->
                  
                    
                </div>
            </div>

        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="resources/pos/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="resources/pos/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="resources/pos/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="resources/pos/assets/libs/js/main-js.js"></script>
</body>
 
</html>