<!-- **************************************************************************************************** -->
<!-- JSP 기술의 한 종류인  [Page Directive] 를 이용하여 현 JSP 페이지 처리 방식 선언하기. -->
<!-- **************************************************************************************************** -->
   <!-- 
      현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다 라고 설정함. 
      현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다.
      UTF-8 인코딩 방식은 한글을 포함한 전 세계 모든 문자열을 부호화 할 수 있는 방법이다.
   -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!-- JSP 페이지에서 사용할  [ 사용자 정의 태그 ]인 [JSTL의  C코어 태그] 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!-- 파일의 보안을 위해  WebContent내부의  WEB-INF 내에 파일을 저장한다면 url 경로를 통해 파일에 접속하지 못하게 막기 때문에  WEB-INF 파일에 저장한다.  -->
<!-- ${ctRoot}/resources/common.css fake경로의 간단한 이유는 servlet-context.xml 파일에서 설정한 코딩에 의해서 리얼 주소로변경해준다. -->

<!-- **************************************************************************************************** -->
<!-- css 파일 수입 -->
<!-- JQuery 라이브러리 파일 수입 -->
<!-- **************************************************************************************************** -->
<%-- <link href="${ctRoot}/resources/common.css" rel="stylesheet" type="text/css">
<script src="${ctRoot}/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${ctRoot}/resources/common.js?a=<%=Math.random()%>>" type="text/javascript"></script> --%>
<%@include file="/WEB-INF/views/common.jsp" %>


<html>
<head>
   <title> 게시판 글쓰기 </title>
   <script>
   		/* $(document).ready(function(){
   			$("[name=u_no]").val("7");
   			$("[name=subject]").val("QQQ");
   			$("[name=content]").val("내용");
   			$("[name=qna_pwd]").val("1111");
   		});  */                                                                                         
      //=======================================================================
         // 게시판 등록 화면  에 입력된 데이터 유효성 체크 함수 선언
      //=======================================================================
         function checkQstnRegForm(){
            
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
            
            if(confirm('정말 저장하시겠습니까?') == false){
               return;
            }
            
            
            /*  alert( $('[name=qstnRegForm]').serialize() );
            return;  */
            
            //===========================================================================
            // 현재 화면에서 페이지 이동 없이 서버쪽 "${ctRoot}/qstnRegProc.do"를 호출하여 
            // 게시판 글을 입력하고 [게시판 입력 행 적용 개수]를 받기
            //===========================================================================
            
            $.ajax({
               // 접속할 서버 쪽 URL 주소 설정
               url : "/posbis/qstnRegProc.do"
               // 전송 방법 설정
               , type : "post"
               // 서버로 보낼 파라미터명과 파라미터값을 설정
               , data : $("[name=qstnRegForm]").serialize()
               // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
               // 매개변수 qstnRegCnt 에는 입력 행의 개수가 들어온다.
               , success : function(qstnRegCnt){
                  // 게시판 입력 행 적용 개수가 1개면(=insert가 한번 성공했다는 뜻)
                  if(qstnRegCnt == 1){
                     alert("새 글 등록 성공!");
 					 location.replace("/posbis/qstnForm.do");
                  }
                  // 게시판 새 글 입력 행 적용 개수가 1개가 아니면 경고하기
                  else{
                     alert("게시판 글 등록 실패! 관리자에게  문의 바랍니다.");
                  }
               }
               // 서버의 응답을 못받았을 경우 실행할 익명함수 설정.
               , error : function(){
                  alert("서버 접속 실패");
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
<body><center><br><br><br><br><br><br>
   <!-- =========================================================== -->
   <!--       [게시판 등록] 화면을 출력하는 form 태그 선언.         -->
   <!-- =========================================================== -->
   <form method="post" name="qstnRegForm" action="/posbis/qstnRegProc.do">
   
   		<!----------------------------------------------------------------->
   		<!--  파라미터명이 qna_no인 파라미터값을 저장할 hidden 태그 선언 
   			  댓글 쓸 경우 qna_no라는 파라미터명에는 엄마 글의 글 번호가 들어온다  -->
   		<!----------------------------------------------------------------->
 		<input type="hidden" name="qna_no" value="${(empty param.qna_no)?0:param.qna_no}"> 
 		<!-- 파명만 있고 파값 없으면 DTO의 속성변수에 null값만 들어감 -->
 		<!-- [입]컨트롤러 클라스 안의 특정 메소드가 단 한 줄도 실행되지 않는 이유는?
 			 => 파값이 저장되는 매개변수 안에 파값과 매개변수 자료형이 일치가 안 돼서 실패한 것 
 			 첫줄에 메세지를 넣어서 시작되는지 확인부터 -->
   		
   		<!----------------------------------------------------------------->
   		<!-- 커스텀태그의 일종인 JSTL C코어 태그를 사용하여
   			 파라미터명이 qna_no인 파라미터값이 비어있으면 새글쓰기 출력하고
   			 파라미터명이 qna_no인 파라미터값이 있으면 댓글쓰기 출력하기   -->
   		<!----------------------------------------------------------------->
   		<c:if test="${empty param.qna_no}"> <!-- empty는 존재하지 않거나 null이거나 길이가 없으면 (사용할 만한 데이터가 아니면) 무조건 true 리턴-->
   		  <b>[새 글쓰기]<b><br>
   		</c:if>
   		<c:if test="${param.qna_no>0}"> <!-- 무조건 test 오른쪽은 EL이 나온다. EL 영역 안에 처음과 맨 끝에 공백 넣으면 안 됨 -->
   		  <b>[답글 쓰기]</b><br>
   		</c:if>
   		<%-- 위 코드는 아래처럼도 가능하다 
	   		<c:choose>
		   		<c:when test="${empty param.qna_no}">
		   		  <b>[새 글쓰기]<b><br>
		   		</c:when>
		   		<c:otherwise>
		   		  <b>[답글 쓰기]</b><br>
		   		</c:otherwise>
	      	</c:choose>
      	--%>
      <table class="tbcss1" border=1 bordercolor=grqy cellspacing=0; cellpadding=5 align=center>
         <tr>
            <th bgcolor="gray">이 름
            <td><input type="text" size="10" maxlength="10" name="u_no" value="${writer}">
         <tr>
            <th bgcolor="gray">제 목
            <td><input type="text" size="40" maxlength="50" name="subject">
         <tr>
            <th bgcolor="gray">내 용
            <td><textarea name="content" rows="13" cols="40"></textarea>
         <tr>
            <th bgcolor="gray">비밀번호
            <td><input type="password" size="8" maxlength="12" name="qna_pwd">
      </table>
      <input type="button" value="저장"  onClick="checkQstnRegForm()">
      <input type="reset" value="다시작성">
      <input type="button" value="목록보기" onClick="location.replace('/posbis/qstnForm.do')">
   </form>
   

</body>
</html>