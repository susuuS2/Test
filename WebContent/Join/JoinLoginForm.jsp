<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 로그인 아이콘 -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
 <!-- CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
 <!-- JS --> <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-Latest.js"></script>
<script type="text/javascript">

	$(function(){
		$("#id1").focus();//얘가 실행된다면 무조건 포커스를 id1에 줘라
		$("#btn").click(function(){ //이거는 이름이 없는 익명함수라고 하고 click(teee){} 이런식으로 작성하면 이름이 있으니까 사용 가능
			if($("#id1").val() == "") {
				$("#idmsg").html("아이디를 입력하세요.");
				$("#id1").focus();
				return false;
			}
		
			if($("#pw").val() == "") {
				$("#pwmsg").html("비밀번호를 입력하세요.");	
				$("#pw").focus();
				return false;
			}
			$("#frm").submit();
		});	
	});
	// 예시로 ~~ function(teee) {}
</script>
<style type="text/css">
/* header */
	.navbar {width:100%}
		 .jbFixed {position: fixed; top: 0px;}
</style>


</head>
<body>
<!--  header -->



<!-- 로그인 되지 않았을 때 -->
<c:if test="${empty memId}"> <!-- session값이 없으면 empty!! -->
<jsp:include page="aaa.jsp"></jsp:include>

<div class="container" >
		<div class="col-sm-5 p-5 mx-auto" style="background-colorL:yellow">
		<div class="login-box well">
			<form id="frm" name="frm" action="joinLoginPro.jo" method="post">
				<h2 class="text-center" style="margin:15px"> &nbsp;Sign In </h2>
				
					<div class="input-group text-center">
							<span class="input-group-addon" > <i class="fa fa-user"></i>  </span>&nbsp;&nbsp;
							<input type="text" id="id1" name="id1" value="${cookieId }" placeholder="ID를 입력하세요" class="form-control" />
				     </div>
				        <div id="idmsg" class="text-center"> ${failId }</div>
					
					
					<div class="input-group" style="align:center;margin-top:10px;">
						<span class="input-group-addon"> <i class="fa fa-lock"></i>  </span>&nbsp;&nbsp;
						<input type="password"  id="pw" name="pw" placeholder="비밀번호를 입력하세요" class="form-control" />
	                </div>
	               		<div id="pwmsg" class="text-center"> ${failPw} </div>
	                
                <button type="submit" id="login-submit" class="btn btn-success btn-block" style="margin-top:10px" />로그인</button> 
		
				<div class="form-inline p-3 text-center" >
					<span><a href="" class="text-sm" style="text-decoration:none; color:#000000">비밀번호 찾기</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span><a href="" class="text-sm" style="text-decoration:none; color:#000000">아이디 찾기</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span><a href="joinForm.jo" class="btn btn-default btn-block" style="text-decoration:none; color:#000000"> 회원가입</a> </span>
				</div>
		</div>
	</div>
</div>

	
	
	
		</form>

	
	<!-- 로그인 되었을 때 -->
	</c:if>
	<c:if test="${ aaas eq 1 }">	<!--  학생 -->
		<jsp:include page="../Main/StudentMain.jsp"><jsp:param value="${sel.joinNum }" name="num"/></jsp:include>
	
	</c:if>
	
	<c:if test="${ aaas eq 2 }">	<!-- 관리자 -->
		<jsp:include page="../Main/AdminMain.jsp"><jsp:param value="${sel.joinNum}" name="num"/></jsp:include>
	</c:if>
	 
	<c:if test="${ aaas eq 3 }">	<!-- 선생 1차 승인 됐을때 -->
	
		<jsp:include page="../Main/TeacherMain.jsp"><jsp:param value="${sel.joinNum}" name="num"/></jsp:include><!-- 선생님 메인페이지로 값을 전달하기 위해서 사용 -->
	</c:if>
	
	<c:if test="${ aaas eq 4 }">	 <!--  선생님 접속 -->
		
		<jsp:include page="../Main/TeacherMain.jsp"><jsp:param value="${sel.joinNum}" name="num"/></jsp:include><!-- 선생님 메인페이지로 값을 전달하기 위해서 사용 -->
	
	</c:if>


	
</body>
</html>