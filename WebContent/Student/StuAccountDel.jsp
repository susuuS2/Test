<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 학생 탈퇴 </title>
</head>
<body>
<!-- header -->
<jsp:include page="Header.jsp"></jsp:include>

<!-- Content -->
<div class="text-center" style="width: 100%">
  <div style="width:30%; float:none; margin:0 auto">
  <form action="StuAccountDelCom.jo" method="post">
	<table class="table table-borderless p-5">
		<tr>
			<td><h2 class="text-center" style="margin-top:30px;"> 정말로 탈퇴하시겠습니까? </h2></td>
		</tr>
		<tr>
			<td>
				<p>탈퇴 사유를 알려주세요.</p>
				<textarea class="form-control" style="width:500px;height:200px"></textarea>
			</td>
		</tr>
		<tr>		
			<td>
			<br/>
			 <div class="alert alert-success">
				 <p style="margin:3px"> 탈퇴를 위해선 비밀번호 확인이 필요합니다. </p>
				</div>
				<div class="input-group">
				 <span class="input-group-addon p-2 ">비밀번호</span>
					<input type="password" class="form-control input" name="pw" id="pw" placeholder="비밀번호"> 
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<button class="btn btn-success col-sm-2" type="submit">탈퇴</button>
			</td>
		</tr>
	</table>
	</form>
</div>
</div>


<!-- footer -->


</body>
</html>