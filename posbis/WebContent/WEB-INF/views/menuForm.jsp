<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp"%>


<!-- 메뉴관리에 필요한 사항 -->
<!-- 출력번호, 가게명, 대분류, 중분류, 소분류, 메뉴번호, 메뉴명, 메뉴가격, 메뉴원가, 메뉴이익단가  했음-->
<!-- 메뉴가격, 메뉴원가, 메뉴순이익 : 원, 콤마 집어넣기 했음-->
<!-- 사업자 번호 검색 체크박스 : 모두검색 유저별 사업자 번호, 비움 했음-->
<!-- 메뉴 첫화면에서 유저가 소유한 모든 가게 메뉴가 한꺼번에 보여지도록 화면에 뿌려주기 -->
<!-- 테이블 헤더에 sort 넣기 -->

<html>
	<head>
		<title>메뉴관리</title>
		<script>
		
			// 페이지가 화면에 뿌려지고 나서 저 ready안에 이벤트시작
			$(document).ready(function() {
				// name = "rowCntPerPage" 에 change 이벤트가 발생하면 실행
				$('[name = rowCntPerPage]').change(function() {
					goSearch();
				});
				
				// 페이징처리를 위한 입력양식 
				$(".pagingNumber").html(
					getPagingNumber( 							//getPagingNumber 는 common.js안에 있는함수
						"${menuListAllCnt}" 					// 검색결과 총 행 개수
						,"${menuSearchDTO.selectPageNo}" 		// 선택된 현재 페이지 번호
						,"${menuSearchDTO.rowCntPerPage}" 		// 페이지 당 출력행의 개수
						,"15" 									// 페이지 당 보여줄 페이지번호개수
						,"goSearch();" 							// 페이지 번호 클릭 후 실행할 자스코드
					)
				);
				
				// 검색조건을 입력 양식에 넣어주기
				inputData("[name=selectPageNo]", "${menuSearchDTO.selectPageNo}");
				inputData("[name=rowCntPerPage]", "${menuSearchDTO.rowCntPerPage}");
				inputData("[name=keyword]", "${menuSearchDTO.keyword}");
				inputData("[name=u_no]", "${menuSearchDTO.u_no}");
				inputData("[name=chooseAllBusinessNo]", "${menuSearchDTO.chooseAllBusinessNo}");
				<c:forEach items="${MenuSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
				   inputData("[name=chooseBusinessNo]","${menuSearchDTO.chooseBusinessNo}");
				</c:forEach>
				
				// 콤마처리 함수
				$(".price_amount").each(function() {
	                var num = $(this).text();
	                var commaNum = numberWithCommas(num);
	                $(this).text(commaNum);
	         	});
					
			}); // $(document).readuy(function() {
	
	
				// 콤마처리 함수
		        function numberWithCommas(number) {
		             var parts = number.toString().split(".");
		             parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		             return parts.join(".");
		        }

				// 검색 함수
				function goSearch(){
					if (is_empty("[name=menuForm] [name=keyword]")) {
						$("[name=menuForm] [name=keyword]").val("");
					}
					
					// 키워드 앞뒤에 공백 제거 후 다시 넣어주기
					var keyword = $("[name=menuForm] [name=keyword]").val();
					keyword = $.trim(keyword);
					$("[name=menuForm] [name=keyword]").val(keyword)
					document.menuForm.submit();
				} 
				
				// 모두검색 함수
				function goSearchAll() {
					document.menuForm.reset();
					$("[name=menuForm] [name=selectPageNo]").val("1");
					$("[name=menuForm] [name=rowCntPerPage]").val("15");
					goSearch();
				}
				
				// 마이페이지로 이동
				function goMyPageForm() {
					location.replace("/posbis/myPageForm.do");
				}
			
				// 메뉴관리 페이지로 이동
				function goMenuForm() {
					location.replace("/posbis/menuForm.do");
				}
			
				// 매출관리 페이지로 이동
				function goSalesForm() {
					location.replace("/posbis/salesForm.do");
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
			      
				// 메뉴등록 페이지로 이동
				function goMenuRegForm(business_no) {
					var str = "business_no="+business_no+"&"+$("[name = menuForm]").serialize();
						location.replace( "/posbis/menuRegForm.do?"+str );
				}
			
				// 메인페이지로 이동
				function goMainForm() {
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

		<div style="border: 1px solid; 20 px , margin : 10px; height: 100%; width: 100%;">

			<!---------------- 상단바 ------------------------->
			<div style="float: left; border: 1px solid; 20 px , margin : 10px; height: 15%; width: 100%;">
				<center><h2>상단바</h2></center>
			</div>


			<div style="display: table; border: 1px solid; 20 px , margin : 10px; height: 85%; width: 100%;">
			
				<!------------------ 사이드바 ---------------------->
				<div style="float: left; width: 15%; border: 1px solid; padding: 30px; height: 90%;"><br><br>
					<h3>마이페이지</h3>
					<br> <a onClick="goMyPageForm()">내 정보관리</a><br>
					<br> <a onClick="goMenuForm()">메뉴관리</a><br>
					<br> <a onClick="goSalesForm()">매출관리</a><br>
					<br> <a onClick="goPreChartForm()">프리미엄</a><br>
					<br>
				</div>
				<!------------------ 메인으로 보여줄 div -------------------->
				<div style="float: right; border: 1px solid; 20 px , margin : 10px; width: 80%; height: 100%;">
					<!-------------------- 메뉴관리 form 태그 ---------------------->
					<!-- user_id가 저장되는 입력양식 -->
					<form name="menuForm" method="post" action="/posbis/menuForm.do">
						<div style="width: 800; border: 1px solid;"><br><br>
						<input type="text" name="u_no" value="${param.u_no}" readonly>
							<!-- 메뉴 관리 보기 -->
							<h2>[메뉴관리]</h2>

			             [사업자번호] :
			            <input type = "checkbox" name="chooseAllBusinessNo">모두선택
			            <c:forEach items="${businessNoList}" var="businessNoList">
			              <input type ="checkbox" name="chooseBusinessNo" value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})
			            </c:forEach><br>
			            
			            <!-- 메뉴사용여부 검색 라디오 -->
			            <!-- 명칭은 좀더 고민해보고 수정하기 -->
			            [메뉴사용여부] :
			            	 <input type ="radio" name="menu_using" value="1">ALL
			            	 <input type ="radio" name="menu_using" value="2">Y
			            	 <input type ="radio" name="menu_using" value="3">N
			            	 <br>
         <!-- ================================================================================================================================================ -->

							
							<!-- 키워드 검색 input -->
							[키워드] : <input type="text" name="keyword" class="keyword">
							<input type="button" value="검   색" onClick="goSearch();">&nbsp;
							<input type="button" value="모두검색" onClick="goSearchAll();">&nbsp;

							<!-- 메뉴등록 input -->
							<input type="button" value="메뉴등록" onClick="goMenuRegForm();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div><br>
					<!---------------------------- 메뉴관리 검색 조건 끝 -------------------------------->
		
					<!-- 페이징처리 span 태그 -->
					<div style="border: 1px solid;">&nbsp; <span class="pagingNumber"></span> &nbsp;
						<!-- 총개수 리턴 -->
						[메뉴 총 개수] : ${menuListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
						
						<!-- 선택한 페이지 번호가 저장되는 입력양식-->
						<select name="rowCntPerPage">
							<option value="10">10
							<option value="15">15
							<option value="20">20
							<option value="25">25
							<option value="30">30
						</select> 행보기
					</div>

					<!-- 선택한 페이지 번호 저장되는 입력양식 -->
					<input type="hidden" name="selectPageNo">

					<!------------------------ 메뉴리스트 출력 테이블 ------------------------>
					<table border=1 cellspacing=0 cellpadding=5 width="800" id="menu">
						<tr> 
							<th>번호
							<th>매장이름
							<th>대분류
							<th>중분류
							<th>소분류
							<th>메뉴이름
							<th>메뉴가격
							<th>메뉴원가
							<th>메뉴이익단가
							<th>사용여부
						<!----- List안에서 꺼내서 한행을 var="menu" 담아화면에 보이도록 하기 ----->
						<c:forEach items="${menuList}" var="menu" varStatus="loopTagStatus">
						<tr style="cursor:pointer" onClick="goMenuUpDelForm(${menu.menu_no});">
							<%-- 게시판 목록 중에 각 행을 정순 일련번호 출력--%>
							<td align=center>${menuSearchDTO.selectPageNo*menuSearchDTO.rowCntPerPage-
								 				menuSearchDTO.rowCntPerPage+1+loopTagStatus.index} 
							<!-- 매장명출력 -->
							<td align=center>${menu.business_name}</td>
							<!-- 대분류출력 -->
							<td align=center>${menu.main_category_name}</td>
							<!-- 각 행의 메뉴 중분류 출력  -->
							<td align=center>${menu.mid_category_name}</td>
							<!-- 각 행의 메뉴 소분류 출력  -->
							<td align=center>${menu.sub_category_name}</td>
							<!-- 각 행의 메뉴 이름 출력  -->
							<td align=center>${menu.menu_name}</td>
							<!-- 각 행의 메뉴 가격 출력  -->
							<td align=center>${menu.menu_price}원</td>
							<!-- 각 행의 메뉴 원가 출력  -->
							<td align=center>${menu.menu_cost}원</td>
							<!-- 각 행의 메뉴 이익 단가 출력  -->
							<td align=center>${menu.menu_price-menu.menu_cost}원</td>
							<!-- 각 행의 메뉴 사용여부 출력  -->
							<td align=center>${menu.menu_using}</td>
							
						</c:forEach>
					</table><br>

					<c:if test="${empty menuList}">
						검색 결과가 없습니다.
					</c:if>
					</from>
					   
					   <script>
					   function goMenuUpDelForm(menu_no){
						   var str = "menu_no="+menu_no+"&"+$("[name = menuForm]").serialize();
							location.replace( "/posbis/menuUpDelForm.do?"+str );
					    }
					   </script>
				</div>
			</div>
		</div>
	</body>
</html>