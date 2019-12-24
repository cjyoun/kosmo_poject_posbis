<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  <!--page language="java" 생략 가능 -->
<%-- <%@ page import="java.util.*" %> --%>
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp" %>

<html>
   <head>
       <title> new document </title>
      <meta charset="utf-8">
      <script>         
		$(document).ready(function(){

		    $('#sales').hide();
		    $('.pagingDiv').hide();
		    
			//첫째 tr태그 내부의 th 태그를 클릭하면 발생할 일을 설정
			$("#sales thead:eq(0) tr:eq(0) th").click(function(){
				//클릭한 th 태그를 관리하는 JQuery 객체 메위주를 얻어 변수에 저장
				var thisThObj= $(this);		//this는 클릭한 th 태그

				//오름차순 내림차순 여부를 저장할 변수 선언
				var ascDesc = "";

				//클릭한 th 형제의 th 태그 안의 문자열에 ▲,▼ 제거
				thisThObj.siblings().each(function(){
					//i번째 th 태그 안의 문자열을 얻자
					var txt = $(this).text();		//this는 클릭한 th 태그의 형제 th 태그
					//앞뒤 공백을 제거하기
					txt = $.trim(txt);
					//▲제거하기
					txt = txt.replace("▲","");
					//▼제거하기
					txt = txt.replace("▼","");
					//i번째 th 태그 안에 ▲,▼ 제거한 문자열을 넣기
					$(this).text(txt);
				});
				//클릭한 th 안의 문자열 뒤에 ▲ 또는 ▼ 붙이기

				//클릭한 th 안의 문자열을 얻어 변수 txt 저장
				var txt = thisThObj.text();
				//txt 변수 안의 문자열에 ▲이 있으면 ▼로 바꾸고 ascDesc 변수에 "desc" 저장하기
				if(txt.indexOf("▲")>=0){
					txt=txt.replace("▲","▼");
					ascDesc="desc"
				}
				//txt 변수 안의 문자열에 ▼이 있으면 ▲로 바꾸고 ascDesc 변수에 "asc" 저장하기
				else if(txt.indexOf("▼")>=0){
					txt=txt.replace("▼","▲");
					ascDesc="asc"
				}
				//txt 변수 안의 문자열에 ▼도 없고 ▲도 없을 경우
				//▲를 넣어주고 ascDesc 변수에 "asc" 저장하기
				else{
					txt=txt + "▲";
					ascDesc="asc"
				}

				//txt 안의 데이터를 클릭한 th 안의 문자열로 갱신
				thisThObj.text(txt);

				//Array 객체에 정렬 대상이 되는 모든 tr을 관리하는 JQuery 객체들을 생성해서 저장
				//원하는 정렬 기준으로 JQuery 객체의 위치를 바꾼다.

				//정렬 대상이 되는 모든 tr 태그를 관리하는 JQuery 객체 여러 개를 생성해 Array 객체에 저장
				var allTrObj=$('#sales tbody:eq(0)').children();

				//각각의 tr을 관리하는 JQuery 객체들을 생성하여 Array 객체에 저장
				var trObjs = [];
				allTrObj.each(function(){
					trObjs.push($(this));	//this는 each가 잡은 tr을 의미
				});

				//클릭한 th 태그의 인덱스번호 저장
				var thIndex=thisThObj.index();

				//반복문을 사용하여 클릭한 th 열과 동일한 열의 데이터를 오름 또는 내림 정렬에 맞추어
				//Array 객체에 저장된 tr 태그 관리 JQuery 객체를 재배치
				for(var j=0; j<trObjs.length-1; j++){
					for(var k=j+1; k<trObjs.length; k++){
						//j번째 JQuery 객체의 관리 tr의 x번째 열의 문자 얻고 소문자로 바꾸기
						var td1Text = trObjs[j].children('td').eq(thIndex).text();
						td1Text = ($.trim(td1Text)).toLowerCase();

						if(thIndex==2){td1Text= parseInt(td1Text,10);}

						//k번째 JQuery 객체의 관리 tr의 x번째 열의 문자 얻고 소문자로 바꾸기
						var td2Text =  trObjs[k].children('td').eq(thIndex).text();
						td2Text = ($.trim(td2Text)).toLowerCase();
						
						//만약 내림차순 의도가 있고 [j번째 x번째 열의 문자]<[k번째 x번째 열의 문자] 면
						//j번째 JQuery 객체와 k번째 JQuery 객체의 위치 바꾸기
						if(thIndex==2){td2Text = parseInt(td2Text,10);}
						if(ascDesc=="desc" && td1Text<td2Text){
							var tmp = trObjs[j];
							trObjs[j] = trObjs[k];
							trObjs[k] = tmp;
						}		
						
						//만약 오름차순 의도가 있고 [j번째 x번째 열의 문자]>[k번째 x번째 열의 문자] 면
						//j번째 JQuery 객체와 k번째 JQuery 객체의 위치 바꾸기
						if(thIndex==2){td2Text = parseInt(td2Text,10);}
						else if(ascDesc=="asc" && td1Text>td2Text){
							var tmp = trObjs[j];
							trObjs[j] = trObjs[k];
							trObjs[k] = tmp;
						}
					}
				}
				//기존 tr 태그를 지우기
				$('#sales tbody:eq(0)').empty();
				//Array 객체에 저장된 JQuery 객체가 관리하는 tr 태그를 삽입하기
				for(var j=0; j<trObjs.length; j++){
					$('#sales tbody:eq(0)').append(trObjs[j]);
				}
			});


			//$('[name=user_id]').val("master7");
			
			//name="rowCntPerPage"에 change 이벤트가 발생하면 실행할 코드 설정하기
			$('[name=rowCntPerPage]').change(function(){
				goSearch();
			});
			//페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기
			$(".pagingNumber").html(
				getPagingNumber(
					"${salesListAllCnt}"				//검색 결과 총 행 개수
					,"${salesSearchDTO.selectPageNo}"	//선택된 현재 페이지번호
					,"${salesSearchDTO.rowCntPerPage}"	//페이지 당 출력행의 개수
					,"15"								//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지번호 클릭 후 실행할 자스코드
				)
			);
			
			//클라이언트가 보낸 검색 조건을 입력 양식에 넣어주기
			
			//inputData("[name=user_id]","${salesSearchDTO.user_id}");
			inputData("[name=selectPageNo]","${salesSearchDTO.selectPageNo}");
			inputData("[name=rowCntPerPage]","${salesSearchDTO.rowCntPerPage}");
			inputData("[name=keyword]","${salesSearchDTO.keyword}");
			inputData("[name=sales_date]","${salesSearchDTO.sales_date}");
			inputData("[name=sales_date_t1]","${salesSearchDTO.sales_date_t1}");
			inputData("[name=sales_date_t2]","${salesSearchDTO.sales_date_t2}");
			inputData("[name=changeBusinessNo]","${salesSearchDTO.changeBusinessNo}");

			var cnt = $("[name=changeBusinessNo] option:selected").val();
			if(cnt==undefined){
				$("[name=changeBusinessNo] option:eq(0)").attr("selected","selected");
	 			document.salesForm.submit();
				SalesSearchDTO.setChangeBusinessNo($("[name=salesForm] [name=changeBusinessNo]").val());
			} 

		   $('#sales').show();
		    $('.pagingDiv').show();

	       $('[name=changeBusinessNo]').change(function(){
	 			//name=salesForm을 가진 form 태그의 action 값의 URL로 웹서버에 접속하기
	 			document.salesForm.submit();
				SalesSearchDTO.setChangeBusinessNo($("[name=salesForm] [name=changeBusinessNo]").val());
	        });  

/* 	       $table2=jQuery('#sales');
	       $table2.find('tbody').append('<tr><td>Total:</td></tr>');
	       var length=$table2.find('thead tr th').length;
	       for(var i=1;i<length;i++){
	         var sum=0;
	         $table2.find('tbody tr').each(function(){

	           if(!isNaN(Number(jQuery(this).find('td').eq(i).text()))){
	             sum=sum+Number(jQuery(this).find('td').eq(i).text());
	           }
	         });
	         $table2.find('tbody tr:last-child').append('<td>'+sum+'</td>');
	       } */

	       var sumC = 0;
	       $('tr').find('.sales_count').each(function () {
	           var sales_count = $(this).text();
	           if (!isNaN(sales_count) && sales_count.length !== 0) {
	        	   sumC += parseFloat(sales_count);
	           }
	       });
	       $('.total-sales_count').html(sumC);

	       var sumA = 0;
	       $('tr').find('.sales_amount').each(function () {
	           var sales_amount = $(this).text();
	           if (!isNaN(sales_amount) && sales_amount.length !== 0) {
	        	   sumA += parseFloat(sales_amount);
	           }
	       });
	       $('.total-sales_amount').html(sumA);
	       

		});
         // 검색 함수
         function goSearch(){
 			//만약 키워드가 공백 또는 길이가 없다면 길이없는 데이터로 세팅하기
 			//공백 상태에서 서버로 전송되면 공백을 가지고 DB를 검색한다.
 			//이 현상을 막기 위해 공백 또는 길이가 없다면 길이없는 데이터로 통일해서 세팅한다.
 			if(is_empty("[name=salesForm] [name=keyword]")){
 				$("[name=salesForm] [name=keyword]").val("");
 			}
 			//키워드 앞뒤에 공백이 있으면 제거하고 다시 넣어주기
 			var keyword = $("[name=salesForm] [name=keyword]").val();
 			keyword = $.trim(keyword);
 			$("[name=salesForm] [name=keyword]").val(keyword);

 			if(!is_empty("[name=salesForm] [name=sales_date_t1]")){
 				$("[name=salesForm] [name=sales_date]").val("");
 			}
  			if(!is_empty("[name=salesForm] [name=sales_date_t2]")){
 				$("[name=salesForm] [name=sales_date]").val("");
 			} 

 			//name=salesForm을 가진 form 태그의 action 값의 URL로 웹서버에 접속하기
 			document.salesForm.submit();

         }

		//메뉴별 검색 함수
         function goSearchMenu(){
			alert("메뉴별 검색 실행");
         }


		function goSearchAll(){

		inputData("[name=selectPageNo]","1");
		inputData("[name=rowCntPerPage]","${salesSearchDTO.rowCntPerPage}");
		inputData("[name=keyword]","");
		$('[name=sales_date]').prop("checked",false);
		inputData("[name=sales_date_t1]","");
		inputData("[name=sales_date_t2]","");
		inputData("[name=changeBusinessNo]","${salesSearchDTO.changeBusinessNo}");
		goSearch();
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
       <br>

    <form name = "salesForm" method="post" action="/posbis/salesForm.do">
	<div style="width:800">
		<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
		<input type="hidden" name="selectPageNo"> 
		사업자번호:
		<select name="changeBusinessNo">   <!-- 중요! -->
             
            <c:forEach items="${businessNoList}" var="businessNoList">
              
                 <option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
                 </option>
           </c:forEach>
                
       </select> 

               <h2>[매출관리]</h2>

               [키워드] : <input type = "text" name="keyword" class="keyword">&nbsp;

               [기간선택]
               <input type = "radio" name="sales_date" class="sales_date" value="1" >금일매출&nbsp;
               <input type = "radio" name="sales_date" class="sales_date" value="2" >최근 일주일매출&nbsp;
               <input type = "radio" name="sales_date" class="sales_date" value="3" >이번달매출<br>
        <!--   [기간직접입력] :
               <input type = "text" name="sales_date_t1" class="sales_date_t1">&nbsp;~&nbsp;
               <input type = "text" name="sales_date_t2" class="sales_date_t2">&nbsp;&nbsp;   -->
      <br>
 				[기간설정]: <input type="date" name="sales_date_t1" class="sales_date_t1"> ~ <input type="date" name="sales_date_t2" class="sales_date_t2">
               
               <input type="button" value="검   색" onClick="goSearch();">&nbsp;
               <input type="button" value="모두 검색" onClick="goSearchAll();">&nbsp;&nbsp;
              <!--  <input type="button" value="메뉴별 매출" onClick="goSearchMenu();">&nbsp;&nbsp;&nbsp; -->
		
		<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
		<!-- 선택한 페이지번호는 DB 연동시 아주 중요한 역할을 한다 -->
		<!-- 개발중에는 테스트를 위해 type을 text로 바꿔놓으면 눈에 보여서 편하다 -->
		<input type="hidden" name="selectPageNo"> 
		<input type="hidden" name="user_id" value="user7">  
		
	</div>	
	<table border=0 width=700>
		<tr>
			<td align=right>
				<!-- EL 문법으로 게시판 검색 총 개수 출력하기 -->
				<!-- 달러{salesAllCnt} 은  컨트롤러 클래스 내부에 --> 		<!-- EL문법은 주석문 안에 들어가더라도 소스보기 했을 때 실행결과가 삽입된다. 문법에 맞지 않는 내용을 삽입할 시에는 에러발생 -->
				<!-- ModelAndView 객체에 salesAllCnt 라는 키값으로 저장된 -->
				<!-- 데이터를 EL로 표현하여 삽입하라는 뜻이다. -->
				[총 개수]: ${salesListAllCnt}&nbsp;&nbsp;
				<!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력양식 표현하기 -->
				<!-- 행의 개수는 DB 연동시 아주 중요한 역할을 한다. -->
				<select name="rowCntPerPage">
					<option value="10">10
					<option value="15">15
					<option value="20">20
					<option value="25">25
					<option value="30">30
				</select> 행보기
	</table>
   </form>
   
        <!-- 페이징 번호를 삽입할 span 태그 선언하기  -->
		<div class="pagingDiv">&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
		
            <table border=1 cellspacing=0 cellpadding=5 align=center width="800" id="sales">
                     
             <thead>
                <tr>
                  <th style="cursor:pointer">no
                  <th style="cursor:pointer">카테고리
                  <th style="cursor:pointer">메뉴
                  <th style="cursor:pointer">가격
                  <th style="cursor:pointer">수량
                  <th style="cursor:pointer">매출
                  <th style="cursor:pointer">판매일
                </tr>
             </thead>
             <tbody>
               <c:forEach items="${salesList}" var="sales" varStatus="loopTagStatus">  <!-- requestScope.은 생략 가능 -->
			<!-- <tbody> -->
				<tr>
					<td align=center>
					<%-- 게시판 목록 중에 각 행의 정순 일련번호 출력--%>
					${salesSearchDTO.selectPageNo*salesSearchDTO.rowCntPerPage-salesSearchDTO.rowCntPerPage+1
																					+loopTagStatus.index} 
					<!-- 각 행의 메뉴카테고리 출력 -->
					<td align=center>${sales.menu_category_code}
					<!-- 각 행의 메뉴 이름 출력 -->
					<td align=center>${sales.menu_name}
					<!-- 각 행의 메뉴 가격 출력 -->
					<td align=center>${sales.menu_price}
					<!-- 각 행의 판매 수량 출력 -->
					<td align=center class="sales_count">${sales.sales_count}
					<!-- 각 행의 총매출 출력 -->
					<td align=center class="sales_amount">${sales.sales_amount}
					<!-- 각 행의 판매 날짜 출력 -->
					<td align=center>${sales.sales_date}
			</c:forEach>
			</tbody>
			<tfoot>
			<tr>
				<td align=center>total
				<td align=center>
				<td align=center>
				<td align=center>
				<td align=center class="total-sales_count">
				<td align=center class="total-sales_amount">
				<td>
			</tfoot>
            </table><br>

	<c:if test="${empty salesList}">
		검색결과 없음
	</c:if> 
</center>


	</div>
</div>
    
   </body>

</html>