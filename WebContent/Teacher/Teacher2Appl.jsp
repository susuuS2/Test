<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- header -->
<jsp:include page="Header.jsp"></jsp:include>


<!-- content -->

<div class="text-center mx-auto col-sm-5">
<div style="float:none; margin:0 auto">
<div class="p-5">
	<h5>제출할 파일을 선택해주세요</h5>	
	<br/>
<form action="Teacher2Applpro.to?num=${dto.joinNum }" method="post" enctype="multipart/form-data" >

	<div>
		<label class = "btn btn-primary btn-file"> 
			 파일 선택<input type="file" name="JoinFile" id="JoinFile" style="display: none;"/>
		</label> 	
	</div>
		<br/>
	<div>	
		<input type="submit" class="btn btn-success" value="제출 하기"/>&nbsp;&nbsp;
		<input type= "button" class="btn btn-success" onclick="javascript:history.back()" value="뒤로 가기" />
	</div>
	
	</form>
</div>
</div>
</div>


</body>
</html>