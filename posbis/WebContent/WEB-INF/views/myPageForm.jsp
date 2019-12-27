<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/common.jsp" %>

<html>
   <head>
       <title> new document </title>
      <meta charset="utf-8">
      <script src="jquery-1.11.0.min.js"></script>
      <script>

      $(document).ready(function(){	
//	    	 checkBusinessNoForm();
				// name="changeBusinessNo" 에 change 이벤트가 발생하면 실행할 코드 설정.
				$('[name=changeBusinessNo]').change(function(){			
					checkBusinessNoForm();
					
				});	

				$('[name=changeBusinessNo]').change();
							
				
	  	});
	  	var b_no;

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
						business_no = myPageDTO.myInfo[0].business_no;

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

      
      
      function goMyPageForm(){
         alert("goMyPageForm.jsp로 이동")
         location.replace("/posbis/myPageForm.do")
      }

      function goMenuForm(){
         alert("goMenuForm.jsp로 이동")
         location.replace("/posbis/menuForm.do")
      }
    
      function goSalesForm(){
         alert("goSalesForm.jsp로 이동")
         location.replace("/posbis/salesForm.do")
      }


      
    
      function goPreChartForm(){
         alert("goPreChartForm.jsp로 이동");

         $.ajax({
				// 서버 쪽 호출 URL 주소 지정
				url : "/posbis/myPageProc2.do"
				
				// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
				, type : "post"

				, async : false
				// 서버로 보낼 파라미터명과 파라미터 값을 설정
				, data : $("[name=myPageForm]").serialize()				
					
				, success : function(myPageDTO){
					//alert("salesMonthList : "+ preChartListDTO.salesMonthList[0].sales_amount);
					//alert("allSalesMonthList : "+ preChartListDTO.allSalesMonthList[0].sales_amount);
					alert("프리미엄 이동----------");

					if(myPageDTO != null){
						

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
			
         location.replace("/posbis/preChartForm.do");
      }




      
      function goMainForm(){
         alert("goMainForm.jsp로 이동")
         location.replace("/posbis/mainForm.do")
      }
      
      function goInfoUpdateForm(){
         alert("goInfoUpdateForm.jsp로 이동");
         var str = "business_no=" + business_no;
         location.replace("/posbis/infoUpdateForm.do?"+str);
			
         
      }
      
      function gowithdrawalForm(){
         alert("gowithdrawalForm.jsp로 이동")
         location.replace("/posbis/withdrawalForm.do")
      }


      function goMainForm(){
          alert("메인으로 이동");
          location.replace("/posbis/mainForm.do");
       }
     	
    
    

      </script>

   </head>

 
   <body>
   
    	<div class="right"><input type=button value="메인으로" onClick="goMainForm()"></div>&nbsp;&nbsp;
		

      <div style="border:1px solid; 20px, margin:10px; height:100%; width: 100%; ">

         <!---------------- 상단바 ------------------------->
         <div style="float: left; border:1px solid; 20px, margin:10px; height:15%; width: 100%; ">
         <center><h2>상단바</h2></center>
         </div>
      
         <div style="display:table; border:1px solid; 20px, margin:10px; height:85%; width: 100%;">
            <!------------------ 사이드바 ---------------------->
            <div style="float:left; width: 15%; border:1px solid; padding:30px; height:90%;"><br><Br>
               <h3>마이페이지</h3><br>
                  <a onClick="goMyPageForm()">내 정보관리</a><br><br>
                  <a onClick="goMenuForm()">메뉴관리</a><br><br>
                  <a onClick="goSalesForm()">매출관리</a><br><br>
                  <a onClick="goPreChartForm()">프리미엄</a><br><br>
            </div>

            <!------------------ 메인으로 보여줄 div -------------------->
            <div style="float: right; border:1px solid; 20px, margin:10px; width: 80%; height:100%;"><br>
               <form name="myPageForm" method="post" action="/posbis/myPageForm.do"> 
	
						<table border=0 width=700  >
							<tr>
								<td align=right>
									사업자번호 : 
									<select name="changeBusinessNo">	<!-- 중요! -->
								 		<c:forEach items="${businessNoList}" var="businessNoList">											
											<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
												</option>
										</c:forEach>
										
									</select> 
						</table>
				</form><br><br><br>

               <!-- 회원정보 form 태그 -->
               <form class="cusForm" name = "cusForm" method="post" action=""><center>

                  <!-- 내정보 보기 -->
                  <h2>[MY PAGE]</h2><br>

                  <table width="60%" border=0 bordercolor="#DDDDDD" cellpadding="8" align="center">
                     
                     <tr align=center>
                        <th bgcolor="FFEFDC" width="20%" > ID
                        <td width=150 name=uid class=uid>

                     <tr align=center>
                        <th bgcolor="FFEFDC"> 회원명
                        <td width=150 name=uName class=uName>
                     
                     <tr align=center>
                        <th bgcolor="FFEFDC"> 이메일
                        <td width=150 name=email class=email>


                     <tr align=center>
                        <th bgcolor="FFEFDC"> 사업자번호
                        <td width=150 name=businessNo class=businessNo>

                     <tr align=center>
                        <th bgcolor="FFEFDC"> 상호명
                        <td width=150 name=businessName class=businessName>

                     <tr align=center>
                        <th bgcolor="FFEFDC"> 가게주소
                        <td width=150 name=addr class=addr>
                        
                     <tr align=center>
                        <th bgcolor="FFEFDC"> 업종
                        <td width=150 name=businessType class=businessType>
 
                     <tr align=center>
                        <th bgcolor="FFEFDC"> 매장번호
                        <td width=150 name=storeNum class=storeNum>
                  </table><br><br>
                     
                  <input type="button" value="메인으로" onClick="goMainForm();">&nbsp;
                  <input type="button" value="정보수정" onClick="goInfoUpdateForm();">&nbsp;
                  <input type="button" value="회원탈퇴" onClick="gowithdrawalForm();">
               </form>
            </div>
         </div>
      </div>

   </body>

</html>