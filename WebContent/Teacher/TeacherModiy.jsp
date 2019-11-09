<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
</script>

<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			if($("#btn").attr("value") == "프로필 변경") {
				$("#btn").attr("value","변경 취소");
				$("#fileDel").val("${dto.joinImage}");
				$("#imageView").html("<input type='file' name='JoinImage'>"); //html코드를 넣겠다
			} else {
				$("#btn").attr("value","프로필 변경");
				$("#fileDel").val("");
				$("#imageView").html(""); 
			}
		});
	});

</script>
</head>
<body>
	<jsp:include page="../Main/top.jsp"></jsp:include>
	<form action="TeacherModiyPro.to" id="frm" method="post" enctype="multipart/form-data" >
		
		<table width="80%" border="1" cellpadding="0" cellspacing="0">
			
		
			<tr  align="center">
	
				<td colspan="2" rowspan="19" width="18%" valign="top" ><img src="Join/upload/${dto.joinImage }" width="200" height="300"><br/>
				<input type="button" name="btn" id="btn" value="프로필 변경"/>
				
				<div id="imageView"></div>
				<input type="hidden" name="fileDel" id="fileDel" />
				</td>
			</tr>
			
			<tr>
				<td>아이디</td>
				<td>${dto.joinId }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input class="form-control" type="text" name="JoinName" id="JoinName" size="12" maxlength="10" style="width:250px" placeholder="${dto.joinName }"></td>
			</tr>
			
			<tr>
				<td>생년월일</td>
				<td>
					<select class="form-control" name="JoinBirth1" style="width:250px;display:inline">

						<%for(int i=2019; i>=1900; i--){ %>
							<option value="<%=i %>" ><%=i %></option>
						<%} %>
							<option value="${dto.joinBirth1 }" selected="${dto.joinBirth1 }">${dto.joinBirth1 }</option>
					</select>년&nbsp;
					<select class="form-control" name="JoinBirth2" style="width:250px;display:inline">
						<% for(int i=1; i<=12; i++){ %>
						<option value="<%=i %>"><%=i %></option>
						<% } %>
							<option value="${dto.joinBirth2 }" selected="${dto.joinBirth2 }">${dto.joinBirth2 }</option>
					</select>월
				   <select class="form-control" name="JoinBirth3" style="width:250px;display:inline">
					    <% for(int i=1; i<=31; i++){ %>
					    <option value="<%=i %>"><%=i %></option>
					    <% } %>
					       <option value="${dto.joinBirth3 }" selected="${dto.joinBirth3 }">${dto.joinBirth3 }</option>
			      	</select>일 &nbsp;&nbsp;<br/>
				</td>
			</tr>
			
			<tr>
				<td>성별</td>
				<td>${dto.joinSex }</td>
			</tr>
			
			<tr>
				<td>국적</td>
				<td>${dto.joinNacionalidad }</td>
			</tr>
			
			<tr>
				<td>연락처</td>
				<td>
					<select class="form-control" name="JoinPh1" style="width:100px;display:inline" >
			      		<option value="010" selected="selected">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="017">018</option>
						<option value="019">019</option>
		     		</select> - 
		     		<input class="form-control" type="tel" name="JoinPh2" style="width:180px;display:inline" maxlength="4" placeholder="${dto.joinPh2 }"> - 
		     		<input class="form-control" type="tel" name="JoinPh3" style="width:180px;display:inline" maxlength="4" placeholder="${dto.joinPh3 }">
				
				</td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td>
					<input class="form-control" name="JoinEmail1" type="text" class="box" id="JoinEmail1" style="width:170px;display:inline" placeholder="${dto.joinEmail1 }"> @ 
					<input class="form-control" name="JoinEmail2" type="text" class="box" id="JoinEmail2" style="width:200px;display:inline" placeholder="${dto.joinEmail2 }">
					<select class="form-control" name="JoinEmail3_select" class="box" id="JoinEmail3_select" onChange="checkemailaddy();" style="width:200px;display:inline">
						<option value="${dto.joinEmail2 }" selected="${dto.joinEmail2 }">${dto.joinEmail2 }
						<option value="">선택하세요</option>
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
					<select class="form-control" name="Joinsubject" style="width:200px;" >
		 			<optgroup label="언어">
						<option selected="${dto.joinSubject }"> ${dto.joinSubject }  </option>
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
					<optgroup label="컴푸터(IT)">	
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
					<input class="form-control" type="text" name="JoinIntro" id="JoinIntro" style="width:500px;" placeholder="${dto.joinIntro }"/>
				</td>
			</tr>
			
			<tr>
				<td>지역</td>
				<td>
						<select class="form-control" name="JoinLoc" style="width:250px;">
						<optgroup label="">
							<option > 강원도  </option>
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
							<option value="${dto.joinLoc }" selected="${dto.joinLoc }">${dto.joinLoc }</option>
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
					<input class="form-control" type="text" name="JoinHav" id="JoinHav" size="20" style="width:250px;"  placeholder="${dto.joinHav }" />
				</td>
			</tr>
			
			<tr>
				<td>자격증</td>
				<td>
					<input class="form-control"  type="text" name="JoinLi" id="JoinLi" size="20" style="width:250px;" placeholder="${dto.joinInli }" />	
				</td>
			</tr>
			
			<tr>
				<td>수업 경력</td>
				<td>
					<select class="form-control" name="JoinExpe1" style="width:200px;">
							<option value="${dto.joinExpe1 }" selected="${dto.joinExpe1 }">${dto.joinExpe1 }
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
					<select class="form-control" name="JoinExpe2" style="width:250px;" >
						<option value="${dto.joinExpe2 }" selected="${dto.joinExpe2 }">${dto.joinExpe2 }
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
					<select class="form-control" name="JoinStuLev" style="width:250px;">
						<option value="${dto.joinStulev }" selected="${dto.joinStulev }">${dto.joinStulev }
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
				<td><textarea  cols="60" rows="20" name="JoinPre" id="JoinPre">${dto.joinPre }</textarea></td>
			</tr>
			
			<tr>
				<td>가격</td>
				<td>
				
					<input class="form-control"  type="text" name="JoinPrice" id="JoinPrice" size="20" style="width:250px;" placeholder="${dto.joinPrice }" />

				</td>
			</tr>
			
			<tr align="center">
				<td colspan="2"> 
					<input type="submit"  value="수정하기"/> 
		
				</td>
			</tr>
		
		</table>
	
	
	</form>
</body>
</html>