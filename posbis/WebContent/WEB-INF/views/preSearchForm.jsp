<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="/posbis/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="/posbis/resources/common.js?a=<%=Math.random()%>>"></script>

<html>
<head>
<title>PremiumSearch</title>
<meta charset="utf-8">

<script>


		

	  	   $(document).ready(function(){

			  	
		  	   //첫째 tr 태그 내부의 th 태그를 클릭하면 발생할 일 설정
				//-------------------------------
				$(".preResult thead:eq(0) tr:eq(0) th").click( function(){
					//클릭한 th태그를 관리하는 JQuery 객체 메위주를 얻어 변수에 저장
					var thisThObj = $(this);
					//내림차순 오름차순 여부를 저장할 변수선언
					var ascDesc = "";
					//클릭한 th 형제의 th태그 안의 문자열에 ▲,▼ 제거
					thisThObj.siblings().each( function(){
						//i번째 th태그 안의 문자열을 얻자
						var txt = $(this).text();
						//앞뒤공백제거
						txt = $.trim(txt);
						//▲제거
						txt = txt.replace("▲","");
						//▼제거
						txt = txt.replace("▼","");
						//i번째 th 태그 안에 ▲,▼ 제거한 문자열 넣기
						$(this).text( txt );
					});
					//클릭한 th안의 문자열 뒤에 ▲ 또는 ▼ 붙이기
					//--------------------------------
					//클릭한 th안의 문자열을 얻어 변수 str저장
					var txt = thisThObj.text();
					//txt 변수 안의 문자열에 ▲가 있으면 ▼로 바꾸고 ascDesc변수에 'desc'저장
					if( txt.indexOf("▲")>=0 ){
						txt=txt.replace("▲","▼");
						ascDesc = "desc";
					}
					//txt 변수 안의 문자열에 ▼가 있으면 ▲로 바꾸고 ascDesc변수에 'asc'저장
					else if( txt.indexOf("▼")>=0 ){
						txt=txt.replace("▼","▲");
						ascDesc = "asc";
					}
					//txt 변수 안의 문자열에 ▼, ▲둘다 없을 경우 ▲넣어주고 ascDesc 변수에 "asc'저장
					else{
						txt= txt+ "▲"
						ascDesc="asc";
					}
					//txt 안의 데이터를 클릭한 th 안의 문자열로 갱신
					thisThObj.text(txt);

					//Array 객체에 각각의 tr을 관리하는 JQuery 객체들을 생성해서 저장
					//원하는 정렬 기준에 따라 JQuery 객체의 위치를 바꾼다.
					//-------------------------------
					//정렬 대상이 되는 모든 tr 태그를 관리하는 JQuery 객체 생성해 저장
					var allTrObj = $('.preResult tbody:eq(0)').children();
					//각각의 tr을 관리하는 JQuery 객체들을 생성하여 Array 객체에 저장
					//--------------------------------
					var trObjs = [];
					allTrObj.each(function(){
						trObjs.push( $(this) );
					});
					//클릭한 th 태그의 인덱스 번호 저장.
					var thIndex = thisThObj.index();

					//반복문을 사용하여 클릭한 th열과 동이한 열의 데이터를 오름 또는 내림 정렬에 맞추어
					//Array 객체에 저장된 tr 태그 관리 JQuery 객체를 재 배치
					//----------------------------------
					for( var j=0; j<trObjs.length-1; j++){
						for( var k=j+1; k<trObjs.length; k++){
							//j번째 jquery 객체의 관리 tr의 x번째 열의 문자얻고 소문자로 바꾸기
							var td1Text = trObjs[j].children('td').eq(thIndex).text();
							td1Text = ($.trim(td1Text)).toLowerCase();
							if(thIndex==2){
								td1Text = parseInt(td1Text,10);
							}
							//k번째 jquery 객체의 관리 tr의 x번째 열의 문자얻고 소문자로 바꾸기
							var td2Text = trObjs[k].children('td').eq(thIndex).text();
							td2Text = ($.trim(td2Text)).toLowerCase();

							if( thIndex==2){ td2Text = parseInt(td2Text,10); }
							//-----------
							//만약 내림차순 의도가 있고 [j번째 x번째 열의 문자]<[k번째 x번째 열의 문자]면
							//j번째 jquery 객체와 k번째 jquery 객체의 위치 바꾸기
							if( ascDesc=="desc" && td1Text<td2Text ){
								var tmp = trObjs[j];
								trObjs[j] = trObjs[k];
								trObjs[k] = tmp;
							}
							//오름차순 의도가 있고 [j번째 x번째 열의 문자]>[k번째 x번째 열의 문자]면
							//j번째 jquery객체와 k번째 jquery 객체의 위치 바꾸기
							else if( ascDesc=="asc" && td1Text>td2Text ){
								var tmp = trObjs[j];
								trObjs[j] = trObjs[k];
								trObjs[k] = tmp;
							}
						}
					}

					//기존 tr 태그 지우기
					$('.preResult tbody:eq(0)').empty();
					//Array 객체에 저장된 JQuery 객체가 관리하는 tr 태그 삽입
					for( var j=0; j<trObjs.length; j++){
						$('.preResult tbody:eq(0)').append( trObjs[j] );
					}
					
				});


				
 	  		 	$('[name=rowCntPerPage]').change(function(){
	  		 		goPreSearch();
				}); 

 	  		 	
 	  			//페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입
					$(".pagingNumber").html(
						getPagingNumber(
							"${preResultAllCnt}"                //검색 결과 총 행 개수
							,"${preSearchDTO.selectPageNo}"	//선택된 현재 페이지 번호
							,"${preSearchDTO.rowCntPerPage}"	//페이지 당 출력행 개수
							,"15"								//페이지 당 보여줄 페이지번호 개수
							,"goPreSearch();"						//페이지 번호 클릭 후 실행할 자스코드
						)
					); 
 	  			


				//alert("${preResultAllCnt}");
				//alert("${preSearchDTO.selectPageNo}");
				//alert("${preSearchDTO.rowCntPerPage}");
				
				
 				$('[name=business_type_name1]').change(function(){
					//alert("change!");
					getBusinessTypeName2();
					
				}); 
				
								
				
				//alert("${preSearchDTO.business_type_name2}");
				inputData("[name=business_type_name1]","${preSearchDTO.business_type_name1}");
				 if("${preSearchDTO.business_type_name2}" == null){
					inputData("[name=business_type_name2]","${preSearchDTO.business_type_name2}");
					}else{
						getBusinessTypeName2();
						//alert("business_type_name2/"+"${preSearchDTO.business_type_name2}");
					}
				//inputData("[name=business_type_name2]","${preSearchDTO.business_type_name2}");
				inputData("[name=addrGu1]","${preSearchDTO.addrGu1}");
				inputData("[name=rowCntPerPage]","${preSearchDTO.rowCntPerPage}");
				inputData("[name=selectPageNo]","${preSearchDTO.selectPageNo}");
				inputData("[name=month_sales]","${preSearchDTO.month_sales}");



	  	   });	 
		
		
			function getBusinessTypeName2(){

				
				$.ajax({
					url : "/posbis/getBusinessTypeName2.do"
					, type : "post"
					, data : "business_type_name1="+$('[name=business_type_name1]').val()
					, success : function(data){
							$("[name=business_type_name2]").empty();
							$("[name=business_type_name2]").append("<option value=''>==중분류==</option>");
							//alert("business_type_name2///"+data[0]);
							for( var i=0; data.length>i; i++){
								//alert();
								$('[name=business_type_name2]').append("<option value="+data[i]+">"+data[i])

							}
							if("${preSearchDTO.business_type_name2}"!=null){
								inputData("[name=business_type_name2]","${preSearchDTO.business_type_name2}");
							}
							else{
								inputData("[name=business_type_name2]","");
							}
							
					}
					, error : function(){
						alert("서버 접속 실패");
					}
				})

				
			}




	
			function goOrderByRnum(){
				var str = "order_by=rnum&"+$("[name=preSearchForm]").serialize();
				
				location.replace("/posbis/preSearchForm.do?"+str);
			}
				
		
	      function goPreSearch(){	         
				document.preSearchForm.submit();
			
	      }   

	      function goPreSearchAll(){
				document.preSearchForm.reset( );
				$("[name=preSearchForm] [name=selectPageNo]").val("1");
				$("[name=preSearchForm] [name=rowCntPerPage]").val("10");
				goPreSearch();
		  }
	
	      function goPreChartForm(){
	         location.replace("/posbis/preChartForm.do");
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

<body>
	<center>


		<div class="right">
			<input type=button value="메인으로" onClick="goMainForm()">
		</div>
		&nbsp;&nbsp;


		<div
			style="border: 1px solid; 20 px , margin : 10px; height: 100%; width: 100%;">

			<!---------------- 상단바 ------------------------->
			<div style="float: left; border: 1px solid; 20 px , margin : 10px; height: 15%; width: 100%;">
				<center>
					<h2>상단바</h2>
				</center>
			</div>

			<div
				style="display: table; border: 1px solid; 20 px , margin : 10px; height: 85%; width: 100%;">
				<!------------------ 사이드바 ---------------------->
				<div
					style="float: left; width: 15%; border: 1px solid; padding: 30px; height: 90%;">
					<br>
					<Br>
					<h3>마이페이지</h3>
					<br> <a onClick="goMyPageForm()">내 정보관리</a><br>
					<br> <a onClick="goMenuForm()">메뉴관리</a><br>
					<br> <a onClick="goSalesForm()">매출관리</a><br>
					<br> <a onClick="goPreChartForm()">프리미엄</a><br>
					<br>
				</div>

				<!------------------ 메인으로 보여줄 div -------------------->
				<div
					style="float: right; border: 1px solid; 20 px , margin : 10px; width: 80%; height: 100%;">
					<br> <input type="button" value="분석페이지로가기" style="" onClick="goPreChartForm();">&nbsp;
							 <input type="button" value="마이페이지로가기" style="" onClick="location.replace('/posbis/myPageForm.do');">&nbsp;
							<input type="button" value="q&a로가기" style="" onClick="location.replace('/posbis/qstnForm.do');">&nbsp;
					<br>
					<br>



					<!--======================-->
					<!--검색 조건-------------->
					<!--======================-->

					<!-- 검색조건 form -->
					<form name="preSearchForm" method="post" action="/posbis/preSearchForm.do">

						<br>
						<br> <select name="changeBusinessNo">
							<option value="">사업자등록번호</option>
							<c:forEach items="${businessNoList}" var="businessNoList">
								<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})
								</option>
							</c:forEach>
						</select> <br>
						<br>



						<table class="tbcss1" border=1 cellpadding=5>
							<caption align=top>
								<b>[검색 조건]</b>
							</caption>

							<!--======================-->
							<!--------업종-------------->
							<!--======================-->
							<tr>
								<th align=center>업 종</th>
								<td><select name="business_type_name1">
										<option value="">==대분류==
											<c:forEach items="${businessTypeName1List}"
												var="businessTypeName1">
												<option value="${businessTypeName1.business_type_name1}">${businessTypeName1.business_type_name1}
												</option>
											</c:forEach>
								</select> &nbsp; <select name="business_type_name2">
										<option value="">==소분류==
								</select> &nbsp;</td>
							</tr>
							<!--======================-->
							<!-----------지역------------>
							<!--======================-->
							<tr>
								<th align=center>지 역</th>
								<td><select name="addrGu1">
										<option value="">==구선택==</option>
										<c:forEach items="${addrGu1List}" var="addrGu1">
											<option value="${addrGu1.addr_gu}">${addrGu1.addr_gu}</option>
										</c:forEach>
								</select> &nbsp;</td>
							</tr>
							

							<!--======================-->
							<!------------매출----------->
							<!--======================-->
							<tr>
								<th align=center>월매출(지난달 기준)</th>
								<td>
										<input type="radio" name="month_sales" class="month_sales" value="0"> 모두 
										<input type="radio" name="month_sales" class="month_sales" value="20000"> 20000이상
										<input type="radio" name="month_sales" class="month_sales" value="50000"> 50000이상 
										<input type="radio" name="month_sales" class="month_sales" value="100000"> 100000이상
								</td>
							</tr>
						</table>
						<br> 
						<input type="button" value="모두검색" style="" onClick="goPreSearchAll();">&nbsp;
						<input type="button" value="검색" style="" onClick="goPreSearch();">&nbsp; <br>
						<br>
						
						
						
						 
						<table border=0 width=700>
							<tr>
								<td align=right>
									<!-- EL 문법으로 게시판 검색 총 개수 출력 -->
									<!-- 달러{boardListAllCnt}(EL은 주석문에서 유효) 은 컨트롤러 클래스 내부에
										ModelAndView 객체에 boardListAllCnt 라는 키갑스올 저장된 데이터를
										EL 로 표현하여 삽입 -->	
									[총 개수] : ${preResultAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
									<!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력 양식 -->
									<!-- 선택한 페이지 번호는 DB 연동시 아주 중요한 역할 -->	
									<select name="rowCntPerPage">
										<option value="10">10
										<option value="15">15
										<option value="20">20
										<option value="25">25
										<option value="30">30
									</select> 행보기
						</table>
			
			
					
						<input type="hidden" name="selectPageNo">		
					</form>
					<!-- /preSearchForm  -->


					
					
					<!-- 페이징 번호 삽입할 span 태그 선언 -->
					<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
					<table><tr height=10><td></table>


					<!--======================-->
					<!--======검색결과=======-->
					<!--======================-->
					<form name="preResultForm">
						<input type="hidden" name="order_by" value="rnum">
						<b>[검색결과]</b>
						<table class="preResult" border=0 cellspacing=0 cellpadding=5 width=700>
							<thead>
							<tr bgcolor="gray">
								<th style="cursor:pointer" class="rnum">순위
								<th style="cursor:pointer" class="months_sales">월매출(지난달 기준)
								<th style="cursor:pointer" class="business_type">업종
								<th style="cursor:pointer" class="best_menu_type">인기메뉴분류
								<th style="cursor:pointer" class="addr_dong">동 
							</thead>
							<c:forEach items="${preResultList}" var="preResult" varStatus="loopTagStatus">
							<tr>
								<td align=center>${preResult.RNUM}
								<td align=center>${preResult.months_sales}
								<td align=center>${preResult.business_type}
								<td align=center>메뉴분류
								<td align=center>${preResult.addr_dong}
							</c:forEach>
						</table>
					</form>
					<!-- /검색조건 form -->


					<c:if test="${empty preResultList}">
					검색 결과가 없습니다.
					</c:if>



					<br>
					<br>
					<br>
					<br>





					<!--======================-->
					<!-- 창업/소상공인 뉴스 -->
					<!--======================-->
					<form name="preTrendForm">
						<b>[창업/소상공인 뉴스]</b>
					</form>












				</div>
			</div>
		</div>
</body>
</html>