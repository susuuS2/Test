<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type ="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

function delchk(){
    return confirm("삭제하시겠습니까?");
}

</script>


</head>
<body>
 	<jsp:include page="../Admin/atop.jsp"></jsp:include>
 	
 	
 	<div>
		<a href="joinLogin.jo">이전 페이지</a>	
	</div>

 	<table border="1" width="80%">	
 	
 		<tr align="center" valign="middle">
					<td colspan="6"> 회원자 수  </td>
					<td align="right">
						<font size=2> 회원 수  : ${Count }&nbsp;&nbsp;&nbsp;&nbsp;</font>
					</td>
				</tr>
 	
 		<tr align="center">
 			<td>번호</td>
 			<td>이름</td>
 			<td>국적</td>
 			<td>생일</td>
 			<td>이메일</td>
 			<td>날짜</td>
 			<td>구분</td>
 		</tr>
 	
 		<c:forEach var="list" items="${list }" step="1" varStatus="status">
	 		<tr align="center">
		 		<td>${status.count }</td>
		 		<td>${list.joinName }</td>
		 		
		 		<td>${list.joinBirth1 }년 ${list.joinBirth2 }월  ${list.joinBirth3 }일</td>
		 		<td>${list.joinNacionalidad }</td>
		 		<td>${list.joinEmail1 }@${list.joinEmail2 }</td>
		 		<td>${list.joinRegister }</td>
		 		<td>
		 			<a href="#">수정</a>
		 			<a href="AdminDeletePro.jo?num=${list.joinNum }" onclick="return delchk();">삭제하기</a>
		 			
		 		</td>
	 		</tr>
 		</c:forEach>
 	
 	</table>
 	
 	<div align="center">
			<table>
			<tr>
				<td> 
					<c:if test="${page <= 1}">
						[이전]&nbsp;
					</c:if>
					
						<c:if test="${page > 1}">
							<a href="AdminTeacherList.jo?page=${page - 1}">[이전]</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
							<a href="AdminTeacherList.jo?page=${i}">[${i}]</a>
						</c:forEach>
						
						<c:if test="${page < maxPage}">
							[이후]&nbsp;
						</c:if>
						
					<c:if test="${page >= maxPage}">
						<a href="AdminTeacherList.jo?page=${page + 1}">[이후]</a> 
					</c:if>
					
				</td>
			</tr>
		
		</table>
	</div>
</body>
</html>