<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   <!--page language="java" 생략 가능 -->
<%@ page import="java.util.*" %>
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp" %>

<html>
   <head>
       <title> new document </title>
      <meta charset="utf-8">
      <script>         
      
		$(document).ready(function(){
			
		    $('#menuSales').hide();
		    $('.pagingDiv2').hide();
		    $('#select').hide();
			
			$('[name=menuRowCntPerPage]').change(function(){
				document.menuSalesForm.submit();
			});
			
			//==============================================================================================
			
			//페이징 처리 관련 HTML 소스를 class=pagingNumber2 가진 태그 안에 삽입하기			
			$(".pagingNumber2").html(
				getPagingNumber(
					"${menuSalesListAllCnt}"			//검색 결과 총 행 개수
					,"${menuSalesSearchDTO.selectPageNo}"	//선택된 현재 페이지번호
					,"${menuSalesSearchDTO.menuRowCntPerPage}"	//페이지 당 출력행의 개수
					,"15"								//페이지 당 보여줄 페이지번호 개수
					,"showMenuSales();"					//페이지번호 클릭 후 실행할 자스코드
				)
			);

//=====================================================================================================
			//클라이언트가 보낸 검색 조건을 입력 양식에 넣어주기

			inputData("[name=selectPageNo]","${menuSalesSearchDTO.selectPageNo}");
			inputData("[name=menuRowCntPerPage]","${menuSalesSearchDTO.menuRowCntPerPage}");
			inputData("[name=keyword]","${menuSalesSearchDTO.keyword}");
			inputData("[name=sales_date]","${menuSalesSearchDTO.sales_date}");
			inputData("[name=sales_date_t1]","${menuSalesSearchDTO.sales_date_t1}");
			inputData("[name=sales_date_t2]","${menuSalesSearchDTO.sales_date_t2}");
			inputData("[name=chooseAllBusinessNo]","${menuSalesSearchDTO.chooseAllBusinessNo}");

			<c:forEach items="${menuSalesSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
				inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
			</c:forEach> 

			//==============================================================================================
			if($("[name=chooseBusinessNo]:checked").length==0){
				$("[name=chooseBusinessNo]").prop("checked",true);
				$("[name=chooseAllBusinessNo]").prop("checked",true);
				
		 		document.menuSalesForm.submit();
				MenuSalesSearchDTO.setChooseBusinessNo($("[name=menuSalesForm] [name=chooseBusinessNo]").val());
			} 

			var allbusi = $("[name=chooseAllBusinessNo]");
            allbusi.change(function() {
                $("[name=chooseBusinessNo]").prop( "checked", allbusi.is(":checked") );
             });
			
			if($("[name=chooseBusinessNo]:not(:checked)").length==0){
				$("[name=chooseAllBusinessNo]").prop("checked",true);
			} 
			
             $("[name=chooseBusinessNo]").change(function(){
                if( $("[name=chooseBusinessNo]:not(:checked)").length>0){
                   allbusi.prop("checked",false);
                }
                else{
                   allbusi.prop("checked",true);
                }
             });
		    $('#menuSales').show();
		    $('.pagingDiv2').show();
		    $('#select').show();
             
//=====================================================================================================
	       var sumMC = 0;
	       $('tr').find('.menu_sales_count').each(function () {
	           var menu_sales_count = $(this).text();
	           if (!isNaN(menu_sales_count) && menu_sales_count.length !== 0) {
	        	   sumMC += parseFloat(menu_sales_count);
	           }
	       });
	       $('.total-menu_sales_count').html(sumMC);

	       var sumMA = 0;
	       $('tr').find('.menu_sales_amount').each(function () {
	           var menu_sales_amount = $(this).text();
	           if (!isNaN(menu_sales_amount) && menu_sales_amount.length !== 0) {
	        	   sumMA += parseFloat(menu_sales_amount);
	           }
	       });
	       $('.total-menu_sales_amount').html(sumMA);

	       var sumMI = 0;
	       $('tr').find('.menu_sales_income').each(function () {
	           var menu_sales_income = $(this).text();
	           if (!isNaN(menu_sales_income) && menu_sales_income.length !== 0) {
	        	   sumMI += parseFloat(menu_sales_income);
	           }
	       });
	       $('.total-menu_sales_income').html(sumMI);
	       
//=====================================================================================================

    	  $(".menu_price").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });

		  $(".menu_sales_amount").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum + "원");
	      });
  	  	  $(".total-menu_sales_amount").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });
	  	  $(".menu_sales_count").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum);
	      });
	  	  $(".total-menu_sales_count").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum);
	      });
	  	  $(".menu_sales_income").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });
	  	  $(".total-menu_sales_income").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });
//=====================================================================================================

	});

      	function numberWithCommas(number) {
    	    var parts = number.toString().split(".");
    	    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	    return parts.join(".");
    	}
    	
//=====================================================================================================
    	
         // 검색 함수
         function goSearch(){
 			//만약 키워드가 공백 또는 길이가 없다면 길이없는 데이터로 세팅하기
 			//공백 상태에서 서버로 전송되면 공백을 가지고 DB를 검색한다.
 			//이 현상을 막기 위해 공백 또는 길이가 없다면 길이없는 데이터로 통일해서 세팅한다.
 			if(is_empty("[name=menuSalesForm] [name=keyword]")){
 				$("[name=menuSalesForm] [name=keyword]").val("");
 			}
 			//키워드 앞뒤에 공백이 있으면 제거하고 다시 넣어주기
 			var keyword = $("[name=menuSalesForm] [name=keyword]").val();
 			keyword = $.trim(keyword);
 			$("[name=menuSalesForm] [name=keyword]").val(keyword);

 			if(!is_empty("[name=menuSalesForm] [name=sales_date_t1]")){
 				$("[name=menuSalesForm] [name=sales_date]").val("");
 			}
  			if(!is_empty("[name=menuSalesForm] [name=sales_date_t2]")){
 				$("[name=menuSalesForm] [name=sales_date]").val("");
 			} 
 			//name=salesForm을 가진 form 태그의 action 값의 URL로 웹서버에 접속하기
 			document.menuSalesForm.submit();
         }

//=====================================================================================================
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
//=====================================================================================================

		function goSearchAll(){
			inputData("[name=selectPageNo]","1");
			inputData("[name=menuRowCntPerPage]","${menuSalesSearchDTO.menuRowCntPerPage}");
			inputData("[name=keyword]","");
			$('[name=sales_date]').prop("checked",false);
			inputData("[name=sales_date_t1]","");
			inputData("[name=sales_date_t2]","");
			<c:forEach items="${menuSalesSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
				inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
			</c:forEach>
			goSearch();
		}

		function showMenuSales(){
			
			document.menuSalesForm.submit();
		}
		
		function goSalesForm(){
			document.salesForm.submit();
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
       <br>

				   	<form name="salesForm" method="post" action="/posbis/salesForm.do">
					</form>

    <form name = "menuSalesForm" method="post" action="/posbis/menuSalesForm.do">
	<div style="width:800">
	
		       <!-- ================================================================================================================================================ -->
		       사업자번호:
		       	<input type = "checkbox" name="chooseAllBusinessNo"> 모두선택
		      <c:forEach items="${businessNoList}" var="businessNoList">
		        <input type ="checkbox" name="chooseBusinessNo" value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})
		      </c:forEach>
		       <!-- ================================================================================================================================================ -->
			
     
               <h2>[메뉴별 매출관리]</h2>

               [키워드] : <input type = "text" name="keyword" class="keyword">&nbsp;

               [기간선택]
               <input type = "radio" name="sales_date" class="sales_date" value="1" >금일매출&nbsp;
               <input type = "radio" name="sales_date" class="sales_date" value="2" >최근 일주일매출&nbsp;
               <input type = "radio" name="sales_date" class="sales_date" value="3" >이번달매출<br><br>
               
				[기간설정]: <input type="date" name="sales_date_t1" class="sales_date_t1"> ~ <input type="date" name="sales_date_t2" class="sales_date_t2">
               
               <input type="button" value="검   색" onClick="goSearch();">&nbsp;
               <input type="button" value="모두 검색" onClick="goSearchAll();">&nbsp;
               
               <a href="javascript:;" onclick="goSalesForm();" >[매출관리]로 이동</a>&nbsp;&nbsp;
		
		<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
		<!-- 선택한 페이지번호는 DB 연동시 아주 중요한 역할을 한다 -->
		<!-- 개발중에는 테스트를 위해 type을 text로 바꿔놓으면 눈에 보여서 편하다 -->
		<input type="hidden" name="selectPageNo"> 
		<input type="hidden" name="user_id" value="${user_id}">  
				
	</div>	
	<table border=0 width=700 id="select">
		<tr>
			<td align=right>
				
				[메뉴 수]: ${menuSalesListAllCnt}&nbsp;&nbsp;
				<!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력양식 표현하기 -->
				<!-- 행의 개수는 DB 연동시 아주 중요한 역할을 한다. -->

				<select name="menuRowCntPerPage">
					<option value="10">10
					<option value="15">15
					<option value="20">20
					<option value="25">25
					<option value="30">30
				</select> 행보기

	</table>
   </form>
   
       <!-- ==================================================================================== -->         
            
        <!-- 페이징 번호를 삽입할 span 태그 선언하기  -->
		<div class="pagingDiv2">&nbsp;<span class="pagingNumber2"></span>&nbsp;</div>
						           
            <table border=1 cellspacing=0 cellpadding=5 align=center width="800" id="menuSales">
                     
             <thead>
                <tr>
                  <th>no
                  <th>상호명
                  <th>카테고리
                  <th>메뉴
                  <th>가격
                  <th>수량
                  <th>총매출
                  <th>순매출
                </tr>
             </thead>
             <tbody>
             <c:forEach items="${menuSalesList}" var="menuSales" varStatus="loopTagStatus">  <!-- requestScope.은 생략 가능 -->
				<tr>
					<td align=center>
					<%-- 게시판 목록 중에 각 행의 정순 일련번호 출력--%>
					${menuSalesSearchDTO.selectPageNo*menuSalesSearchDTO.menuRowCntPerPage-menuSalesSearchDTO.menuRowCntPerPage+1
																					+loopTagStatus.index} 
					<!-- 각 행의 상호명 출력 -->
					<td align=center>${menuSales.business_name2}
					<!-- 각 행의 메뉴카테고리 출력 -->
					<td align=center>${menuSales.menu_category_code2}
					<!-- 각 행의 메뉴 이름 출력 -->
					<td align=center>${menuSales.menu_name2}
					<!-- 각 행의 메뉴 가격 출력 -->
					<td align=center class="menu_price">${menuSales.menu_price2}
					<!-- 각 행의 판매 수량 출력 -->
					<td align=center class="menu_sales_count">${menuSales.sales_count2}
					<!-- 각 행의 총매출 출력 -->
					<td align=center class="menu_sales_amount">${menuSales.sales_amount2}
					<!-- 각 행의 순매출 출력 -->
					<td align=center class="menu_sales_income">${menuSales.sales_income2}
			</c:forEach>
			</tbody>
			<tfoot>
			<tr>
				<td align=center>total
				<td align=center>
				<td align=center>
				<td align=center>
				<td align=center>
				<td align=center class="total-menu_sales_count">
				<td align=center class="total-menu_sales_amount">
				<td align=center class="total-menu_sales_income">
			</tfoot>
            </table>

       <!-- ==================================================================================== -->     
	<c:if test="${empty menuSalesList}">
		검색결과 없음
	</c:if> 
</center>


	</div>
</div>
    
   </body>

</html>