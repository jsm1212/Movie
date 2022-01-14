<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
.center{
	margin: auto;
	width: 60%;
	border: 3px solid #0000ff;
	padding: 10px;
}
</style>

<!-- jquery 사용을 위해 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<h2>회원가입</h2>

<div class="center">
<form action="regiAf.do" id="frm" method="post">

<table border="1">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" id="id" size="20">
		<!-- * id 중복확인 -->
		&nbsp; <input type="button" id="btn" value="중복확인"><br>
		<!-- id 중복확인 결과가 출력될 부분 --> <p id="idcheck" style="font-size: 8px"></p>
	</td>
</tr>
<tr>
	<th>패스워드</th>
	<td>
		<input type="password" name="pwd" id="pwd" size="20">
		<p style="font-size: 11px; color:#2BC0DB;">
		※ 패스워드는 영문, 숫자, 특수문자를 포함하여 8 ~ 16자리로 설정하여 주십시오.
		</p>
	</td>
</tr>
<tr>
	<th>이름</th>
	<td>
		<input type="text" name="name" id="name" size="20">
	</td>
</tr>
<tr>
	<th>닉네임</th>
	<td>
		<input type="text" name="nickname" id="nickname" size="20">
		<!-- 닉네임 중복확인 -->
		&nbsp; <input type="button" id="nickbtn" value="중복확인"><br>
		<!-- 닉네임 중복확인 결과가 출력될 부분 --> <p id="nickcheck" style="font-size: 8px"></p>
	</td>
</tr>
<tr>
	<th>나이</th>
	<td>
		<input type="text" name="age" id="age" size="20">
	</td>
</tr>
<tr>
	<th>성별</th>
	<td>
		<input type="radio" name="gender" id="gender" value=0>남자
		<input type="radio" name="gender" id="gender" value=1>여자
	</td>
</tr>
<tr>
	<th>이메일</th>
	<td>
		<input type="text" name="email" id="email" size="20">
		<!-- 이메일 중복확인 -->
		&nbsp; <input type="button" id="emailbtn" value="중복확인"><br>
		<!-- 이메일 중복확인 결과가 출력될 부분 --> <p id="emailcheck" style="font-size: 8px"></p>
	</td>
</tr>
<tr>
	<td colspan="2">
		<!-- 회원가입 시 필요한 정보가 하나라도 없다면 데이터를 전달하지 않게 설정: 클릭 시 account() 함수 실행 -->
		<button type="button" onclick="account()">회원가입</button>
	</td>
</tr>
</table>

</form>
</div>

<script type="text/javascript">
var id_check = false;			/* id 중복확인 결과값 저장을 위한 javascript 전역변수 */
var nick_check = false;
var email_check = false;

/* <!-- * id 중복확인: Ajax 사용(비동기 처리) --> */
$(document).ready(function () {
	$("#btn").click(function () {
//		alert("ID 중복확인 버튼(btn) 동작 확인용");

		$.ajax({
			url: "idcheck.do", 				// controller 내 incheck.do로 이동
			type: "post",
			data: { "id":$("#id").val().trim() },
			success:function(msg){
//				alert(msg);
				if(msg == "yes"){
					$("#idcheck").css("color", "#0000ff");		// id 중복확인 결과창 p태그의 id="idcheck"
					$("#idcheck").html("사용할 수 있는 ID입니다.")
					id_check = true;		// id 중복확인 결과가 통과인 경우 전역변수 id_check를 true로 저장
				}
				else {
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").html("사용중인 ID입니다.")
					$("#id").val("");		// 입력한 id 지우기
					id_check = false;
				}
			},
			error:function(){
				alert("ajax ID 중복확인 ERROR 발생");
			}
		})
	});
	
	/* 닉네임 중복확인: Ajax 사용(비동기 처리) */
	$("#nickbtn").click(function () {

		$.ajax({
			url: "nickcheck.do", 				
			type: "post",
			data: { "nickname":$("#nickname").val().trim() },
			success:function(msg){
				if(msg == "yes"){
					$("#nickcheck").css("color", "#0000ff");
					$("#nickcheck").html("사용할 수 있는 닉네임입니다.")
					nick_check = true;
				}
				else {
					$("#nickcheck").css("color", "#ff0000");
					$("#nickcheck").html("사용중인 닉네임입니다.")
					$("#nickname").val("");	
					nick_check = false;
				}
			},
			error:function(){
				alert("ajax 닉네임 중복확인 ERROR 발생");
			}
		})
	});
	
	/* 이메일 중복확인: Ajax 사용(비동기 처리) */
	$("#emailbtn").click(function () {

		$.ajax({
			url: "emailcheck.do", 				
			type: "post",
			data: { "email":$("#email").val().trim() },
			success:function(msg){
				if(msg == "yes"){
					$("#emailcheck").css("color", "#0000ff");
					$("#emailcheck").html("사용할 수 있는 이메일입니다.")
					email_check = true;
				}
				else {
					$("#emailcheck").css("color", "#ff0000");
					$("#emailcheck").html("사용중인 이메일입니다.")
					$("#email").val("");	
					email_check = false;
				}
			},
			error:function(){
				alert("ajax 이메일 중복확인 ERROR 발생");
			}
		})
	});
});


<!-- (Front) 회원가입 데이터 유효성 검사 -->
function account() {
var pwdRule = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;						// pwdRule: 패스워드 정규식, 영어/숫자/특수문자 포함 8-20자
var emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;	// emailRule: 이메일 정규식
var checkNumber = /^[0-9]*$/;
var checkString = /^[A-Za-z가-힣]*$/;

if($("#id").val().trim() == ''){ 
		alert("아이디를 입력해 주십시오");
	}
	// 패스워드 작성규칙 검사
	else if(!pwdRule.test($('#pwd').val().trim())){
		alert("패스워드 작성규칙에 맞게 작성해주십시오.")
		$("#pwd").val("");
	}
	else if($("#name").val().trim() == ''){
		alert("이름을 작성해 주십시오.")
	}
	// 이름이 영어, 한글인지 검사
	else if(!checkString.test($("#name").val().trim())){
		alert("이름은 영어 또는 한글로만 입력해주십시오.")
		$("#name").val("");
	}
	else if($("#nickname").val().trim() == ''){
		alert("닉네임을 입력해 주십시오.");
	}
	else if($("#age").val().trim() == ''){
		alert("나이를 입력해 주십시오.");
	}
	// 나이가 숫자인지 검사
	else if(!checkNumber.test($('#age').val().trim())){
		alert("나이는 숫자로만 입력해주십시오.")
		$("#age").val("");
	}
	else if($("#gender").val() == ''){
		alert("성별을 선택해 주십시오.");
	}
	// 이메일 형식 검사
	else if(!emailRule.test($('#email').val().trim())){
		alert("이메일 형식에 맞게 입력해 주십시오.");
		$("#email").val("");
	}
	// ID 중복확인 여부 확인
	else if(id_check != true){
		alert("ID 중복확인을 진행해 주십시오.");
	}
	// NIKNAME 중복확인 여부 확인
	else if(nick_check != true){
		alert("닉네임 중복확인을 진행해 주십시오.");
	}
	// EMAIL 중복확인 여부 확인
	else if(email_check != true){
		alert("이메일 중복확인을 진행해 주십시오.");
	}
	// 성별 체크확인 여부
	else if($(':radio[name="gender"]:checked').length < 1){
		alert("성별을 선택해 주십시오.")
	}
	else {
		$("#frm").submit();				// 회원가입 form id="frm"
	}
}
</script>

</body>
</html>