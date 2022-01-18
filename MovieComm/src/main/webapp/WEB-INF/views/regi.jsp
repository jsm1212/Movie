<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

<!-- jqeury, bootstrap 사용을 위해 code 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- CSS -->
<style type="text/css">
	body {
		min-height: 100vh;
		background: -webkit-gradient(linear, left bottom, right top, from(#B3D7D9), to(#1B6B64)); 
		background: -webkit-linear-gradient(bottom left, #92b5db 0%, #B3D7D9 100%); 
		background: -moz-linear-gradient(bottom left, #92b5db 0%, #B3D7D9 100%); 
		background: -o-linear-gradient(bottom left, #92b5db 0%, #B3D7D9 100%); 
		background: linear-gradient(to top right, #92b5db 0%, #B3D7D9 100%);
	}
	
	.input-form { 
		max-width: 680px; 
		margin-top: 80px; 
		padding: 32px; 
		background: #fff; 
		-webkit-border-radius: 10px; 
		-moz-border-radius: 10px; 
		border-radius: 10px; 
		-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
		-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
		box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) 
	}
	
	input::placeholder {
		font-size: 12px;
	}
	
	button {
		margin-top: 10px;
		cursor: pointer;
		width: 100%;
		font-size: 16px;
		padding: 7px 20px;
	}
	
	duplBtn {
		border: 0;
		letter-spacing: 2px;
		margin-top: 5px;
	}
	
	
</style>

<!-- jquery 사용을 위해 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

   <div class="container">
      <div class="input-form-background row">
         <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3">회원가입</h4>
            <form id="frm" action="regiAf.do" method="post">
               <div class="row">
               
                  <div class="col-md-6 mb-3">
                     <label for="id">아이디</label>
                     <input type="text" class="form-control" name="id" id="id">
                     <!-- * ID 중복확인 -->
                     <label id="idcheck" style="font-size: 13px"></label>
                  </div>

                  <div class="col-md-6 mb-3">
                     <label for="nickname">닉네임</label>
                     <input type="text" class="form-control" name="nickname" id="nickname">
                     <!-- * 닉네임 중복확인 -->
                     <label id="nickcheck" style="font-size: 13px"></label>
                  </div>
                  
                  <div class="col-md-6 mb-3">
                  	<label for="name">이름</label>
                  	<input type="text" class="form-control" name="name" id="name">
                  </div>
                  
                  <div class="col-md-6 mb-3">
                  	<label for="age">나이</label>
                  	<input type="text" class="form-control" name="age" id="age">
                  </div>
                  
               </div>
               
               <div class="mb-3">
					<label for="gender">성별</label>
					<br>
					<input type="radio" name="gender" id="gender" value=0>남자
					<input type="radio" name="gender" id="gender" value=1>여자
				</div>
               
               <div class="mb-3">
					<label for="password">비밀번호</label>
					<input type="password" class="form-control" name="pwd" id="pwd" placeholder="영문/숫자/특수문자 포함 8-16자리">
				</div>
				
				<div class="mb-3">
                  <label for="email">이메일</label>
                  <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com">
                  <!-- * 이메일 중복확인 -->
                  <label id="emailcheck" style="font-size: 13px"></label>
               </div>
               
               <div class="mb-3"></div>
               <button type="button" onclick="account()">회원가입</button>
            </form>
         </div>
      </div>
   </div>


<script type="text/javascript">
var id_check = false;			/* id 중복확인 결과값 저장을 위한 javascript 전역변수 */
var nick_check = false;
var email_check = false;

$(document).ready(function() {
	/* [ID] id 중복확인: Ajax 사용(비동기 처리) */
	$("#id").blur(function() {
		$.ajax({
			url: "idcheck.do", 				// controller 내 incheck.do로 이동
			type: "post",
			data: { "id":$("#id").val().trim() },
			success:function(msg){
//				alert(msg);
				if(msg == "yes"){
					$("#idcheck").css("color", "#0000ff");		// id 중복확인 결과창 p태그의 id="idcheck"
					$("#idcheck").html("사용할 수 있는 ID입니다.")
					id_check = true;							// id 중복확인 결과가 통과인 경우 전역변수 id_check를 true로 저장
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
	
	/* [NICKNAME] 닉네임 중복확인: Ajax 사용(비동기 처리) */
	$("#nickname").blur(function() {
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
	
	/* [EMAIL] 이메일 중복확인: Ajax 사용(비동기 처리) */
	$("#email").blur(function() {
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
	else if($("#nickname").val().trim() == ''){
		alert("닉네임을 입력해 주십시오.");
	}
	else if($("#name").val().trim() == ''){
		alert("이름을 작성해 주십시오.")
	}
	// 이름이 영어, 한글인지 검사
	else if(!checkString.test($("#name").val().trim())){
		alert("이름은 영어 또는 한글로만 입력해주십시오.")
		$("#name").val("");
	}
	else if($("#age").val().trim() == ''){
		alert("나이를 입력해 주십시오.");
	}
	// 나이가 숫자인지 검사
	else if(!checkNumber.test($('#age').val().trim())){
		alert("나이는 숫자로만 입력해주십시오.")
		$("#age").val("");
	}
	//성별 체크확인 여부
	else if($(':radio[name="gender"]:checked').length < 1){
		alert("성별을 선택해 주십시오.")
	}
	// 패스워드 작성규칙 검사
	else if(!pwdRule.test($('#pwd').val().trim())){
		alert("패스워드 작성규칙에 맞게 작성해주십시오.")
		$("#pwd").val("");
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
	else {
		$("#frm").submit();				// 회원가입 form id="frm"
	}
}
</script>

</body>
</html>