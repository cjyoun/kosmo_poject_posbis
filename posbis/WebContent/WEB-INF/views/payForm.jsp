<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>카드등록</title>
 <meta charset="UTF-8">
<meta name="description" content="loans HTML Template">
<meta name="keywords" content="loans, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link href="resources/bootstrap/img/favicon.ico" rel="shortcut icon" />

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="resources/bootstrap/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="resources/bootstrap/css/owl.carousel.min.css" />
<link rel="stylesheet" href="resources/bootstrap/css/flaticon.css" />
<link rel="stylesheet" href="resources/bootstrap/css/slicknav.min.css" />

<!-- Main Stylesheets -->
<link rel="stylesheet" href="resources/bootstrap/css/style.css" />

<!-- ------------------------------------------------------------------------------- -->


<!-- 	<link rel="shortcut icon" href="img/favicon.png">
 -->
<!-- Bootstrap CSS -->
<link href="resources/tableBoot/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="resources/tableBoot/css/bootstrap-theme.css"
	rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="resources/tableBoot/css/elegant-icons-style.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/daterangepicker.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/bootstrap-datepicker.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/bootstrap-colorpicker.css"
	rel="stylesheet" />
<!-- date picker -->

<!-- color picker -->

<!-- Custom styles -->
<link href="resources/tableBoot/css/style.css" rel="stylesheet">
<link href="resources/tableBoot/css/style-responsive.css"
	rel="stylesheet" />

<!-- =======================================================
      Theme Name: NiceAdmin
      Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
      Author: BootstrapMade
      Author URL: https://bootstrapmade.com
    ======================================================= -->
  
  
  
  <style>
.loginmaintaining {
	color: #6c757d;
    width: 11%;
    
    float: right;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
	
    text-align: right;

	border-top:1px solid #eeeeee ;

	border-left:1px solid #eeeeee ;

    border-right:1px solid #eeeeee ;

	border-bottom:1px solid #eeeeee ;    
   background-color: #f5f8fd;


}
  
  </style>
 
   <script> 
 
    
   
 //----- 등록 버튼 눌렀을 때
   function checkCardInsert(){
	   
	   if( is_empty(".credit") ){
           alert("카드 번호 입력이 필요합니다.");
           $(".credit").val("");
           return;
        }
      
        for(var i=1; i<=4; i++){   
            if(is_valid_pattern("[name=creditNum"+i+"]",/^[0-9]{4}$/) == false){
               alert(" 카드번호 4자리를 입력해주세요");
               return;
            }
          }

            if(is_valid_pattern("[name=cvc_no]",/^[0-9]{3}$/) == false){
               alert(" CVC 카드 번호 3자리를 입력해주세요");
               return;
            }


           
           if(is_valid_pattern("[name=ex_month]",/^[0-9]{2}$/) == false){
              alert("숫자 2자리를 입력해주세요");
              return;
           }
          
          if($("[name=ex_month]").val()>12 || $("[name=ex_month]").val()<1 ){
             
             alert("해당하는 월이 존재하지 않습니다");
             return;
           }
          
       if(is_valid_pattern("[name=ex_year]",/^[0-9]{2}$/) == true){
            
            var today = new Date();  
         var thisyear=today.getFullYear().toString();
         var thisyear2=thisyear.substring(2.2);   
      
      
             if($("[name=ex_year]").val()<thisyear2){
                
                alert("해당카드는 기간이 만료된 카드입니다.");
                 return;
               }
            }else{
              alert("숫자 2자리를 입력해주세요");
        return;
         }
         
 
           if(is_valid_pattern("[name=jumin_no]",/^[0-9]{6}$/) == false){
              alert(" 주민번호 숫자 6자리를 입력해주세요");
              return;
           }
          
           if(is_valid_pattern("[name=credit_pwd]",/^[0-9]{2}$/) == false){
              alert(" 비밀번호 숫자 2자리를 입력해주세요");
              return;
           }



           if(is_valid_pattern("[name=jumin_no]",/^[0-9]{6}$/) == false){
               alert(" 주민번호 숫자 6자리를 입력해주세요");
               return;
            }
//============================================================================== 유효성 검사 수정 1/31
           if($("[name=jumin_no2]").val()=='1' || $("[name=jumin_no2]").val()=='2'){
     			var year= Number('19'+$("[name=jumin_no]").val().substr(0,2));
        	}
        	else if($("[name=jumin_no2]").val()=='3' || $("[name=jumin_no2]").val()=='4'){
        		var year= Number('20'+$("[name=jumin_no]").val().substr(0,2));
           }
        	else{
            	alert("주민번호 뒷자리의 첫번쨰 자리는 1~4까지만 입력 가능합니다.")
            	return;
           }
       		var month= Number($("[name=jumin_no]").val().substr(2,2));
       		var day= Number($("[name=jumin_no]").val().substr(4,2));
       		var today = new Date();
       		var yearNow = today.getFullYear();

       		if(1900>year || year>yearNow){
       			$('font[name=jumin_no]').text('');
       			alert('생년월일을 다시 확인해주세요.');
       			return;
       		}
       		else if(year>(yearNow-14)){
       			$('font[name=jumin_no]').text('');
       			alert('생년월일을 다시 확인해주세요.');
       			return;
       		}
       		else if(month<1 || month>12){
       			$('font[name=jumin_no]').text('');
       			alert('생년월일을 다시 확인해주세요.');
       			return;
       		}
       		else if(day<1 || day>31){
       			$('font[name=jumin_no]').text('');
       			alert('생년월일을 다시 확인해주세요.');
       			return;
       		}
       		else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
       			$('font[name=jumin_no]').text('');
       			alert('생년월일을 다시 확인해주세요.');
       			return;
       		}
       		else if (month == 2) {
       			var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
       			if (day>29 || (day==29 && !isleap)) {
       					$('font[name=jumin_no]').text('');
       	       			alert('생년월일을 다시 확인해주세요.');
       					return;
       			}
       		}
//===================================================================================
	   
       //alert($("[name=payForm]").serialize());

       $.ajax({ 
           url : "/posbis/payProc.do"
           ,type : "post"   
           ,data : $("[name=payForm]").serialize()
          , success : function(insertCard) {
             

				if(insertCard == 1){
					alert("카드가 정상적으로 등록되었습니다.\n 프리미엄회원으로 정상처리 되었습니다 \n 로그인을 다시 해주세요.");
					location.replace("/posbis/mainForm.do");
				}
				
				else {
					alert("서버 오류 발생. 관리자에게 문의 바람");
				} 
              
          }, error : function(){
             alert("서버 접속 실패");
            }
     });
       
       
       
   }      
   
   //---- 취소 버튼 눌렀을 때
   function cardCancel(){
 	  
 	  if(confirm("카드 등록을 취소하시면 일반회원으로 등급이 변경/유지 됩니다. \n 정말 취소 하시겠습니까?")==false) {
				return;
			}
	  	 else{
	  		$.ajax({ 
	              url : "/posbis/payProc2.do"
	              ,type : "post"   
	              ,data : $("[name=payForm]").serialize()
	             , success : function(cardCancel) {
	                

	   				if(cardCancel == 1){
	   					alert("일반회원으로 변경됩니다.\n 로그인을 다시 해주세요.");
	   					location.replace("/posbis/mainForm.do");
	   				}
	   				else {
	   					alert("서버 오류 발생. 관리자에게 문의 바람");
	   				} 
	                 
	             }, error : function(){
	                alert("서버 접속 실패");
	               }
	        });
	       }
 	  
     
    	 
   }


 //---- 등록, 취소 외의 다른 페이지로 넘어가는 버튼 눌렀을 때  
   function elseClick(move){
	   
		if(confirm("카드 등록 없이 다른 페이지로 이동하면 일반회원으로 등급이 변경 됩니다. \n 정말 이동 하시겠습니까?")==false) {
			return;
		}
		else{
			$.ajax({ 
		          url : "/posbis/payProc2.do"
		          ,type : "post"   
		          ,data : $("[name=payForm]").serialize()
		         , success : function(cardCancel) {
		            
					if(cardCancel == 1){
						alert("일반회원으로 변경됩니다.");
						location.replace(move);
					}
					else {
						alert("서버 오류 발생. 관리자에게 문의 바람");
					} 
		             
		         }, error : function(){
		            alert("서버 접속 실패");
		           }
		    });
		}

  }
      
      
    //--------------------------------------------------------
	   //로고 클릭시
	function goMainForm() {
		//alert("메인으로 이동");
		var move = "/posbis/mainForm.do";
		elseClick(move);

		
	}

	//회사소개-pobis 클릭시

	function gobeforeSignIntroForm() {
		//alert("회사소개로 이동");
		var move = "/posbis/beforeSignIntroForm.do";
		elseClick(move);

		
	}
		//--------------------------------------------------------

		
		
		
   </script>

   </head>

 
<body>
 <!--==========================
  Header
  ============================-->
	<header class="header-section">
		<a onClick="goMainForm();" class="site-logo" style="cursor:pointer;"> 
			<img src="resources/bootstrap/img/POSBIS_logo.png" alt=""> 
		</a> 
			
		<a onClick="gobeforeSignIntroForm();" style="cursor: pointer; float: right; color: #fff; padding: 30px 100px 30px 30px">회사소개 바로 가기</a>

	</header>
	<!-- #header -->



		<!-- Page top Section end -->
	<section class="page-top-section set-bg" data-setbg="resources/bootstrap/img/page-top-bg/1.jpg">
		<div class="container"  style="margin: -25px 0 0 250px;">
			<h2 style="font-size:65px"><strong>카드등록</strong></h2>
		</div>
	</section>
	<!-- Page top Section end -->
	

 

    <!--==========================
      	결제창
    ============================-->   
   <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-7" align="center" style="margin:0 0 0 410">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	   <font color="#39485f">프리미엄 회원 결제</font>
              </header>
                
              <div class="panel-body"> 
                 <div class="container">
                  <form name = "payForm" class="form-validate form-horizontal payForm" id="feedback_form"  >
                  
 
                  <div class="form-group"> 
                    <label for="cname" class="control-label col-lg-2">카드종류 <span class="required">*</span></label>
                     <div class="col-lg-2">
                     <!--    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
                        
                        <select name="credit"  size=1 class="form-control credit"> 
                          <option value="" selected> --선택요망--</option>
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
                      
                      
                      </div>
              
                  </div>
                   
                  <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">카드번호 <span class="required">*</span></label>
                    <div class="col-lg-2">
                        <input type="text"  name="creditNum1" size=4 maxlength=4 class="form-control creditNum1" placeholder="4자리"   >
 
                      </div>
                       <div class="col-lg-2">
                        <input type="text"  name="creditNum2" size=4 maxlength=4 class="form-control creditNum2" placeholder="4자리"     >
 
                      </div> 
                       <div class="col-lg-2">
                        <input type="text"  name="creditNum3" size=4 maxlength=4 class="form-control creditNum3"  placeholder="4자리"    >
 
                      </div> 
                      <div class="col-lg-2">
                        <input type="password"  name="creditNum4" size=4 maxlength=4 class="form-control creditNum4" placeholder="4자리"    >
 
                      </div> 
 
                  </div>
                  
                   
                  <div class="form-group">
                   <label for="cname" class="control-label col-lg-2">CVC <span class="required">*</span></label>
                      <div class="col-lg-2">
                        <input type="password"  name="cvc_no" size=3 maxlength=3 class="form-control cvc_no" placeholder="3자리"    >
 
                      </div> 
                  </div>
                  
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">유효기간 <span class="required">*</span></label>
                    <div class="col-lg-2">
                        <input type="text" name="ex_month" size=2 maxlength=2  placeholder="mm" class="form-control ex_month"    >
                      </div> 
                      
                     <div class="col-lg-2">
                        <input type="text" name="ex_year" size=2 maxlength=2  placeholder="yy" class="form-control ex_year"   >
                      </div> 
                  </div>
                  
                  <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">주민번호 <span class="required">*</span></label>
          		
          		 <div class="col-lg-2">
          		<input type="text" name="jumin_no" size=5 maxlength=6  class="form-control jumin_no" >
          		</div>
          		<div class="col-lg-2">
          			<div style="float:left">
                    -&nbsp;
                    </div>
                    <div style="float:right">
                    	<div style="float:left">
                    	<input type="text" name="jumin_no2" size=1 maxlength=1  class="form-control jumin_no2"  style="width:35">
                    	</div>
                    	<div style="float:right; margin:7 10 0 5">
                    	****** 
                    	</div>
                    </div>
                    </div>
 				</div>
          			<br>
                      <div class="form-group">
                    <label for="cname" class="control-label col-lg-2">비밀번호 <span class="required">*</span></label>
                    
                    <div class="col-lg-2">
                        <input type="password" name="credit_pwd"   placeholder="앞 2자리" class="form-control credit_pwd"  size=3 maxlength=2 >
                      </div>
                    <div class="col-lg-2" style="margin:7 0 0 -77">
                    ** 
                    </div>
 
 
                  </div>
   
        		<div style="margin:30 0 0 0">
                <button class="btn btn-default" type="button" value="등록" onClick="checkCardInsert();" style="margin:0 40 0 0">등록 </button>
                <button class="btn btn-default" type="button" value="취소" onClick="cardCancel();">취소 </button>
                </div>
                
                 <%-- <input type="text" name="user_id"  value="${param.user_id}"> --%>
                </form>
			 
              </div>
              </div>
            </section>
          </div>
        
 </section>
</section>



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

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <!-- Uncomment below i you want to use a preloader -->
  <!-- <div id="preloader"></div> -->

  <!--====== Javascripts & Jquery ======-->
	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/bootstrap/js/jquery.slicknav.min.js"></script>
	<script src="resources/bootstrap/js/owl.carousel.min.js"></script>
	<script src="resources/bootstrap/js/jquery-ui.min.js"></script>
	<script src="resources/bootstrap/js/main.js"></script>
	<!-- ---------------------------------------------------------------------- -->

	<!-- javascripts -->
	<script src="resources/tableBoot/js/jquery.js"></script>
	<!-- nice scroll -->
	<script src="resources/tableBoot/js/jquery.scrollTo.min.js"></script>
	<script src="resources/tableBoot/js/jquery.nicescroll.js"
		type="text/javascript"></script>

	<!-- jquery ui -->
	<script src="resources/tableBoot/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom checkbox & radio-->
	<script type="text/javascript" src="resources/tableBoot/js/ga.js"></script>
	<!--custom switch-->
	<script src="resources/tableBoot/js/bootstrap-switch.js"></script>
	<!--custom tagsinput-->
	<script src="resources/tableBoot/js/jquery.tagsinput.js"></script>

	<!-- colorpicker -->

	<!-- bootstrap-wysiwyg -->
	<script src="resources/tableBoot/js/jquery.hotkeys.js"></script>
	<script src="resources/tableBoot/js/bootstrap-wysiwyg.js"></script>
	<script src="resources/tableBoot/js/bootstrap-wysiwyg-custom.js"></script>
	<script src="resources/tableBoot/js/moment.js"></script>
	<script src="resources/tableBoot/js/bootstrap-colorpicker.js"></script>
	<script src="resources/tableBoot/js/daterangepicker.js"></script>
	<script src="resources/tableBoot/js/bootstrap-datepicker.js"></script>
	<!-- ck editor -->
	<script type="text/javascript"
		src="resources/tableBoot/assets/ckeditor/ckeditor.js"></script>
	<!-- custom form component script for this page-->
	<script src="resources/tableBoot/js/form-component.js"></script>
	<!-- custome script for all page -->
	<script src="resources/tableBoot/js/scripts.js"></script>
  
  

</body>
</html>
 