<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="javax.activation.*, javax.mail.*" %>
<%@ page import="java.util.*,javax.mail.internet.*, java.text.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1차 승인</title>
</head>
<body>
<!-- header -->
<jsp:include page="Header.jsp"></jsp:include>


<!-- content -->
<div class="text-cener mx-auto col-sm-9 P-5">
<div style="float:none; margin:0 auto">
	<div style="width:100%">
		<div class="float-left">
			<a href="TeacherTwoList.jo" class="btn btn-success">2차 승인 페이지</a>
		</div>
		<div class="float-right">
			<a href="joinLogin.jo" class="btn btn-success ">이전 페이지</button></a>
		</div>
	</div>
	
		<div>
			<table class="table table-hoverd table-bordered table-striped">	
				<tr align="center" valign="middle">
					<td colspan="5"> 선생님 신청  </td>
					<td align="right">
						<font size=2> 선생님 신청 개수 : ${Teachercount }&nbsp;&nbsp;&nbsp;&nbsp;</font>
					</td>
				</tr>
			
				<tr align="center" valign="middle">
					<td>번호</td>
					<td>이름</td>
					<td>국적</td>
					<td>과목</td>
					<td>날짜</td>
					<td>구분</td>
				</tr>
				
				<c:forEach var="list" items="${Teacherlist }" step="1" varStatus="status">
				<tr align="center" valign="middle">
					<td> ${status.count } </td>
					<td> ${list.joinName } </td>
					<td> ${list.joinNacionalidad } </td> 
					<td> ${list.joinSubject } </td>
					<td> <fmt:formatDate value="${list.joinRegister }" type="date"/> </td>
					
					<td>
					
						<a href="TeacherTrue.jo?num=${list.joinNum }"> 승인 </a> 
						<a href="TeacherFalse.jo?num=${list.joinNum }"> 미승인 </a>
					</td> 
				</tr>	
				</c:forEach>
			</table>
		</div>	
		
		<div class="container">
		  <ul class="pagination justify-content-center">

	    	<li class="page-item"> 
	    		<a class="page-link" href="TeacherList.jo?page=${page - 1}">Previous</a> 
	    	</li>	
		   	<li class="page-item"> 
				<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">		   			
		   			<a class="page-link" href="TeacherList.jo?page=${i}">${i}</a> </li>
   				</c:forEach>
		    <li class="page-item"> 
		    	<a class="page-link" href="TeacherList.jo?page=${page + 1};">Next</a> 
		    </li>
	  	</ul> 
	</div>
	
</div>
</div>

	
</body>
</html>