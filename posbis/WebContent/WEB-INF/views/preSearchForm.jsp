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
 
 
<title>PremiumSearch</title>
 
</head>
 
<script>

         
           $(document).ready(function(){
              //alert("ready!");
              
              //월매출 콤마 넣기
               $(".month_sales").each(function() {
                var num = $(this).text();
                var commaNum = numberWithCommas(num);
                $(this).text(commaNum+ "원");
               });
            

            
                $('[name=rowCntPerPage]').change(function(){
                  goPreSearch();
            }); 

                
               //페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입
               $(".pagingNumber").html(
                  getPagingNumber(
                     "${preResultAllCnt}"                //검색 결과 총 행 개수
                     ,"${preSearchDTO.selectPageNo}"   //선택된 현재 페이지 번호
                     ,"${preSearchDTO.rowCntPerPage}"   //페이지 당 출력행 개수
                     ,"15"                        //페이지 당 보여줄 페이지번호 개수
                     ,"goPreSearch();"                  //페이지 번호 클릭 후 실행할 자스코드
                  )
               ); 
               

            
            
             $('[name=business_type_name1]').change(function(){
               getBusinessTypeName2();
               
            }); 

             $('[name=addr_gu1]').change(function(){
                getAddrGu2();
            }); 
            
                        

            
            inputData("[name=rowCntPerPage]","${preSearchDTO.rowCntPerPage}");
            inputData("[name=selectPageNo]","${preSearchDTO.selectPageNo}");
            inputData("[name=business_type_name1]","${preSearchDTO.business_type_name1}");
             if("${preSearchDTO.business_type_name2}" == null){
               inputData("[name=business_type_name2]","${preSearchDTO.business_type_name2}");
               }else{
                  getBusinessTypeName2();
             }
            inputData("[name=addr_gu1]","${preSearchDTO.addr_gu1}");
             inputData("[name=addr_gu2]","${preSearchDTO.addr_gu2}");
             if("${preSearchDTO.addr_gu2}" != null){
              inputData("[name=addr_gu2]","${preSearchDTO.addr_gu2}");
             }else{
                getAddrGu2();
            } 
            inputData("[name=month_sales]","${preSearchDTO.month_sales}");



           });    



        // addr_gu2 List
         function getAddrGu2(){

            $.ajax({
               url : "/posbis/getAddrGu2Proc.do"
               , type : "post"
               , data : "addr_gu1="+$('[name=addr_gu1]').val()
               , success : function(data){
                     $("[name=addr_gu2]").empty();
                     $("[name=addr_gu2]").append("<option value=''>----구선택----</option>");
                     for( var i=0; data.length>i; i++){
                        //alert();
                        $('[name=addr_gu2]').append("<option value="+data[i]+">"+data[i])

                     }
                     if("${preSearchDTO.addr_gu2}"!=null){
                        inputData("[name=addr_gu2]","${preSearchDTO.addr_gu2}");
                     }
                     else{
                        inputData("[name=addr_gu2]","");
                     }
                     
               }
               , error : function(){
                  alert("서버 접속 실패");
               }
            })
         }


           
      
         // 업종 소분류
         function getBusinessTypeName2(){

            $.ajax({
               url : "/posbis/getBusinessTypeName2Proc.do"
               , type : "post"
               , data : "business_type_name1="+$('[name=business_type_name1]').val()
               , success : function(data){
                     $("[name=business_type_name2]").empty();
                     $("[name=business_type_name2]").append("<option value=''>----중분류----</option>");
                     //alert("business_type_name2///"+data[0]);
                     for( var i=0; data.length>i; i++){
                        //alert();
                        $('[name=business_type_name2]').append("<option value="+data[i]+">"+data[i])

                     }
                     if("${preSearchDTO.business_type_name2}"!=null){
                        inputData("[name=business_type_name2]","${preSearchDTO.business_type_name2}");
                     }
                     else{
                        inputData("[name=business_type_name2]","");
                     }
                     
               }
               , error : function(){
                  alert("서버 접속 실패");
               }
            })
         }



         

         //월매출 콤마 넣기
            function numberWithCommas(number) {
                var parts = number.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            }

         




            
         function goPreSearch(){            
          /*
                $.ajax({
               url : "/posbis/getPreResultProc.do"
               , type : "post"
               , data : $("[name=preSearchForm]").serialize() 
               , success : function(data){
                  alert("성공");
                  alert(data.preResultAllCnt);
               }
               , error : function(request,status,error){
                  alert("서버 접속 실패");

               }
            }) 
         
         */
            document.preSearchForm.submit();
         }   



         

         function goPreSearchAll(){
            document.preSearchForm.reset( );
            $("[name=preSearchForm] [name=selectPageNo]").val("1");
            $("[name=preSearchForm] [name=rowCntPerPage]").val("10");
            goPreSearch();
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
</head>

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
        <h1 class="text-light"><a href="#intro" class="scrollto"><span>POSBIS</span></a></h1>
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
              <li><a onClick="gohomepageForm();">통합 관리</a></li>
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
                
          <li  class="drop-down"> <a href=""><i class="icon_profile"></i> 김수정 님</a> 
           <ul>
                 
              <li><a onClick="goMyPageForm();"><i class="icon_profile"></i>&nbsp;&nbsp;내정보 보기</a></li>
                 <li><a href="login.html"><i class="icon_documents_alt"></i>&nbsp;&nbsp;통합관리</a></li>
                <li><a href="login.html"><i class="icon_key_alt"></i>&nbsp;&nbsp;Log Out</a></li>
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
          <h2>SEARCH<br> In <br><span>POBIS</span></h2>
 
        </div>
  
        <div class="col-md-6 intro-img order-md-last order-first">
          <img src="resources/intro/img/features-1.svg" alt="" class="img-fluid">
        </div>
      </div>

    </div>
  </section><!-- #intro -->
  <!--==========================
   검색관리
  ============================-->
  <main id="main">
 
      <section id="main-content">
      <section class="wrapper">
        <!--overview start-->
         <div class="row">
          <div class="col-lg-10" align="center">
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">분석현황</a></li>
              <li><i class="icon_documents_alt"></i>검색관리</li>
            </ol>
     <div class="col-lg-10" align="center">
            <section class="panel">
              <header class="panel-heading">
                   프리미엄 검색
              </header>
         <div class="panel-body"> 
                   <div  class="form-group">
 
  
             



               <!--======================-->
               <!------검     색        조      건-------------->
               <!--======================-->

               <!-- 검색조건 form -->
               <form name="preSearchForm" method="post"
                  action="/posbis/preSearchForm.do">

                  <br> 
                  
                  <!-- 사업자 등록 번호 -->
   <%--                
                  <select name="changeBusinessNo">
                     <option value="">사업자등록번호</option>
                     <c:forEach items="${businessNoList}" var="businessNoList">
                        <option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})
                        </option>
                     </c:forEach>
                  </select> 
 --%>                  
                
 
    
                     
                     <!--======================-->
                     <!-----------지역------------>
                     <!--======================-->
         
                  <span class="help-block">지 역
                        <select name="addr_gu1">
                              <option value="">==구선택==</option>
                              <c:forEach items="${addrGu1List}" var="addrGu1">
                                 <option value="${addrGu1.addr_gu1}">${addrGu1.addr_gu1}</option>
                              </c:forEach>
                        </select> &nbsp;
                        
                        <select name="addr_gu2">
                           <option value="">----구선택----</option>
                        </select>   
                      
                     <!--======================-->
                     <!--------업종-------------->
                     <!--======================-->
                     <span class="help-block">업 종
                         <select name="business_type_name1">
                              <option value="">==대분류==
                                 <c:forEach items="${businessTypeName1List}"
                                    var="businessTypeName1">
                                    <option value="${businessTypeName1.business_type_name1}">${businessTypeName1.business_type_name1}
                                    </option>
                                 </c:forEach>
                        </select> &nbsp; <select name="business_type_name2">
                              <option value="">==소분류==
                        </select> &nbsp;
                     
                     

                     <!--======================-->
                     <!------------매출----------->
                     <!--======================-->
                  <br> <span class="help-block">월매출(지난달 기준)
                  
                              <input type="radio" id="month_sales_all" name="month_sales" class="month_sales" value="0"><label for="month_sales_all"> 모두 </label>
                              <input type="radio" id="month_sales_2"  name="month_sales" class="month_sales" value="20000"><label for="month_sales_2"> 20000이상</label>
                              <input type="radio" id="month_sales_all_5"  name="month_sales" class="month_sales" value="50000"><label for="month_sales_all_5"> 50000이상 </label>
                              <input type="radio" id="month_sales_all_10"  name="month_sales" class="month_sales" value="100000"><label for="month_sales_all_10"> 100000이상</label>
                
                  <br> 
                  <input type="button" value="검색" style="" onClick="goPreSearch();">&nbsp;
                  <input type="button" value="모두검색" style="" onClick="goPreSearchAll();">&nbsp;
                   <br><br>
                  
                  
                    <div class="col-sm-12" align="center">
                   
              <table class="table table-striped table-advance table-hover" id="select">
                     <tr>
                        <td align=right>
                           <!-- EL 문법으로 게시판 검색 총 개수 출력 -->
                           <!-- 달러{boardListAllCnt}(EL은 주석문에서 유효) 은 컨트롤러 클래스 내부에
                              ModelAndView 객체에 boardListAllCnt 라는 키갑스올 저장된 데이터를
                              EL 로 표현하여 삽입 -->   
                           [총 개수] : ${preResultAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
                           <!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력 양식 -->
                           <!-- 선택한 페이지 번호는 DB 연동시 아주 중요한 역할 -->   
                           <select name="rowCntPerPage">
                              <option value="10">10
                              <option value="15">15
                              <option value="20">20
                              <option value="25">25
                              <option value="30">30
                           </select> 행보기
                  </table>
         
         
               
                  <input type="hidden" name="selectPageNo">      
                  <input type="hidden" name="sort" value="ranking asc">      
               </form>
               <!-- /preSearchForm  -->


               
               
               <!-- 페이징 번호 삽입할 span 태그 선언 -->
               <div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
               <table><tr height=10><td></table>


               <!--======================-->
               <!--======검색결과=======-->
               <!--======================-->
               <form name="preResultForm">
                    <table class="table table-striped table-advance table-hover" id="select">
                     <tr bgcolor="gray">
                        <th> 순서 
                        
                     <!-- 순위-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='ranking desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('ranking asc'); goPreSearch();">매출순위▼
                           </c:when>
                           <c:when test="${param.sort=='ranking asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('ranking desc'); goPreSearch();">매출순위▲
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('ranking asc'); goPreSearch();">매출순위
                           </c:otherwise>
                        </c:choose>
                     <!-- 월매출-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='month_sales desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('month_sales asc'); goPreSearch();">월 매 출 ▼<br>(지난달 기준)
                           </c:when>
                           <c:when test="${param.sort=='month_sales asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('month_sales desc'); goPreSearch();">월 매 출 ▲<br>(지난달 기준)
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('month_sales asc'); goPreSearch();">월 매 출<br>(지난달 기준)
                           </c:otherwise>
                        </c:choose>
                        <!-- 업종-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='business_type desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('month_sales asc'); goPreSearch();">업&nbsp;&nbsp;종▼
                           </c:when>
                           <c:when test="${param.sort=='business_type asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('business_type desc'); goPreSearch();">업&nbsp;&nbsp;종▲
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('business_type asc'); goPreSearch();">업&nbsp;&nbsp;종
                           </c:otherwise>
                        </c:choose>
                        <!-- 인기메뉴분류-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='best_menu_type desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('best_menu_type asc'); goPreSearch();">인기메뉴▼
                           </c:when>
                           <c:when test="${param.sort=='best_menu_type asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('best_menu_type desc'); goPreSearch();">인기메뉴▲
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('best_menu_type asc'); goPreSearch();">인기메뉴
                           </c:otherwise>
                        </c:choose>
                        <!-- 인기메뉴분류-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='addr_dong desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('addr_dong asc'); goPreSearch();">지역(동단위)▼
                           </c:when>
                           <c:when test="${param.sort=='addr_dong asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('addr_dong desc'); goPreSearch();">지역(동단위)▲
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('addr_dong asc'); goPreSearch();">지역(동단위)
                           </c:otherwise>
                        </c:choose>



                     <c:forEach items="${preResultList}" var="preResult" varStatus="loopTagStatus">
                     <tr>
                        <td align=center>${preResult.PAGINGRNUM}
                        <td align=center>${preResult.RANKING}
                        <td align=center class=month_sales>${preResult.MONTH_SALES}
                        <td align=center>${preResult.BUSINESS_TYPE}
                        <td align=center>${preResult.BEST_MENU_TYPE}
                        <td align=center>${preResult.ADDR_DONG}
                     </c:forEach>
                  </table>
               </form>
               <!-- /검색조건 form -->


               <c:if test="${empty preResultList}">
               검색 결과가 없습니다.
               </c:if>



               <br>
               <br>
               <br>
               <br>





               <!--======================-->
               <!-- 창업/소상공인 뉴스 -->
               <!--======================-->
               <form name="preTrendForm">
                  <b>[창업/소상공인 뉴스]</b>
               </form>
      
          </div>
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