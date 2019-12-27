<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/views/common.jsp" %>    
    
<html>
   <head>
      <title> </title>
      <meta charset="utf-8">
      <style>
      
      /*--------------------------------------------------------
      <table class="tbcss1"> ~<table>태그로 표현되는 테이블의 CSS설정하기
      경계선 두께/선모양/선색 설정하기
      테이블 내부의 여백 설정하기
      글자크기 설정하기
      글꼴 설정하기기
      ----------------------------------------*/

         .tbcss1, .tbcss1 th, .tbcss1 td{
            border-collapse: collapse;
            border: 1px solid #A2A2A2 /*#C0C0C0*/
            padding: 5;
            font-size: 9pt;
            font-family:tahoma, 굴림, 돋움, verdana;
         }
      </style>
   <script> 
      function goMyPageForm(){
         alert("결제가 완료 되었습니다.");
         location.replace("/posbis/mainForm.do");
      }
      
      function goMainForm(){
         alert("결제가 취소 되었습니다.");
       	 location.replace("/posbis/mainForm.do");
      }
   </script>

   </head>

   <body><center>
   
      <!-- ------------------------------ -->
      <!-- 입력양식 태그를 내포하는 form 태그 선언 -->
      <!-- ------------------------------ -->
      <form name="payForm">

         <table border="1" cellpadding=5 class="tbcss1">
            
            <tr align=center>
               <td colspan=2><b>결제창</b></td>
               <!--<td>70</td>-->
            </tr>
            <tr>
            <td bgcolor="white">카드 종류</td>
            <td>
               <!-- 목록 입력 양식 출력 -->
               <select name="credit" size=1>
                  <option value="" selected>--선택요망--</option>
                  <option value="BC">BC카드</option>
                  <option value="SHINHAN">신한카드</option>
                  <option value="KB">국민카드</option>
                  <option value="SAMSUNG">삼성카드</option>
                  <option value="HYUNDAI">현대카드</option>
                  <option value="LOTTE">롯데카드</option>
                  <option value="HANA_SK">하나카드</option>
                  <option value="NH">농협카드</option>
                  <option value="CITY">씨티카드</option>
                  <option value="KakaoBank">카카오뱅크카드</option>
                  <option value="K bank">케이뱅크카드</option>
                  <option value="JEONBUK">전북은행카드</option>
                  <option value="COMMUNITY_CREDIT_COOPERATIVES">새마을금고카드</option>
                  <option value="ETC">기타(은행/증권)카드</option>
               </select>
            </td>
            </tr>
            <tr>
               <td bgcolor="white">카드번호</td>
               <td>
                  <input type="text" name="creditNum1" size=2 maxlength=4>&nbsp;-&nbsp;
                  <input type="text" name="creditNum2" size=2 maxlength=4>&nbsp;-&nbsp;
                  <input type="text" name="creditNum3" size=2 maxlength=4>&nbsp;-&nbsp;
                  <input type="password" name="creditNum4" size=2 maxlength=4>
                  
               </td>

            </tr>
            <tr>
               <td bgcolor="white">유효기간</td>
               <td><input type="text" name="exdate1" size=2 maxlength=2  placeholder="mm">&nbsp;월 
               <input type="text" name="exdate2" size=2 maxlength=2  placeholder="yy">&nbsp;년</td>
            </tr>
            <tr>
               <td bgcolor="white">주민번호</td>
               <td><input type="text" name="joominNum1" size=5 maxlength=6>&nbsp;-&nbsp;
               <input type="password" name="joominNum2" size=1 maxlength=1>******</td>
            </tr>
            <tr>
               <td bgcolor="white">비밀번호</td>
               <td><input type="password" name="creditpwd" placeholder="앞 2자리" size=3 maxlength=2>**</td>
            </tr>

         </table>
         <br>
            <input type="button" value="결제" onclick="goMyPageForm()"> 
            <input type="button" value="취소" onclick="goMainForm()">
         

      </form>




   </body>

</html>