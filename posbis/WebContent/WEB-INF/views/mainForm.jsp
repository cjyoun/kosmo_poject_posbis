<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ include file="common.jsp"%>



<html>
	<head>
		<title> new document </title>
		<script src="jquery-1.11.0.min.js"></script>

		<style>

		html, body { height:100%; overflow:hidden }

 
		 
 		#intro {
			border: 1px 
			solid orange; 
			float: left; 
			width: 100%;
			height:300px;
			text-align:center;
			display: table-cell;
			vertical-align: middle;
		}



 
 		</style>


		<script>
		
	 

			function goIntroForm(){
				alert("소개글로 이동")
				location.replace("/posbis/introForm.do")
			}


			function goIdPwdSearchForm(){
				alert("아이디/비밀번호 찾기 이동")
				location.replace("/posbis/findIdPwdForm.do")
			}


			function goJoinForm(){
				alert("회원가입으로 이동")
				location.replace("/posbis/joinForm.do")
			}

			function goWithdrawalForm(){
				alert("회원탈퇴로 이동")
				location.replace("/posbis/withdrawalForm.do")
			}
//*************************************************************************************   
//아이디, 암호 체크 후 ajax를 통해 아이디 조회 후 로그인 하기  			
			function goLoginForm(){
	
	
				if( is_empty(".rank_code") ){
		             alert("회원등급 체크 요망");
		             $(".rank_code").val("");
		             return;
		          }
	
	
				if( is_empty(".user_id") ){
		            alert("아이디 입력 요망");
		            $(".user_id").val("");
		            return;
		         }
				
				if( is_empty(".user_pwd") ){
		            alert("암호 입력 요망");
		            $(".user_pwd").val("");
		            return;
		         }		
				//아이디, 암호 체크 후 ajax를 통해 아이디 조회 후 로그인 하기  					
				$.ajax({ 
					url : "/posbis/loginProc.do"
					, type : "post"
					, data : $("[name=mainForm]").serialize()
					, success : function(data){
						if( data==1 ){
							alert("로그인 성공");
							location.replace("/posbis/myPageForm.do");
						}
						 else if(data == 0) {
							 alert("아이디 또는 암호가 존재하지 않습니다. 재입력 바람");
							 $(".user_id").val("");
							 $(".user_pwd").val("");
						 }
					}
					,error : function(){
							alert("서버 접속 실패");
					}

				});
				
 
				
	 
			}

		</script>
	</head>
	<body><center>
	 

	<form>

		<div id="box">
			  <div id=intro class=intro onClick=goIntroForm() ><tr><td><h1>소개</td></b></tr></div>
		</div>

	</form>

	<br>

	<form name="mainForm">
		
		<input type="radio" name="rank_code" class="rank_code" value=1 >일반&nbsp;&nbsp;
		<input type="radio" name="rank_code" class="rank_code" value=2 >프리미엄


		<!-- ------------------ -->
		<br>
		<br>
		<!-- ------------------ -->	
		<table class="tbcss1" border=1 cellpadding=5>
 			<tr>
				<th bgcolor="lightyellow" align="center"  >ID
				<td><input type="text" name="user_id" class="user_id" size="18">
				<td rowspan=2 onClick=goLoginForm()>로그인</td> 
				
			<tr>
				<th bgcolor="lightyellow" align="center" >PassWord
				<td><input type="password" name=user_pwd class="user_pwd" size="18">
		</table>

		<!-- ------------------ -->
		<table>
		<tr>
			<td><input type = "checkbox" value="y" name="is_login"> 아이디, 암호 기억
		<tr>	
	 		<td><span onClick=goIdPwdSearchForm()>[아이디찾기/암호찾기]   | </span> &nbsp;
				<span onClick=goJoinForm()>[회원가입]   | </span>&nbsp;
				<span onClick=goWithdrawalForm()>[회원탈퇴]    </span>
			
		</table>
	</form>


 
	</body>
</html>
	