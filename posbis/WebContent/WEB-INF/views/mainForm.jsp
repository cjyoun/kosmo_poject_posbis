<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
 
<!DOCTYPE html>
 
<html>

<head>
<title>POSBIS</title>
  <meta charset="UTF-8">
   <meta name="description" content="loans HTML Template">
   <meta name="keywords" content="loans, html">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
   <!-- Favicon -->
   <link href="resources/bootstrap/img/favicon.ico" rel="shortcut icon"/>

   <!-- Google font -->
   <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
 
   <!-- Stylesheets -->
   <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css"/>
   <link rel="stylesheet" href="resources/bootstrap/css/font-awesome.min.css"/>
   <link rel="stylesheet" href="resources/bootstrap/css/owl.carousel.min.css"/>
   <link rel="stylesheet" href="resources/bootstrap/css/flaticon.css"/>
   <link rel="stylesheet" href="resources/bootstrap/css/slicknav.min.css"/>

   <!-- Main Stylesheets -->
   <link rel="stylesheet" href="resources/bootstrap/css/style.css"/>


   <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->

</head>
<script>

function gobeforeSignIntroForm(){
    //alert("소개글로 이동")
    location.replace("/posbis/beforeSignIntroForm.do")
 }


 function goIdPwdSearchForm(){
    //alert("아이디/비밀번호 찾기 이동")
    location.replace("/posbis/findIdPwdForm.do")
 }


 function goJoinForm(){
    //alert("회원가입으로 이동")
    location.replace("/posbis/joinForm.do")
 }

 
 $(document).ready(function() {
    
   /*  $("[name=mainForm] .login").click(function(){
       goLoginForm();
    });
     */
    
     inputData("[name=user_id]",'${cookie.user_id.value}');
     inputData("[name=user_pwd]",'${cookie.user_pwd.value}'); 
    
    <c:if test="${!empty cookie.user_id.value}">
     $('[name=is_login]').prop("checked",true);
     </c:if>
  
  
    
    
 });
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
          alert("아이디를 입력하세요");
          $(".user_id").val("");
          return;
       }
    
    if( is_empty(".user_pwd") ){
          alert("비밀번호를 입력하세요");
          $(".user_pwd").val("");
          return;
       }      

    
    //아이디, 암호 체크 후 ajax를 통해 아이디 조회 후 로그인 하기                 
    $.ajax({ 
       url : "/posbis/loginProc.do"
       , type : "post"
       , data : $("[name=mainForm]").serialize()
       , success : function(data){
          //alert("Dddddd")
          if( data==1 ){
             //alert("로그인 성공");
             location.replace("/posbis/homePageForm.do");
          }
           else if(data == 0) {
              alert("아이디 또는 암호가 존재하지 않습니다.");
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
<body>
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>

   <!--==========================
  Header
  ============================-->
   <header class="header-section">
      <a onClick="goMainForm();" class="site-logo" style="cursor:pointer;"> 
         <img src="resources/bootstrap/img/POSBIS_logo.png" alt=""> 
      </a> 
      
   </header>
   <!-- #header -->

   <!-- Hero Section end -->
   <section class="hero-section">
      <div class="container" style="max-width:1400">
         <div class="row">
            <div class="col-lg-6" style="margin:-60 0 0 0">
               <div class="hs-text">
                  <h2 style="font-size:75">POSBIS</h2>
                  <p style="font-size:19; padding:15 0 30 0">서울특별시 소상공인 점포의 정보 원천으로 활용하시어 점포의 매출 증대와 이익 증대를 위해 함께 노력하는 동반자가 되어 드릴 것을 진심으로 기원하며, 소상공인들께 최상의 서비스를 추구할 것을 약속드립니다. 고객의 입장, 고객의 중심에서 생각하는 회사로 항상 노력하겠습니다.</p>
                  <button class="site-btn3 sb-dark" onClick="gobeforeSignIntroForm();" style="color:#fff">회사소개 바로가기</button>
               </div>
            </div>
            <div class="col-lg-6" style="margin: 0 0 0 0">
               <form class="hero-form" name="mainForm" style="width:480; margin: 0 0 0 100; ">
                  <div style="width:325; margin: 0 0 0 -40px">
                     <input type="text" placeholder="ID" name="user_id" class="id-pwd user_id" style="height:60">
                     <input type="password" placeholder="Password" name="user_pwd" class="id-pwd user_pwd" style="height:60">
                     <div class="textColor">
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                        <label><input type="checkbox" value="remember-me" name="is_login" value="y"  style="float:left; ">&nbsp; 아이디/비밀번호 기억하기</label>
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
   
                        
                        <span> <a onClick="goIdPwdSearchForm();" style="cursor:pointer; float:right; padding:0 0 20px 0; font-size:17">내 계정 찾기</a></span><br>
                          </div>
                          <br><br> 
      
                     <button type="button" class="site-btn" onClick="goLoginForm();" style="margin:-10 0 -25 0">Log in</button>
                     <br>
                     <br>
                     <br>
                     <button type="button" class="site-btn2"  onClick="goJoinForm();">Sign up</button>
                     <br>
                  </div>
                  <br>
               </form>
               
            </div>
            
               <br>   
         </div>
      </div>
      <div class="hero-slider owl-carousel">
         <div class="hs-item set-bg" data-setbg="resources/bootstrap/img/hero-slider/1.jpg"></div>
         <div class="hs-item set-bg" data-setbg="resources/bootstrap/img/hero-slider/2.jpg"></div>
         <div class="hs-item set-bg" data-setbg="resources/bootstrap/img/hero-slider/3.jpg"></div>
      </div>
   </section>
   <!-- Hero Section end -->

   <!--==========================
    꼬리말
  ============================-->
   <footer class="footer-section">
      <div class="container">
         <img class="footer-logo" src="resources/bootstrap/img/POSBIS_logo.png" alt="">
         <div class="row">

            <div class="footer-widget">

               <p>POSBIS는 항상 도전하는 정신으로 고객 편의성 증대를 위하여 혁신 기술을 도입하고, 세련된 디자인과 높은 성능으로 국내의 POS 통계 분석 업계 표준을 설정 및 유지해 나가고 있습니다. 항상 행복과 고객님의 사업이 번창하시기를 기원합니다.</p>
               <p>
                  월드메르디앙벤쳐 2차 Korea, Seoul 가산디지털단지역<br> <strong>Phone:</strong>
                  +1 5589 55488 55<br> <strong>Email:</strong> info@example.com<br>
               </p>
            </div>


         </div>
         <div class="copyright">
            Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
            Copyright &copy;
            2020
            All rights reserved | This template is made with <i
               class="fa fa-heart-o" aria-hidden="true"></i> by <a
               href="https://colorlib.com" target="_blank">Colorlib</a>
            Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
         </div>
      </div>
   </footer>
   <!-- #footer -->
   
   <!--====== Javascripts & Jquery ======-->
   <script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
   <script src="resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="resources/bootstrap/js/jquery.slicknav.min.js"></script>
   <script src="resources/bootstrap/js/owl.carousel.min.js"></script>
   <script src="resources/bootstrap/js/jquery-ui.min.js"></script>
   <script src="resources/bootstrap/js/main.js"></script>

   </body>
</html>