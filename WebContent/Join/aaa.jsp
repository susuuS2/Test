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


 <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.navbar' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.navbar' ).addClass( 'jbFixed' );
          }
          else {
            $( '.navbar' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>
    

<style type="text/css">

/* header */
	.navbar {width:100%}
		 .jbFixed {position: fixed; top: 0px;}
</style>


</head>
<body>

<!-- header -->
<nav class="navbar navbar-expand-sm navbar-light bg-light"> 
	<a href="index.jo" class="navbar-brand "><img src="#" />LOGO</a>
		<!-- Toggle Button --> 
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse"> 
			<span class="navbar-toggler-icon"></span>
		 </button> 
		<div class="collapse navbar-collapse" id="collapsibleNavbar"> 
			<ul class="navbar-nav ml-auto"> 
				<li class="nav-item">
					<a href="joinLogin.jo" class="nav-link"> 도움말 </a>
				</li>
			</ul>
		</div> 
</nav>
</body>
</html>