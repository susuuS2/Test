<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
 <!-- JS --> <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="StuinquiryPro.jo" method="post" name="frm" id="frm">
		<table border="1" width="60%" heigth="30%">
			<tr >
				<td align="center" width="25%">문의 주제</td>
				<td>
					<select name="JoinSubject" id="JoinSubject"  class="form-control" style="width:300px;display:inline" >
			 				<option selected="selected"> 계정변환 </option>
							<option> 결제 관련 </option>
							<option> 메시지 관련 </option>
							<option> 인증 관련 </option>
							<option> 학생 관련 </option>
							<option> 선생님 관련 </option>						
							<option> 취소 관련 </option>
							<option> 계정 관련 </option>
							<option> 기타질문 </option>
						
			 			</select>
			 	</td>
		
			</tr>
			
			<tr>
				<td align="center"> 문의 제목 </td>
				<td>
					<input type="text" class="form-control" style="width:500px;display:inline" name="JoinTitle" id="JoinTitle" placeholder="제목을 입력해 주세요">
				</td>
			</tr>
			
			<tr>
				<td align="center"> 문의 내용 </td>
				<td>
					<textarea rows="20" cols="65" name="Joincontent" id="Joincontent"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input class="btn btn-default " type="submit" value="문의하기" />&nbsp;		
					<input class="btn btn-reset" type= "reset" value="다시 입력" />&nbsp;
					<input class="btn btn-danger" onclick="javascript:history.back()" type="button" value="문의 취소" />
				</td>
			</tr>
		
		</table>
	</form>
</body>
</html>