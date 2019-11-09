<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 메인 점보트론 </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
/* content */
	.navbar {width:100%;height:80px}
	.jbFixed {position: fixed; top: 0px;}
	
	.jumbotron{
	height:400px;
	
	/* background-image: url('../images/pawel.jpg'); */
	bavkground-size:cover;
	text-shadow: black 0.1em 0.1em 0.1em; 
	color:white; 
	}
</style>

</head>
<body>

<!-- content -->
<div class="jumbotron text-center mb-0" style="background-color:#04B45F;">
<div style="margin-top:100px;">
	<h1 class="text-center"> 환영합니다 !</h1>
		<br/>
	<p> 나한테 딱 맞는 선생님 찾기 </p>
		<form action="Teachersearch.to" method="post" id="frm" name="frm">
			<div class="mx-auto form-inline">
			<div style="margin:0 auto; "> 
			  	<input type="text" class="form-control col-sm-7" id="searchbox1" name="searchbox1">
			 	<input type="text" class="form-control col-sm-7" id="searchbox2" name="searchbox2">
			 	<input  type="submit" class="btn btn-light" id="submit" value="검색">
			</div>
			</div>
		</form>
	</div>
</div>



</body>
</html>