<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 회원가입 </title>
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
/* content */

 /* footer */
      .footer{width:"100%"; height:200px; background-color:black}
</style>

   

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                if (data.userSelectedType === 'R') { 
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                document.getElementById('JoinAddr1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('JoinAddr2').value = fullAddr;
                document.getElementById('JoinAddr3').focus();
            }
        }).open();
    }
</script>

	<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.js" ></script>
	<script type="text/javascript">
	$(function(){
		
		$("#frm").submit(function(){
			if($("#userId").val() == ""){
				$("#userId").focus();
				alert("아이디를 입력하세요.");
				return false;
			}
			if($("#userPw").val() == ""){
				$("#userPw").focus();
				alert("비밀번호를 입력하세요.");
				return false;
			}
			if($("#userPw").val() !=  $("#userPwCon").val()){
				$("#userPw").val("");
				$("#userPwCon").val("");
				$("#userPw").focus();
				alert("비밀번호가 다릅니다.");
				return false;
			}
			if($("#userName").val()==""){
				$("#userName").focus();
				alert("사용자 이름을 입력하세요.");
				return false;
			}
			if($("#userBirth").val()==""){
				$("#userBirth").focus();
				alert("사용자 생년월일을 입력하세요.");
				return false;
			}
			if($("#userPh1").val()==""){
				$("#userPh1").focus();
				alert("사용자 연락처를 입력하세요.");
				return false;
			}
			
			 
		   if($("#confirmNum").val() == "1"){
		          alert("중복확인을 하세요.");
		          return false;
		   }
		   
		   
		      
		      
		});
		
		 $("#JoinIdCon").click(function() {
		      if($("#JoinId").val() == "") {
		         $("#JoinId").focus();
		         alert("사용자 Id를 입력하세요.");
		         return false;
		      }
		      

		 var url = "JoinIdCon.jo?JoinId="+$("#JoinId").val(); 
		 open(url, "JoinIdCon", "width=300, height = 500");

		 });
		 
		 
		
	});
	
	function checkemailaddy(){
        if (frm.JoinEmail3_select.value == '1') {
        	frm.JoinEmail2.readonly = false;
        	frm.JoinEmail2.value = '';
        	frm.JoinEmail2.focus();
        }
        else {
        	frm.JoinEmail2.readonly = true;
        	frm.JoinEmail2.value = frm.JoinEmail3_select.value;
        }
    }
	</script>
	
</head>
<body>

<!-- header -->
<jsp:include page="aaa.jsp"></jsp:include>

<!-- content -->
<div class=" col-sm-8 mx-auto p-5" >
<div style=" float:none; margin:0 auto" >

<form action="JoinAction.jo" name="frm" id="frm" method="post"  >
<input type="hidden" name="JoinConfirmNum" id="JoinConfirmNum" value="1">
	<table class="table">
		<tr>
			<td>아이디</td>
		 	<td>
		 		<input type="text" class="form-control" style="width:200px;display:inline" name="JoinId" id="JoinId" size="12" maxlength="20" placeholder="아이디를 입력해주세요" >
				<input class="btn btn-success" type="button" name="JoinIdCon" id="JoinIdCon" value="중복확인" style="display:inline">
			</td>
		</tr>
		<tr>	
			<td>비밀번호</td>
			<td>
				<input type="password" class="form-control" style="width:300px;display:inline" name="JoinPw" id="JoinPw" maxlength="25" placeholder="비밀번호를 입력해주세요">
				<br/>
				<small>&nbsp;&nbsp;&nbsp;&nbsp;특수문자(*, ^, %, _,-),숫자,영문을 사용하여 비밀번호를 생성하세요</small>
			</td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td>
				<input type="password" class="form-control" style="width:300px;display:inline" name="JoinPwCon" id="JoinPwCon" maxlength="10" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" class="form-control" style="width:300px;display:inline" name="JoinName" id="JoinName" placeholder="이름을 입력해 주세요">
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
		 		<select name="JoinBirth1"  class="form-control" style="width:120px;display:inline;" >
		 			<%for(int i=2019; i>=1900; i--){ %>
		 				<option value="<%=i %>"><%=i %></option>
					<%} %>
				</select>년&nbsp;
				<select name="JoinBirth2" class="form-control"  style="width:100px;display:inline;" >
					<%for(int i=1; i<=12; i++){ %>
						<option value="<%=i %>"><%=i %></option>
					<%} %>
				</select>&nbsp;월&nbsp;
				<select name="JoinBirth3"  class="form-control"  style="width:100px;display:inline;" >
					<%for(int i=1; i<=31; i++){ %>
						<option value="<%=i %>"><%=i %></option>
					<%} %>
				</select>&nbsp;일 &nbsp;&nbsp;	
				
		 			남자 <input type="radio" value="M" name="JoinSex" id ="JoinSex" checked="checked">
		 			 여자 <input type="radio" value="F" name="JoinSex" id ="JoinSex">
			</td>
		</tr>
		<tr>
		 	<td>국적</td>
		 	<td>
		 		<select name="JoinNacio" id="JoinNacio"  class="form-control" style="width:300px;display:inline" >
		 				<option selected="selected"> 대한민국 </option>
						<option> 가나 </option>
						<option> 그리스 </option>
						<option> 남아프리카공화국 </option>
						<option> 노르웨이 </option>
						<option> 독일 </option>						
						<option> 대만 </option>
						<option> 덴마크 </option>
						<option> 모로코 </option>
						<option> 몽골 </option>
						<option> 미국 </option>
						<option> 멕시코 </option>
						<option> 베트남 </option>
						<option> 벨기에 </option>
						<option> 스페인 </option>
						<option> 영국 </option>
						<option> 오스트리아 </option>
						<option> 우즈베키스탄 </option>
						<option> 이탈리아 </option>
						<option> 일본 </option>
						<option> 중국 </option>
						<option> 칠레 </option>
						<option> 체코 </option>
						<option> 카자흐스탄 </option>
						<option> 캐나다 </option>
						<option> 케냐 </option>
						<option> 태국 </option>
						<option> 포르투갈 </option>
						<option> 폴란드 </option>
						<option> 프랑스 </option>
						<option> 핀란드 </option>
						<option> 필리핀 </option>
						<option> 페루 </option>
						<option> 헝가리 </option>
						<option> 홍콩 </option>
		 			</select>
		 	</td>
		</tr>
		<tr>
			<td>전화 번호</td>
				<td><select  class="form-control" class="form-control"  style="width:150px;display:inline;" name="JoinPh1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					 <option value="017">018</option>
					<option value="019">019</option>
				</select> -  <input type="tel" name="JoinPh2" class="form-control" maxlength="4" style="width:150px;display:inline;"> - <input type="tel" name="JoinPh3" class="form-control" maxlength="4" style="width:150px;display:inline;">
		 </td>
		<tr>
		<td>이메일</td>
		<td>
			<label for="inputEmail"> 이메일 </label><br/>
				<input class="form-control" name="JoinEmail1" type="text" class="box" id="JoinEmail1" style="width:170px;display:inline" > @ 
				<input class="form-control" name="JoinEmail2" type="text" class="box" id="JoinEmail2" style="width:200px;display:inline" >
				<select class="form-control" name="JoinEmail3_select" class="box" id="JoinEmail3_select" onChange="checkemailaddy();" style="width:200px;display:inline">
					<option value="" selected="selected">선택하세요</option>
					<option value="naver.com">naver.com</option>
			   		<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
					<option value="paran.com">paran.com</option>
					<option value="empas.com">empas.com</option>
					<option value="dreamwiz.com">dreamwiz.com</option>
					<option value="freecharl.com">freecharl.com</option>
					<option value="lycos.co.kr">lycos.co.kr</option>
					<option value="korea.com">korea.com</option>
					<option value="hanmir.com">hanmir.com</option> 
					<option value="1">직접입력</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" class="form-control" style="width:150px;display:inline;" name="JoinAddr1" id="JoinAddr1" onkeypress="gNumCheck()"> &nbsp; 
				<input type="button" name="zipCode" id="zipCode" value="우편번호 찾기"  onclick="sample6_execDaumPostcode()" > <br/>
				<input type="text" class="form-control" style="width:400px;margin-top:5px;display:inline;" name="JoinAddr2" id="JoinAddr2" ><br/>
				<input type="text" class="form-control" style="width:400px;margin-top:5px;display:inline;" name="JoinAddr3" id="JoinAddr3" > <br/><br/><br/>
		 	</td>
		 </tr>
		 <tr>
		 	<td colspan="2" class="text-center p-5">
				<input class="btn btn-success btn-default " type="submit" value="가입완료" />&nbsp;		
				<input class="btn btn-success btn-reset" type= "reset" value="다시 입력" />&nbsp;
				<input class="btn btn-danger" onclick="javascript:history.back()" type="button" value="가입 안함" />
			</td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
</html>