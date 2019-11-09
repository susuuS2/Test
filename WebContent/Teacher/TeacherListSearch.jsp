<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="DTO.*, DAO.*, java.util.*" %>
 <%
 	request.setCharacterEncoding("utf-8");
 	String box1 = request.getParameter("searchbox1");
	String box2 = request.getParameter("searchbox2");

	JoinDAO dao = new JoinDAO();
	List<JoinDTO> list = dao.selectListbox(box1, box2);
	
	String sub = request.getParameter("sub");
	List<JoinDTO> list1 = dao.selectListSub(sub);
	
	String loc = request.getParameter("loc");
	List<JoinDTO> list2 = dao.selectListLoc(loc);
	
	String lv = request.getParameter("lv");
	List<JoinDTO> list3 = dao.selectListLv(lv);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 메인 선생님 찾기 </title>
</head>
<body>
<!-- header -->
<jsp:include page="Header.jsp"></jsp:include>


<!-- content -->
<div class="text-center mx-auto col-sm-9">
<div style="float:none; margin:0 auto">

<table class="table table-rounded table-bordered" >	<!-- 검색창 -->
	<%	int j=0;
		for(int i = 0; i < list.size(); i ++) {
			JoinDTO dto1 = list.get(i);
		if(j%4 == 0) {	%>
	<tr>
	<%}	%>
		<td>
			<a href="TeacherDetail.to?num=<%= dto1.getJoinNum() %>"><img class="rounded" src="Join/upload/<%= dto1.getJoinImage() %>" width="300" height="300"></a>
			<p><%= dto1.getJoinName() %></p>
			<p><%= dto1.getJoinLoc() %></p>
			<p><%= dto1.getJoinPrice() %></p>
			<p><%= dto1.getJoinIntro() %></p>
		</td>
	<%j = j+1; } %>
	</tr>
</table>

<table class="table table-rounded table-bordered" >	<!-- 과목창 -->
	<%	int k=0;
		for(int i = 0; i < list1.size(); i ++) {
			JoinDTO dto1 = list1.get(i);
		if(k%4 == 0) {  %>
	<tr>
	<%}	%>
		<td>
			<a href="TeacherDetail.to?num=<%= dto1.getJoinNum() %>"><img class="rounded" src="Join/upload/<%= dto1.getJoinImage() %>" width="300" height="300"></a>
			<p><%= dto1.getJoinName() %></p>
			<p><%= dto1.getJoinLoc() %></p>
			<p><%= dto1.getJoinPrice() %></p>
			<p><%= dto1.getJoinIntro() %></p>
		</td>
	<%	j = j+1; }	%>
	</tr>
</table>
<table class="table table-rounded table-bordered">	 <!-- 지역에 관련된거 -->
	<%	int o=0;
		for(int i = 0; i < list2.size(); i ++) {
			JoinDTO dto1 = list2.get(i);			
		if(o%4 == 0) {	%>
	<tr align="center">
	<%}	%>
		<td align="center">
			<a href="TeacherDetail.to?num=<%= dto1.getJoinNum() %>"><img class="rounded" src="Join/upload/<%= dto1.getJoinImage() %>" width="300" height="300"></a>
			<p><%= dto1.getJoinName() %></p>
			<p><%= dto1.getJoinLoc() %></p>
			<p><%= dto1.getJoinPrice() %></p>
			<p><%= dto1.getJoinIntro() %></p>
		</td>
	<%	j = j+1; } %>
	</tr>
</table>
<table  class="table table-rounded table-bordered">	<!-- 레벨에 관련된거 -->
	<%	int l=0;
		for(int i = 0; i < list3.size(); i ++) {
			JoinDTO dto1 = list3.get(i);
		if(l%4 == 0) {	%>
	<tr align="center"> 
	<%}	%>
		<td align="center">
			<a href="TeacherDetail.to?num=<%= dto1.getJoinNum() %>"><img class="rounded" src="Join/upload/<%= dto1.getJoinImage() %>" width="300" height="300"></a>
			<p><%= dto1.getJoinName() %></p>
			<p><%= dto1.getJoinLoc() %></p>
			<p><%= dto1.getJoinPrice() %></p>
			<p><%= dto1.getJoinIntro() %></p>
		</td>
	<%	j = j+1; } %>
	</tr>
</table>
</div>
</div>



</body>
</html>