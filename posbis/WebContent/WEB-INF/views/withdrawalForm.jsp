<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ include file="common.jsp"%>


<html>
   <head>
      <meta charset="utf-8">
  
   <script>

      function goWithdrawalForm(){
         alert("정말 탈퇴하시겠습니까?");
         
         alert($("[name=user_id]").val());
 //*************************************************************************************   
 //ajax를 통해 아이디 암호 맞는 사용자 삭제하기     
   		 $.ajax({ 
   			url : "/posbis/withdrawalProc.do"
			, type : "post"
			, data : $("[name=withdrawalform]").serialize()
			, success : function(withdrawalCnt){
				
				if(withdrawalCnt == 1){
					alert("탈퇴 완료 되었습니다.");
					location.replace("/posbis/mainForm.do")
				
				}else if(withdrawalCnt==-1){
						alert("이미 탈퇴한 회원 또는 등록된 사용자가 아닙니다.");
						location.replace("/posbis/withdrawalForm.do")
				
				}else if(withdrawalCnt==0){
						alert("아이디 비밀번호 확인 요청");
						location.replace("/posbis/withdrawalForm.do")
				}else {
					alert("서버쪽 DB 연동 실패!");
				}
				
			}, error : function(){
					alert("서버 접속 실패");
			}	 
   		 });
         
   
         
      }

      function goMyPageForm(){
         alert("goMyPageForm.jsp로 이동")
         location.replace("/posbis/myPageForm.do")
      }
      
      function goMainForm(){
          alert("메인으로 이동")
          location.replace("/posbis/mainForm.do")
       }
   </script>
   
   </head>

   <body><center>
   
   <form name="withdrawalform" >
   
	<div style='float:right'><input type=button value="메인으로" onClick="goMainForm()"></div>&nbsp;&nbsp;
     <div style="height:50;"></div>  
      <table>
         <tr>
            <td>ID
            <td><input type="text" name="user_id" class="user_id"  >
         <tr>
            <td>비밀번호
            <td><input type="password" name="user_pwd" class="user_pwd"  >
         <tr>
             <td>탈퇴 사유
            <td>
               <select name="withdrawalReason">
                  <option> --선택-- </option>
                  <option> 서비스 불만족 </option>
                  <option> 폐점 </option>
                  <option> 기타 </option>
               </select>
      </table>
      <br><br>
         <input type="button" value="탈퇴" onclick="goWithdrawalForm()">&nbsp;
         <input type="button" value="취소" onclick="goMyPageForm()">
      </form>

   </body>
</html>