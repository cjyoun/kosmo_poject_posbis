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
  
 
   <head>
 
  <style>
  .loginmaintaining {

    display: inline-block;
	color: #6c757d;
    width: 21%;
    
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
	
    text-align: left;

	border-top:1px solid #eeeeee ;

	border-left:1px solid #eeeeee ;

    border-right:1px solid #eeeeee ;

	border-bottom:1px solid #eeeeee ;

    display: inline-block;
    
   background-color: #f5f8fd;

}
  
  
  </style>
   <script src="jquery-1.11.0.min.js"></script>
  <script>



	   $(document).ready(function() {

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
		   
	 

		   $(".newPwd").keyup(function(){
	           $('font[name=check]').text('');
	        });
	         $(".checkPwd").keyup(function(){
	            if($(".newPwd").val()!=$(".checkPwd").val()){
	               $('font[name=check]').text('');   
	               $('font[name=check]').html('&nbsp;암호틀림');   
	            }else{
	               $('font[name=check]').text('');   
	               $('font[name=check]').html('&nbsp;암호맞음');
	            }
	         });

	     	// 라디오 버튼의 value 값 1과 2 중에서 저장된 유저의 rank_code 값에 따라 라디오 버튼 체크	
		 	   var st = ${myNStoreInfo[0].rank_code};
		 	   $('input:radio[name=rank_code]:input[value=' + st + ']').attr("checked", true);
	
	       
	       
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
	    

	    	
 


	    
	 // 회원정보 수정 데이터 저장 (저장 버튼 눌렀을 때 실행되는 함수)	
	      function checkUserRegForm(){
	    	  //alert($("[name=infoUpdateForm]").serialize());
	    	  
	    	  if( is_empty(".user_pwd") ){
	              alert("암호 입력 요망");
	              $(".user_pwd").val("");
	              return;
	           }
	         if(is_valid_pattern("[name=user_pwd]", /^[0-9]{1,10}$/) == false){
	             alert("암호는 숫자 10개 이하로 입력해주세요");
	             return;
	  			}
			 if($("[name=newPwd]") == ""){
	        	 if(is_valid_pattern("[name=newPwd]", /^[0-9]{10}$/) == false){
	           	  alert("새로운 암호는 숫자 10개를 입력해주세요");
	           	  return;
	  			}
			 }

	         if($(".newPwd").val()!=$(".checkPwd").val()){
	        	 alert("비밀번호를 확인해 주세요");
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

	    	  $.ajax({ 
	              url : "/posbis/infoUpdateProc.do"
	              ,type : "post"   
	              ,data : $("[name=infoUpdateForm]").serialize()
	             , success : function(updateSuccess) {
	                

					if(updateSuccess == 1){
						alert("프리미엄 등급으로 변경되었습니다.\n 카드가 등록 되어 있지 않아 카드 등록페이지로 이동합니다.");
						location.replace("/posbis/payForm.do");
						//location.replace("/posbis/mainForm.do");
						
					}
					else if (updateSuccess == 2){
						alert("프리미엄 등급으로 변경되었습니다.\n 로그인을 다시 해주세요.");
						location.replace("/posbis/mainForm.do");
					}
					else if (updateSuccess == 3){
						alert("서버 오류 발생. 관리자에게 문의 바람1");
					}
					else if (updateSuccess == 4){
						alert("일반 등급으로 변경되었습니다.\n 로그인을 다시 해주세요.");
						location.replace("/posbis/mainForm.do");
					}
					else if (updateSuccess == 5){
						alert("일반 등급으로 변경되었습니다.\n 등록된 카드는 삭제됩니다. 로그인을 다시 해주세요.");
						location.replace("/posbis/mainForm.do");
					}
					else if (updateSuccess == 6){
						alert("회원정보가 수정되었습니다.");
						location.replace("/posbis/myPageForm.do");
					}
					else {
						alert("서버 오류 발생. 관리자에게 문의 바람2");
					} 
	                 
	             }, error : function(){
	                alert("서버 접속 실패");
	               }
	        });
	          

	      }




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
   	//분석현황-검색관리 (프리미엄으로 이동 시일반 회원은 프리미엄 부분에 들어가지 못함)
   		function goPreSearchForm(){
   	        //alert("검색관리로 이동");
   			var rank_code = ${rank_code};
	         if(rank_code == 2){
	        	 location.replace("/posbis/preSearchForm.do");
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
   		//분석현황-차트관리 (프리미엄으로 이동 시일반 회원은 프리미엄 부분에 들어가지 못함)
   		function goPreChartForm(){
   	        //alert("차트관리로 이동");
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
		 function goMyQstnForm(){
	        //alert("내글보기으로 이동");
	        location.replace("/posbis/myQstn.do");
	     }
		//qna 게시판- 전체 질문보기
		 function goQstnForm(){
	        //alert("전체 질문보기으로 이동");
	        location.replace("/posbis/qstnForm.do");
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
   
   </head>

   <body> 
   <!--==========================
  Header
  ============================-->
  <header id="header">

         <div id="topbar">
           <div class="container">
          
           </div>
         </div>

         <div class="container">

           <div class="logo float-left">
             <!-- Uncomment below if you prefer to use an image logo -->
             <h1 style="cursor:pointer"  class="text-light"><a  onClick="goMainForm();" class="scrollto"><span>POSBIS</span></a></h1>
             <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
           </div>
  
          		<br>
          		<div style="float:right" class= "loginmaintaining">
    
                      <a style="float:right"><i class="icon_profile"></i>&nbsp;&nbsp;&nbsp;<b>${user_id}</b> 님 반갑습니다</a><br><br> 
                        
                       <label class="btn btn-default"><a onClick="goMyPageForm();"><i  ></i>&nbsp;&nbsp; 내정보 보기 </a></label>
                          <div style="float:right" >
                      <label class="btn btn-default"><a onClick="goMainForm();"><i class="icon_key_alt"></i>&nbsp;&nbsp;로그아웃</a></label>
 
                   </div>     
                
                </div>
                <br><br><br><br><br><br>
           
              

           <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li style="cursor:pointer"  class="drop-down"><a href="">회사소개</a>
            <ul>
              <li style="cursor:pointer" onClick="goIntroForm();"><a href="#">POSBIS</a></li>
            </ul>
          </li>
		     <li style="cursor:pointer"  class="drop-down"><a href="">마이페이지</a>
		            <ul>
		              <li style="cursor:pointer" ><a onClick="goHomePageForm();">통합 관리</a></li>
		              <li style="cursor:pointer" ><a onClick="goSalesForm();">매출 관리</a></li>
		              <li style="cursor:pointer" ><a onClick="goMenuForm();">메뉴 관리</a></li>
		              <li style="cursor:pointer" ><a onClick="goMyPageForm();">내 정보 보기</a></li>
 
		            </ul>
		          </li>
           <li style="cursor:pointer"  class="drop-down"><a href="">분석현황</a>
            <ul>
              <li style="cursor:pointer" ><a onClick="goPreSearchForm();">검색관리</a></li>
              <li style="cursor:pointer" ><a onClick="goPreChartForm();">차트관리</a></li>
            </ul>
          </li>
    
           <li style="cursor:pointer"  class="drop-down"><a href="">Q&A게시판</a>
            <ul>
              <li style="cursor:pointer" ><a onClick="goqstnRegForm();">질문하기</a></li>
           	  <li style="cursor:pointer" ><a onClick="goMyQstnForm();">내글보기</a></li>
           	  <li style="cursor:pointer" ><a onClick="goQstnForm();">목록보기</a></li>
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
          <h2>MYPAGE</h2>
 
        </div>
  <!-- 
        <div class="col-md-6 intro-img order-md-last order-first">
          <img src="resources/intro/img/intro-img.svg" alt="" class="img-fluid">
        </div> -->
      </div>

    </div>
  </section> 
 

   <!--==========================
      회원가입 수정
    ============================-->
 <br><br>
 <main id="main">
   <section id="main-content">
   <section class="wrapper">
     <div class="row">
           <div class="col-lg-10" align="center">
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">내정보관리</a></li>
              <li><i class="fa fa-user-md"></i>내정보수정</li>
            </ol>
               </div>
        </div>
    	  <div class="col-lg-6" align="center">
            <section class="panel">
              <header class="panel-heading">
                	<a href="">내정보수정</a>
              </header>
			<div class="panel-body"> 
			
      <div class="container">
          			<div  class="form-group">
  
    <form class="infoUpdateForm" method="post" name="infoUpdateForm" action="/posbis/infoUpdateForm.do">
 
 
   <section class="panel">
     <header class="panel-heading">
       	대표자 정보
     </header>
 
   <table class="table table-hover">
 
  <tr>
   <td> 아이디 </td>
   <td>
      <input type = "text" name="user_id" class="user_id" readonly value="${myNStoreInfo[0].user_id}"/>
   	
    </td>
    
  </tr>
  
    <tr>
     <td> 현재 비밀번호 </td>
     <td> <input type = "password" name="user_pwd" class="user_pwd" /> </td>
   </tr>

  <tr>
   <td> 새 비밀번호 </td>
   <td> <input type = "password" name="newPwd" class="newPwd" /> </td>
  </tr>

  <tr>
   <td> 새 비밀번호 확인 </td>
    <td> <input type = "password"  name="checkPwd" class="checkPwd"/><font name="check" size="2" color="red"></font> </td>
  </tr>

  <tr>
   <td> 성명 </td>
   <td> <input type = "text" name="user_name" class="user_name" value="${myNStoreInfo[0].user_name}"/> </td>
  </tr>
  
  <tr>
   <td> 생년월일 </td>
   <td> 
        <input type="text" class="birth" id="birth" name="birth"  maxlength="8" readonly value="${myNStoreInfo[0].birth}" ></td>
   
   </tr>


  <tr>
   <td> 이메일 </td>
   <td>
    <input type = "text" name="email" class="email" value="${myNStoreInfo[0].email}"/>
   </td>
  </tr>
</table>
</section>
</div>  
 

 <br><br><br>
 
 
  
  <section class="panel">
    <header class="panel-heading">
       	사업장 정보
     </header>

     <table class="table table-hover">  
  <tr>
   <td> 사업자 번호 </td>
      <td> <input type = "text" name="business_no" class="business_no" readonly value="${myNStoreInfo[0].business_no}"/> </td>
   
   </tr>

  <tr>
   <td> 상호명 </td>
   <td> <input type = "text" name="business_name" class="business_name"value="${myNStoreInfo[0].business_name}"/> </td>
  </tr>

  <tr>
   <td> 주소 </td>
   <td>
    <select name="addr_gu" class="addr_gu">
        <!--  onchange="getAddrDong()" -->
        	<option value="${myNStoreInfo[0].addr_gu}">${myNStoreInfo[0].addr_gu}</option>
           <c:forEach items="${addrListGu}" var="addrGu">
              <option value="${addrGu.addr_gu}">${addrGu.addr_gu}</option>
           </c:forEach>

     </select> 
     
     <select name="addr_dong" class="addr_dong">
                 <option value="${myNStoreInfo[0].addr_dong}" selected>${myNStoreInfo[0].addr_dong}</option>
       
         
     </select>
  </td>
  </tr>
  
  <tr>
   <td> 상세주소 </td>
   <td>
    <input type = "text" size=50 name="addr_detail" class="addr_detail" value="${myNStoreInfo[0].addr_detail}"/>
   </td>
  </tr>

  <tr>
   <td> 업종 </td>
   <td>
    <select name="business_type_name1" class="business_type_name1">
          <option value="${myNStoreInfo[0].business_type_name1}">${myNStoreInfo[0].business_type_name1}</option>
          <c:forEach items="${businessTypeList1}" var="busiType1">
             <option value="${busiType1.business_type_name1}">${busiType1.business_type_name1}
             </option>
          </c:forEach>
          
    </select> <select name="business_type_name2" class="business_type_name2" onchange="getbusiListname2();">
           <option value="${myNStoreInfo[0].business_type_name2}">${myNStoreInfo[0].business_type_name2}</option>
 
    </select>
  </td>
  </tr>

  <tr>
   <td> 매장 번호 </td>
   <td>
    <input type = "text" size = "12" name="store_tel_num" class="store_tel_num" value="${myNStoreInfo[0].store_tel_num}"/>&nbsp;&nbsp;*숫자만 입력하세요
   </td>
  </tr>
 <tr>
       <td>회원등급</td>
       <td><input type="radio" name="rank_code" class="rank_code" value="1">일반 
             <input type="radio" name="rank_code"  class="rank_code" value="2">프리미엄 &nbsp;&nbsp;(월 10,000원)&nbsp;&nbsp; 
             <a class="help">[회원등급혜택]</a>
       </td>
  </tr>
    

</table>
 <br><br><br>
   <div style="height:20;"></div>

   <input type="button" value="저장" onclick="checkUserRegForm();">
   <input type="reset" value="다시 작성">
   <input type="button" value="취소" onclick="goMyPageForm();">

</form>
 
 </div>
 </div>
 </div>
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