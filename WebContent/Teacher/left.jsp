<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="DTO.*, DAO.*" %>   
 <%
	 String aa = request.getParameter("num");
	 Integer num1 = Integer.parseInt(aa);
	 
	 JoinDAO dao = new JoinDAO();
	 JoinDTO dto = dao.selea(num1);
 
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>
<a href="Teacher2Appl.to?num=<%= dto.getJoinNum() %>"> 2차 서류 제출하기</a> <br/>
<a href="TeacherCheckPass.to" class="btn"> 수정 </a>   <br/>				
<a href="TeacherDelete.to" class="btn"> 탈퇴 </a>
</body>
</html>