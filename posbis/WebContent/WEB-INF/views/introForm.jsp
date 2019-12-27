<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
   <head>
      <title> new document </title>
      <meta charset="utf-8">
      <script src="jquery-1.11.0.min.js"></script>

      <style>
         .right{
            float: right;
            border: 0 solid #000;
            width: 0px;
            height:0px;
            text-align: center;
            line-height: 100px;
            font-weight: bold;
         
         }

         .logo{
            
            background: yellow;
            border: 1 solid #000;
            width: 100px;
            height:100px;
            text-align: center;
            line-height: 100px;
            font-weight: bold;
         
         }

 

 
       </style>
       
      <script>
         function goMainForm(){
            alert("메인으로 이동");
            location.replace("/posbis/mainForm.do");
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

 
      </script>
      
   </head>




   <body>
      소개 Page

      <div class="right"><input type=button value="메인으로" onClick="goMainForm()"></div>&nbsp;&nbsp;

      <br><br><br><br>

      <div class=logo>로고 </div>
      <br><br><br><br>

      <h3 class="mTitle11"><span>상권영향분석 서비스</span></h3>
         <div class="con2">
            <ul>
            <li class="ls1">
               <span class="img">요즘 어떤 업종이<br> 성장하고 있을까?</span>
               <span class="txt">
                  <span class="i">업종 트렌드 분석</span>
                  소상공인이 가장 많이 창업하는 73개 업종의 점포수 추이,<br>
                  매출액 추이, 점포증감률, 개/폐업률 등을 비교하여 업종의<br>
                  전반적인 트렌드를 비교 파악할 수 있습니다.
               </span>
            </li>

            <br><br>

            <li class="ls2">
               <span class="img">업종에 맞는 상권을 쉽게 찾을 수<br> 있는 방법은 없을까?</span>
               <span class="txt">
                  <span class="i">바로 상권 분석</span>
                  소상공인이 가장 많이 창업하는 73개 업종의 창업위험지수<br>
                  성장성, 안정성, 구매력, 점포수 증감, 개/폐업률, 업력 등을<br>
                  비교하여 업종의 전반적인 트렌드를 비교 파악할 수 있습니다.
               </span>
            </li>

            <br><br>

            <li class="ls3">
               <span class="img">홍보효과가 높은 곳에 홍보를 하고<br> 싶은데 좋은 방법이 없을까?</span>
               <span class="txt">
                  <span class="i">내 점포 마케팅 분석</span>
                  상권 내 업종의 주 매출 고객의 성/연령대와 주 시간대를<br>
                  분석하고 주 고객층이 많이 다니는 유동인구 지점과<br>
                  주거인구 밀집 지역을 파악 할 수 있습니다.
               </span>
            </li>

            <br><br>

            <li class="ls4">
               <span class="img">다른 업종으로 변경하고 싶은데<br> 어떻게 알아보지?</span>
               <span class="txt">
                  <span class="i">업종 변경 분석</span>
                  상권 내 타 업종과의 점포수 추이, 개/폐업률, 시간대, 요일별,<br>
                  성/연령대 매출액, 프랜차이즈 비율 등 다양한 지표를 비교하고<br>
                  지속적으로 변화를 모니터링 할 수 있습니다.
               </span>
            </li>

            <br><br>

            <li class="ls5">
               <span class="img">소상공인 지원 정보와 전문가에게<br> 상답을 쉽게 받을 수 없을까? </span>
               <span class="txt">
                  <span class="i">소상공인지원 서비스</span>
                  소상공인 사업을 지원하기 위한 다양한 정보를 제공하고<br>
                  경기도 소상공인지원센터의 분야별 전문가가 상권/업종<br>
                  관련 궁금증을 풀어드립니다.
               </span>
            </li>
            </ul>
         </div>
      </div>
 
 
   </body>
</html>
   