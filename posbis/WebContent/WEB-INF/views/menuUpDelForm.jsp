<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<script src="/posbis/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="/posbis/resources/common.js?a=<%=Math.random()%>" type="text/javascript"></script>



<html>
   <head>
       <title> 메뉴 수정/삭제 </title>
      <meta charset="utf-8">
      <script>
      function checkMenuUpDelForm(upDel){
			//----------------------------------------------------
			// 매개변수로 들어온 upDel 에 "del" 이 저장되었으면
			//----------------------------------------------------
			if(upDel=='del'){
				$("[name=upDel]").val("del");
				if(confirm("정말 삭제 하시겠습니까?")==false) {return;}
			}
			//----------------------------------------------------
			// 매개변수로 들어온 upDel 에 "up" 이 저장되었으면
			// 즉, 삭제 버튼을 눌렀으면 각 입력양식의 유효성 체크하고 수정 여부 물어보기
			//----------------------------------------------------
			else if(upDel=="up"){

				//name=upDel 을 가진 양식에 "up" 저장하기
				$("[name=upDel]").val("up");
					
				if(confirm("정말 수정하시겠습니까?")==false){return;}
				
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
				, data : $('[name=menuUpDelFrom]').serialize()
				//--------------------------
				// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
				// 매개변수upDelCnt 에는 입력 행의 개수가 들어온다.
				//--------------------------
				, success : function(upDelCnt){

					if(upDel=="up"){
						if(upDelCnt==1){
						alert("수정성공!");
						location.replace("/posbis/menuListForm.do");
						}else{
							alert("서버쪽 DB 연동 실패!");
						}
					}else if(upDel=="del"){
						if(upDelCnt==1){
						alert("삭제 성공!");
						location.replace("/posbis/menuListForm.do");
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
			});
		}
			
      </script>

   </head>

   <body><center><br>
   		<c:if test="${!empty boardDTO}">
		<form name = "menuUpDelForm" method="post" action="/posbis/menuUpDelProc.do">
			<b>[메뉴 수정/삭제]</b><br>
		<!------------------------------------------------------------->
		<table class = "tbcss1" border=1 bordercolor=grary cellspacing=0 cellpadding=5 align=center>
		 <tr>
               <th bgcolor="FFEFDC">분류
               <td>
               <select name="main_category" class="main_category" value="${boardDTO.writer}">
                  <option value="">---대분류---
               </select>

               <select name="middle_category" class="middle_category" value="${boardDTO.subject}">
                  <option value="">---중분류---
               </select>

            <select name="sub_ategory" class="sub_ategory" value="${boardDTO.email}">
                  <option value="">---소분류---
               </select>

            <tr>
               <th bgcolor="FFEFDC">메뉴이름
               <td><input type="text" size="10" maxlength="10" name="menu_name">
            <tr>
               <th bgcolor="FFEFDC">메뉴가격
               <td><input type="text" size="40" maxlength="50" name="menu_price">
            <tr>
               <th bgcolor="FFEFDC">메뉴원가
               <td><input type="text" size="40" maxlength="50" name="menu_cost">
		
		</table>
		</c:if>
		<!------------------------------------------------------------->
		<table><tr height=4><td></table>
		<input type ="hidden" name="upDel" value="up">
		<input type ="hidden" name="b_no" value="${boardDTO.b_no}">
		<!------------------------------------------------------------->
		<input type="button" value="수정" onClick="checkBoardUpDelForm('up')">
		<input type="button" value="삭제" onClick="checkBoardUpDelForm('del')">
		<input type="reset" value="목록보기" onClick="document.boardListForm.submit;">
		
   </body>

</html>