<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 학생 마이페이지1 </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 로그인 아이콘 -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
 <!-- CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
 <!-- JS --> <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-Latest.js"></script>
<script type="text/javascript"></script>

</head>
<body>
<!-- header -->
<jsp:include page="Header.jsp"></jsp:include>


<!-- content -->
<!-- 학생 정보는 <table>형식으로 첫 <td>는 이름, 아이디, 생년월일, 성별, 이메일, 주소, 국적, 연락처를 순서대로 주면서 두 번째 <td>에는 로그인한 사용자에 대한 정보를 주도록 한다. 하단에는 수정, 탈퇴라는 버튼을 만들어 주면서 해당 버튼을 클릭하면 해당 내용으로 넘어가게  -->
<div class="row">
<div class="text-center col-sm-6 mx-auto">
<div class="p-5">
	<table class="table table-sm">
		<tr>
			<td class="p-3"> 이름 </td> <td> ${dto.joinName } </td>
		</tr>
		<tr>
			<td  class="p-3"> 아이디 </td> <td> ${dto.joinId } </td>
		</tr>
		<tr>
			<td  class="p-3"> 생년월일 </td> <td> ${dto.joinBirth1 }년 ${dto.joinBirth2 } 월 ${dto.joinBirth3 }일 </td>
		</tr>                               
		<tr>
			<td class="p-3"> 성별 </td> <td> ${dto.joinSex } </td>
		</tr>
		<tr>
			<td class="p-3"> 이메일 </td> <td> ${dto.joinEmail1 }@${dto.joinEmail2 }  </td>
		</tr>
		<tr>
			<td  class="p-3"> 주소 </td> <td> ${dto.joinAddr1 }  ${dto.joinAddr2 }  ${dto.joinAddr3 } </td>
		</tr>
		<tr>
			<td class="p-3"> 국적 </td> <td> ${dto.joinNacionalidad } </td>
		</tr>
		<tr>
			<td class="p-3"> 연락처 </td><td> ${dto.joinPh1 } - ${dto.joinPh2 } - ${dto.joinPh3 } </td>
		</tr>
		<tr>
			<td  class="p-5" colspan="2">
				<a href="CheckPass.jo" class="btn btn-success col-sm-2 p-2"> 수정 </a>   
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="StuAccountDel.jo" class="btn btn-success col-sm-2 p-2"> 탈퇴 </a>
			</td>
		</tr>
	</table>
	</div>
</div>
</div>

<!-- footer -->


</body>
</html>