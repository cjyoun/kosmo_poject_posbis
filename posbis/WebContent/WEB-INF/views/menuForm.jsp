<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp" %>


<html>
   <head>
       <title> 메뉴관리 </title>
      	<script>
      	
      	$(document).ready(function(){

      		$('#menu').hide();
	        $('.pagingDiv').hide();
	        
      		$('[name = rowCntPerPage]').change(function(){
				goSearch();
			});
			
			// 클라이언트가 보낸 검색 조건을 입력 양식에 넣어주기
			$(".pagingNumber").html(
				getPagingNumber(						//getPagingNumber 는 common.js안에 있는함수
					"${menuAllCnt}"						// 검색결과 총 행 개수
					,"${menuSearchDTO.selectPageNo}"	// 선택된 현재 페이지 번호
					,"${menuSearchDTO.rowCntPerPage}"	// 페이지 당 출력행의 개수
					,"15"								// 페이지 당 보여줄 페이지번호개수
					,"goSearch();"					// 페이지 번호 클릭 후 실행할 자스코드
				)
			);

			inputData("[name=selectPageNo]","${menuSearchDTO.selectPageNo}");
			inputData("[name=rowCntPerPage]","${menuSearchDTO.rowCntPerPage}");
			inputData("[name=keyword]","${menuSearchDTO.keyword}");
			inputData("[name=changeBusinessNo]","${menuSearchDTO.changeBusinessNo}");
			
			$('[name=changeBusinessNo]').change(function(){
				//name=salesForm을 가진 form 태그의 action 값의 URL로 웹서버에 접속하기
				document.menuForm.submit();
				MenuSearchDTO.setChangeBusinessNo($("[name=menuForm] [name=changeBusinessNo]").val());
			});

		  var cnt = $("[name=changeBusinessNo] option:selected").val();
	         if(cnt==""){
	            $("[name=changeBusinessNo] option:eq(1)").attr("selected","selected");
	             document.menuForm.submit();
	             MenuSearchDTO.setChangeBusinessNo($("[name=menuForm] [name=changeBusinessNo]").val());
	         }
	         
	      $('#menu').show();
	      $('.pagingDiv').show();
	         
		});


			// 메뉴검색 함수
	    	function goSearch(){
	        	
			if(is_empty("[name=menuForm] [name=keyword]")){
				$("[name=menuForm] [name=keyword]").val("");
			}
			// 키워드 앞뒤에 공백이 있으면 제거하고 다시 넣어주기
			var keyword = $("[name=menuForm] [name=keyword]").val();
			keyword = $.trim(keyword);
			$("[name=menuForm] [name=keyword]").val(keyword)
			document.menuForm.submit();
	    	}
	    	
	        // 모두검색 함수
	        function goSearchAll(){
	       	 	document.menuForm.reset();
				$("[name=menuForm] [name=selectPageNo]").val("1");
				$("[name=menuForm] [name=rowCntPerPage]").val("10");
				goSearch();
	        }
	         // 마이페이지로 이동
	         function goMyPageForm(){
	            location.replace( "/posbis/myPageForm.do" );
	         }
	
	         // 메뉴관리 페이지로 이동
	         function goMenuForm(){
	            location.replace( "/posbis/menuForm.do" );
	         }
	         
	         // 매출관리 페이지로 이동
	         function goSalesForm(){
	            location.replace( "/posbis/salesForm.do" );
	         }
	                  
	         // 프리미엄 페이지로 이동
	         function goPreChartForm(){
	            location.replace( "/posbis/preChartForm.do" );
	         }
	                  
	         // 메뉴수정삭제 페이지로 이동
	         function goMenuUpDelForm(menu_name){
 				var str = "menu_no="+menu_no+"&"+$("[name = menuForm]").serialize();
				location.replace( "/posbis/menuUpDelForm.do?"+str );
	         }
                  
	         // 메뉴등록 페이지로 이동
	         function goMenuRegForm(){
	            location.replace( "/posbis/menuRegForm.do" );
	         }

	         // 메인페이지로 이동
	         function goMainForm(){
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
		<div style="float: right; border: 1px solid; 20 px , margin : 10px; width: 80%; height: 100%;"><br>
		
		
		
		<!-------------------- 메뉴관리 form 태그 ---------------------->
		<form name="menuForm" method="post" action="/posbis/menuForm.do">
			
			<select name="changeBusinessNo">
			
				<!-- 중요! -->
				<option value="">사업자번호</option>
				<c:forEach items="${businessNoList}" var="businessNoList">
					<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})
					</option>
				</c:forEach>
			</select><br><br><br>
			<div style="width:800">

				<!-- 메뉴 관리 보기 -->
				<h2>[메뉴관리]</h2>

				<!-- 키워드 검색 input -->
				[키워드] : 	<input type="text" name="keyword" class="keyword">
							<input type="button" value="검   색"onClick="goSearch();">&nbsp; 
							<input type="button" value="모두검색" onClick="goSearchAll();">&nbsp;

				<!-- 메뉴등록 input -->
				<input type="button" value="메뉴등록" onClick="goMenuRegForm();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				[총 개수] : ${menuAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- 선택한 페이지 번호가 저장되는 입력양식 표현하기 ------------------------>
					<select name = "rowCntPerPage">
						<option value="10">10
						<option value="15">15
						<option value="20">20
						<option value="25">25
						<option value="30">30
					</select> 행보기
				</div ><br>
				
		</from>
		
				<!-- 페이징처리 span 태그 -->
				<div class="pagingDiv">&nbsp; <span class="pagingNumber"></span> &nbsp;</div>	
				<!-- 선택한 페이지 번호 저장되는 입력양식 -->
				<input type="hidden" name="selectPageNo">

		<table><tr height=10><td></table>
		
		<!-- 메뉴관리 table -->
		<table border=1 cellspacing=0 cellpadding=5 width="800" id="menu">
			<tr> <th>번호<th>대분류<th>중분류<th>소분류<th>메뉴이름<th>메뉴가격<th>메뉴원가
			
			<!-- List안에서 꺼내서 한행을 var="menu" 담아서 화면에 보여지도록 한다. -->
			<c:forEach items="${menuList}" var="menu" varStatus="loopTagStatus">
				<tr style="cursor: pointer" onClick="goMenuUpDelForm(${menu.menu_no});">

					<%-- 게시판 목록 중에 각 행의 정순 일련번호 출력--%>
              		 <td>
              		 ${menuSearchDTO.selectPageNo*menuSearchDTO.rowCntPerPage-menuSearchDTO.rowCntPerPage+1
                                                               +loopTagStatus.index} 

					<!-- 각 행의 메뉴 대분류 출력  -->
					<td align=center>${menu.main_category_name}</td>

					<!-- 각 행의 메뉴 중분류 출력  -->
					<td align=center>${menu.mid_category_name}</td>

					<!-- 각 행의 메뉴 소분류 출력  -->
					<td align=center>${menu.sub_category_name}</td>
					
					<!-- 각 행의 메뉴 이름 출력  -->
					<td>${menu.menu_name}</td>
					
					<!-- 각 행의 메뉴 가격 출력  -->
					<td align=center>${menu.menu_price}</td>

					<!-- 각 행의 메뉴 원가 출력  -->
					<td align=center>${menu.menu_cost}</td>
			</c:forEach>
		
		</table><br>

		<c:if test="${empty menuList}">
			검색 결과가 없습니다.
		</c:if>

		</div>
	</div>
</div>

</body>

</html>