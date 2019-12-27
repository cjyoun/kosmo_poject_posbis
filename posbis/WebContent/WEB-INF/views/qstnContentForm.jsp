<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>

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
   <title> 게시판 상세 보기 </title>
   <script>
   
   	// 게시판 수정 화면으로 이동하는 함수 선언
   	function goQstnUpDelForm(){
   		// name=qstnUpDelForm 을 가진 form 태그의 action 값을 URL로 서버에 접속하라
   		document.qstnUpDelForm.submit();
   	}
   	
   	// 게시판 답글 화면으로 이동하는 함수 선언
   	function goQstnRegForm(){
   	   		



   	   $.ajax({
   	        // 접속할 서버 쪽 URL 주소 설정
   	        url : "/posbis/qstnMasterRegProc.do"
   	        // 전송 방법 설정
   	        , type : "post"
   	        // 서버로 보낼 파라미터명과 파라미터값을 설정
   	        , data : $("[name=qstnContentForm]").serialize()
   	        // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
   	        // 매개변수 masterCnt 에는 입력 행의 개수가 들어온다.
   	        , success : function(masterCnt){
   	           // 관리자 계정의 개수가 1개면(=insert가 한번 성공했다는 뜻)
   	           if(masterCnt == 1){
   	        	   document.qstnRegForm.submit();
   	           }
   	           // 관리자 계정의 개수 1개가 아니면 경고하기
   	           else{
   	              alert("관리자의 권한이 필요합니다.");
   	              return;
   	           }
   	        }
   	        // 서버의 응답을 못받았을 경우 실행할 익명함수 설정.
   	        , error : function(){
   	           alert("서버 접속 실패");
   	        }
   	     });
   	}
		// ajax 순서 바꾸고 답글쓰기 폼으로 이동하는 거 위에 있으니까 주석처리함
   		//document.qstnRegForm.submit();
   		 /* 
	   		function goQstnRegForm(){
	   		if(admin_id == 'abc'){ 
	   	   		document.qstnRegForm.submit();
	   		}
	   		else{
	   			alert("관리자의 권한이 필요합니다.");
	   			return;
	   		} 
   		} */
   	
   
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
   <!-- ================================================================================ -->
   <!-- [1개의 게시판 내용]을 출력하고 게시판 등록 화면으로 이동하는 form 태그 선언하기  -->
   <!-- ModelAndView 객체에 "qstnDTO"라는 키값으로 저장된 QstnDTO 객체의 속성변수 안의 -->
   <!-- 데이터를 꺼내어 출력한다 ------------------------------------------------------- -->
   <!-- 꺼내는 방법은 EL 문법으로 달러{qstnDTO.속성변수명}이다 ------------------------ --> 
   <!-- ================================================================================ -->
   <form class=qstnContentForm  name="qstnContentForm"  method="post" action="/posbis/qstnRegForm.do">
      <input type="hidden" name="qna_no" value="${qstnDTO.qna_no}">
      <b>[글 상세 보기]</b>
      <!--------------------------------------------------------------------------------------->
      <table class="tbcss1" width="500" border=1 bordercolor="#dddddd" cellpadding="5" align="center">
         <tr align=center>
            <th bgcolor="gray" width=60>글번호
            <td width=150>${qstnDTO.qna_no}
            <th bgcolor="gray" width=60>조회수
            <td width=150>${qstnDTO.readcount}
         <tr align=center>
            <th bgcolor="gray" width=60>작성자
            <td width=150>${qstnDTO.user_id}
            <th bgcolor="gray" width=60>작성일
            <td width=150>${qstnDTO.qna_date}
         <tr>
            <th bgcolor="gray" >글제목
            <td width=150 colspan=3>${qstnDTO.subject}
         <tr>
            <th bgcolor="gray">글내용
            <td width=150 colspan=3>
            	<textarea name="content" rows="13" cols="45" style="border:0" readonly>${qstnDTO.content}</textarea>
      </table>
      <!--------------------------------------------------------------------------------------->
      <table><tr height=3></table>
      <!--------------------------------------------------------------------------------------->
      <input type="button" value="답글쓰기" onClick="goQstnRegForm();">&nbsp;
      <input type="button" value="수정/삭제" onClick="goQstnUpDelForm();">&nbsp;
      <input type="button" value="목록보기" onClick="document.qstnForm.submit();">
      
      <!-- ------------------------------------- -->
      <input type="text" name="user_id" value="master40">
   </form>   
   
   <!--****************************************************************************************-->
   <!-- [게시판 목록] 화면으로 이동하는 form 태그 선언 --------------------------------------- -->
   <!-- form 태그 내부에는 클라이언트가 보낸 파라미터값을 hidden 양식에 저장하고 있다 -------- -->
   <!-- 파라미터값을 꺼낸 방법은 EL 문법을 이용한다 ------------------------------------------ -->
   <!-- 파라미터값을 꺼내는 EL 문법은 달러 {param.파라미터명} 또는 --------------------------- -->
   <!-- ----------------------------- 달러 {paramValues.파라미터명} 이다 --------------------- -->
   <!-- 달러 {paramValues.파라미터명}는 배열로서 checkbox 가 파라미터값으로 들어올 때 사용한다 -->
   <!--****************************************************************************************-->
   <form name="qstnForm" method="post" action="/posbis/qstnForm.do">
   
   </form>
   
	<!--**************************************************-->
	<!--  수정/삭제 화면으로 이동하기 위한 form 태그 선언 -->
	<!--**************************************************-->
	<form name="qstnUpDelForm" method="post" action="/posbis/qstnUpDelForm.do">
	   	 <!-- 게시판 상세보기 화면을 구성하는 글의 고유번호를 hidden 태그에 저장 -->
	   	 <!-- 수정/삭제를 하려면 현재 글의 고유번호를 알아야 하기 떄문 -->
	   	 <input type="hidden" name="qna_no" value="${param.qna_no}">
	   	 <input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
	   	 <input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
	</form>
	<!--**************************************************************************-->
	<!-- 이전 페이지에서 온 게시판 선택 페이지 번호를 지정한 hidden 태그 출력하고 -->
	<!-- [게시판 목록] 화면으로 이동하는 form 태그 선언 ---------------------------->
	<!--**************************************************************************-->
	<form name="qstnRegForm" method="post" action="/posbis/qstnRegForm.do">
		<!-- 게시판 상세보기 화면을 구성하는 글의 [고유번호]를 hidden 태그에 저장 -->
		<!-- 댓글을 달려면 주인 글의 고유번호를 알아야 하기 때문 -->
		<input type="hidden" name="qna_no" value="${param.qna_no}">
	</form>
</body>
</html>
