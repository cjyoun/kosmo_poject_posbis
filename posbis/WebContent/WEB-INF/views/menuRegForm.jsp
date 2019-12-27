<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp" %>


<html>
	<head>
	<title> 메뉴 등록 </title>
	<meta charset="utf-8">
	<script>
	$(document).ready(function(){
        
        $("[name=main_category_name]").change(function(){
           alert($(this).val());
           $("[name=mid_category_name]").empty();
           
           $.ajax({
              
              url : "/posbis/middleProc.do"
              ,type : "post"
              ,data : "main_category_name=" + $(this).val()
              , success : function(menuCategory2) {
                 var str="--중분류--";
                 for(var i=0; i<menuCategory2.length; i++){
                    $("[name=mid_category_name]").append('<option value='+menuCategory2[i]+'>'+menuCategory2[i]+'</option>');
                 }
                 if(menuCategory2[0]!=str){
                    $("[name=mid_category_name]").prepend("<option value='' selected>"+str+"</option>");
                 }
              } //success
              , error : function(){
                  alert("서버 접속 실패");
              } //error
              
           }); // $.ajax({
           
        }); //$("[name=main_category_name]").change(function(){

           
        $("[name=mid_category_name]").change(function(){
           alert($(this).val());
           $("[name=sub_category_name]").empty();
           
           $.ajax({
              
              url : "/posbis/subProc.do"
              ,type : "post"
              ,data : "mid_category_name=" + $(this).val()
              , success : function(menuCategory3) {
                 var str="--소분류--";
                 for(var i=0; i<menuCategory3.length; i++){
                    $("[name=sub_category_name]").append('<option value='+menuCategory3[i]+'>'+menuCategory3[i]+'</option>');
                 }
                 if(menuCategory3[0]!=str){
                    $("[name=sub_category_name]").prepend("<option value='' selected>"+str+"</option>");
                 }
              } //success
              , error : function(){
                  alert("서버 접속 실패");
              } //error
              
           }); // $.ajax({
           
        }); //$("[name=main_category_name]").change(function(){
        
     }); //$(document).ready(function(){

    	 
		// [메뉴 등록 화면]에 입력된 데이터의 유효성 체크 함수 선언
		function checkMenuRegForm(){
			if(is_empty("[name=main_category_name]")){
				alert("대분류를 선택해주세요");
				$("[name=middle_category]").focus();
				return;
			}
			
			if(is_empty("[name=mid_category_name]")){
				alert("중분류를 선택해주세요");
				$("[name=sub_category]").focus();
				return;
			}
			
			if(is_empty("[name=sub_category_name]")){
				alert("소분류를 선택해주세요.");
				$("[name=menu_name]").focus();
				return;
			}
			if(is_empty("[name=menu_name]")){
				alert("메뉴이름을 입력해주세요.");
				$("[name=menu_price]").focus();
				return;
			}
			
			if(is_empty("[name=menu_price]")){
				alert("메뉴가격을 입력해주세요.");
				$("[name=menu_cost]").focus();
				return;
			}
			
			if(is_empty("[name=menu_cost]")){
				alert("메뉴원가를 입력해주세요.");
				return;
			}

			//alert($('[name=menuRegForm]').serialize());
			// 메뉴 등록 후 메뉴 입력 행 개수를 받기
			$.ajax({
				// 서버 쪽 호출 URL 주소 지정
				url : "/posbis/menuRegProc.do"
					
				// 전송 방법 설정
				, type : "post"
					
				// 서버로 보낼 파라미터명과 파라미터값을 설정
				
				, data : $('[name=menuRegForm]').serialize()
				
				// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
				// 매개변수 menuRegCnt 에는 입력 행의 개수가 들어온다.
				, success : function(menuRegCnt){
					alert("메뉴 등록하시겠습니까?"+menuRegCnt);
				// [메뉴 등록 적용 개수]가 1개면(=insert 라 한 번 성공했따는 뜻)
					if(menuRegCnt==1){
						alert("메뉴 등록 성공!");
						location.replace("/posbis/menuForm.do");
					}
				// [메뉴 등록 행 적용 개수]가 1개가 아니면 경고하기
					else{
						alert("메뉴 등록 실패! 관리자에게 문의 바랍니다.");
					}
				}
				// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				, error : function(){
					alert("서버 접속에 실패하였습니다.");
				}
			});
			
		} //function checkMenuRegForm(){


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

		
	</script>
	</head>
		<body><center>
			<form name = "menuRegForm" method="post" action="/posbis/menuRegForm.do">
			<input type="text" name="u_no" value="7" readonly >
			
			<select name="business_no">
				<!-- 중요! -->
				<option value="" selected>사업자번호를 선택해주세요
				<c:forEach items="${businessNoList}" var="businessNoList">
					<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})
					</option>
				</c:forEach>
			</select>

			<!------------------------------------------------------------->
			<table class = "tbcss1" border=1 bordercolor=grary cellspacing=0 cellpadding=5 align=center>
				<tr>
				<th bgcolor="FFEFDC">분류
					<td><!-- 대분류 -->
					<select name="main_category_name" class="main_category_name">
						<option value="" selected>---대분류---</option>
						<c:forEach items="${menuCategory1}" var="menucate">
							<option value="${menucate.main_category_name}">${menucate.main_category_name}</option>
						</c:forEach>
					</select>
					
					<!-- 중분류 -->
					<select name="mid_category_name" class="mid_category_name">
						<option value="" selected>---중분류---</option>
					</select>
					
					<!-- 소분류 -->
					<select name="sub_category_name" class="sub_category_name">
						<option value="" selected>---소분류---</option>
					</select>
					
					<!-- 메뉴이름 -->
					<tr>
						<th bgcolor="FFEFDC">메뉴이름
						<td><input type="text" size="10" maxlength="10" name="menu_name">
						
					<!-- 메뉴가격 -->
					<tr>
						<th bgcolor="FFEFDC">메뉴가격
						<td><input type="text" size="40" maxlength="50" name="menu_price">
						
					<!-- 메뉴원가 -->
					<tr>
						<th bgcolor="FFEFDC">메뉴원가
						<td><input type="text" size="40" maxlength="50" name="menu_cost">
			</table><br>
					<input type="button" value="등록" onClick="checkMenuRegForm();">
					<input type="reset" value="다시작성">
					<input type="button" value="취소" onClick="location.replace('/posbis/menuForm.do')">
			<!----------------------------------------------------------------------------------------->
</form>
		
		
		
		</center></body>
</html>