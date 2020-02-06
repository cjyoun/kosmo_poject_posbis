<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- =====================================================================================  -->
<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고 이 문서안의 데이터는 UTF-8 방식으로 인코딩한다라고 설정하며 
	 이 JSP파일을 UTF-8방식으로 부호화한후 저장한다고 설정. (이 코드는 모든 JSP페이지 상단에 꼭 있어야함.)		-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여  common.jsp 파일 내의 소스를 삽입하기 -->
<%-- <%@include file="/WEB-INF/views/common.jsp" %> --%>		<!-- 이것만 WEB-INF 경로를 사용할 수 있음. -->

<script>

	//alert("포스기 로그인 화면으로 이동합니다.");
	location.replace("/posbis/posLoginForm.do");
	
</script>