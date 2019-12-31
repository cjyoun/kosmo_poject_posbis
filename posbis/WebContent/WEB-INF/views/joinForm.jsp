<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Rapid Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="resources/intro/img/favicon.png" rel="icon">
  <link href="resources/intro/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="resources/intro/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="resources/intro/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="resources/intro/lib/animate/animate.min.css" rel="stylesheet">
  <link href="resources/intro/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="resources/intro/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="resources/intro/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="resources/intro/css/style.css" rel="stylesheet">
  
  
  
  
   <!-- Bootstrap CSS -->
  <link href="resources/sidetopbar/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="resources/sidetopbar/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="resources/sidetopbar/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="resources/sidetopbar/css/font-awesome.min.css" rel="stylesheet" />
  <!-- full calendar css-->
  <link href="resources/sidetopbar/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
  <link href="resources/sidetopbar/assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
  <!-- easy pie chart-->
  <link href="resources/sidetopbar/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen" />
  <!-- owl carousel -->
  <link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
  <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
  <!-- Custom styles -->
  <link rel="stylesheet" href="css/fullcalendar.css">
  <link href="resources/sidetopbar/css/widgets.css" rel="stylesheet">
  <link href="resources/sidetopbar/css/style.css" rel="stylesheet"> 
  <link href="resources/sidetopbar/css/style-responsive.css" rel="stylesheet" />
  <link href="resources/sidetopbar/css/xcharts.min.css" rel=" stylesheet">
  <link href="resources/sidetopbar/css/jquery-ui-1.10.4.min.css" rel="stylesheet"> 
  <!-- =======================================================
  
  

  <!-- =======================================================
    Theme Name: Rapid
    Theme URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>


<script>
  $(document).ready(function() {
    
     
         $("[name=user_pwd]").val("1234567890");
         $("[name=checkPwd2]").val("1234567890");
         
         $("[name=user_name]").val("회원가입");
         $("[name=birth]").val("19911001");
         $("[name=email]").val("tnwjd098@gmail.com");
         
         $("[name=answer]").val("1");
         $("[name=business_no]").val("123-45-12345");
         $("[name=business_name]").val("회원가입테스트 가게");
         
         $("[name=addr_detail]").val("회원가입테스드 상세주소");
         $("[name=store_tel_num]").val("123456");
        
         
         
      
         
        
         //비밀번호 확인 체크
          $(".user_pwd").keyup(function(){
             $('font[name=check]').text('');
          });
           $(".checkPwd2").keyup(function(){
              if($(".user_pwd").val()!=$(".checkPwd2").val()){
                 $('font[name=check]').text('');   
                 $('font[name=check]').html('&nbsp;암호틀림');   
              }else{
                 $('font[name=check]').text('');   
                 $('font[name=check]').html('&nbsp;암호맞음');
              }
           });
      
 
        
      
         
        
         //$(".helpA").hide();
         //a태그에 마우스오버 또는 마우스아웃 할 경우 실행할 자스 코딩 설정
         $(".help").hover(
            function(){

               $(this).append("<div class='helpA'>");
               $(".helpA").append("&nbsp;일반<br>");
               $(".helpA").append("&nbsp;&nbsp;- 비용: 무료<br>");
               $(".helpA").append("&nbsp;&nbsp;- 서비스: 점포에서 사용하는 POS의 정보를 사이트에서 원격으로 확인 가능");
               $(".helpA").append("<br>&nbsp;프리미엄<br>");
               $(".helpA").append("&nbsp;&nbsp;- 비용: 월 10,000원 (부가세 별도)<br>");
               $(".helpA").append("&nbsp;&nbsp;- 서비스: 지역별/상품별 매출현황 비교, 위치기반 메뉴 추천");
               $(".helpA").append("</div>");
            }
            ,function(){
               $(this).find(".helpA").remove();
            }
         );
         
         
        //  구 검색시 동 구하기 -------------------------------------------------------
         $("[name=addr_gu]").change(function(){
    
            //alert($(this).val());
            $("[name=addr_dong]").empty();
           

             $.ajax({ 
                   url : "/posbis/addrDongProc.do"
                   //,datatype:"json"
                   ,type : "post"   
                   ,data : "addr_gu=" + $(this).val() 
                  , success : function(addrDongList) {   
                         //$("[name=addr_dong]").append('<option value=''>--동 선택--</option>');   
                         
                         var str="--동 선택--";
                         
                      for(var i=0; i<addrDongList.length; i++){
                      
                        $("[name=addr_dong]").append('<option value='+addrDongList[i]+'>'+addrDongList[i]+'</option>');
                            
                         
                      }
                     if(addrDongList[0]!=str){
                        $("[name=addr_dong]").prepend("<option value='' selected>"+str+"</option>");   
                     }
           
                }   
                    , error : function(){
                     alert("서버 접속 실패");
                  }
             }); /*  $.ajax({  */     
           
        });/* $("[name=addr_gu]").change(function(){ */
           
           
       //  업종1 검색시 업종2 구하기 -------------------------------------------------------   
         $("[name=business_type_name1]").change(function(){
           
           /*alert($(this).val())*/
          //alert($(this).val());
            $("[name=business_type_name2]").empty();
              
            $.ajax({ 
                   url : "/posbis/businessTypeName2Proc.do"
                   ,type : "post"   
                   ,data : "business_type_name1=" + $(this).val() 
                  , success : function(businessTypeList2) {
                     
                     var str="--업종2 선택--";
                   
                   
                      
                      for(var i=0; i<businessTypeList2.length; i++){
                        $("[name=business_type_name2]").append('<option value='+businessTypeList2[i]+'>'+businessTypeList2[i]+'</option>');
                            
                         
                      }
                     if(businessTypeList2[0]!=str){
                       $("[name=business_type_name2]").prepend("<option value='' selected>"+str+"</option>");   
                    }
                      
                  }, error : function(){
                     alert("서버 접속 실패");
                    }
             }); /*  $.ajax({  */
           
           
           
        });   /* $("[name=business_type_name1]").change(function(){ */
           
         
      });/*  $(document).ready(function() { */ 
      
       
 
 
      
      
   //*************************************************************************************   
      
      function checkUserRegForm(){
     
         //회원가입 양식 빈칸체크
         if( is_empty(".user_id") ){
              alert(" 아이디 입력 요망");
              $(".user_id").val("");
              return;
         }
        if( is_empty(".user_pwd") ){
             alert("암호 입력 요망");
             $(".user_pwd").val("");
             return;
          }
        if(is_valid_pattern("[name=user_pwd]", /^[0-9]{10}$/) == false){
            alert("암호는 숫자 10개를 입력해주세요");
            return;
      }
        
        if( is_empty(".user_name") ){
             alert("성명 입력 요망");
             $(".user_name").val("");
             return;
          }
        if( is_empty(".birth") ){
             alert("생년월일 입력 요망");
             $(".birth").val("");
             return;
          }
       /*  if(is_valid_birth(".birth") == false){
            alert("생년월일 숫자 8자리 입력해주세요");
            return;
         } */
        if( is_empty(".business_no") ){
             alert("사업자번호 입력 요망");
             $(".business_no").val("");
             return;
          }
        if( is_empty(".business_name") ){
             alert("상호명 입력 요망");
             $(".business_name").val("");
             return;
          }
 
        
        if( is_empty(".addr_gu") ){
             alert("주소 체크 요망");
             $(".addr_gu").val("");
             return;
          }
        if( is_empty(".addr_dong") ){
             alert("주소 체크  요망");
             $(".addr_dong").val("");
             return;
          }
        if( is_empty(".addr_detail") ){
             alert("상세주소 입력  요망");
             $(".addr_detail").val("");
             return;
          }
        if( is_empty(".business_type_name1") ){
             alert("업종1 체크  요망");
             $(".business_type_name1").val("");
             return;
          }
        if( is_empty(".business_type_name2") ){
             alert("업종2 체크  요망");
             $(".business_type_name2").val("");
             return;
          }
        if( is_empty(".store_tel_num") ){
             alert("매장번호 입력  요망");
             $(".store_tel_num").val("");
             return;
          }
     
        if( is_empty(".rank_code") ){
             alert("회원등급 체크 요망");
             $(".rank_code").val("");
             return;
          }
        
        if( is_valid_pattern("[name=birth]", /^[0-9]{8}$/)==false ){
            alert("생년월일 형식을 벗어납니다.");
            return;
         }

     
        if( is_valid_pattern("[name=email]", /^([0-9a-zA-Z]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/)==false ){
            alert("이메일 형식을 벗어납니다.");
            return;
         }
 
         if( is_valid_pattern(".business_no", /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/)==false ){
            alert("사업자번호 형식을 벗어납니다.");
            return;
         }  
        
        if( is_empty(".agree_checkbox") ){
             alert("약관동의 체크 요망");
             $(".agree_checkbox").val("");
             return;
          }
        
        
 
         //*************************************************************************************   
         //회원가입 등록 ajax 
      alert("회원가입 등록 검사 시작5")
                  
               $.ajax({
                  url : "/posbis/joinRegProc.do"
                  , type : "post"
                  , data : $("[name=joinForm]").serialize()
                  , success : function(joinRegCnt){
                     
                     if(joinRegCnt == 1){
                        
                        alert($("[name=rank_code]:checked").val())
                        
                        if( $("[name=rank_code]:checked").val()==1){
                           alert("회원가입 완료 재 로그인해주세요!");
                           location.replace('/posbis/mainForm.do');
                           
                        }else{
                              alert("회원가입 완료 결제창으로 이동합니다!");
                              location.replace('/posbis/payForm.do');
                              
                           }
                     }
                     else{
                        alert("회원가입 실패! 관리자에게  문의 바랍니다.");   
                     } 
                  }, error : function(){
                        alert("서버 접속 실패");
                  }
               });

    
      }
   
//*************************************************************************************   
//가입취소 클릭     
    function goMainForm(){
         location.replace("/posbis/mainForm.do");
      }
      
//*************************************************************************************     
//중복확인 클릭      
    function checkOverlap(){
  
         //아이디 중복체크
   
       if( is_empty(".user_id") ){
            alert(" 아이디 입력 요망");
            $(".user_id").val("");
            return;
       }
         
         $.ajax({
            url : "/posbis/joinProc.do"
           , type : "post"
           , data : $("[name=joinForm]").serialize()
           , success : function(join_idCnt) {
              if( join_idCnt==1 ){
                 alert("이미 등록된 아이디 입니다.재 입력 바랍니다.");
              } else if(join_idCnt == 0) {
                 alert("등록가능한 아이디입니다.");
                 
              }else {
                    alert("서버 오류 발생!! 관리자에게 문의 바랍니다.");
              }
           }
           , error : function(){
                alert("서버 접속 실패");
           }
           
         });
         
      }/*  function checkOverlap(){ */
         
       
      
         
      function checkBusinessNo(){
         
 

              if( is_empty(".business_no") ){
                   alert(" 사업자번호 입력 요망");
                   $(".business_no").val("");
                   return;
              }
        
               $.ajax({
                   url : "/posbis/chekckBusinessNoProc.do"
                  , type : "post"
                  , data : $("[name=joinForm]").serialize()
                  , success : function(businessnoCnt) {
                     if( businessnoCnt==1 ){
                        alert("이미 등록된 사업자번호 입니다.재 입력 바랍니다.");
                        location.replace('/posbis/joinForm.do');
                     }else if(businessnoCnt == 0) {
                        alert("등록가능한 사업자번호 입니다3.");
      
                     }else {
                           alert("서버 오류 발생!! 관리자에게 문의 바랍니다.");
                     }
                  }, error : function(){
                       alert("서버 접속 실패");
                  }
                  
                });
     
      }  /* function checkBusinessNo(){ */
 
  	//--------------------------------------------------------
  	   //로고 클릭시
  	     function goMainForm(){
  	        //alert("메인으로 이동");
  	        location.replace("/posbis/mainForm.do");
  	     }
  		
  		//회사소개-pobis 클릭시
  		
  		function goIntroForm(){
  	        //alert("회사소개로 이동");
  	        location.replace("/posbis/introForm.do");
  	     }
  		
  		//마이페이지-매출관리
  	    function goSalesForm(){
  	       //alert("매출관리로 이동");
  	        location.replace("/posbis/salesForm.do");
  	     } 
  		//마이페이지-메뉴관리
  		function goMenuForm(){
  	        //alert("메뉴관리로 이동");
  	        location.replace("/posbis/menuForm.do");
  	     }
  		//분석현황-검색관리
  		function goPreSearchForm(){
  	        //alert("검색관리로 이동");
  	        location.replace("/posbis/preSearchForm.do");
  	     }
  		//분석현황-차트관리
  		function goPreChartForm(){
  	        //alert("차트관리로 이동");
  	        location.replace("/posbis/preChartForm.do");
  	     }
  		//내정보관리-내정보 보기
  		function goMyPageForm(){
  	        //alert("내정보 보기으로 이동");
  	        location.replace("/posbis/myPageForm.do");
  	     }

  		//qna 게시판- 질문하기
  		function goqstnRegForm(){
  	        //alert("질문하기으로 이동");
  	        location.replace("/posbis/qstnRegForm.do");
  	     }
  	    //qna 게시판- 내글보기
  		 function goQstnForm(){
  	        //alert("내글보기으로 이동");
  	        location.replace("/posbis/myQstn.do");
  	     }
  		 
  		//통합 관리
  		 function goHomePageForm(){
		    //alert("통합 관리으로 이동");
		    location.replace("/posbis/homePageForm.do");
		 }
  		//--------------------------------------------------------

  		
  		function goMessageForm(){
  		    alert("건의사항이 접수 되었습니다. 감사합니다");
  	 
  		 }
</script>

<body>
  <!--==========================
  Header
  ============================-->
  <header id="header">

    <div id="topbar">
      <div class="container">
        <div class="social-links">
          <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
          <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
          <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
          <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
        </div>
      </div>
    </div>

    <div class="container">

      <div class="logo float-left">
        <!-- Uncomment below if you prefer to use an image logo -->
        <h1 class="text-light"><a  onClick="goMainForm();" class="scrollto"><span>POSBIS</span></a></h1>
        <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
      </div>

      <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li class="drop-down"><a href="">회사소개</a>
            <ul>
              <li onClick="goIntroForm();"><a href="#">POSBIS</a></li>
            </ul>
          </li>
           
         <li class="drop-down"><a href="">마이페이지</a>
            <ul>
              <li><a onClick="goHomePageForm();">통합 관리</a></li>
              <li><a onClick="goSalesForm();">매출 관리</a></li>
              <li><a onClick="goMenuForm();">메뉴 관리</a></li>
              <li><a onClick="goMyPageForm();">내 정보 보기</a></li>
   
            </ul>
          </li>
 
           <li class="drop-down"><a href="">분석현황</a>
            <ul>
              <li><a onClick="goPreSearchForm();">검색관리</a></li>
              <li><a onClick="goPreChartForm();">차트관리</a></li>
            </ul>
          </li>
 
 
           <li class="drop-down"><a href="">Q&A게시판</a>
            <ul>
              <li><a onClick="goqstnRegForm();">질문하기</a></li>
           	  <li><a onClick="goQstnForm();">내글보기</a></li>
            </ul>
          </li>  
 
        </ul>
      </nav><!-- .main-nav -->
      
    </div>
  </header><!-- #header -->

  <!--==========================
    Intro Section
  ============================-->
  <section id="intro" class="clearfix">
    <div class="container d-flex h-100">
      <div class="row justify-content-center align-self-center">
        <div class="col-md-6 intro-info order-md-first order-last">
          <h2>Business<br>Bank In <span>Sign up</span></h2>
 
        </div>
  
        <div class="col-md-6 intro-img order-md-last order-first">
          <img src="resources/intro/img/intro-img.svg" alt="" class="img-fluid">
        </div>
      </div>

    </div>
  </section> 

<body> 
    <!--==========================
   회원가입 폼
  ============================-->
  <main id="main">
 
 
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-10"> 
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">로그인</a></li>
              <li><i class="fa fa-user-md"></i>회원가입</li>
            </ol>
          </div>
        </div>
 
   	<div class="row">
          <div class="col-lg-8">
            <section class="panel">
              <header class="panel-heading">
                 [회원가입]
              </header>
              
              <div class="panel-body">
                <form class="form-horizontal joinForm" method="post" name="joinForm"  action="/posbis/joinForm.do">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">아이디</label>
                    <div class="col-sm-6">
                      <input type="text" name="user_id" class="form-control user_id" placeholder="ID" >
                    </div>
 
							<a class="btn btn-default"onclick="checkOverlap();" title="Bootstrap 3 themes generator" >중복확인</a>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-6">
                      <input type="password" name="user_pwd" class="form-control user_pwd" maxlength="10"><br>
                      <input type="password"  name="checkPwd2" class="form-control checkPwd2" maxlength="10">
                      <span class="help-block">*숫자 10자리 입력하세요.</span>
                    </div>
          		  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">성명</label>
                    <div class="col-sm-6">
                      <input class="form-control user_name" id="focusedInput" type="text"  name="user_name" value="This is focused...">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">생년월일</label>
                    <div class="col-sm-6">
                      <input class="form-control birth" id="disabledInput" type="text" name="birth"  >
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label class="col-sm-2 control-label">이메일</label>
                    <div class="col-sm-6">
                      <input type="text" name="email" class="form-control email" placeholder="">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-lg-2 control-label">질문</label>
                    <div class="col-lg-6">
                       <select class="form-control m-bot15 question_code" name="question_code" >
                                              <option>--질문 선택--</option>
                                              <option value="1">내가 졸업한 초등학교 이름은?</option>
                                              <option value="2">나의 보물 1호는?</option>
                                              <option value="3">가장 기억에 남는 선생님의 이름은?</option>
                                              <option value="4">가장 감명깊게 본 영화는?</option>
                       </select>

                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">답변</label>
                    <div class="col-sm-6">
                      <input type="text" class="form-control answer" name="answer" >
                    </div>
                  </div>
                  
                  
                  
                  <!-- 사업장 정보 -->
                  
                   <div class="form-group">
                    <label class="col-sm-2 control-label">사업자 번호</label>
                    <div class="col-sm-6">
                      <input type="text" class="form-control business_no" name="business_no">
                     
                    </div>
					<a class="btn btn-default"onclick="checkBusinessNo();" title="Bootstrap 3 themes generator" name="checkOverlapBusinessNo" class="checkOverlapBusinessNo">사업자 번호 중복확인</a>
                  </div>
                  
                   <div class="form-group">
                    <label class="col-sm-2 control-label">상호명</label>
                    <div class="col-sm-6">
                      <input type="text" class="form-control business_name" name="business_name">
                    </div>
                  </div>
                  
                   <div class="form-group">
                    <label class="col-sm-2 control-label">주소</label>
                    <div class="col-lg-6">
                       <select class="form-control m-bot15 addr_gu" name="addr_gu">
                                              <option>--구 선택--</option>
                                              <c:forEach items="${addrListGu}" var="addrGu">
													<option value="${addrGu.addr_gu}">${addrGu.addr_gu}</option>
											  </c:forEach>
                       </select>
                       
                       <select class="form-control m-bot15 addr_dong" name="addr_dong" >
                                              <option>--동 선택--</option>
 
                       </select>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label class="col-sm-2 control-label">상세주소</label>
                    <div class="col-sm-6">
                      <input type="text" name="addr_detail" class="form-control addr_detail">
                    </div>
                  </div>
                  
                   <div class="form-group">
                    <label class="col-sm-2 control-label">업종</label>
                    <div class="col-lg-6">
                       <select class="form-control m-bot15 business_type_name1" name="business_type_name1">
                                              <option>--선택--</option>
                                              <c:forEach items="${businessTypeList1}" var="busiType1">
													<option value="${busiType1.business_type_name1}">${busiType1.business_type_name1}
													</option>
											 </c:forEach>
                       </select>
                       
                       <select class="form-control m-bot15 business_type_name2" name="business_type_name2" onchange="getbusiListname2();" >
                                              <option>--선택--</option>
  
                       </select>
                    </div>
                  </div>
              	<div class="form-group">
                    <label class="col-sm-2 control-label">매장번호</label>
                    <div class="col-sm-6">
                      <input type="text" name="store_tel_num" class="form-control store_tel_num">
                    </div>
                  </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">회원등급</label>&nbsp;
                     <div class="btn-group" data-toggle="buttons"> 
 					    <label class="btn btn-default active">
                                        <input type="radio" class="rank_code" name="rank_code" id="option1" value="1"> 일반
                                      </label>
                    <label class="btn btn-default">
                                          <input type="radio"class="rank_code" name="rank_code" id="option2" value="2"> 프리미엄
                                          
                                      </label>
                                      <br><br><span class="help-block">
                                       <br><a class="help">(월10,000원)&nbsp;&nbsp; [회원등급혜택]</a></span>
 					</div>
                  </div>
               <div class="form-group">
					<label class="col-sm-2 control-label">서비스이용약관</label>
					<div class="col-sm-6">
                         <textarea class="form-control ckeditor" name="editor1" rows="6" readonly></textarea>
                          <br><div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-info">
                                          <input type="checkbox" class="agree_checkbox" name="agree_checkbox" value=""> 약관동의
                                      </label>
 
                  </div>
       
                    </div>
				
				
		 
                 
				
				
					
 
                </div>	
                <div style="float:right">
  					<button class="btn btn-info" type="button" value="등록" onClick="checkUserRegForm();" >가입 </button> 
	 				
	 				<button class="btn btn-primary" type="reset" value="다시작성"  >다시작성 </button> 
	 				<button class="btn btn-danger" type="button" value="취소" onClick="goMainForm();" >가입취소 </button>
                </div>
                </form>

             
              
              
              
            </section>
          </div>
 
      </section>
 
    </section>
           
 </main>

  <!--==========================
    꼬리말
  ============================-->
  <footer id="footer" class="section-bg">
    <div class="footer-top">
      <div class="container">

        <div class="row">

          <div class="col-lg-6">

            <div class="row">

                <div class="col-sm-6">

                  <div class="footer-info">
                    <h3>POSBIS</h3>
                    <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus. Scelerisque felis imperdiet proin fermentum leo. Amet volutpat consequat mauris nunc congue.</p>
                  </div>

                  <!-- <div class="footer-newsletter">
                    <h4>Our Newsletter</h4>
                    <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna veniam enim veniam illum dolore legam minim quorum culpa amet magna export quem.</p>
                    <form action="" method="post">
                      <input type="email" name="email"><input type="submit"  value="Subscribe">
                    </form>
                  </div> -->

                </div>

                <div class="col-sm-6">
                  <div class="footer-links">
                    <h4>빠른 이동</h4>
                    <ul>
                      <li><a onClick="goIntroForm();">회사소개 </a></li>
                      <li><a onClick="goMainForm();">로그인</a></li>
                      <li><a onClick="goqstnRegForm();">질문하기</a></li>
                    </ul>
                  </div>

                  <div class="footer-links">
                    <h4>연락망</h4>
                    <p>
                      월드메르디앙벤쳐 2차 <br>
                      Korea, Seoul 가산디지털단지역<br>
                      용기의 방, 409호 <br>
                      <strong>Phone:</strong> +1 5589 55488 55<br>
                      <strong>Email:</strong> info@example.com<br>
                    </p>
                  </div>

                  <div class="social-links">
                    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                    <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                    <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                    <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                  </div>

                </div>

            </div>

          </div>

          <div class="col-lg-6">

            <div class="form">
              
              <h4>건의 사항</h4>
              <p>POSBIS는 고객의 말에 늘 귀기울이고 있습니다. <br>불편한 점 또는 좋은 제안이 있으시다면 언제든지 건의해 주세요. </p>
              <form action="" method="post" role="form" class="contactForm">
                <div class="form-group">
                  <input type="text" class="form-control" name="name" id="name" placeholder="성함" data-rule="minlen:2" data-msg="2자 이상 입력해 주십시오" />
                  <div class="validation"></div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="이메일" data-rule="email" data-msg="이메일을 입력해 주십시오" />
                  <div class="validation"></div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="subject" id="subject" placeholder="제목" data-rule="minlen:4" data-msg="제목을 4자 이상 입력해 주십시오" />
                  <div class="validation"></div>
                </div>
                <div class="form-group">
                  <textarea class="form-control" name="message" rows="5" data-rule="required"  placeholder="내용" data-msg="내용을 입력해 주십시오"></textarea>
                  <div class="validation"></div>
                </div>

               <!--  <div id="sendmessage">건의사항이 무사히 전달됐습니다. 감사합니다!</div>
                <div id="errormessage"></div> -->

                <div class="text-center"><button type="submit" title="Send Message" onClick="goMessageForm();">전송</button></div>
              </form>
            </div>

          </div>

          

        </div>

      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>POSBIS</strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Rapid
        -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>

 
  </footer><!-- #footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <!-- Uncomment below i you want to use a preloader -->
  <!-- <div id="preloader"></div> -->

  <!-- JavaScript Libraries -->
  <script src="resources/intro/lib/jquery/jquery.min.js"></script>
  <script src="resources/intro/lib/jquery/jquery-migrate.min.js"></script>
  <script src="resources/intro/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/intro/lib/easing/easing.min.js"></script>
  <script src="resources/intro/lib/mobile-nav/mobile-nav.js"></script>
  <script src="resources/intro/lib/wow/wow.min.js"></script>
  <script src="resources/intro/lib/waypoints/waypoints.min.js"></script>
  <script src="resources/intro/lib/counterup/counterup.min.js"></script>
  <script src="resources/intro/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="resources/intro/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="resources/intro/lib/lightbox/js/lightbox.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="resources/intro/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="resources/intro/js/main.js"></script>
  
  

</body>
</html> 