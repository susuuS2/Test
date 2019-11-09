<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../Main/top.jsp"></jsp:include>
	<form action="#" method="post">
		<table width="80%" celladding="0" cellspacing="0" >
			
			
			<tr align="center">
				<td rowspan="2" width="45%"><img src="Join/upload/${dto.joinImage}"/ width="200" height="200"></td>
				<td align="left" rowspan="2" width="15"> ${dto.joinName } </td>
				<td align="right"> ${dto.joinPrice }/hr </td> <!-- 이거 가격만 크기좀 키워주삼 -->
			</tr>
			<tr align="center">
				
				<td align="right" width="20%"> <input type="submit" value="메시지 보내기" />  </td> 
			</tr>
		
		</table>
		
		<table width="80%" celladding="0" cellspacing="0">
			<tr>
				<td width="20%" align="center"> 프로필 실명확인 </td>
				<td width="10%" align="right"><img src="images/chk.png" width="25" height="25"></td>
				<td rowspan="5" width="50%" align="center"><h3>${dto.joinIntro }</h3> ${dto.joinPre }</td>
				
			</tr>
			<tr>
				<td width="20%" align="center"> 메시지 답장 시간 </td>
				<td width="10%" align="right"><img src="images/time.jpg" width="25" height="25"></td>
			
				
			</tr>
			
			<tr>
				<td width="20%" align="center"> 수업 방식 </td>
				<td width="10%" align="right"> 개인별, 그룹별 </td>
			
				
			</tr>
			
			<tr>
				<td width="20%" align="center"> 수업 장소 </td>
				<td width="10%" align="right"> 집, 화상통화 </td>
			
				
			</tr>
			
			<tr>
				<td width="20%" align="center"> 과목 </td>
				<td width="10%" align="right"> ${dto.joinSubject } </td>
			
				
			</tr>
		
		</table>
	</form>
</body>
</html>