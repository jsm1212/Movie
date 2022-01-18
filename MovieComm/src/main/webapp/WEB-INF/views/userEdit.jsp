<%@page import="mul.camp.seven.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- MemberController loginAf.do에서 저장해둔 사용자 정보 가져오기 -->   
<%
	MemberDto user = (MemberDto)request.getSession().getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<!-- jqeury, bootstrap 사용을 위해 code 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원정보 수정</h4>
				<br>
				<form id="frm" action="userEditAf.do" method="post">
					<div class="row">
					
						<div class="col-md-6 mb-3">
							<label for="id">아이디</label>
							<input type="text" class="form-control" name="id" id="id" value="<%=user.getId() %>" readonly="readonly">
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="nickname">닉네임</label>
							<input type="text" class="form-control" name="nickname" id="nickname" value="<%=user.getNickname() %>">
							<!-- 닉네임 중복확인 -->
							<!-- <input type="button" id="nickbtn" value="중복확인"> -->
							<label id="nickcheck" style="font-size: 13px"></label>
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="name">이름</label>
							<input type="text" class="form-control" name="name" id="name" value="<%=user.getName() %>">
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="age">나이</label>
							<input type="text" class="form-control" name="age" id="age" value="<%=user.getAge() %>">
						</div>
						
					</div>
						
					<div class="mb-3">
						<label for="gender">성별</label>
						<br>
						<% if( user.getGender() == 0 ) { 
						%>
						<input type="radio" name="gender" id="gender" value=0 checked="checked">남자
						<input type="radio" name="gender" id="gender" value=1>여자
						<% } else { %>
						<input type="radio" name="gender" id="gender" value=0>남자
						<input type="radio" name="gender" id="gender" value=1 checked="checked">여자
						<% } %>
					</div>
					
					<div class="mb-3">
						<label for="password">비밀번호</label>
						<input type="password" class="form-control" name="pwd" id="pwd" placeholder="영문/숫자/특수문자 포함 8-16자리">
					</div>
					
					<div class="mb-3">
						<label for="email">이메일</label>
						<input type="email" class="form-control" name="email" id="email" value="<%=user.getEmail() %>">
						<!-- 이메일 중복확인 -->
						<!-- <input type="button" id="emailbtn" value="중복확인"> -->
						<label id="emailcheck" style="font-size: 13px"></label>
					</div>
					
					<div class="mb-3"></div>
					<button type="button" onclick="userEdit()">수정완료</button>
				</form>
			</div>
		</div>
	</div>


<script type="text/javascript">
<!-- 중복확인 -->
var nick_check = false;
var email_check = false;

$(document).ready(function() {
	
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

/* $(document).ready(function () {
	
	/* 1) 닉네임 중복확인: Ajax 사용(비동기 처리) */
	/* $("#nickbtn").click(function () {

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
	}); */
	
	/* 2) 이메일 중복확인: Ajax 사용(비동기 처리) */
	/* $("#emailbtn").click(function () {

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
}); */

<!-- (Front) 정보수정 데이터 유효성 검사 -->
function userEdit() {
	var pwdRule = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;						
	var emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;	
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
		else if(!checkString.test($("#name").val().trim())){
			alert("이름은 영어 또는 한글로만 입력해주십시오.")
			$("#name").val("");
		}
		else if($("#age").val().trim() == ''){
			alert("나이를 입력해 주십시오.");
		}
		else if(!checkNumber.test($('#age').val().trim())){
			alert("나이는 숫자로만 입력해주십시오.")
			$("#age").val("");
		}
		else if($(':radio[name="gender"]:checked').length < 1){
			alert("성별을 선택해 주십시오.")
		}
		else if(!pwdRule.test($('#pwd').val().trim())){
			alert("패스워드 작성규칙에 맞게 작성해주십시오.")
			$("#pwd").val("");
		}
		else if(!emailRule.test($('#email').val().trim())){
			alert("이메일 형식에 맞게 입력해 주십시오.");
			$("#email").val("");
		}
		else if(nick_check != true){
			alert("닉네임 중복확인을 진행해 주십시오.");
		}
		else if(email_check != true){
			alert("이메일 중복확인을 진행해 주십시오.");
		}
		else {
			$("#frm").submit();				// 정보수정 form id="frm"
		}
	}
</script>
</body>
</html>