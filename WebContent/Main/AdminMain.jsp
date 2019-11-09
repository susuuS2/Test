<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ page import="DTO.*, DAO.*, java.util.*" %>   
 <%
	 String aa = request.getParameter("num");
	 Integer num1 = Integer.parseInt(aa);
	 
	 JoinDAO dao = new JoinDAO();
	 JoinDTO dto = dao.selea(num1);
	 
	 
		int page1 = 1;
		int limit = 12;


		List<JoinDTO> list = dao.SelectListThe(page1, limit);
		Integer Count = dao.TeacherCountTwo();
	
 %>
<!-- 메인페이지 다시 해줘야함 리스트항목... 레벨을  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 혜윰 </title>
<meta name="viewport" content="width=device-width, initial-scale=1">

 <!-- CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
 <!-- JS --> <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>




 <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.navbar' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.navbar' ).addClass( 'jbFixed' );
          }
          else {
            $( '.navbar' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>
    
    
<style type="text/css">

/* header */
	a{font-size:10px;height:80px}
/* content */
	.navbar {width:100%}
	.jbFixed {position: fixed; top: 0px;}

	#searchLoc, #selectSub{width:300px}
	
	#btnSearch{background-color:green; border:green}
	
	
	.teacherPics {background:gray; 
				width:100%; 
				 height: 2000px;	
				}
	
     
      
      
 /* footer */
      .footer{width:"100%"; height:200px; background-color:black}
</style>


<script type="text/javascript" src="jquery/lib/jquery.js"></script>
<script type='text/javascript' src='jquery/lib/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='jquery/lib/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="jquery/jquery.autocomplete.css" />
 
 
 
	<script>
	var availableTags1 = [
							'한국어', '영어', '스페인어', '독일어', '베트남어', '중국어', '일본어', '아랍어', '태국어', '이탈리아어', '포르투갈어', '폴란드어', '러시아어', '힌디어', '인도네시아어',
							'요가', '스트레칭', '춤', '달리기', '보드',
							'C언어', 'C++', 'java', '파이썬', '코틀린', '루아', '루비', '머신러닝', 'UI', '웹개발', '앱개발',
							'해금', '대금', '거문고', '보컬', '드럼', '기타', '피아노', '바이올린'
						];
	
	var availableTags2 = [
							'강릉', '거제', '경산', '경주', '계룡', '고양', '공주', '과천', '광명', '광양', '광주', '광주광역시',
							'구리', '구미', '군산', '군포', '김제', '김천', '김포', '김해', '나주', '남양주', '남원', '논산',
							'당진', '대구광역시', '대전광역시', '동두천', '동해', '목포', '문경', '밀양', '보령', '부산광역시',
							'부천', '사천', '삼척', '상주', '서귀포', '서산', '서울특별시', '성남', '세종특별자치시', '속초',
							'수원', '순천', '시흥', '아산', '안동', '안산', '안성', '안양', '양산', '양주', '여수', '영주',
							'영천', '오산', '용인', '울산광역시', '원주', '의왕', '의정부', '이천', '이천', '익산', '인천광역시',
							'전주시', '정읍', '제주도', '제천', '진주', '창원', '천안', '청주', '춘천', '충주', '태백', '통영',
							'파주', '평택', '포천', '포항', '하남', '화성'
		
		
		
	];
	</script>
	
	<script>
	$(function(){
	
		$("#frm").submit(function(){
		      if($("#searchbox1").val() == ""){
		         $("#searchbox1").focus();
		         alert("1번 박스 입력요.");
		         return false; //결국 false는 break;같은거 폼전송 안되게
		      }
		      if($("#searchbox2").val() == ""){
			         $("#searchbox2").focus();
			         alert("2번 박스 입력요.");
			         return false; //결국 false는 break;같은거 폼전송 안되게
			      }
		
		
		  });
		
		$(document).ready(function() {
		    $("#searchbox1").autocomplete( availableTags1,{ 
		        matchContains: true,
		        selectFirst: false
		    });
		    
		    $("#searchbox2").autocomplete( availableTags2,{ 
		        matchContains: true,
		        selectFirst: false
		    });
		});
	
	});
	</script>
	<style>
.aa{list-style:none;
	  padding-left:0px;
	  width: 300px;
	}
li> .btn{ font-size:10pt;}
</style>
	
</head>
<body>

<!-- header -->
<nav class="navbar navbar-expand-sm navbar-light bg-light"> 
	<a href="joinLogin.jo" class="navbar-brand"><img src="#" />LOGO</a>
		<!-- Toggle Button --> 
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse"> 
			<span class="navbar-toggler-icon"></span>
		 </button> 
		<div class="collapse navbar-collapse" id="collapsibleNavbar"> 
			<ul class="navbar-nav ml-auto"> 
				<li class="nav-item">
					<a href="joinLogout.jo" class="nav-link">로그아웃</a>
				</li> 
				<li class="nav-item">
					<a href="TeacherList.jo" class="nav-link">선생님 신청 조회</a>
				</li> 
				
				<li class="nav-item">
					<a href="AdminStuList.jo" class="nav-link">회원 조회</a>
				</li>  
				
				<li class="nav-item">
					<a href="AdminTeacherList.jo" class="nav-link">선생님 조회</a>
				</li>  
				
				
				<li class="nav-item">
					<a href="AdminquiryList.jo" class="nav-link">1:1 문의 조회</a>
				</li>
				
				<li class="nav-item">
					<a href="#" class="nav-link"> "about us"</a>
				</li>
			</ul>
		</div> 
</nav>


<!-- content -->
<div class="jumbotron text-center mb-0">
	<h1 class="text-center"> 환영합니다 !</h1>
	<br/>
		<p class="text-center"> 나한테 딱 맞는 선생님 찾기 </p>
			<p class="text-center">
				<form action="Teachersearch.to" method="post" id="frm" name="frm">
				
					  <input type="text" id="searchbox1" name="searchbox1">
					  <input type="text" id="searchbox2" name="searchbox2">
					  <input  type="submit" id="sumit" value="검색">
				</form>
				<!-- SUBJECT -->				
			</p>
			
</div> 

	
		<table width="100%" celladding="0" cellspacing="0">	
			<%
			   int j=0;
			for(int i = 0; i < list.size(); i ++) {
				JoinDTO dto1 = list.get(i);
				if(j%4 == 0) {
			
			%>
		
		
		<tr align="center">

			<%}	%>
			<td align="center">
				<a href="TeacherDetail.to?num=<%= dto1.getJoinNum() %>"><img src="Join/upload/<%= dto1.getJoinImage() %>" width="300" height="300"></a>
				<p><%= dto1.getJoinName() %></p>
				<p><%= dto1.getJoinLoc() %></p>
				<p><%= dto1.getJoinPrice() %></p>
				<p><%= dto1.getJoinIntro() %></p>
			</td>
			
			<%j = j+1; } %>
			</tr>
		</table>
			</div>
	<div>		
		<table class="table table-borderless">
			<tr>
				<td><h3> language </h3></td>
				<td><h3> sport </h3></td>
				<td><h3> Programming </h3></td>
				<td><h3> Introduction </h3></td>
			</tr>
			<tr>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=한국어"> 한국어 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=요가"> 요가 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=C언어"> C언어 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=해금>"> 해금 </a></td>
			</tr>
			<tr>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=영어"> 영어 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=스트레칭"> 스트레칭 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=C++"> C++ </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=가야금"> 가야금 </a></td>
			</tr>
			<tr>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=스페인어"> 스페인어 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=춤"> 춤 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=Java"> Java </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=대금"> 대금 </a></td>
				</tr>
			<tr>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=프랑스어"> 프랑스어 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=달리기"> 달리기 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=파이썬"> 파이썬 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=거문고"> 거문고 </a></td>
			</tr>
			<tr>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=독일어"> 독일어 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=보드"> 보드 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=코틀린"> 코틀린 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=보컬"> 보컬 </a></td>
			</tr>
			<tr>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=베트남어"> 베트남어 </a></td>
				<td>  </td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=루아"> 루아 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=드럼"> 드럼 </a></td>
			</tr>		
			<tr  >
				<td><a class="btn btn-default" href="Teachersearch.to?sub=중국어"> 중국어 </a></td>
				<td>  </td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=루비"> 루비 </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?sub=기타"> 기타 </a></td>
			</tr>
		</table>
	</div>		
	<div>
		<table class="table table-borderless">
			<h4>지역</h4>	
			<tr>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=강릉"> 강릉 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=거제"> 거제 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=경산"> 경산 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=경주"> 경주 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=계룡"> 계룡 </a></td>
			</tr>
			<tr >
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=고양"> 고양 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=공주"> 공주 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=과천"> 과천 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=광명"> 광명 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=광양"> 광양 </a></td>
			</tr>
			<tr>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=광주"> 광주 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=광주광역시"> 광주광역시 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=구리"> 구리 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=구미"> 구미 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=군산"> 군산 </a></td>
			</tr>
			<tr>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=군포"> 군포 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=김제"> 김제 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=김천"> 김천 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=김포"> 김포 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=김해"> 김해 </a></td>
			</tr>
			<tr>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=나주"> 나주 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=남양주"> 남양주 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=남원"> 남원 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=논산"> 논산 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=당진"> 당진 </a></td>
			</tr>	
			<tr>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=대구광역시"> 대구광역시 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=대전광역시"> 대전광역시 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=동두천"> 동두천 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=동해"> 동해 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=목포"> 목포 </a></td>
			</tr>
			<tr>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=문경"> 문경 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=밀양"> 밀양 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=보형"> 보령 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=부산광역시"> 부산광역시 </a></td>					
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=부천"> 부천 </a></td>
			</tr>
			<tr>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=사천"> 사천 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=삼척"> 삼척 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=상주"> 상주 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=서귀포"> 서귀포 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=서산"> 서산 </a></td>
			</tr>
			<tr>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=서울특별시"> 서울특별시 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=성남"> 성남 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=세종특별자치시"> 세종특별자치시 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=속초"> 속초 </a></td>
				<td width="20%"><a class="btn btn-default" href="Teachersearch.to?loc=수원"> 수원 </a></td>
			</tr>	
		</table>
	</div>
	</div>
	<div class="p-3">
		<table class="table table-borderless">
			<h5>레벨</h5>	
			<tr  >
				<td><a class="btn btn-default" href="Teachersearch.to?lv=A+"> A+</a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?lv=A"> A </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?lv=B+"> B+ </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?lv=B"> B </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?lv=C+"> C+ </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?lv=C"> C </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?lv=D+"> D+ </a></td>
				<td><a class="btn btn-default" href="Teachersearch.to?lv=D"> D </a></td>
			</tr>			
		</table>
	</div>
</div>
</div>




<!-- footer -->

<!-- 하단  -->

<div class="text-center col-sm-15 mx-auto bg-light p-3">
<div style="float:none; margin:0 auto;">
	<div class="form-inline">
		<div class="text-center">
			<ul class="aa">
				<li> <a class="btn btn-default" href="#" ><strong>회사정보</strong></a> </li>
				<li> <a class="btn btn-default" href="#"> 도움말 </a> </li>
				<li> <a class="btn btn-default" href="#"> 사용방법</a> </li>
				<li> <a class="btn btn-default" href="#"> 선생님을 찾습니다 </a> </li>
				<li> <a class="btn btn-default" href="#"> Status </a> </li>
			</ul>
		</div>
		<div class="text-center" style="margin-left:100px;">
			<ul class="aa">
				<li> <a href="#" class="btn btn-default"><strong>배우기</strong></a> </li>
				<li> <a class="btn btn-default" href="#"> 질문 및 응답 </a> </li>
				<li> <a class="btn btn-default" href="#"> 선생님 찾기 </a> </li>
				<li> <a class="btn btn-default" href="#"> 제휴 프로그램 </a> </li>
				<li> <a class="btn btn-default" href="#"> 추천 프로그램 </a> </li>
			</ul>
		</div>
		<div class="text-center" style="margin-left:100px;">
			<ul class="aa">
				<li> <a href="#" class="btn btn-default"><strong>수업 기회</strong></a> </li>
				<li> <a class="btn btn-default" href="#"> 선생님되기 </a> </li>
				<li> <a class="btn btn-default" href="#"> 프리랜서로 일하기 </a> </li>
			</ul>
		</div>
	</div>

<div class="text-center col-sm-20 mx-auto bg-light p-3">
<div style="float:none; margin:0 auto;">
	<div class="form-inline">
		<div class="text-center">
			<ul class="aa">
				<li> <a href="#" class="btn btn-default"><strong>  지원 </strong></a> </li>
				<li> <a class="btn btn-default" href="#"> 도움이 필요하십니까? </a> </li>
				<li> <a class="btn btn-default" href="#"> <i class="fa fa-envelope"> jhsk30@naver.com</i> </a> </li>
			</ul>
		</div>
		<div class="text-center" style="margin-left:100px;">
			<ul class="aa">
				<li> <a href="#" class="btn btn-default"><strong> 연락처 </strong></a> </li>
				<li> <a class="btn btn-default" href="#"> 한국 </a> </li>
				<li> <a class="btn btn-default" href="#"> USA </a> </li>
			</ul>
		</div>
		<div class="text-center" style="margin-left:100px;">
			<ul class="aa">
				<li> <a href="#" class="btn btn-default"><strong> 혜윰 소셜 </strong></a> </li>
				<li> <a class="btn btn-default" href="#"> SNS </a> </li>
			</ul>
		</div>
	</div>
</div>
</div>


<div class="text-center col-sm-15 mx-auto bg-light p-3">
<div style="float:none; margin:0 auto;">
	<div class="form-inline">
		<div class="text-center" style="margin-top:50px">
			<ul class="aa">
				<li> <p>ⓒ2019-2019 HaeYum Inc.</p> </li>
			</ul>
		</div>
		<div class="text-center" style="margin-left:100px;">
			<ul class="aa">
				<li> <a class="btn btn-default" href="#"> 이용 약관  </a> </li>
				<li> <a class="btn btn-default" href="#"> 개인정보 보호정책 </a> </li>
			</ul>
		</div>
		<div class="text-center" style="margin-left:100px;">
			<ul class="aa">
				<li> <a class="btn btn-default" href="#"> 쿠키정책 </a> </li>
				<li> <a class="btn btn-default" href="#"> 환불정책 </a> </li>
			</ul>
		</div>
	</div>
</div>
</div>

</div>
</div>


</body>
</html>

