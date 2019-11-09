<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

 <!-- CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
 <!-- JS --> <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style type="text/css">

/* header */
	a{font-size:10pt}
/* content */
	.navbar {width:100%}
	.jbFixed {position: fixed; top: 0px;}

	#searchLoc, #selectSub{width:300px}
	
	#btnSearch{background-color:green; border:green}
	
	
	.teacherPics {background:gray; 
				width:100%; 
				 height: 2000px;	
				}
	
     
      
      
 /* footer */
      .footer{width:"100%"; height:200px; background-color:black}
</style>


</head>
<body>

<!-- header -->
<nav class="navbar navbar-expand-sm navbar-light bg-light"> 
	<a href="joinLogin.jo" class="navbar-brand"><img src="#" />LOGO</a>
		<!-- Toggle Button --> 
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse"> 
			<span class="navbar-toggler-icon"></span>
		 </button> 
		<div class="collapse navbar-collapse" id="collapsibleNavbar"> 
			<ul class="navbar-nav ml-auto"> 
				<li class="nav-item">
					<a href="joinLogout.jo" class="nav-link">로그아웃</a>
				</li> 
				<li class="nav-item">
					<a href="TeacherMy.to" class="nav-link">마이페이지</a>
				</li> 
				<li class="nav-item">
					<a href="Teacherinquiry.to" class="nav-link">1:1 문의</a>
				</li> 
				<li class="nav-item">
					<a href="#" class="nav-link"> "about us"</a>
				</li>
			</ul>
		</div> 
</nav>


</body>
</html>