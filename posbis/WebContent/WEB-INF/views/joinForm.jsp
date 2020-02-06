<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
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


			$("[name=business_open]").change(function(){
		           overLapTime();
		         
		        });

	        $("[name=business_close]").change(function(){
	           overLapTime();
	        });
         
        
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
       /*   $(".help").hover(
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
          */
         
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


		//--------------------------------------------------open close 시간===========================
       /*  $("[name=business_open]").change(function(){
            //alert($("[name=business_open]").find("option:selected").index());
            k=$("[name=business_open]").find("option:selected").index();
       	 	$("[name=business_close] option:eq("+k+")").hide();
        }); */
           
         
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
			$('font[name=checkBusinessNo]').html('*사업자번호 형식에 벗어납니다.');
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
					$('font[name=checkBusinessNo]').html('*이미 등록된 사업자번호입니다.');
					$(".businessNoAvailability").val('false');
				} else if (businessnoCnt == 0) {
					$('font[name=checkBusinessNo]').text('');
					$('font[name=checkBusinessNo]').attr("color", "green");
					$('font[name=checkBusinessNo]').html('*등록 가능한 사업자번호입니다.');
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
	

	
    
	 //영업시간 유효성 검사 함수==================================================      
	  function checkBusinessTime(){   
	     if(is_empty("[name=business_open]") || is_empty("[name=business_close]")){
	        alert("Open시간 또는 Close시간 확인 바랍니다.")
	        $("[name=business_open] option:eq(0)").attr("selected","selected");
	        $("[name=business_close] option:eq(0)").attr("selected","selected");
	        return;
	     }
	 
	   }
	  //영업시간 유효성 검사 함수  끝==================================================   
	     
	     
	   //동일 시간 체크 유효성 검사 함수==============================================ㄴ====
	  function overLapTime(){
	     if($("[name=business_open]").find("option:selected").val()==$("[name=business_close]").find("option:selected").val()){
	        alert("동일한 시간을 입력하셨습니다. 재입력 바랍니다.");
	 
	        $("[name=business_open] option:eq(0)").attr("selected","selected");
	        $("[name=business_close] option:eq(0)").attr("selected","selected");

	     }
	  }
	
	
	
	

	//가입번튼 누르면 유효성 검사 후 가입완료*************************************************************   
	function checkUserRegForm() {

			checkId();
			checkPwd();
			checkPwd2();
			checkName();
			checkBirth();
			checkEmail();
			checkBusinessNo();
			checkBusinessTime();


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
	<section class="page-top-section set-bg" data-setbg="resources/bootstrap/img/page-top-bg/1.jpg">
		<div class="container"  style="margin: -25px 0 0 250px;">
			<h2 style="font-size:65px"><strong>회원가입</strong></h2>
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
			<div class="col-lg-7" align="center" style="margin:0 0 0 410">
				<section class="panel">
					<header class="panel-heading" style="background-color:#7f9ed436;">
						<font color="#39485f">회원가입</font>
					</header>
					<div class="panel-body">

						<div class="container">
							<form class="form-horizontal joinForm" method="post" 
								name="joinForm" action="/posbis/payForm.do">
								<div class="form-group">
									<br> <label class="col-sm-2 control-label" style="margin:0 0 0 100">아이디</label>
									<div class="col-sm-6">

										<input type="text" name="user_id" class="form-control user_id" placeholder="ID"> 
										<font name="checkId" size="2" style="float:left; margin:5 0 0 0"></font>
									</div>

									<!-- <a class="btn btn-default"onclick="checkOverlap();" title="Bootstrap 3 themes generator" >중복확인</a>  -->
								</div>
								<div class="form-group" style="border-bottom: 0px;">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">비밀번호</label>

									<div class="col-sm-6">
										<input type="password" name="user_pwd" class="form-control user_pwd" maxlength="10"	placeholder="숫자 4자리"> 
										<font name="checkPwd" size="2" color="red" style="float:left; margin:5 0 0 0"></font> 																				
									</div>

								</div>
								
								<div class="form-group" >
									
									<label class="col-sm-3 control-label" style="margin:0 0 0 15">비밀번호 확인</label>

									<div class="col-sm-6">
										<input type="password" name="user_pwd2" class="form-control user_pwd2" maxlength="10">
										<!-- <span class="help-block">*숫자 10자리 입력하세요.</span> -->
										<font name="checkPwd2" size="2" color="red" style="float:left; margin:5 0 0 0"></font>
									</div>
									
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">성명</label>
									<div class="col-sm-6">
										<input class="form-control user_name" id="focusedInput" type="text" maxlength="10" name="user_name"> 
										<font name="checkName" size="2" color="red" style="float:left; margin:5 0 0 0"></font>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">생년월일</label>
									<div class="col-sm-6">
										<input class="form-control birth" id="disabledInput" type="text" maxlength=8 name="birth" placeholder="숫자 8자리">
										<font name="checkBirth" size="2" color="red" style="float:left; margin:5 0 0 0"></font>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">이메일</label>
									<div class="col-sm-6">
										<input type="text" name="email" class="form-control email" placeholder=""> 
										<font name="checkEmail" size="2" color="red" style="float:left; margin:5 0 0 0"></font>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label" style="margin:0 0 0 100">질문</label>
									<div class="col-lg-6">
										<select class="form-control m-bot15 question_code"
											name="question_code">
											<option value=''>---질문을 선택해주세요---</option>
											<option value="1">내가 졸업한 초등학교 이름은?</option>
											<option value="2">나의 보물 1호는?</option>
											<option value="3">가장 기억에 남는 선생님의 이름은?</option>
											<option value="4">가장 감명깊게 본 영화는?</option>
										</select> 
										<font name="checkQuestion" size="2" color="red" style="float:left; margin:-10 0 0 0"></font>

									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">답변</label>
									<div class="col-sm-6">
										<input type="text" class="form-control answer" name="answer">
										<font name="checkAnswer" size="2" color="red" style="float:left; margin:5 0 0 0"></font>
									</div>
								</div>



								<!-- 사업장 정보 -->

								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">사업자 번호</label>
									<div class="col-sm-6">
										<input type="text" class="form-control business_no"
											name="business_no" maxlength="12" placeholder="000-00-00000">
										<font name="checkBusinessNo" size="2" color="red" style="float:left; margin:5 0 0 0"></font>

									</div>
									<!-- <a class="btn btn-default"onclick="checkBusinessNo();" title="Bootstrap 3 themes generator" name="checkOverlapBusinessNo" class="checkOverlapBusinessNo">사업자 번호 중복확인</a> -->
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">상호명</label>
									<div class="col-sm-6">
										<input type="text" class="form-control business_name" name="business_name"> 
										<font name="checkBusinessName" size="2" color="red" style="float:left; margin:5 0 0 0"></font>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">주소</label>
									<div class="col-lg-6">
										<select class="form-control m-bot15 addr_gu" name="addr_gu">
											<option value=''>--구 선택--</option>
											<c:forEach items="${addrListGu}" var="addrGu">
												<option value="${addrGu.addr_gu}">${addrGu.addr_gu}</option>
											</c:forEach>
										</select> 
										<font name="checkAddrGu" size="2" color="red" style="float:left; margin:-10 0 15 0"></font> 
										
										<select	class="form-control m-bot15 addr_dong" name="addr_dong">
											<option value=''>--동 선택--</option>

										</select> 
										<font name="checkAddrDong" size="2" color="red" style="float:left; margin:-10 0 0 0"></font>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">상세주소</label>
									<div class="col-sm-6">
										<input type="text" name="addr_detail" class="form-control addr_detail"> 
										<font name="checkAddrDetail" size="2" color="red" style="float:left; margin:5 0 0 0"></font>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">업종</label>
									<div class="col-lg-6">
										<select class="form-control m-bot15 business_type_name1" name="business_type_name1">
											<option value=''>--선택--</option>
											<c:forEach items="${businessTypeList1}" var="busiType1">
												<option value="${busiType1.business_type_name1}">${busiType1.business_type_name1}
												</option>
											</c:forEach>
										</select> 
										<font name="checkBusinessType1" size="2" color="red" style="float:left; margin:-10 0 15 0"></font>

										<select class="form-control m-bot15 business_type_name2" name="business_type_name2" onchange="getbusiListname2();">
											<option value=''>--선택--</option>

										</select> 
										<font name="checkBusinessType2" size="2" color="red" style="float:left; margin:-10 0 0 0"></font>

									</div>
								</div>
								
								<div class="form-group">
									<label class="col-lg-2 control-label" style="margin:0 0 0 100">OPEN시간</label>
									<div class="col-lg-6">
										<select class="form-control m-bot15 question_code"
											name="business_open">
											<option value=''>---OPEN시간을 선택해주세요---</option>
											<option value="00">00 시</option>
											<option value="01">01 시</option>
											<option value="02">02 시</option>
											<option value="03">03 시</option>
											<option value="04">04 시</option>
											<option value="05">05 시</option>
											<option value="06">06 시</option>
											<option value="07">07 시</option>
											<option value="08">08 시</option>
											<option value="09">09 시</option>
											<option value="10">10 시</option>
											<option value="11">11 시</option>
											<option value="12">12 시</option>
											<option value="13">13 시</option>
											<option value="14">14 시</option>
											<option value="15">15 시</option>
											<option value="16">16 시</option>
											<option value="17">17 시</option>
											<option value="18">18 시</option>
											<option value="19">19 시</option>
											<option value="20">20 시</option>
											<option value="21">21 시</option>
											<option value="22">22 시</option>
											<option value="23">23 시</option>
										</select> 
										<font name="checkQuestion" size="2" color="red" style="float:left; margin:-10 0 0 0"></font>

									</div>
								</div>
								
								<div class="form-group">
									<label class="col-lg-2 control-label" style="margin:0 0 0 100">CLOSE시간</label>
									<div class="col-lg-6">
										<select class="form-control m-bot15 question_code"
											name="business_close">
											<option value=''>---CLOSE시간을 선택해주세요---</option>
											<option value="00">00 시</option>
											<option value="01">01 시</option>
											<option value="02">02 시</option>
											<option value="03">03 시</option>
											<option value="04">04 시</option>
											<option value="05">05 시</option>
											<option value="06">06 시</option>
											<option value="07">07 시</option>
											<option value="08">08 시</option>
											<option value="09">09 시</option>
											<option value="10">10 시</option>
											<option value="11">11 시</option>
											<option value="12">12 시</option>
											<option value="13">13 시</option>
											<option value="14">14 시</option>
											<option value="15">15 시</option>
											<option value="16">16 시</option>
											<option value="17">17 시</option>
											<option value="18">18 시</option>
											<option value="19">19 시</option>
											<option value="20">20 시</option>
											<option value="21">21 시</option>
											<option value="22">22 시</option>
											<option value="23">23 시</option>
										</select> 
										<font name="checkQuestion" size="2" color="red" style="float:left; margin:-10 0 0 0"></font>

									</div>
								</div>
								
								
								
								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin:0 0 0 100">매장전화번호</label>
									<div class="col-sm-6">
										<input type="text" name="store_tel_num"	class="form-control store_tel_num"> 
										<font name="checkStoreTelNum" size="2" color="red" style="float:left; margin:5 0 0 0"></font>
									</div>
								</div>

						<div class="form-group">
                           <label class="col-sm-2 control-label" style="margin:0 0 0 100">회원등급</label>
                           <div style="width:450; ">
                              <div class="btn-group" data-toggle="buttons" style="padding: 0 250 0 0; width:500;">
                                 <label class="btn btn-default active"> 
                                    <input type="radio" class="rank_code" name="rank_code" id="option1"   value="1"> 일반
                                 </label> 
                                 <label class="btn btn-default"> 
                                    <input type="radio"   class="rank_code" name="rank_code" id="option2" value="2"> 프리미엄
                                 </label> 
                                 <font name="checkRankCode" size="2" color="red" style="float:right; margin:5 0 0 0"></font> 
                              </div>
                              <br><br>
                              
                                  <div  style="text-align:left; font-size:18">
                                     [회원등급별 혜택]
                                  </div>
                                  
                                  <div  style="text-align:left; font-size:12">
                                     &nbsp;● 일반<br>
                                    &nbsp;&nbsp;&nbsp;- 비용: 무료<br>
                                    &nbsp;&nbsp;&nbsp;- 서비스: 점포에서 사용하는 POS의 정보를 사이트에서 원격으로 확인 가능<br>
                                    &nbsp;● 프리미엄<br>
                                    &nbsp;&nbsp;&nbsp;- 비용: 월 10,000원 (부가세 별도)<br>
                                    &nbsp;&nbsp;&nbsp;- 서비스: 지역별/상품별 매출현황 비교, 위치기반 메뉴 추천
                                  </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-sm-2 control-label" style="margin:0 0 0 100">서비스이용약관</label>
                           <div class="col-sm-6">
                              <textarea class="form-control" name="editor1"
                                 rows="6" readonly>회원 가입 약관
제1조 (목적)
본 약관은 포스비스 주식회사(이하 '회사')가 POSBIS 사이트(이하 ‘사이트’)를 통하여 인터넷상에서 제공하는 서비스(이하 ‘서비스’)를 이용하는 고객 (이하 '고객')간의 권리와 의무 및 책임 등 기타 제반사항을 규정함을 목적으로 합니다.

제2조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
가. '회원'이라 함은 이 약관에 동의하고 회원가입을 통하여 이용자ID(고유번호)와 비밀번호를 발급받은 자로서, 회사가 제공하는 서비스를 이용할 수 있는 이용자를 말합니다.
나. '이용자ID'라 함은 회원의 식별 및 서비스 이용을 위하여 회원의 신청에 따라 회사가 회원 별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.
다. '비밀번호'라 함은 이용자ID로 식별되는 회원의 본인 여부를 검증하기 위하여 회원이 설정하여 회사에 등록한 고유의 문자와 숫자의 조합을 말합니다.
라. ‘로그인’이라 함은 이용자ID와 비밀번호를 통하여 서비스 신청 및 사용 중 서비스의 세부정보를 확인할 수 있는 행위를 말합니다.
마. '탈퇴'라 함은 회원이 서비스 이용을 해지하는 것을 말합니다.
바. ‘휴면ID’ 라 함은 회사에서 정한 일정 기간 동안 사이트 접속 및 미 로그인 시 고객의 정보 악용방지를 위하여 보호되는 계정입니다.
이 약관에서 사용하는 용어 중 제1항에서 정하지 아니한 것은 관계 법령 및 서비스 별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.

제3조 (이용약관의 효력 및 개정)
1. 이 약관은 사이트를 통해 온라인으로 공시하고 회원의 동의로 효력을 발생합니다. 본 약관의 공시는 사이트에 게시하는 방법으로 합니다.
2. 회사는 합리적인 사유가 발생할 경우 관련 법령에 위배되지 않는 범위 내에서 약관을 개정할 수 있습니다. 개정된 약관은 사이트를 통해 공지하거나 기타의 방법으로 회원에게 공지함으로써 그 효력이 발생하며, 이용자의 권리 또는 의무에 관한 변경은 최소한 7일 전에 공지합니다.
3. 변경된 약관에 대한 정보를 알지 못해 발생하는 회원의 피해는 회사에서 책임지지 않습니다.
4. 회원은 변경된 약관에 동의하지 않을 경우 서비스 이용을 중단하고 회원 탈퇴를 요청할 수 있습니다. 단, 이의가 있음에도 불구하고 제 2항에서 정한 바에 따른 회사의 고지가 있은 후 30일 이내에 이용계약을 하지 않은 회원은 변경된 약관에 동의한 것으로 간주합니다. 

제4조 (약관외 준칙)
회사는 필요한 경우 기타 유ㆍ무료 서비스 내의 운영원칙 또는 개별약관(이하 '서비스 별 약관'이라 합니다)를 정할 수 있으며, 본 약관과 서비스 별 약관의 내용이 상충되는 경우에는 서비스 별 약관의 내용을 우선하여 적용합니다.

제5조 (회원 가입)
1. 이 약관의 동의는 회원가입 당시 절차 상의 이용약관 및 개인정보처리방침에 동의한다는 의사표시와 함께 회사가 요청하는 정보를 제공하여 회원가입 신청을 완료함으로써 이루어집니다. 
2. 회원으로 가입하여 서비스를 이용하고자 하는 이용자는 회사에서 요청하는 제반 정보(개인정보처리방침 제 1항 ‘수집하는 개인정보의 항목’)를 제공하여야 합니다.
3. 회원은 반드시 회원 본인의 정보를 제공하여야만 서비스를 이용할 수 있으며, 타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 정확한 정보를 등록하지 않은 회원은 서비스 이용과 관련하여 아무런 권리를 주장할 수 없으며, 관계 법령에 따라 처벌 받을 수 있습니다. 또한 제 3자에게 야기한 손해를 배상할 책임이 있으며, 회사는 허위의 정보를 기재한 회원의 서비스 이용 자격을 제한할 수 있습니다.

제6조 (개인정보의 보호 및 사용)
1. 회사는 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 관해서는 관계 법령 및 회사의 개인정보처리방침에 정한 바에 의합니다. 단, 회원은 이용자ID 및 비밀번호 등이 타인에게 노출되지 않도록 철저히 관리해야 하며 회사는 회원의 귀책사유로 인해 노출된 정보에 대해서 책임을 지지 않습니다.
2. 회사는 고객이 제공하는 개인정보를 본 서비스 이외의 목적을 위하여 사용할 수 없습니다.
3. 회사는 고객이 제공한 개인정보를 고객의 사전 동의 없이 제 3자에게 제공할 수 없습니다. 단, 다음 각 호에 해당하는 경우에는 예외로 합니다.
가. 도메인이름 검색서비스를 제공하는 경우
나. 전기통신기본법 등 관계법령에 의하여 국가기관의 요청이나 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우
다. 통계작성, 홍보자료, 시장조사를 위하여 필요한 경우로서 특정 고객임을 식별할 수 없는 형태로 제공되는 경우

제7조 (회원에 대한 통지 및 정보제공)
1. 회사가 회원에 대하여 통지하는 경우 회원이 회사에 등록한 전자우편 주소나 휴대전화번호, 유선전화번호로 할 수 있습니다.
2. 회사는 불특정다수 회원에게 통지를 해야 할 경우 고도 공지게시판을 통해 7일 이상 게시함으로써 개별 통지에 갈음할 수 있습니다.
3. 회사는 회원에게 서비스 이용에 필요가 있다고 인정되는 각종 정보에 대해서 전자우편이나 서신, 우편, SMS, 전화 등의 방법으로 회원에게 제공할 수 있습니다.
4. 회사는 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에 관련 법령에 따라 추가적인 개인 정보를 수집할 수 있습니다.

제8조(서비스의 이용 시간 및 중단)
1. 서비스 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간 운영을 원칙으로 합니다. 단, 회사는 시스템 정기점검, 증설 및 교체를 위해 회사가 정한 날이나 시간에 서비스를 일시 중단할 수 있으며, 예정되어 있는 작업으로 인한 서비스 일시 중단은 고도를 통해 사전에 사이트를 통하여 공지합니다.
2. 회사는 긴급한 시스템 점검, 증설 및 교체, 설비의 장애, 서비스 이용의 폭주, 국가비상사태, 정전 등 부득이한 사유가 발생한 경우 사전 예고 없이 일시적으로 서비스의 전부 또는 일부를 중단할 수 있습니다.
3. 회사는 서비스 개편 등 서비스 운영 상 필요한 경우 전부 또는 일부 서비스의 제공을 중단할 수 있으며 회원에게 사전 예고 또는 사후 통보 합니다.

제9조 (회사의 의무)
1. 회사는 본 약관이 정하는 바에 따라 지속적이고 안정적인 서비스를 제공하기 위해서 노력합니다.
2. 회사는 회원의 개인정보 보호를 위해 보안 시스템을 구축하며 개인정보 처리방침을 공시하고 준수합니다.
3. 회사는 공정하고 건전한 운영을 위해 최선을 다하고 지속적인 연구개발을 통하여 양질의 서비스를 제공함으로써 고객만족을 극대화하여 인터넷 사업 발전에 기여합니다.
4. 회사는 회원으로부터 제기되는 의견이나 불편사항이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 통해 즉시 처리하여야 합니다. 다만, 신속한 처리가 곤란한 경우는 회원에게 그 사유와 처리일정을 통보하여야 합니다.

제10조 (회원의 의무)
1. 회원은 회원가입 신청 또는 회원정보 변경 시 모든 사항을 사실에 근거하여 본인의 실제 정보로 작성하여야 하며, 허위 또는 타인의 정보를 등록할 경우 이와 관련된 모든 권리를 주장할 수 없습니다.
2. 회원은 본 약관에서 규정하는 사항과 기타 회사가 정한 제반 규정, 공지사항 등 회사가 공지하는 사항 및 관계 법령을 준수하여야 하며, 기타 회사의 업무에 방해가 되는 행위, 회사의 명예를 손상시키는 행위, 타인에게 피해를 주는 행위를 해서는 안됩니다.
3. 회원은 주소, 연락처, 전자우편 주소 등 회원의 이용정보가 변경된 경우에 해당 절차를 거쳐 이를 회사에 즉시 알려야 합니다.
4. 회원은 회원ID, 비밀번호 등이 타인에게 노출되지 않도록 철저한 관리 책임이 있습니다.
5. 회원은 회원ID, 비밀번호 등이 도난 당하거나 제 3자가 사용하고 있음을 인지한 경우에는 즉시 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.
6. 회사는 회원의 상기 제1항, 제 2항, 제 3항, 제 4항, 제 5항을 위반하여 회원에게 발생한 손해에 대하여 어떠한 책임도 부담하지 않습니다.

제11조 (회원 탈퇴 및 자격 상실)
1. 회원은 회사에 언제든지 회원 탈퇴를 요청할 수 있으며 회사는 요청을 받은 즉시 해당 회원의 회원 탈퇴를 위한 절차를 밟아 고도 개인정보처리방침에 따라 회원 등록을 말소합니다.
2. 회사의 모든 서비스에서 이용중인 서비스의 기간이 남아있는 회원이 탈퇴 요청하였을 경우 회원탈퇴로 인한 서비스의 중지 또는 피해는 회원탈퇴 이용자에게 있습니다.
3. 회원이 서비스 이용에 있어서 본 약관 제 10조 내용을 위반하거나, 다음 각 호의 사유에 해당하는 경우 회사는 직권으로 회원자격 상실 및 회원탈퇴의 조치를 할 수 있습니다.
가. 다른 사람의 명의를 사용하여 가입 신청한 경우
나. 신청 시 필수 작성 사항을 허위로 기재한 경우
다. 관계법령의 위반을 목적으로 신청하거나 그러한 행위를 하는 경우
라. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청하거나 그러한 행위를 하는 경우
마. 다른 사람의 회사 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우
바. 관계 법령 위배와 본 약관이 금지하는 행위를 하는 회원 경우
4. 회사가 직권으로 회원탈퇴 처리를 하고자 하는 경우에는 말소 전에 회원에게 소명의 기회를 부여합니다.

제12조 (휴면ID 관리)
1. 회사는 서비스 미 이용 및 1년 이상 사이트 로그인을 하지 않은 경우 해당 이용자ID 및 개인정보를 휴면ID로 별도 관리합니다.
2. 회사는 휴면ID 대상 회원에게 전환 30일 전에 고지의 의무를 다 해야 하며, 휴면ID를 이용하여 사이트 로그인 시도 시 회원가입 당시 요청한 제반 정보 확인 후 바로 이용자 ID로 전환이 이루어집니다.

제13조 (손해배상)
1. 회사는 서비스에서 무료로 제공하는 서비스의 이용과 관련하여 개인정보보호정책에서 정하는 내용에 해당하지 않는 사항에 대하여 어떠한 손해도 책임을 지지 않습니다.

제14조 (면책조항)
1. 회사는 천재지변, 전쟁, 기간통신사업자의 서비스 중지 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임 지지 않습니다.
2. 회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.
3. 회사는 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고, 회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 서비스 이용과 관련하여 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 회원에게 있습니다.
4. 회사가 제공하는 정보와 자료는 거래의 목적으로 이용될 수 없습니다. 따라서 본 서비스의 정보와 자료 등에 근거한 거래는 전적으로 회원자신의 책임과 판단아래 수행되는 것이며, 회사는 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.
5. 회사는 회원이 서비스를 이용하여 기대하는 수익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않으며, 서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다.
6. 회사는 회원의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할 의무가 없으며, 그 결과에 대한 책임을 지지 아니합니다.

제15조 (약관의 해석 및 관할법원)
1. 본 약관에 명시되지 않은 사항은 관계 법령과 상관례에 따릅니다.
2. 회사의 개별 유ㆍ무료 서비스 이용 회원의 경우 당해 서비스와 관련하여서는 회사가 별도로 정한 약관 및 정책에 따릅니다.
3. 회원과 회사 사이에 발생한 분쟁에 대해 소송이 제기되는 경우 관할 법원은 서울중앙지방법원으로 합니다.

제16조 (재판관할 및 준거법)
1. 이 약관에 명시되지 않은 사항은 전기통신사업법 등 대한민국의 관계법령과 상관습에 따릅니다.
2. 회사의 정액 서비스 회원 및 기타 유료 서비스 이용 회원의 경우 당해 서비스와 관련하여서는 회사가 별도로 정한 약관 및 정책에 따릅니다.
3. 이 약관 및 서비스의 이용과 관련된 분쟁에 관한 소송은 회사의 본사 소재지를 관할하는 법원에 제기합니다.


부칙 (시행일)
본 약관은 2018년 4월 02일부터 적용하고, 2016년 5월 2일부터 시행되던 종전의 약관은 본 약관으로 대체합니다.</textarea>
										<br>
										<div class="btn-group" data-toggle="buttons" style="float:left">

											<font name="checkAgree" size="2" color="red" style="float:left; margin:5 10 0 0"></font> <label
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
								<br>
								<div style="float: center">
									<button class="btn btn-default" type="button" value="등록"
										onClick="checkUserRegForm();">가입하기</button>

									<button class="btn btn-default" type="reset" value="다시작성">다시작성
									</button>
									<button class="btn btn-default" type="button" value="취소"
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
