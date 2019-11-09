<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 선생님 회원가입 창 </title>
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
    
<script>
    var fileTarget = $('.filebox .upload-hidden');

	fileTarget.on('change', function(){ // 값이 변경되면
	  if(window.FileReader){ // modern browser
	    var filename = $(this)[0].files[0].name;
	  }
	  else { // old IE
	    var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
	  }
	
	  // 추출한 파일명 삽입
	  $(this).siblings('.upload-name').val(filename);
	});
</script>

<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.js" ></script>
	<script type="text/javascript">
	
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
	$(function(){
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
	</script>
    

<style type="text/css">
/* content */
	.navbar {width:100%}
		 .jbFixed {position: fixed; top: 0px;}
		 
		 
/* content_signIn*/



 /* footer */
      .footer{width:"100%"; height:200px; background-color:black}
</style>




</head>
<body>

<!-- header -->
<jsp:include page="aaa.jsp"></jsp:include>



<!-- content -->
<div class=" col-sm-8 mx-auto p-5" >
<div style=" float:none; margin:0 auto" >

	<form action="TjoinAction.jo" name="frm" id="frm" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="JoinConfirmNum" id="JoinConfirmNum" value="1"> 
		 	<!-- <table width=600 align="center" align="center" > -->
		 	<table class="table">
		 		<tr>
		 			<td>아이디</td>
		 			<td>
				 		<input class="form-control col-sm-4" type="text" name="JoinId" maxlength="20" id="JoinId" style="display:inline" >
					 	<input class="btn" type="button" name="JoinIdCon" id="JoinIdCon" value="중복확인" style="display:inline">
					</td>
				</tr>			
				<tr>
					<td>비밀번호</td>
					<td>
						<input class="form-control col-sm-4" type="password" name="JoinPw" id="JoinPw" maxlength="25" style="display:inline">
						<br/><small>&nbsp;&nbsp;&nbsp;&nbsp;특수문자(*, ^, %, _,-),숫자,영문을 사용하여 비밀번호를 생성하세요</small>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input class="form-control col-sm-4" type="password" name="JoinPwCon" id="JoinPwCon" size="12" maxlength="10" style="display:inline"> 
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input class="form-control col-sm-4" type="text" name="JoinName" id="JoinName" size="12" maxlength="10" style="display:inline">
					</td>
				</tr>			
				<tr>
					<td>생년월일</td>
					<td>
			 			<select class="form-control col-sm-3" name="JoinBirth1" style="display:inline">
							<%for(int i=2019; i>=1900; i--){ %>
								<option value="<%=i %>"><%=i %></option>
							<%} %>
						</select>년&nbsp;
						<select class="form-control col-sm-3" name="JoinBirth2" style="display:inline">
							<%for(int i=1; i<=12; i++){ %>
								<option value="<%=i %>"><%=i %></option>
							<%} %>
						</select>월
					   <select class="form-control col-sm-3" name="JoinBirth3" style="display:inline">
					       <%for(int i=1; i<=31; i++){ %>
						       <option value="<%=i %>"><%=i %></option>
					       <%} %>
				      </select>일 
					<br/>
					<div class="p-2">		 			
						 남자 <input type="radio" value="M" name="JoinSex" id ="JoinSex" checked="checked">
						 여자 <input type="radio"  value="F" name="JoinSex" id ="JoinSex">
					 </div>
				 </tr>
			<tr>
				<td>국적</td>
				<td>
			 		<select class="form-control col-sm-4" name="JoinNacio" id="JoinNacio" style="display:inline">
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
				<td>
					<select class="form-control col-sm-3" name="JoinPh1" style="display:inline" >
			      		<option value="010" selected="selected">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="017">018</option>
						<option value="019">019</option>
			     	</select> - <input class="form-control col-sm-3" type="tel" name="JoinPh2" style="display:inline" maxlength="4"> - <input class="form-control col-sm-3" type="tel" name="JoinPh3" style="display:inline" maxlength="4">
				</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input class="form-control col-sm-3" name="JoinEmail1" type="text" class="box" id="JoinEmail1" style="display:inline" > @ 
						<input class="form-control col-sm-4" name="JoinEmail2" type="text" class="box" id="JoinEmail2" style="display:inline" >
						<select class="form-control col-sm-4" name="JoinEmail3_select" class="box" id="JoinEmail3_select" onChange="checkemailaddy();" style="display:inline">
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
					<td>과목</td>
				 	<td>
				 		<select class="form-control col-sm-4" name="Joinsubject" style="display:inline">
				 			<optgroup label="언어">
								<option selected="selected"> 한국어  </option>
								<option> 영어  </option>
								<option> 스페인어  </option>
								<option> 프랑스어  </option>
								<option> 독일어  </option>
								<option> 베트남어  </option>
								<option> 중국어  </option>
								<option> 아랍어  </option>
								<option> 태국어 </option>
								<option> 이탈리아어 </option>
								<option> 포르투갈어 </option>
								<option> 폴란드어 </option>
								<option> 러시아어 </option>
								<option> 힌디어 </option>
								<option> 인도네시아어 </option>
								<option> 일본어  </option>
							</optgroup>		
							<optgroup label="운동">	
								<option> 요가 </option>
								<option> 스트레칭 </option>
								<option> 춤 </option>
								<option> 달리기 </option>
								<option> 보드 </option>			
							</optgroup>
							<optgroup label="컴퓨터(IT)">	
								<option> C언어 </option>
								<option> C++ </option>
								<option> Java </option>
								<option> 파이썬 </option>
								<option> 코틀린 </option>	
								<option> 루아 </option>
								<option> 루비 </option>
								<option> 머신러닝 </option>
								<option> Ui </option>
								<option> 웹개발 </option>
								<option> 앱개발 </option>		
							</optgroup>
							<optgroup label="예술">
								<option> 데셍 </option>
								<option> 동양화 </option>
								<option> 스케치 </option>
								<option> 서양화 </option>
								<option> 색체 </option>
								<option> 조소 </option>				
							</optgroup>
							<optgroup label="음악">	
								<option> 해금 </option>
								<option> 가야금 </option>
								<option> 대금 </option>
								<option> 거문고 </option>
								<option> 보컬 </option>
								<option> 드럼 </option>
								<option> 기타 </option>
								<option> 피아노 </option>
								<option> 바이올린 </option>			
							</optgroup>
						</select>
					</td>
				</tr>
				<tr>
					<td>한 줄 소개</td>
					<td>
						<input class="form-control col-sm-9" type="text" name="JoinIntro" id="JoinIntro" style="display:inline"/>
					</td>
				</tr>
				<tr>
					<td>지역</td>
					<td>
			 			<select class="form-control col-sm-4" name="JoinLoc" style="display:inline" >
							<optgroup label="">
								<option selected="selected"> 강원도  </option>
								<option> 강릉</option>
								<option> 거제</option>
								<option> 경산</option>
								<option> 경주</option>
								<option> 계룡</option>
								<option> 고양</option>
								<option> 공주</option>
								<option> 과천</option>
								<option> 광명</option>
								<option> 광양</option>
								<option> 광주</option>
								<option> 광주광역시</option>
								<option> 구리</option>
								<option> 구미</option>
								<option> 군산</option>
								<option> 군포</option>
								<option> 김제</option>
								<option> 김천</option>
								<option> 김포</option>
								<option> 김해</option>
								<option> 나주</option>
								<option> 남양주</option>
								<option> 남원</option>
								<option> 논산</option>
								<option> 당진</option>
								<option> 대구광역시</option>
								<option> 대전광역시</option>
								<option> 동두천</option>
								<option> 동해</option>
								<option> 목포</option>
								<option> 문경</option>
								<option> 밀양</option>
								<option> 보령</option>
								<option> 부산광역시</option>
								<option> 부천</option>
								<option> 사천</option>
								<option> 삼척</option>
								<option> 상주</option>
								<option> 서귀포</option>
								<option> 서산</option>
								<option> 서울특별시</option>
								<option> 성남</option>
								<option> 세종특별자치시</option>
								<option> 속초</option>
								<option> 수원</option>
								<option> 순천</option>
								<option> 시흥</option>
								<option> 아산</option>
								<option> 안동</option>
								<option> 안산</option>
								<option> 안성</option>
								<option> 안양</option>
								<option> 양산</option>
								<option> 양주</option>
								<option> 여수</option>
								<option> 영주</option>
								<option> 영천</option>
								<option> 오산</option>
								<option> 용인</option>
								<option> 울산광역시</option>
								<option> 원주</option>
								<option> 의왕</option>
								<option> 의정부</option>
								<option> 이천</option>
								<option> 익산</option>
								<option> 인천광역시</option>
								<option> 전주시</option>
								<option> 정읍</option>
								<option> 제주도</option>
								<option> 제천</option>
								<option> 진주</option>
								<option> 창원</option>
								<option> 천안</option>
								<option> 청주</option>
								<option> 춘천</option>
								<option> 충주</option>
								<option> 태백</option>
								<option> 통영</option>
								<option> 파주</option>
								<option> 평택</option>
								<option> 포천</option>
								<option> 포항</option>
								<option> 하남</option>
								<option> 화성</option> 
							</optgroup>
						</select>
					</td>
				</tr>
				<tr>
					<td>학력</td>
					<td>
						<input class="form-control col-sm-4" type="text" name="JoinHav" id="JoinHav" size="20" style="display:inline"/>
					</td>
				</tr>
				<tr>
					<td>자격증</td>
					<td> 
						<input class="form-control col-sm-4"  type="text" name="JoinLi" id="JoinLi" size="20" style="display:inline"/>
					</td>
				</tr>
				<tr>
					<td>수업 경력</td>
					<td>
							<select class="form-control col-sm-4" name="JoinExpe1" style="display:inline">
								<option selected="selected"> 3개월 이하   </option>
								<option> 6개월 이하  </option>
								<option> 1년 이하 </option>
								<option> 2년 이하  </option>
								<option> 3년 이하  </option>
								<option> 4년 이상  </option>
						</select>
					</td>
				</tr>
				<tr>
					<td>전문 분야 경력</td>
					<td>
						<select class="form-control col-sm-4" name="JoinExpe2"style="display:inline">
							<option selected="selected"> 3개월 이하  </option>
							<option> 6개월 이하  </option>
							<option> 1년 이하 </option>
							<option> 2년 이하  </option>
							<option> 3년 이하  </option>
							<option> 4년 이상  </option>
						</select>
					</td>
				</tr>
				<tr>
					<td>선호하는 학생의 레벨</td>
					<td> 
						<select class="form-control col-sm-4" name="JoinStuLev" style="display:inline">
							<option  selected="selected"> A+ </option>
							<option> A </option>
							<option> B+ </option>
							<option> B </option>
							<option> C+ </option>
							<option> C </option>
							<option> D+ </option>
							<option> D </option>
							<option> 상관없음 </option>
						</select>
					</td>
				</tr>
				<tr>
					<td>자기소개</td>
					<td>
						<textarea class="form-control col-sm-10"  cols="30" rows="18" name="JoinPre" id="JoinPre" style="display:inline"></textarea>
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
			 			<input class="form-control col-sm-3"  type="text" name="JoinPrice" id="JoinPrice" size="20" style="display:inline" />원
					</td>
				</tr>
				<tr>
					<td>프로필 사진</td>
					<td>
						<input type="file" value="파일선택" class="upload-hidden" name="JoinImage" id="JoinImage" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="p-3">
							<input class="btn btn-success" type= "submit" value="가입완료" />&nbsp;
							<input class="btn btn-success" type= "reset" value="다시 입력" />&nbsp;
							<input class="btn btn-danger" type= "button" onclick="javascript:history.back()" value="가입 안함" />
						</div>
					</td>
				</tr>
		</table>
	</form>
	
</div>
</div>


</body>
</html>