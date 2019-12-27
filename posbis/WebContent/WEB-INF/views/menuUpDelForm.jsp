<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<script src="/posbis/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="/posbis/resources/common.js?a=<%=Math.random()%>" type="text/javascript"></script>



<html>
	<head> 
		<title> 메뉴 수정/삭제 </title>
		<script>
		$(document).ready(function(){
			
	           var main ='<c:out value="${menuDTO.main_category_name}"/>';
	           var mid = '<c:out value="${menuDTO.mid_category_name}"/>';
	           var sub = '<c:out value="${menuDTO.sub_category_name}"/>';
	           var mcn = "";
	           var scn = "";
				if( main != ""){
					mcn = main; 
				}

				if( mid != ""){
					scn = mid;
				}
				
			$.ajax({
	              
	              url : "/posbis/middleProc.do"
	              ,type : "post"
	              ,data : "main_category_name=" + mcn
	              , success : function(menuCategory2) {
	                 for(var i=0; i<menuCategory2.length; i++){
	                    $("[name=mid_category_name]").append('<option value='+menuCategory2[i]+'>'+menuCategory2[i]+'</option>');
	                    inputData("[name=mid_category_name]", "${menuDTO.mid_category_name}");
	                 }
	              } //success
	              , error : function(){
	                  alert("서버 접속 실패");
	              } //error
	              
	           });
				
			$.ajax({
	              
	              url : "/posbis/subProc.do"
	              ,type : "post"
	              ,data : "mid_category_name=" + scn
	              , success : function(menuCategory3) {
	                 for(var i=0; i<menuCategory3.length; i++){
						$("[name=sub_category_name]").append('<option ${scn eq menuCategory3[i] ? 'selected' :''} value='+menuCategory3[i]+'>'+menuCategory3[i]+'</option>');
						inputData("[name=sub_category_name]", "${menuDTO.sub_category_name}");
		                }
	              } //success
	              , error : function(){
	                  alert("서버 접속 실패");
	              } //error
	              
	           }); // $.ajax({
			
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
	                    $("[name=mid_category_name]").append("<option value="+menuCategory2[i]+">"+menuCategory2[i]+"</option>");
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
	     
	         // 메뉴관리 페이지로 이동
	         function goMenuForm(){
	            location.replace( "/posbis/menuForm.do" );
	         }
			// 메뉴판 수정/삭제 유효성 체크 함수 선언
			function checkMenuUpDelForm(upDel){

				// 삭제 버튼 눌렀을 경우
				if(upDel=='del'){
					$("[name=upDel]").val("del");
					if(confirm("정말 삭제 하시겠습니까?")==false) {return;}
					
				}else if(upDel=="up"){
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
				}

				$.ajax({
					//--------------------------
					// 서버 쪽 호출 URL 주소 지정
					//--------------------------
					url : "/posbis/menuUpDelProc.do"
					//--------------------------
					// 전송 방법 설정
					//--------------------------
					, type : "post"
					//--------------------------
					// 서버로 보낼 파라미터명과 파라미터값을 설정
					//--------------------------
					, data : $('[name=menuUpDelForm]').serialize()
					//--------------------------
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
					// 매개변수upDelCnt 에는 입력 행의 개수가 들어온다.
					//--------------------------
					, success : function(upDelCnt){
						if(upDel=="up"){
							if(upDelCnt==1){
							alert("수정성공!");
							location.replace("/posbis/menuForm.do");
							}else{
								alert("서버쪽 DB 연동 실패!");
							}
						}else if(upDel=="del"){
							if(upDelCnt==1){
							alert("삭제 성공!");
							location.replace("/posbis/menuForm.do");
							}else{
								alert("서버쪽 DB 연동 실패!");
							}
						}
					}
					//--------------------------
					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
					//--------------------------
					, error : function(){
						alert("서버와 통신 실패");
					}
				}); //$.ajax({
				
			} //function checkBoardUpDelForm(upDel){

				
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
	
	<body><center><br>
		<form name = "menuUpDelForm" method="post" action="/posbis/menuUpDelProc.do">
		<h2>[메뉴 수정/삭제]</h2><br>
		<!------------------------------------------------------------->
		<table class = "tbcss1" border=1 bordercolor=grary cellspacing=0 cellpadding=5 align=center>
			<tr>
			<th bgcolor="FFEFDC">분류
 				<td><!-- 대분류 -->
				<select name="main_category_name" class="main_category_name">
					<c:forEach items="${menuCategory1}" var="menucate">
						<option value="${menucate.main_category_name}"
						<c:if test="${menuDTO.main_category_name == menucate.main_category_name}">
							selected
						</c:if>
						>${menucate.main_category_name}</option>
					</c:forEach>
				</select>
				<!-- 중분류 -->
				<select name="mid_category_name" class="mid_category_name">
				</select>
				<!-- 소분류 -->
				<select name="sub_category_name" class="sub_category_name">
				</select>
				<!-- 메뉴이름 -->
				<tr>
					<th bgcolor="FFEFDC">메뉴이름
					<td><input type="text" size="10" maxlength="10" name="menu_name" value="${menuDTO.menu_name}">
					
				<!-- 메뉴가격 -->
				<tr>
					<th bgcolor="FFEFDC">메뉴가격
					<td><input type="text" size="40" maxlength="50" name="menu_price" value="${menuDTO.menu_price}">원
					
				<!-- 메뉴원가 -->
				<tr>
					<th bgcolor="FFEFDC">메뉴원가
					<td><input type="text" size="40" maxlength="50" name="menu_cost" value="${menuDTO.menu_cost}">원
		</table><br>
			<!------------------------------------------------------------->
			<table><tr height=4><td></table>
			<input type ="hidden" name="upDel" value="up">
			<input type ="text" name="menu_no" value="${param.menu_no}" readonly>
			<!------------------------------------------------------------->
			<input type="button" value="메뉴수정" onClick="checkMenuUpDelForm('up')">
			<input type="button" value="메뉴미사용" onClick="checkMenuUpDelForm('del')">
			<input type="reset" value="목록보기" onClick="document.menuForm.submit();">
			<!------------------------------------------------------------->
		</form>
		<form name="menuForm" method="post" action="/posbis/menuForm.do" >
			<input type="hidden" name="selectPageNo" value="${param.selectPageNo}" }>
		      <input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}" }>
		      <input type="hidden" name="keyword" value="${param.keyword}" }>
		</form>
	</body>

</html>