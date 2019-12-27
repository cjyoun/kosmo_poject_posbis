<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp" %>

<html>
   <head>
      <meta charset="utf-8">
   <script src="jquery-1.11.0.min.js"></script>
   <script>


	   $(document).ready(function() {

	       
	      
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
	         
	      $('[name=changeBusinessNo]').change();
			
	    });/*  $(document).ready(function() { */ 
	    

	    	

	    function checkBusinessNoForm(){
			//alert($("[name=preChartForm]").serialize());

			$.ajax({
				// 서버 쪽 호출 URL 주소 지정
				url : "/posbis/myPageProc.do"
				
				// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
				, type : "post"

				, async : false
				// 서버로 보낼 파라미터명과 파라미터 값을 설정
				, data : $("[name=myPageForm]").serialize()				
					
				, success : function(myPageDTO){
					//alert("salesMonthList : "+ preChartListDTO.salesMonthList[0].sales_amount);
					//alert("allSalesMonthList : "+ preChartListDTO.allSalesMonthList[0].sales_amount);
					alert("성공----------");
						$(".uid").empty();
						$(".uName").empty();
						$(".email").empty();
						$(".businessNo").empty();
						$(".businessName").empty();
						$(".addr").empty();
						$(".businessType").empty();
						$(".storeNum").empty();

					if(myPageDTO != null){
						

						var info = myPageDTO.myInfo[0];
						$('.uid').append(info.user_id);
						$('.uName').append(info.user_name);						
						$('.email').append(info.email);
						$('.businessNo').append(info.business_no);
						$('.businessName').append(info.business_name);
						$('.addr').append(info.store_addr);						
						$('.businessType').append(info.business_type);
						$('.storeNum').append(info.store_tel_num);
						
						
					}
					else if (myPageDTO == null){
						alert("실패");
					}
					else {
						alert("서버 오류 발생. 관리자에게 문의 바람");
					} 
				}
				
				// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				, error : function(request, error){
					alert("서버 접속 실패");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					
					
				}
				
			});
      }

	    
	    // 프리미엄으로 이동 시일반 회원은 프리미엄 부분에 들어가지 못하게 하는 함수
	    function goPreChartForm(){
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


    	
      function checkUserRegForm(){
         //
    	  location.replace("/posbis/myPageForm.do");
      }
      
      function changeRank(){
         //
         
      }

      function goMainForm(){
          alert("메인으로 이동");
          location.replace("/posbis/mainForm.do");
       }

      function goMyPageForm(){
          location.replace("/posbis/myPageForm.do");
       }

   </script>
   
   </head>

   <body><center>
   
   <div class="right"><input type=button value="메인으로" onClick="goMainForm()"></div>&nbsp;&nbsp;
		
 <h3> 회원정보 수정 </h3>
 <FORM>
 
 <table>
  <tr>
   <td align="center" colspan=2>--대표자 정보--</td>
  </tr>

  <tr>
   <td>아이디 </td>
   <td>
   <input type = "text" name="uid" class="uid" readonly value="${myNStoreInfo[0].user_id}"/>
   </td>
  </tr>

  <tr>
   <td> 새 비밀번호 </td>
   <td> <input type = "password" name="newPwd" class="newPwd" /> </td>
  </tr>

  <tr>
   <td> 새 비밀번호 확인 </td>
   <td> <input type = "password"  name="checkPwd" class="checkPwd"/> </td>
  </tr>

  <tr>
   <td> 성명 </td>
   <td> <input type = "text" name="user_name" class="user_name" value="${myNStoreInfo[0].user_name}"/> </td>
  </tr>
  
  <tr>
   <td> 생년월일 </td>
   <td> 
      <input type="text" class="birth" id="birth" name="birth"  maxlength="8" value="${myNStoreInfo[0].birth}" ></td>
  </tr>


  <tr>
   <td> 이메일 </td>
   <td>
    <input type = "text" name="email" class="email" value="${myNStoreInfo[0].email}"/>
   </td>
  </tr>


  
        <tr><td>&nbsp;</tr>
  <tr>
   <td align="center" colspan=2>--사업장 정보--</td>
  </tr>
  
  <tr>
   <td> 사업자 번호 </td>
   <td> <input type = "text" name="business_no" class="business_no" value="${myNStoreInfo[0].business_no}"/> </td>
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
           <option value=" " selected>${myNStoreInfo[0].addr_dong}</option>
      
         
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
          <option value="">${myNStoreInfo[0].business_type_name2}</option>

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
   <td> 회원등급</td>
   <td>
   <input type="button" name="rank" class="rank" value="회원등급 전환" onclick="changeRank();">
   </td>
  </tr>

</table>

   <div style="height:20;"></div>

   <input type="button" value="저장" onclick="checkUserRegForm();">
   <input type="reset" value="다시 작성">
   <input type="button" value="취소" onclick="goMyPageForm();">

</form>
</center>

   </body>
</html>