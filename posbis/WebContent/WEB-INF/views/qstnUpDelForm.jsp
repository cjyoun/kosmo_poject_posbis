
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>


<!-- ------------------------------------------------------------------ -->
<!-- 만약에 상세보기할 게시판 글이 없으면 경고 후 이전 화면으로 이동하기-->
<!-- ------------------------------------------------------------------ -->
<c:if test="${empty qstnDTO}">
	<script>
		alert("게시판 글이 삭제되었습니다.");
		location.replace("/posbis/qstnForm.do")
	</script>
</c:if>


<html>
<head>
   <title> 게시판 수정/삭제 </title>
   <script>
   		//NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
   		// [게시판 수정/삭제 화면]에 입력된 데이터의 유효성 체크 함수 선언
   		//NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
   		function checkQstnUpDelForm(upDel){
        	//----------------------------------------------------------------------------
        	// 매개변수로 들어온 upDel 에 "del"이 저장되었으면
        	// 즉, 삭제 버튼을 눌렀으면 암호 확인하고 삭제 여부를 물어보기
        	//----------------------------------------------------------------------------
        	if(upDel=="del"){
        		if( is_empty("[name=qna_pwd]") ){
        			alert("암호를 입력해 주세요");
        			$("[name=qna_pwd]").focus();
        			return;
        		}
        		
        		//-------------------------------------------
        		// name=upDel 을 가진 양식에 "del" 저장하기
        		//-------------------------------------------
        			// <주의> 아래 코드를 생략하면 일어나는 일
        			//-----------------------------------------------------------------
        			// 수정 버튼을 누르고 취소하게 되면 name=upDel 에 "up"이 들어간다
        			// 그리고 삭제 버튼을 누르면 name=upDel 에 "up" 이 들어간 상태에서
        			// 삭제가 진행되므로 올바른 삭제가 진행되지 않는다
        		$("[name=upDel]").val("del");
        		
        		if(confirm("정말 삭제하시겠습니까?")==false) {return;}
        	}
        	//----------------------------------------------------------------------------
        	// 매개변수로 들어온 upDel 에 "up"이 저장되었으면
        	// 즉, 수정 버튼을 눌렀으면 각 입력양식의 유효성 체크하고 수정 여부 물어보기
        	//----------------------------------------------------------------------------
        	else if(upDel=="up"){
        		//-------------------------------------------
        		// name=upDel 을 가진 양식에 "up" 저장하기
        		//-------------------------------------------
        			// <주의> 아래 코드를 생략하면 일어나는 일
        			//-----------------------------------------------------------------
        			// 삭제 버튼을 누르고 취소하게 되면 name=upDel 에 "del"이 들어간다
        			// 그리고 수정 버튼을 누르면 name=upDel 에 "del" 이 들어간 상태에서
        			// 수정이 진행되므로 올바른 수정이 진행되지 않는다
        		$("[name=upDel]").val("up");
        			
        		if(is_empty("[name=u_no]")){
                    alert("이름을 입력해 주세요.");
                    $("[name=wirter]").focus();
                    return;
                 }
                 if(is_empty("[name=subject]")){
                    alert("제목을 입력해 주세요.");
                    $("[name=subject]").focus();
                    return;
                 }
                 /* return; */
                 if(is_empty("[name=content]")){
                    alert("내용 입력해 주세요.");
                    $("[name=content]").focus();
                    return;
                 }
                 if(is_valid_pattern("[name=qna_pwd]", /^[0-9]{4}$/) == false){
                    alert("암호는 숫자 4개를 입력해주세요");
                    return;
                 }
                 
                 if(confirm('정말 수정하시겠습니까?') == false){ return; }
        	}
        	//=================================================================================
        	// 현재 화면에서 페이지 이동 없이 서버쪽 "${ctRoot}/qstnUpDelProc.do"를 호출하여
        	// [게시판 수정 또는 삭제 적용 개수]를 받는다
        	//=================================================================================
        	//alert($('[name=qstnUpDelForm]').serialize());
        	
        	$.ajax({
        		//------------------------------
        		// 호출할 서버쪽 URL 주소 설정
        		//------------------------------
        		url : "/posbis/qstnUpDelProc.do"
        		//-----------------
        		// 전송 방법 설정
        		//-----------------
        		, type : "post"
        		//---------------------------------------------
        		// 서버로 보낼 파라미터명과 파라미터값을 설정
        		//---------------------------------------------
        		, data : $('[name=qstnUpDelForm]').serialize()
        		//----------------------------------------------------------------------
        		// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
        		// 매개변수 upDelCnt 에는 [게시판 수정 또는 삭제 적용 개수]가 들어온다
        		//----------------------------------------------------------------------
        		, success: function(upDelCnt){
        			if(upDel=="up"){

        				if(upDelCnt==1){
        					alert("수정 성공!");
        					location.replace("/posbis/qstnForm.do");
        				}else if(upDelCnt==-1){
        					alert("게시물이 삭제되어 수정할 수 없습니다!");
        				}else if(upDelCnt==-2){
        					alert("비밀번호가 잘못 입력되었습니다!");
        				}else{
        					alert("서버쪽 DB 연동 실패!");
        				}
        			}else if(upDel=="del"){
        				if(upDelCnt==1){
        					alert("삭제 성공!");
        					location.replace("/posbis/qstnForm.do");
        				}else if(upDelCnt==-1){
        					alert("이미 삭제된 게시물입니다!");
        				}else if(upDelCnt==-2){
        					alert("비밀번호가 잘못 입력되었습니다!");
        				}else if(upDelCnt==-3){
        					alert("댓글이 있어 삭제 불가능합니다!");
        				}else{
        					alert("서버쪽 DB 연동 실패!");
        				}
        				
        			}
        		}
        		//---------------------------------------------------
        		// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
        		//---------------------------------------------------
        		, error : function(){
        			alert("서버와 통신 실패!");
        		}
        	});
        	
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





   		
   </script>
</head>

<body><center><br>
	<!--***************************************************-->
	<!-- [게시판 수정/삭제] 화면을 출력하는 form 태그 선언 -->
	<!--***************************************************-->
	<%--
   <form method="post" name="qstnUpDelForm" action="${ctRoot}/qstnUpDelProc.do">
      <b>[글 수정/삭제]</b>
       <!-- -------------------- -->
      <table class="tbcss1" border=1 bordercolor=grqy cellspacing=0 cellpadding=5 align=center>
         <tr>
            <th bgcolor="gray">이름
            <td><input type="text" size="10" maxlength="10" name="u_no" value="${qstnDTO.u_no}">
         <tr>
            <th bgcolor="gray">제목
            <td><input type="text" size="40" maxlength="50" name="subject" value="${qstnDTO.subject}">
         <tr> 
            <th bgcolor="gray">이메일
            <td><input type="text" size="40" maxlength="30" name="email" value="${qstnDTO.email}">
         <tr>
            <th bgcolor="gray">내용
            <td><textarea name="content" rows="13" cols="40">${qstnDTO.content}</textarea>
         <tr>
            <th bgcolor="gray">비밀번호
            <td><input type="password" size="8" maxlength="12" name="qna_pwd" >
      </table>
      <!-- -------------------- -->
      <table><tr height=4><td></table>
      <!-- -------------------- -->
      <input type="hidden" name="upDel" value="up">
      <input type="hidden" name="qna_no" value="${qstnDTO.qna_no}">
      <!-- -------------------- -->
      <input type="button" value="수정"  onClick="checkQstnUpDelForm('up')">
      <input type="button" value="삭제"  onClick="checkQstnUpDelForm('del')">
      <input type="button" value="목록보기" onClick="document.qstnForm.submit();">
   </form>
   --%>
   
   <!---------------------------------------------------------------------------------------------->
   <!-- 스프링 폼 태그를 사용하여 html의 form 태그와 입력양식 관련 태그를 출력한다----------------->
   <!-- 이때 DTO 객체나 Map 객체 등과 연결하면 이 객체 안의 데이터가 자동으로 입력양식에 삽입된다-->
   <!---------------------------------------------------------------------------------------------->  
	<c:if test = "${!empty qstnDTO}">
    <form:form name="qstnUpDelForm" method="post" commandName="qstnDTO"
  										action="/posbis/qstnUpDelProc.do">
  										
	<!---------------------------------------------------->
	<!-- 위 스프링 폼 태그는 아래처럼 변환되어 실행된다 -->
	<!---------------------------------------------------->
  	<%-- 
  	<form name="qstnUpDelForm" method="post" id="qstnDTO"
  										action="${ctRoot}/qstnUpDelProc.do">
  	 --%>
  		
	  <b>[글 수정/삭제]</b>
	  <!-- ---------------------------------------------- -->
	  <table class="tbcss1" border=1 bordercolor=gray cellspacing=0 cellpadding=5 align=center>
		  <tr>
		  	<th bgcolor="gray">이 름
		  	<td><form:input path="u_no" className="u_no"/>
		  	<!---------------------------------------------------->
		  	<!-- 위 스프링 폼 태그는 아래처럼 변환되어 실행된다 -->
		  	<!---------------------------------------------------->
		  	<%-- <input type=text name="u_no" class="u_no" value="${qstnDTO.u_no}"> --%>
		  <tr>
		  	<th bgcolor="gray">제 목
		  	<td><form:input path="subject" className="subject"/>
		  	<!---------------------------------------------------->
		  	<!-- 위 스프링 폼 태그는 아래처럼 변환되어 실행된다 -->
		  	<!---------------------------------------------------->
		  	<%-- <input type="text" size="40" maxlength="50" name="subject" value="${qstnDTO.subject}"> --%>
		  <tr>
		  	<th bgcolor="gray">내 용
		  	<td><form:textarea path="content" className="content" rows="13" cols="40"/>
		  	<!---------------------------------------------------->
		  	<!-- 위 스프링 폼 태그는 아래처럼 변환되어 실행된다 -->
		  	<!---------------------------------------------------->
		  	<%-- <textarea name="content" rows="13" cols="40">${qstnDTO.content}</textarea> --%>
		  <tr>
		  	<th bgcolor="gray">비밀번호
		  	<td><form:password path="qna_pwd" className="qna_pwd"/>
		  	<!---------------------------------------------------->
		  	<!-- 위 스프링 폼 태그는 아래처럼 변환되어 실행된다 -->
		  	<!---------------------------------------------------->
		  	<%-- <input type=text name="qna_pwd" class="qna_pwd" value="${qstnDTO.qna_pwd}" --%>
	  </table>
      <!-- -------------------- -->
      <table><tr height=4><td></table>
      <!-- -------------------- -->
      <input type="hidden" name="upDel" value="up">
      <input type="hidden" name="qna_no" value="${qstnDTO.qna_no}">
      <!-- -------------------- -->
      <input type="button" value="수정"  onClick="checkQstnUpDelForm('up')">
      <input type="button" value="삭제"  onClick="checkQstnUpDelForm('del')">
      <input type="button" value="목록보기" onClick="location.replace('/posbis/qstnForm.do')">
  	</form:form>
  	</c:if>
  	
  	<form name="qstnForm" method="post" action="/posbis/qstnForm.do">
      <input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
      <input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
    </form>
   
</body>
</html>