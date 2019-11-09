<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>학생 정보 수정페이지</title>



<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.js" ></script>
	<script>
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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode(){
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


</head>
<body>
<!-- header -->
<jsp:include page="Header.jsp"></jsp:include>


<!-- content_STUDENT MODIFY -->

<div class="col-sm-7 mx-auto p-5">
<form action="StuInfoModify.jo" class="form-inline" method="post" name="frm" id="frm">
	<table class="table">
		<tr>
			<td class=" text-center col-sm-3"> 이름 </td> 
			<td> <input type="text" class="form-control col-sm-6" name="NewName" /></td>
		</tr>
		<tr>
			<td class="text-center col-sm-3" > 아이디 </td> 
			<td class="cal-sm-3"> ${Info.joinId } </td>
		</tr>
		<tr>
			<td class="text-center col-sm-3"> 생년월일 </td>
			<td> ${Info.joinBirth1 } 년  ${Info.joinBirth2 }  월  ${Info.joinBirth3 } 일  </td>
		</tr>                               
		<tr>
			<td class="text-center col-sm-3"> 성별 </td>
			<td> ${Info.joinSex } </td>
		</tr>
		<tr>
			<td class="text-center col-sm-2"> 이메일 </td> 
			<td>
				<input  class="form-control col-sm-4" name="NewEmail1" type="text" class="box" id="JoinEmail1" size="8"> @ 
					<input  class="form-control col-sm-4" name="NewEmail2" type="text" class="box" id="JoinEmail2" size="8">
					<select name="NewEmail3_select" class="box form-control col-sm-4 form-inline" id="JoinEmail3_select" onChange="checkemailaddy();">
					    <option value="" selected>선택하세요</option>
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
				
		</tr>
		<tr>
			<td class="text-center col-sm-3"> 주소 </td> 
			<td> 
					<input type="text" class="form-control" style="width:150px;display:inline;" name="NewAddr1" id="JoinAddr1" onkeypress="gNumCheck()">&nbsp; 
					<input type="button" class="btn btn-success" name="zipCode" id="zipCode" value="우편번호 찾기"  onclick="sample6_execDaumPostcode()" > <br/>
					<input type="text" class="form-control" style="width:400px;margin-top:5px;display:inline;" name="NewAddr2" id="JoinAddr2" ><br/>
					<input type="text" class="form-control" style="width:400px;margin-top:5px;display:inline;" name="NewAddr3" id="JoinAddr3" > <br/><br/><br/>
		 </td>
		</tr>
		<tr>
			<td class="text-center col-sm-3"> 국적 </td> 
			<td> ${Info.joinNacionalidad } </td>
		</tr>
		<tr>
			<td class="text-center col-sm-3"> 연락처 </td>
			<td>  
				<select  class="form-control col-sm-3 " style="display:inline" name="NewPh1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="017">018</option>
					<option value="019">019</option>
				</select> -  <input type="tel" name="NewPh2" class="form-control col-sm-4" style="display:inline" maxlength="4"> - <input type="tel" name="NewPh3" class="form-control col-sm-4" style="display:inline"  maxlength="4" >
			</td>
		</tr>
		<tr>
			<td colspan="2">  <button class="btn btn-success" style="text-algin:center" type="submit">수정</button>
			</td>
		</tr>
	</table>
</form>
</div>
</div>

<!-- footer -->


</body>
</html>