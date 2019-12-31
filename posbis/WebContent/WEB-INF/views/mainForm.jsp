<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
 
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">

  <title>Login Page| Creative - Bootstrap 3 Responsive Admin Template</title>

  <!-- Bootstrap CSS -->
  <link href="resources/sidetopbar/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="resources/sidetopbar/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="resources/sidetopbar/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="resources/sidetopbar/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="resources/sidetopbar/css/style.css" rel="stylesheet">
  <link href="resources/sidetopbar/css/style-responsive.css" rel="stylesheet" />

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

    <!-- =======================================================
      Theme Name: NiceAdmin
      Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
      Author: BootstrapMade
      Author URL: https://bootstrapmade.com
    ======================================================= -->
</head>
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

//*************************************************************************************   
//아이디, 암호 체크 후 ajax를 통해 아이디 조회 후 로그인 하기           
         function goLoginForm(){
   
 /*   
            if( is_empty(".rank_code") ){
                   alert("회원등급 체크 요망");
                   $(".rank_code").val("");
                   return;
                }
    */
   
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
                     location.replace("/posbis/homePageForm.do");
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

<body class="login-img3-body">

  <div class="container">

    <form class="login-form mainForm" name=mainForm>
      <div class="login-wrap">
        <p class="login-img"><i class="icon_lock_alt"></i></p>
        
       <!--   <label class="checkbox checkbox-inline">
                <input type="radio" name="rank_code" class="rank_code" value=1  id="inlineCheckbox1" >&nbsp;&nbsp;일반&nbsp;&nbsp;
            	<input type="radio" name="rank_code" class="rank_code" value=2  id="inlineCheckbox1">&nbsp;&nbsp;프리미엄
 
            </label> -->
        
        <div class="input-group">
        
          <span class="input-group-addon"><i class="icon_profile"></i></span>
          
          <input type="text" class="form-control user_id" placeholder="Username" name="user_id" autofocus>
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_key_alt"></i></span>
          <input type="password" class="form-control user_pwd" name="user_pwd" placeholder="Password">
        </div>
        <label class="checkbox checkbox-inline">
                <input type="checkbox" value="remember-me"> Remember me
        </label><br>
        
         <span class="pull-right"> <a onClick="goIdPwdSearchForm();">아이디 암호 찾기</a></span><br>
		<br>
   
 
        <button type="button" class="btn btn-primary btn-lg btn-block" onClick="goLoginForm();" >Login</button>
          <button type="button" class="btn btn-info btn-lg btn-block" onClick="goJoinForm();">Sign up</button>
           <button type="button" class="btn btn-success btn-lg btn-block"  onClick="goIntroForm();">회사소개 바로가기</button>
 
 
      </div>
          
      
    </form>
    <div class="text-right">
    <!--   <div class="credits">
          
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
         
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div> -->
    </div>
  </div>


</body>

</html>
