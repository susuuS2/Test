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
<title>2차 승인 페이지 </title>
</head>
<body>
<!-- header -->
<jsp:include page="Header.jsp"></jsp:include>


<!-- content -->

<div class="text-center mx-auto col-sm-9">
<div style="float:none; margin:0 auto">

<a href="TeacherList.jo" class="btn">이전 페이지</a>

<table class="table">   
      <tr >
         <td colspan="6"> 선생님 신청  </td>
         <td align="right">
            <font size=2> 선생님 신청 개수 : ${Teachercount }&nbsp;&nbsp;&nbsp;&nbsp;</font>
         </td>
      </tr>
      <tr>
         <td>번호</td>
         <td>이름</td>
         <td>국적</td>            
         <td>과목</td>
         <td>제출 서류</td>
         <td>날짜</td>
         <td>구분</td>
      </tr>
   <c:forEach var="list" items="${Teacherlist }" step="1" varStatus="status">
      <tr>
         <td> ${status.count } </td>
         <td> ${list.joinName } </td>
         <td> ${list.joinNacionalidad } </td> 
         <td>${list.joinSubject }</td>
         <td>
            <a href="FileUpload.jo?filename=${list.joinFile}"> ${list.joinFile }</a>
         </td><!-- 파일 다운로드를 위해서 -->
         <td>${list.joinRegister }</td>
         <td>
            <a href="TeacherTrueTwo.jo?num=${list.joinNum }"> 승인 </a> 
            <a href="TeacherFalseTwo.jo?num=${list.joinNum }&image=${list.joinFile}"> 미승인 </a>
         </td> 
      </tr>   
   </c:forEach>
</table>

<div class="container">
   <ul class="pagination justify-content-center">
      <li class="page-item"> 
         <a class="page-link" href="TeacherTwoList.jo?page=${page - 1}">Previous</a> 
      </li>   
      <li class="page-item"> 
         <c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">                  
              <a class="page-link" href="TeacherTwoList.jo?page=${i}">${i}</a>    </c:forEach>
              </li>
      
      <li class="page-item"> 
         <a class="page-link" href="TeacherTwoList.jo?page=${page + 1};">Next</a> 
      </li>
   </ul> 
</div>      

</div>
</div>



</body>
</html>