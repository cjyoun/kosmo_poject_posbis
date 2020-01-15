<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- =====================================================================================  -->
<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고 이 문서안의 데이터는 UTF-8 방식으로 인코딩한다라고 설정하며 
	 이 JSP파일을 UTF-8방식으로 부호화한후 저장한다고 설정. (이 코드는 모든 JSP페이지 상단에 꼭 있어야함.)		-->
<!-- 다른 곳에서 이 JSP파일이 수입 될 때 이 코드는 빼고 아래 코드들이 모두 수입됨. (이 코드는 모든 JSP파일 상단에 위치되어 있음. -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%--============================================================================ 
<!-- 자바문법 사용 시 필요한 수입 부분. -->
<%@ page import="java.util.*" %> 
================================================================================--%>


<!-- JSP 페이지에서 사용할 [사용자 정의 태그]인 [JSTL의 C 코어 태그] 선언 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- JSP 페이지에서 사용할 [사용자 정의 태그]인 [spring 폼 태그] 선언 -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!-- WebContent 안에 있으면서 WEB-INF 밖에 있으면 누구나 url로 접근이 가능하다.
	 이를 방지하기 위해 페이크 주소로 주는것이고 이를 리얼주소로 바꾸어준다. Spring은 다 페이크주소를 사용함.(WEB-INF 안에 코딩을 다 넣음.) 
	 servlet-context.xml 파일안에 페이크경로 말고 실제 경로로 되는 것이 있음 29줄. -->
<!-- CSS, js파일, JQuery 라이브러리 수입 -->
<link href="/posbis/resources/common.css" rel="stylesheet" type="text/css" >
<script src="/posbis/resources/common.js?a=<%=Math.random()%>" ></script>		<!-- ?매개변수 새로운 숫자가 들어가는 것을 주어서 url을 항상 새롭게 해주어 매번 새롭게 불러옴. -->
<script src="/posbis/resources/jquery-1.11.0.min.js" ></script>



<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">



<script>

/* $("body").prepend("<div style='position:relative; left:85%; top:15%;'><table border=1 cellspacing=0 cellpadding=5><tr><td rowspan='2'>${rank_code}<td colspan='2'>${user_name}<tr><td><input type=button value='내 정보' onClick=\"location.replace('/posbis/myPageForm.do')\"><td><input type=button value='로그아웃' onClick=\"location.replace('/posbis/mainForm.do')\"></table></div>") */
	
 
	
	/* $("body").prepend("<div><table border=1 cellspacing=0 cellpadding=5><tr><td rowspan='2'>${rank_code}<td colspan='2'>${user_name}<tr><td><input type=button value='내 정보' onClick=\"location.replace('/posbis/myPageForm.do')\"><td><input type=button value='로그아웃' onClick=\"location.replace('/posbis/mainForm.do')\"></table></div>")
 */
</script>




