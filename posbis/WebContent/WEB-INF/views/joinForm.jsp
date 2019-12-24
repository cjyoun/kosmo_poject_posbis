<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ include file="common.jsp"%>




<html>
<head>
<meta charset="utf-8">

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
    	 
    	  $("[name=rank_code]").val(1);
    	  
      
    	  
    	 
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
        	
        	
        	
        });
        	
         
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
 
		if(confirm('정말 저장하시겠습니까?') == false){
			return;
		}
		
		
//*************************************************************************************   
//사업자 번호 개수 검사 
	    alert("사업자 번호 개수 검사 시작1")
	    	  
	    	  $.ajax({
	         	 url : "/posbis/chekckBusinessNoProc.do"
	         	, type : "post"
	         	, data : $("[name=joinForm]").serialize()
	         	, success : function(businessnoCnt) {
	         		if( businessnoCnt==1 ){
	         			alert("이미 등록된 사업자번호 입니다.재 입력 바랍니다2.");
	         			location.replace('/posbis/joinForm.do');
	         		} else if(businessnoCnt == 0) {
	         			alert("등록가능한 사업자번호 입니다3.");
	         			
	         		}else {
	                     alert("서버 오류 발생!! 관리자에게 문의 바랍니다4.");
	         		}
	         	}, error : function(){
	                 alert("서버 접속 실패");
	         	}
	         	
	          });	
		
		
		
//*************************************************************************************   
//회원가입 등록 ajax 
		   alert("회원가입 등록 검사 시작5")
		   
		$.ajax({
			url : "/posbis/joinRegProc.do"
			, type : "post"
			, data : $("[name=joinForm]").serialize()
			, success : function(joinRegCnt){
				
				if(joinRegCnt == 1){
					
					//alert($("[name=rank_code]:checked").val())
					
					if( $("[name=rank_code]:checked").val()==1){
						alert("회원가입 완료 재 로그인해주세요!6");
						location.replace('/posbis/mainForm.do');
						
					}else{
							alert("회원가입 완료 결제창으로 이동합니다!7");
							location.replace('/posbis/payForm.do');
							
						}
				}
				else{
					alert("회원가입 실패! 관리자에게  문의 바랍니다.8");	
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
    	  
    	  
    
      
//--------------------------------------------------------------------------------------------------
   </script>

</head>

<body>
	<center>
		<h3>회원가입</h3>
		<FORM class="joinForm" method="post" name="joinForm"
			action="/posbis/joinForm.do">

			<table>
				<tbody>
					<tr>
						<td align="center" colspan=2>--대표자 정보--</td>
					</tr>

					<tr>

						<td>아이디</td>
						<td><input type="text" name="user_id" class="user_id"
							placeholder="ID" /> <input type="button" value="중복확인"
							onclick="checkOverlap();" /></td>
					</tr>

					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="user_pwd" class="user_pwd"
							placeholder="PASSWORD"  maxlength="10" required />&nbsp;&nbsp;*숫자 10자리 입력하세요</td>
					</tr>

					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="checkPwd2" class="checkPwd2"
							placeholder="Confirm PASSWORD" maxlength="10" required /><font name="check" size="2" color="red"></font></td>
							
					</tr>
					
					<tr>
						<td>성명</td>
						<td><input type="text" name="user_name" class="user_name"
							placeholder="Name" /></td>
					</tr>

					<tr>
						<td>생년월일</td>
						<td><input type="text" class="birth" id="birth" name="birth"
							placeholder="ex) 19990415" maxlength="8" required></td>
					</tr>

					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" class="email"
							placeholder="E-mail" /></td>
					</tr>

					<tr>
						<td>질문</td>
						<td><select name="question_code" class="question">
								<option value="" placeholder="--질문 선택--">--질문 선택--</option>
								<option value="1">내가 졸업한 초등학교 이름은?</option>
								<option value="2">나의 보물 1호는?</option>
								<option value="3">가장 기억에 남는 선생님의 이름은?</option>
								<option value="4">가장 감명깊게 본 영화는?</option>
						</select></td>
					</tr>


					<tr>
						<td>답변</td>
						<td><input type="text" name="answer" class="answer"
							placeholder="답변" /></td>
					</tr>

					<tr>
						<td>&nbsp;
					</tr>

					<tr>
						<td align="center" colspan=2>--사업장 정보--</td>
					</tr>

					<tr>
						<td>사업자 번호</td>
						<td><input type="text" name="business_no" class="business_no" placeholder="(10자리, 000-00-0000)" maxlength="12" required/>
						<input type="button" value="사업자 번호 중복확인"
							onclick="checkOverlapBusinessNo();" /></td>
						</td>
					</tr>

					<tr>
						<td>상호명</td>
						<td><input type="text" name="business_name"
							class="business_name" placeholder="상호명"/></td>
					</tr>

					<tr>
						<td>주소</td>
						<td>
							<!--********************************************************************** -->
					 
						<select name="addr_gu" class="addr_gu">
							<!--  onchange="getAddrDong()" -->
								<option value="" selected>--구 선택--</option>
								<c:forEach items="${addrListGu}" var="addrGu">
									<option value="${addrGu.addr_gu}">${addrGu.addr_gu}</option>
								</c:forEach>


						</select> 
						<select name="addr_dong" class="addr_dong"">
								<option value="" selected>--동 선택--</option>
						 
							 
						</select> <!--********************************************************************** -->
					 

						</td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td><input type="text" size=50 name="addr_detail"
							class="addr_detail" /></td>
					</tr>

					<tr>
						<td>업종</td>
						<!--********************************************************************** -->

						<td><select name="business_type_name1"
							class="business_type_name1">
								<option value="">--선택--</option>
								<c:forEach items="${businessTypeList1}" var="busiType1">
									<option value="${busiType1.business_type_name1}">${busiType1.business_type_name1}
									</option>
								</c:forEach>
						</select> <select name="business_type_name2" class="business_type_name2"
							onchange="getbusiListname2();">
								<option value="">--선택--</option>

						</select></td>
						<!--********************************************************************** -->

					</tr>

					<tr>
						<td>매장 번호</td>
						<td><input type="text" size="12" name="store_tel_num"
							class="store_tel_num" />&nbsp;&nbsp;*숫자만 입력하세요</td>
					</tr>

					<tr>
						<td>회원등급</td>
						<td><input type="radio" name="rank_code" class="rank_code"
							value="1">일반 
							<input type="radio" name="rank_code"
							class="rank_code" value="2">프리미엄 &nbsp;&nbsp;(월
							10,000원)&nbsp;&nbsp; <a class="help">[회원등급혜택]</a></td>
					</tr>

					<tr>

						<td colspan="3" class="signUp_agree"><br>서비스이용 약관</td>
					</tr>
					<tr>
						<td colspan="3" class="signUp_agree_textarea"><textarea
								cols="70" rows="10" readonly="readonly">회원가입~~~~</textarea></td>
					</tr>
					<tr>
						<td colspan="3" class="signUp_agree_ checkbox" id="agree_checkbox"><input
							type="checkbox" class="agree_checkbox" name="agree_checkbox">약관
							동의</td>
					</tr>



				</tbody>

			</table>

			<div style="height: 20;"></div>

			<input type="button" value="가입" onclick="checkUserRegForm();">
			<input type="reset" value="다시 작성"> <input type="button"
				value="가입취소" onclick="goMainForm();">
				
			<!--  <input type="hidden" name=u_no value=""> -->

		</form>
	</center>

</body>
</html>