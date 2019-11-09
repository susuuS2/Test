<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script>

$(function(){
	$("#frm").submit(function(){
		if($("#pw").val() == "") {
			alert("111111");
			$("#pw").focus();
			return false;
		}		
	});
		
});
</script>


</head>
<body>

<!-- header -->
<jsp:include page="Header.jsp"></jsp:include>

<!-- content 비번 확인 -->

<div class="row col-sm-8 p-5 mx-auto">
<div class="p-5" style="margin:0 auto">
<form action="CheckPw.jo" name="frm" id="frm" method="post">
	<table class="table  mx-auto">
		<tr>
			<td> 
				<h2>비밀번호 확인</h2>
				<br/>
				<small> <strong>학생의 정보를 안전하게 보호하기 위해 비밀번호를 다시 확인 합니다.</strong></small>
			</td> <!-- 크고 두껍게  -->	
		</tr>
		<tr>
			<td class="col-sm-8">
				<input type="password" class="form-control col-sm-7 " style="display:inline" name="pw" id="pw" placeholder="비밀번호를 입력하세요" >
				&nbsp;&nbsp;
				<input type="submit" class="btn btn-primary " style="display:inline" value="확인" id="submit"/>
				
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" class="">비밀번호를 잊으셨나요?</a>
			</td>
		</tr>
		<tr>
			<td><small>혜윰은 개인정보를 신중하게 취급하며 사용자의 동의 없이 기재한 학생 정보를 공개 및 변경하지 않습니다.</small></td>
		</tr>
</table>
</form>
</div>
</div>


</body>
</html>