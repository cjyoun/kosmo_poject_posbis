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
		  	   //alert("ready!");
		  	   
		  	   //월매출 콤마 넣기
	  		    $(".month_sales").each(function() {
                var num = $(this).text();
                var commaNum = numberWithCommas(num);
                $(this).text(commaNum+ "원");
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
				inputData("[name=addr_gu1]","${preSearchDTO.addr_gu1}");
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
							$("[name=business_type_name2]").append("<option value=''>===중분류===</option>");
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



			//월매출 콤마 넣기
	         function numberWithCommas(number) {
	             var parts = number.toString().split(".");
	             parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	             return parts.join(".");
	         }

		   


	      function goPreSearch(){	         
	    	  /* $.ajax({
					url : "/posbis/getPreResultProc.do"
					, type : "post"
					, data : $("[name=preSearchForm]").serialize() 
					, success : function(data){
							alert("ajax 성공");

					}
					, error : function(request,status,error){
						alert("서버 접속 실패");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				}) */
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
				<div style="float: right; border: 1px solid; 20 px , margin : 10px; width: 80%; height: 100%;">
				
				<h2 align=left>&nbsp;&nbsp;&nbsp;[프리미엄 검색]</h2>
					<br> <input type="button" value="분석페이지로가기" style=""
						onClick="goPreChartForm();">&nbsp; <input type="button"
						value="마이페이지로가기" style=""
						onClick="location.replace('/posbis/myPageForm.do');">&nbsp;
					<input type="button" value="q&a로가기" style=""
						onClick="location.replace('/posbis/qstnForm.do');">&nbsp;
					<br>
					<br>



					<!--======================-->
					<!--검색 조건-------------->
					<!--======================-->

					<!-- 검색조건 form -->
					<form name="preSearchForm" method="post"
						action="/posbis/preSearchForm.do">

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
							<!-----------지역------------>
							<!--======================-->
							<tr>
								<th align=center>지 역</th>
								<td><select name="addr_gu1">
										<option value="">==구선택==</option>
										<c:forEach items="${addrGu1List}" var="addrGu1">
											<option value="${addrGu1.addr_gu1}">${addrGu1.addr_gu1}</option>
										</c:forEach>
								</select> &nbsp;</td>
							</tr>

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
						<input type="button" value="검색" style="" onClick="goPreSearch();">&nbsp;
						<input type="button" value="모두검색" style="" onClick="goPreSearchAll();">&nbsp;
						 <br><br>
						
						
						
						 
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
						<input type="hidden" name="sort" value="rnum asc">		
					</form>
					<!-- /preSearchForm  -->


					
					
					<!-- 페이징 번호 삽입할 span 태그 선언 -->
					<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
					<table><tr height=10><td></table>


					<!--======================-->
					<!--======검색결과=======-->
					<!--======================-->
					<form name="preResultForm">
						<table class="boardTable tbcss2" border=0 cellspacing=0 cellpadding=5 width=700>
							<tr bgcolor="gray">
								
							<!-- 순위-------------------------------------------------------------------------------------------------------------------  -->
								<c:choose>
									<c:when test="${param.sort=='rnum desc'}">
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('rnum asc'); goPreSearch();">매출순위▼
									</c:when>
									<c:when test="${param.sort=='rnum asc'}">
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('rnum desc'); goPreSearch();">매출순위▲
									</c:when>
									<c:otherwise>
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('rnum asc'); goPreSearch();">매출순위
									</c:otherwise>
								</c:choose>
							<!-- 월매출-------------------------------------------------------------------------------------------------------------------  -->
								<c:choose>
									<c:when test="${param.sort=='month_sales desc'}">
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('month_sales asc'); goPreSearch();">월 매 출 ▼<br>(지난달 기준)
									</c:when>
									<c:when test="${param.sort=='month_sales asc'}">
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('month_sales desc'); goPreSearch();">월 매 출 ▲<br>(지난달 기준)
									</c:when>
									<c:otherwise>
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('month_sales asc'); goPreSearch();">월 매 출<br>(지난달 기준)
									</c:otherwise>
								</c:choose>
								<!-- 업종-------------------------------------------------------------------------------------------------------------------  -->
								<c:choose>
									<c:when test="${param.sort=='business_type desc'}">
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('month_sales asc'); goPreSearch();">업&nbsp;&nbsp;종▼
									</c:when>
									<c:when test="${param.sort=='business_type asc'}">
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('business_type desc'); goPreSearch();">업&nbsp;&nbsp;종▲
									</c:when>
									<c:otherwise>
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('business_type asc'); goPreSearch();">업&nbsp;&nbsp;종
									</c:otherwise>
								</c:choose>
								<!-- 인기메뉴분류-------------------------------------------------------------------------------------------------------------------  -->
								<c:choose>
									<c:when test="${param.sort=='best_menu_type desc'}">
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('best_menu_type asc'); goPreSearch();">인기메뉴▼
									</c:when>
									<c:when test="${param.sort=='best_menu_type asc'}">
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('best_menu_type desc'); goPreSearch();">인기메뉴▲
									</c:when>
									<c:otherwise>
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('best_menu_type asc'); goPreSearch();">인기메뉴
									</c:otherwise>
								</c:choose>
								<!-- 인기메뉴분류-------------------------------------------------------------------------------------------------------------------  -->
								<c:choose>
									<c:when test="${param.sort=='addr_dong desc'}">
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('addr_dong asc'); goPreSearch();">지역(동단위)▼
									</c:when>
									<c:when test="${param.sort=='addr_dong asc'}">
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('addr_dong desc'); goPreSearch();">지역(동단위)▲
									</c:when>
									<c:otherwise>
										<th style="cursor:pointer"
												onClick="$('[name=sort]').val('addr_dong asc'); goPreSearch();">지역(동단위)
									</c:otherwise>
								</c:choose>



							<c:forEach items="${preResultList}" var="preResult" varStatus="loopTagStatus">
							<tr>
								<td align=center>${preResult.RNUM}
								<td align=center class=month_sales>${preResult.MONTH_SALES}
								<td align=center>${preResult.BUSINESS_TYPE}
								<td align=center>${preResult.BEST_MENU_TYPE}
								<td align=center>${preResult.ADDR_DONG}
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