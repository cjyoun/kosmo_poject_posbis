<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
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

</head>

<script>
//====기능 코드=======================================================================================
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
        
         
       //회원등급 일반 체크=================
			$("input:radio[name='rank_code']:radio[value='1']").prop('checked', true); 
			
			// 아이디 중복, 유효성 검사========================================
			$("[name=user_id]").change(function() {
				checkId();
			}); // 아이디 중복, 유효성 검사 끝==================================

			// 비밀번호 유효성 검사========================================
			$("[name=user_pwd]").change(function() {
				checkPwd();
			}); // 비밀번호 중복, 유효성 검사 끝==================================

			//비밀번호 확인 체크==================================
			$("[name=user_pwd2]").change(function() {
				checkPwd2();
			}); //비밀번호 확인 체크 끝==================================

			// 이름 유효성 검사========================================
			$("[name=user_name]").change(function() {

				checkName();

			}); // 이름 유효성 검사 끝==================================

			// 생년월일 유효성 검사========================================
			$("[name=birth]").change(function() {
				checkBirth();

			}); // 생년월일 유효성 검사 끝==================================

			// 이메일 유효성 검사========================================
			$("[name=email]").change(function() {
				checkEmail();

			}); // 이메일 유효성 검사 끝==================================

			//  사업자번호 중복 유효성 검사========================================
			$("[name=business_no]").change(function() {
				checkBusinessNo();

			}); // 사업자번호 유효성 검사 끝==================================

			//  사업자번호 중복 유효성 검사==================================
			$("[name=business_no]").change(function() {
				checkBusinessNo();

			}); // 사업자번호 유효성 검사 끝==================================
      
         
        
/*          //비밀번호 확인 체크
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
           }); */
      

        
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
      

    	  

	//id 유효성검사 함수=========================================
	function checkId() {
		if (is_empty("[name=user_id]")) {
			$('font[name=checkId]').text('');
			$('font[name=checkId]').attr("color", "red");
			$('font[name=checkId]').html('*필수 항목입니다.');
			$(".idAvailability").val('false');
			return;
		}

		if (is_valid_pattern("[name=user_id]", /^[a-z0-9_-]{5,10}$/) == false) {
			$('font[name=checkId]').text('');
			$('font[name=checkId]').attr("color", "red");
			$('font[name=checkId]').html('*5~10자의 영문 소문자, 숫자와 특수기호(_, -)만 사용 가능합니다.');
			$(".idAvailability").val('false');
			return;
		}

		$.ajax({
			url : "/posbis/joinCheckUserId.do",
			type : "post",
			data : $("[name=joinForm]").serialize(),
			success : function(join_idCnt) {
				if (join_idCnt == 1) {
					$('font[name=checkId]').text('');
					$('font[name=checkId]').attr("color", "red");
					$('font[name=checkId]').html('*이미 사용중인 아이디입니다.');
					$(".idAvailability").val('false');
				} else if (join_idCnt == 0) {
					$('font[name=checkId]').text('');
					$('font[name=checkId]').attr("color", "green");
					$('font[name=checkId]').html('등록 가능한 아이디입니다.');
					$(".idAvailability").val('true');
				} else {
					alert("서버 오류 발생!! 관리자에게 문의 바랍니다.");
					$(".idAvailability").val('false');
				}
			},
			error : function() {
				alert("서버 접속 실패");
				$(".idAvailability").val('false');
			}
		});
	}//id 유효성검사 함수 끝=========================================

	//비밀번호 유효성검사 함수=========================================
	function checkPwd() {

		$('font[name=checkPwd2]').text('');

		if (is_empty("[name=user_pwd]")) {
			$('font[name=checkPwd]').text('');
			$('font[name=checkPwd]').attr("color", "red");
			$('font[name=checkPwd]').html('*필수 항목입니다.');
			$(".pwdAvailability").val('false');
			return;
		}

		if (is_valid_pattern("[name=user_pwd]", /^[0-9]{4}$/) == false) {
			$('font[name=checkPwd]').text('');
			$('font[name=checkPwd]').attr("color", "red");
			$('font[name=checkPwd]').html('숫자 4자리를 입력해주세요');
			$(".pwdAvailability").val('false');
			return;
		}

		$('font[name=checkPwd]').text('');
		$(".pwdAvailability").val('true');
	}
	//비밀번호 유효성검사 함수 끝=========================================

	//비밀번호 확인체크 함수===========================================
	function checkPwd2() {
			if (is_empty("[name=user_pwd]")) {
				$('font[name=checkPwd2]').text('');
				$('font[name=checkPwd2]').attr("color", "red");
				$('font[name=checkPwd2]').html('*필수 항목입니다.');
				$(".pwdAvailability").val('false');
				return;
			}
			if ($("[name=user_pwd]").val() != $("[name=user_pwd2]").val()) {
				$('font[name=checkPwd2]').text('');
				$('font[name=checkPwd2]').attr("color", "red");
				$('font[name=checkPwd2]').html('&nbsp;*비밀번호 불일치');
				$(".pwd2Availability").val('false');
			} else {
				$('font[name=checkPwd2]').text('');
				$(".pwd2Availability").val('true');
			}
	}
	//비밀번호 확인체크 함수 끝=========================================

	//이름 유효성 검사 함수 ============================================
	function checkName() {

		$('font[name=checkName]').text('');

		if (is_empty("[name=user_name]")) {
			$('font[name=checkName]').text('');
			$('font[name=checkName]').attr("color", "red");
			$('font[name=checkName]').html('*필수 항목입니다.');
			$(".nameAvailability").val('false');
			return;
		}

		if (is_valid_pattern("[name=user_name]", /^[가-힣a-zA-Z]{1,10}$/) == false) {
			$('font[name=checkName]').text('');
			$('font[name=checkName]').attr("color", "red");
			$('font[name=checkName]').html('*한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)');
			$(".nameAvailability").val('false');
			return;
		}

		$('font[name=checkName]').text('');
		$(".nameAvailability").val('true');
	}
	//이름 유효성 검사 함수  끝============================================

	//생년월일 유효성 검사 함수 ============================================
	function checkBirth() {

		if (is_empty("[name=birth]")) {
			$('font[name=checkBirth]').text('');
			$('font[name=checkBirth]').html('*필수 항목입니다.');
			$(".bitrhAvailability").val('false');
			return;
		}

		if (is_valid_pattern("[name=birth]", /^[0-9]{8}$/) == false) {
			$('font[name=checkBirth]').text('');
			$('font[name=checkBirth]').html('숫자 8자리를 입력해주세요.');
			$(".bitrhAvailability").val('false');
			return;
		}

		var year= Number($("[name=birth]").val().substr(0,4));
		var month= Number($("[name=birth]").val().substr(4,2));
		var day= Number($("[name=birth]").val().substr(6,2));
		var today = new Date();
		var yearNow = today.getFullYear();

		if(1900>year || year>yearNow){
			$('font[name=checkBirth]').text('');
			$('font[name=checkBirth]').html('생년월일을 다시 확인해주세요.');
			$(".bitrhAvailability").val('false');
			return;
		}
		else if(year>(yearNow-14)){
			$('font[name=checkBirth]').text('');
			$('font[name=checkBirth]').html('14세 이상만 가입가능합니다.');
			$(".bitrhAvailability").val('false');
			return;
		}
		else if(month<1 || month>12){
			$('font[name=checkBirth]').text('');
			$('font[name=checkBirth]').html('생년월일을 다시 확인해주세요.');
			$(".bitrhAvailability").val('false');
			return;
		}
		else if(day<1 || day>31){
			$('font[name=checkBirth]').text('');
			$('font[name=checkBirth]').html('생년월일을 다시 확인해주세요.');
			$(".bitrhAvailability").val('false');
			return;
		}
		else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			$('font[name=checkBirth]').text('');
			$('font[name=checkBirth]').html('생년월일을 다시 확인해주세요.');
			$(".bitrhAvailability").val('false');
			return;
		}
		else if (month == 2) {
			var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			if (day>29 || (day==29 && !isleap)) {
					$('font[name=checkBirth]').text('');
					$('font[name=checkBirth]').html('생년월일을 다시 확인해주세요.');
					$(".bitrhAvailability").val('false');
					return;
			}
		}


		$('font[name=checkBirth]').text('');
		$(".bitrhAvailability").val('true');

	}
	//생년월일 유효성 검사 함수  끝============================================

	//사업자번호 유효성, 중복 검사 함수============================================
	function checkBusinessNo() {
		if (is_empty("[name=business_no]")) {
			$('font[name=checkBusinessNo]').text('');
			$('font[name=checkBusinessNo]').attr("color", "red");
			$('font[name=checkBusinessNo]').html('*필수 항목입니다.');
			$(".businessNoAvailability").val('false');
			return;
		}
		if (is_valid_pattern("[name=business_no]",
				/^[0-9]{3}-[0-9]{2}-[0-9]{5}$/) == false) {
			$('font[name=checkBusinessNo]').text('');
			$('font[name=checkBusinessNo]').attr("color", "red");
			$('font[name=checkBusinessNo]').html('사업자번호 형식에 벗어납니다.');
			$(".businessNoAvailability").val('false');
			return;
		}

		$.ajax({
			url : "/posbis/chekckBusinessNoProc.do",
			type : "post",
			data : $("[name=joinForm]").serialize(),
			success : function(businessnoCnt) {
				if (businessnoCnt == 1) {
					$('font[name=checkBusinessNo]').text('');
					$('font[name=checkBusinessNo]').attr("color", "red");
					$('font[name=checkBusinessNo]').html('이미 등록된 사업자번호입니다.');
					$(".businessNoAvailability").val('false');
				} else if (businessnoCnt == 0) {
					$('font[name=checkBusinessNo]').text('');
					$('font[name=checkBusinessNo]').attr("color", "green");
					$('font[name=checkBusinessNo]').html('등록 가능한 사업자번호입니다.');
					$(".businessNoAvailability").val('true');
				} else {
					alert("서버 오류 발생!! 관리자에게 문의 바랍니다.");
					$(".businessNoAvailability").val('false');
				}
			},
			error : function() {
				alert("서버 접속 실패");
				$(".businessNoAvailability").val('false');
			}

		});
	}
	//사업자번호 유효성, 중복 검사 함수 끝============================================
	
	//이메일 유효성 검사 함수====================================================
	function checkEmail(){
			if (is_empty("[name=email]")) {
				$('font[name=checkEmail]').text('');
				$('font[name=checkEmail]').attr("color", "red");
				$('font[name=checkEmail]').html('*필수 항목입니다.');
				$(".emailAvailability").val('false');
				return;
			}
			

			if (is_valid_pattern("[name=email]", /^([0-9a-zA-Z]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/) == false) {
					$('font[name=checkEmail]').text('');
					$('font[name=checkEmail]').attr("color", "red");
					$('font[name=checkEmail]').html('*이메일 형식을 벗어납니다.');
					$(".emailAvailability").val('false');
					return;
				}
			$(".emailAvailability").val('true');

	}

	//이메일 유효성 검사 함수  끝==================================================
	

	
	
	
	
	
	

	//가입번튼 누르면 유효성 검사 후 가입완료*************************************************************   
	function checkUserRegForm() {

			checkId();
			checkPwd();
			checkPwd2();
			checkName();
			checkBirth();
			checkEmail();
			checkBusinessNo();



	        if( is_empty("[name=question_code]") ){
				$("font[name=checkQuestion]").text('');
				$('font[name=checkQuestion]').attr("color", "red");
				$('font[name=checkQuestion]').html('*필수 항목입니다.');
				$(".questionAvailability").val('false');
	          }
	        else{
		        $("font[name=checkQuestion]").text('');
				$(".questionAvailability").val('true');
		     }

	        
	        if( is_empty("[name=answer]") ){
				$("font[name=checkAnswer]").text('');
				$('font[name=checkAnswer]').attr("color", "red");
				$('font[name=checkAnswer]').html('*필수 항목입니다.');
				$(".answerAvailability").val('false');
	          }
	        else{
		        $("font[name=checkAnswer]").text('');
				$(".answerAvailability").val('true');
		     }

			
	        if( is_empty("[name=business_name]") ){
				$("font[name=checkBusinessName]").text('');
				$('font[name=checkBusinessName]').attr("color", "red");
				$('font[name=checkBusinessName]').html('*필수 항목입니다.');
				$(".businessNameAvailability").val('false');
	          }
	        else{
		        $("font[name=checkBusinessName]").text('');
				$(".businessNameAvailability").val('true');
		     }
	 

	        
	        if( is_empty("[name=addr_gu]") ){
				$("font[name=checkAddrGu]").text('');
				$('font[name=checkAddrGu]').attr("color", "red");
				$('font[name=checkAddrGu]').html('*필수 항목입니다.');
				$(".addrGuAvailability").val('false');
	          }
	        else{
		        $("font[name=checkAddrGu]").text('');
				$(".addrGuAvailability").val('true');
			  }
	 

	        
	        if( is_empty("[name=addr_dong]") ){
				$("font[name=checkAddrDong]").text('');
				$('font[name=checkAddrDong]').attr("color", "red");
				$('font[name=checkAddrDong]').html('*필수 항목입니다.');
				$(".addrDongAvailability").val('false');
	          }
	        else{
		        $("font[name=checkAddrDong]").text('');
				$(".addrDongAvailability").val('true');
			  }
	 

	        
	        if( is_empty("[name=addr_detail]") ){
				$("font[name=checkAddrDetail]").text('');
				$('font[name=checkAddrDetail]').attr("color", "red");
				$('font[name=checkAddrDetail]').html('*필수 항목입니다.');
				$(".addrDetailAvailability").val('false');
	          }
	        else{
		        $("font[name=checkAddrDetail]").text('');
				$(".addrDetailAvailability").val('true');
			  }
	 

	        
	        if( is_empty("[name=business_type_name1]") ){
				$("font[name=checkBusinessType1]").text('');
				$('font[name=checkBusinessType1]').attr("color", "red");
				$('font[name=checkBusinessType1]').html('*필수 항목입니다.');
				$(".businessType1Availability").val('false');
	          }
	        else{
		        $("font[name=checkBusinessType1]").text('');
				$(".businessType1Availability").val('true');
			  }
	 

	        
	        if( is_empty("[name=business_type_name2]") ){
				$("font[name=checkBusinessType2]").text('');
				$('font[name=checkBusinessType2]').attr("color", "red");
				$('font[name=checkBusinessType2]').html('*필수 항목입니다.');
				$(".businessType2Availability").val('false');
	          }
	        else{
		        $("font[name=checkBusinessType2]").text('');
				$(".businessType2Availability").val('true');
			  }
	 

	        
	        if( is_empty("[name=store_tel_num]") ){
				$("font[name=checkStoreTelNum]").text('');
				$('font[name=checkStoreTelNum]').attr("color", "red");
				$('font[name=checkStoreTelNum]').html('*필수 항목입니다.');
				$(".BusinessType2Availability").val('false');
	          }
	        else{
		        $("font[name=checkStoreTelNum]").text('');
				$(".storeTelNumAvailability").val('true');
			  }


	        
	      
	        if( is_empty(".rank_code") ){
				$("font[name=checkRankCode]").text('');
				$('font[name=checkRankCode]').attr("color", "red");
				$('font[name=checkRankCode]').html('*필수 항목입니다.');
				$(".BusinessType2Availability").val('false');
				$(".rankCodeAvailability").val('false');
	          }
	        else{
				$("font[name=checkRankCode]").text('');
				$(".rankCodeAvailability").val('true');
		     }
	        
	    
	        if( is_empty(".agree_checkbox") ){
					$("font[name=checkAgree]").text('');
					$('font[name=checkAgree]').attr("color", "red");
					$('font[name=checkAgree]').html('*');
				 $(".agreeAvailability").val('false');
	          }
	        else{
				$("font[name=checkAgree]").text('');
				$(".agreeAvailability").val('true');
		     }

	        
		if(
				$(".idAvailability").val()=='true' && $(".pwdAvailability").val()=='true' && $(".pwd2Availability").val()=='true' &&
				$(".nameAvailability").val()=='true' && $(".bitrhAvailability").val()=='true' && $(".emailAvailability").val()=='true' &&
				$(".questionAvailability").val()=='true' && $(".answerAvailability").val()=='true' && $(".businessNoAvailability").val()=='true' && 
				$(".businessNameAvailability").val()=='true' && $(".addrGuAvailability").val()=='true' && $(".addrDongAvailability").val()=='true' &&
				$(".addrDetailAvailability").val()=='true' && $(".businessType1Availability").val()=='true' && $(".businessType2Availability").val()=='true' &&
				$(".storeTelNumAvailability").val()=='true' && $(".storeTelNumAvailability").val()=='true' 
				
		){
				
				//약관동의여부=================
				if( $(".agreeAvailability").val()=='true'){
						//일반회원 체크시 
						var checkedRank =$('input[name=rank_code]').filter(':checked').val();
						if(checkedRank=="1"){
								var joinConfirm = confirm('일반 회원으로 가입 하시겠습니까? \n (일부 서비스 이용이 제한될 수 있습니다.)');
							   if (joinConfirm) {
								 //회원가입 등록 ajax 
									//alert("회원가입 등록 검사 시작5")
							
									$.ajax({
										url : "/posbis/joinRegProc.do",
										type : "post",
										data : $("[name=joinForm]").serialize(),
										success : function(joinRegCnt) {
							
											if (joinRegCnt == 1) {
							
												//alert($("[name=rank_code]:checked").val())
							
													alert("회원가입 완료. 로그인해주세요.");
													location.replace('/posbis/mainForm.do');
							
											} else {
												alert("회원가입 실패");
											}
										},
										error : function() {
											alert("서버 접속 실패");
										}
									}); 
							   }
						}
						else if(checkedRank=="2"){
							var joinPreConfirm = confirm('프리미엄 회원으로 가입 완료하시겠습니까? \n (확인시 결제창으로 이동됩니다.)');
							   if (joinPreConfirm) {
								 //회원가입 등록 ajax 
									//alert("회원가입 등록 검사 시작5")
							
									$.ajax({
										url : "/posbis/joinRegProc.do",
										type : "post",
										data : $("[name=joinForm]").serialize(),
										success : function(joinRegCnt) {
							
											if (joinRegCnt == 1) {
							
													alert("프리미엄 회원가입 완료. 결제창으로 이동합니다.");
													document.joinForm.submit();
							
											} else {
												alert("회원가입 실패");
											}
										},
										error : function() {
											alert("서버 접속 실패");
										}
									}); 
							   }
						}
						
				}//약관동의여부 끝=================
				
				else{ alert("약관에 동의 해주세요");}

		}
		else{
			alert("입력 양식을 다시 확인해주세요");
		}

	}

	//*************************************************************************************   
	//가입취소 클릭     
	function goMainForm() {
		location.replace("/posbis/mainForm.do");
	}
	//*************************************************************************************     

	
//====기능 코드 끝=======================================================================================
	
	
	
	
	
	
	//--------------------------------------------------------------------------------------------------

	//로고 클릭시
	function goMainForm() {
		//alert("메인으로 이동");
		location.replace("/posbis/mainForm.do");
	}

	//회사소개-pobis 클릭시

	function gobeforeSignIntroForm() {
		//alert("회사소개로 이동");
		location.replace("/posbis/beforeSignIntroForm.do");
	}

</script>

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
	<section class="page-top-section set-bg"
		data-setbg="resources/bootstrap/img/page-top-bg/1.jpg">
		<div class="container">
			<h2>회원가입</h2>
			<nav class="site-breadcrumb">
				<a class="sb-item" href="#">회원가입</a> <span class="sb-item active">About us</span>
			</nav>
		</div>
	</section>
	<!-- Page top Section end -->



	<!--==========================
   회원가입 폼
  ============================-->
<body>
	<br>
	<main id="main">
	<section id="main-content">
		<section class="wrapper" >
			<div class="col-lg-6" align="center">
				<section class="panel">
					<header class="panel-heading">
						<a href="">회원가입</a>
					</header>
					<div class="panel-body">

						<div class="container">
							<form class="form-horizontal joinForm" method="post"
								name="joinForm" action="/posbis/payForm.do">
								<div class="form-group">
									<br> <label class="col-sm-2 control-label">아이디</label>
									<div class="col-sm-6">

										<input type="text" name="user_id" class="form-control user_id" placeholder="ID"> 
										<font name="checkId" size="2"></font>
									</div>

									<!-- <a class="btn btn-default"onclick="checkOverlap();" title="Bootstrap 3 themes generator" >중복확인</a>  -->
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">비밀번호</label>
									<div class="col-sm-6">
										<input type="password" name="user_pwd"
											class="form-control user_pwd" maxlength="10"
											placeholder="숫자 4자리"> <font name="checkPwd" size="2"
											color="red"></font> <br> <input type="password"
											name="user_pwd2" class="form-control user_pwd2"
											maxlength="10">
										<!-- <span class="help-block">*숫자 10자리 입력하세요.</span> -->
										<font name="checkPwd2" size="2" color="red"></font>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">성명</label>
									<div class="col-sm-6">
										<input class="form-control user_name" id="focusedInput" type="text" maxlength="10" name="user_name"> 
										<font name="checkName" size="2" color="red"></font>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">생년월일</label>
									<div class="col-sm-6">
										<input class="form-control birth" id="disabledInput" type="text" maxlength=8 name="birth" placeholder="숫자 8자리">
										<font name="checkBirth" size="2" color="red"></font>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">이메일</label>
									<div class="col-sm-6">
										<input type="text" name="email" class="form-control email" placeholder=""> 
										<font name="checkEmail" size="2" color="red"></font>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">질문</label>
									<div class="col-lg-6">
										<select class="form-control m-bot15 question_code"
											name="question_code">
											<option value=''>---질문을 선택해주세요---</option>
											<option value="1">내가 졸업한 초등학교 이름은?</option>
											<option value="2">나의 보물 1호는?</option>
											<option value="3">가장 기억에 남는 선생님의 이름은?</option>
											<option value="4">가장 감명깊게 본 영화는?</option>
										</select> 
										<font name="checkQuestion" size="2" color="red"></font>

									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">답변</label>
									<div class="col-sm-6">
										<input type="text" class="form-control answer" name="answer">
										<font name="checkAnswer" size="2" color="red"></font>
									</div>
								</div>



								<!-- 사업장 정보 -->

								<div class="form-group">
									<label class="col-sm-2 control-label">사업자 번호</label>
									<div class="col-sm-6">
										<input type="text" class="form-control business_no"
											name="business_no" maxlength="12" placeholder="000-00-00000">
										<font name="checkBusinessNo" size="2" color="red"></font>

									</div>
									<!-- <a class="btn btn-default"onclick="checkBusinessNo();" title="Bootstrap 3 themes generator" name="checkOverlapBusinessNo" class="checkOverlapBusinessNo">사업자 번호 중복확인</a> -->
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">상호명</label>
									<div class="col-sm-6">
										<input type="text" class="form-control business_name" name="business_name"> 
										<font name="checkBusinessName" size="2" color="red"></font>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">주소</label>
									<div class="col-lg-6">
										<select class="form-control m-bot15 addr_gu" name="addr_gu">
											<option value=''>--구 선택--</option>
											<c:forEach items="${addrListGu}" var="addrGu">
												<option value="${addrGu.addr_gu}">${addrGu.addr_gu}</option>
											</c:forEach>
										</select> 
										<font name="checkAddrGu" size="2" color="red"></font> 
										
										<select	class="form-control m-bot15 addr_dong" name="addr_dong">
											<option value=''>--동 선택--</option>

										</select> 
										<font name="checkAddrDong" size="2" color="red"></font>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">상세주소</label>
									<div class="col-sm-6">
										<input type="text" name="addr_detail" class="form-control addr_detail"> 
										<font name="checkAddrDetail" size="2" color="red"></font>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">업종</label>
									<div class="col-lg-6">
										<select class="form-control m-bot15 business_type_name1" name="business_type_name1">
											<option value=''>--선택--</option>
											<c:forEach items="${businessTypeList1}" var="busiType1">
												<option value="${busiType1.business_type_name1}">${busiType1.business_type_name1}
												</option>
											</c:forEach>
										</select> 
										<font name="checkBusinessType1" size="2" color="red"></font>

										<select class="form-control m-bot15 business_type_name2" name="business_type_name2" onchange="getbusiListname2();">
											<option value=''>--선택--</option>

										</select> 
										<font name="checkBusinessType2" size="2" color="red"></font>

									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">매장전화번호</label>
									<div class="col-sm-6">
										<input type="text" name="store_tel_num"	class="form-control store_tel_num"> 
										<font name="checkStoreTelNum" size="2" color="red"></font>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">회원등급</label>&nbsp;
									<div class="btn-group" data-toggle="buttons">
										<label class="btn btn-default active"> 
											<input type="radio" class="rank_code" name="rank_code" id="option1"	value="1"> 일반
										</label> 
										<label class="btn btn-default"> 
											<input type="radio"	class="rank_code" name="rank_code" id="option2" value="2"> 프리미엄
										</label> 
										<font name="checkRankCode" size="2" color="red"></font> 
										</div>
										<br>
										<br>
										<span class="help-block"> <br>
										<a >(월10,000원)&nbsp;&nbsp; [회원등급별혜택]</a></span>
										<div class='helpA' style="text-align:left; width:420">
						               일반<br>
						               - 비용: 무료<br>
						               - 서비스: 점포에서 사용하는 POS의 정보를 사이트에서 원격으로 확인 가능<br>
						               프리미엄<br>
						               - 비용: 월 10,000원 (부가세 별도)<br>
						               - 서비스: 지역별/상품별 매출현황 비교, 위치기반 메뉴 추천
						               </div>
									
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">서비스이용약관</label>
									<div class="col-sm-6">
										<textarea class="form-control" name="editor1"
											rows="6" readonly></textarea>
										<br>
										<div class="btn-group" data-toggle="buttons">

											<font name="checkAgree" size="2" color="red"></font> <label
												class="btn btn-info"> <input type="checkbox"
												class="agree_checkbox" name="agree_checkbox" value="">
												약관동의
											</label> 
											
											<input type="hidden" class="idAvailability"> 
											<input type="hidden" class="pwdAvailability"> 
											<input type="hidden" class="pwd2Availability"> 
											<input type="hidden" class="nameAvailability"> 
											<input type="hidden" class="bitrhAvailability"> 
											<input type="hidden" class="emailAvailability"> 
											<input type="hidden" class="questionAvailability"> 
											<input type="hidden" class="answerAvailability"> 
											<input type="hidden" class="businessNoAvailability"> 
											<input type="hidden" class="businessNameAvailability"> 
											<input type="hidden" class="addrGuAvailability"> 
											<input type="hidden" class="addrDongAvailability"> 
											<input type="hidden" class="addrDetailAvailability"> 
											<input type="hidden" class="businessType1Availability"> 
											<input type="hidden" class="businessType2Availability"> 
											<input type="hidden" class="storeTelNumAvailability"> 
											<input type="hidden" class="rankCodeAvailability"> 
											<input type="hidden" class="agreeAvailability">

										</div>

									</div>








								</div>
								<div style="float: right">
									<button class="btn btn-info" type="button" value="등록"
										onClick="checkUserRegForm();">가입</button>

									<button class="btn btn-primary" type="reset" value="다시작성">다시작성
									</button>
									<button class="btn btn-danger" type="button" value="취소"
										onClick="goMainForm();">가입취소</button>
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
	<footer class="footer-section">
		<div class="container">
			<img class="footer-logo" src="resources/bootstrap/img/POSBIS_logo.png" alt="">
			<div class="row">

				<div class="footer-widget">

					<p>Cras fermentum odio eu feugiat lide par naso tierra. Justo
						eget nada terra videa magna derita valies darta donna mare
						fermentum iaculis eu non diam phasellus. Scelerisque felis
						imperdiet proin fermentum leo. Amet volutpat consequat mauris nunc
						congue.</p>
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
