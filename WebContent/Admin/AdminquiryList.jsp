<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
<script type ="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	    $("#StuTeacher1").change(function(){
	        if($("#StuTeacher1").is(":checked")){
	        	location.href="../index.jo"
	        }
	    });
	    
	    $("#StuTeacher2").change(function(){
	       if($("#StuTeacher2").is(":checked")){
	        	location.href="../index.jo"
	        }
	    });
	    
	    if($("#StuTeacher2").is(":checked") && $("#StuTeacher1").is(":checked")) {
	    	location.href="AdminquiryList.jo"
	    }
	});
	

	
</script> -->




</head>
<body>
 	<jsp:include page="../Admin/atop.jsp"></jsp:include>
 	
 	
 	<div>
		<a href="joinLogin.jo">이전 페이지</a>	
	</div>
 	
 		<form action="AdminquiryListTwo.jo" method="post" id="frm">
 			<select name="TeacherSubject" id="TeacherSubject"  class="form-control" style="width:300px;display:inline" >
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
			
			<input type="submit" value="검색"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<select name="Substu" id="Substu"  class="form-control" style="width:300px;display:inline" >
			 	<option selected="selected"> 모두 </option>
				<option> 선생님 </option> 
				<option> 학생 </option>
			
			</select>
			
			
		</form>
 	
 	
	
	
	
	
 	<table border="1" width="80%">	
 	
 		<tr align="center" valign="middle">
					<td colspan="5"> 1:1 문의  </td>
					<td align="right">
						<font size=2> 문의 신청 개수 : ${Count }&nbsp;&nbsp;&nbsp;&nbsp;</font>
					</td>
				</tr>
 	
 		<tr align="center">
 			<td>번호</td>
 			<td>작성자</td>
 			<td>주제</td>
 			<td>제목</td>
 			<td>내용</td>
 			<td>구분</td>
 		</tr>
 	
 		<c:forEach var="list" items="${list }" step="1" varStatus="status">
	 		<tr align="center">
		 		<td>${status.count }</td>
		 		<td>${list.joinName }</td>
		 		<td>${list.joinSubject }</td>
		 		<td>${list.joinTitle }</td>
		 		<td>${list.joinContent }</td>
		 		<td>
		 			<a href="#">답변</a>
		 			<a href="#">삭제</a>
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
							<a href="AdminquiryList.jo?page=${page - 1}">[이전]</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
							<a href="AdminquiryList.jo?page=${i}">[${i}]</a>
						</c:forEach>
						
						<c:if test="${page < maxPage}">
							[이후]&nbsp;
						</c:if>
						
					<c:if test="${page >= maxPage}">
						<a href="AdminquiryList.jo?page=${page + 1}">[이후]</a> 
					</c:if>
					
				</td>
			</tr>
		
		</table>
	</div>
</body>
</html>