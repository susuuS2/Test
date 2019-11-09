<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="text-center mx-auto col-sm-10">
<div style="float:none; margin:0 auto">
	<form action="#" name="frm" id="frm" method="post" >
		<input type="hidden" value="${dto.joinNum }"  name="num"/>
		<table  class="table">
			<tr>
			  <td rowspan="19">
			      <jsp:include page="left.jsp" flush="false"/>
			   </td>
			</tr>
			<tr >
				<td colspan="2" rowspan="19" width="18%" valign="top"><img src="Join/upload/${dto.joinImage }" width="100" height="100"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${dto.joinId }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${dto.joinName }</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${dto.joinBirth1}-${dto.joinBirth2}-${dto.joinBirth3 }</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${dto.joinSex }</td>
			</tr>			
			<tr>
				<td>국적</td>
				<td>${dto.joinNacionalidad }</td>
			</tr>			
			<tr>
				<td>연락처</td>
				<td>${dto.joinPh1 }-${dto.joinPh2 }-${dto.joinPh3 }</td>
			</tr>			
			<tr>
				<td>이메일</td>
				<td>${dto.joinEmail1 }@${dto.joinEmail2 }</td>
			</tr>			
			<tr>
				<td>과목</td>
				<td>${dto.joinSubject }</td>
			</tr>		
			<tr>
				<td>한 줄 소개</td>
				<td>${dto.joinIntro }</td>
			</tr>			
			<tr>
				<td>지역</td>
				<td>${dto.joinLoc }</td>
			</tr>			
			<tr>
				<td>학력</td>
				<td>${dto.joinHav }</td>
			</tr>			
			<tr>
				<td>자격증</td>
				<td>${dto.joinInli }</td>
			</tr>
			<tr>
				<td>수업 경력</td>
				<td>${dto.joinExpe1 }</td>
			</tr>			
			<tr>
				<td>전문 분야 경력</td>
				<td>${dto.joinExpe2 }</td>
			</tr>			
			<tr>
				<td>선호하는 학생의 레벨</td>
				<td>${dto.joinStulev }</td>
			</tr>			
			<tr>
				<td>자기소개</td>
				<td><textarea  cols="30" rows="18" value="${dto.joinPre }">${dto.joinPre }</textarea></td>
			</tr>			
			<tr align="center">
				<td colspan="2"> 
					<input class="form-control" type="submit" name="sub" id="sub" value="수정하기"/> 
					<input class="form-control" type="submit" name="sub" id="sub" value="탈퇴하기"/> 
				</td>
			</tr>		
		</table>
	</form>
</div>
</div>
	
	
</body>
</html>