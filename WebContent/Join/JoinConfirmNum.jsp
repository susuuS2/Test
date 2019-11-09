<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

 <!-- CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
 <!-- JS --> <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function (){
		$("#btn").click(function(){
			$(opener.document).find("#JoinId").val($("#JoinId").val());
			$(opener.document).find("#JoinConfirmNum").val($("#num").val());
			window.close();
		});
	});
</script>
</head>
<body>
		<!-- 로고 넣어주기 -->
<div class="text-center p-5">
	<div style="float:none;margin:0 auto">
		<form action="JoinIdCon.jo" method="post" name="frm" >
			<div class="text-center col-sm-2">
				<div style="margin:0 auto">
					<input type="text" class="form-control " name="JoinId" value="${JoinId }" id="JoinId">
				</div>
			</div>
				<div>${msg }</div><!-- 텍스트값 출력 -->
			<input type="hidden" class="form-control" value="${num }" id="num" name="num" />
			<input type="submit" class="form-control" value="아이디확인" />
			<input type="button" class="form-control" value="닫기" id="btn" />
		</form>
	</div>
</div>



</body>
</html>