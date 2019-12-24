<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ include file="common.jsp"%>
<html>
   <head>
      <title> </title>
      <meta charset="utf-8">
      <script>
         function goMainForm(){
        	 
 			 alert("아이디/비밀번호 찾기 시작")
	    	  
	    	  $.ajax({
	         	 url : "/posbis/findIDPassword.do"
	         	, type : "post"
	         	, data : $("[name=findIdPwdForm]").serialize()
	         	, success : function(findIDPassword) {
	         		if( findIDPassword.user_id!=null && findIDPassword.user_id!=null ){
	         			alert("등록된 아이디는"+findIDPassword.user_id+"비밀번호는"+findIDPassword.user_pwd+"입니다");
	         			location.replace('/posbis/findIdPwdForm.do');
	         			
	         		}else if( findIDPassword.user_id==null && findIDPassword.user_id==null ) {
	         			alert("해당 아이디, 비밀번호, 사업자 등록번호가 존재하지 않습니다. 재입력 바랍니다.");
	         			location.replace('/posbis/findIdPwdForm.do');
	         			
	         		}
	         		else {
	                     alert("서버 오류 발생!! 관리자에게 문의 바랍니다.");
	         		}
	         	
	         	}, error : function(){
	                 alert("서버 접속 실패");
	         	}
	         	
	          });	
		
        	 
        	 
       
         }

    /*      function goMainForm(){
             alert("메인으로 이동");
             location.replace("/posbis/mainForm.do");
          }
 			 */
 		
         
      </script>
   </head>

   <body><center>
   <form name="findIdPwdForm">
   
   		<div style='float:right'><input type=button value="메인으로" onClick="goMainForm()"></div>&nbsp;&nbsp;
   		
   		
      [아이디/비밀번호 찾기]
      <table>
         <tr>
            <td> 이름
            <td><input type="text" name="user_name" class="user_name"> 
         </tr>
         <tr>
            <td> 사업자 등록 번호&nbsp;&nbsp;
            <td><input type="text" name="business_no" class="business_no"> 
         </tr>
         <tr>
            <td> 질문
            <td>
               <select name="question_code" size=1> 
                  <option value="" selected> --선택요망--</option>
                  <option value="1">자신의 보물 1호는?</option>
                  <option value="2">졸업한 초등학교 이름은?</option>
                  <option value="3">어머니의 이름은?</option>
                  <option value="4">존경하는 인물은?</option>
               </select>
         </tr>
         <tr>
            <td> 답변
            <td><input type="answer" name="answer" maxlength=15> 
         </tr>   
      </table>
      <input type="button" value="아이디/비밀번호 찾기" onClick="goMainForm()"> 
     </form>
   </body>

</html>