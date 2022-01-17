<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 Login 페이지</title>

<!-- CSS -->
<style type="text/css">
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	body {
		width: 100%;
		height: 100vh;
		display: flex;
		background: rgba(0, 0, 0, 0.1);
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	
	li {
		list-style: none;
	}
	
	.wrap {
		width: 100%;
		height: 100vh;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.login {
		width: 30%;
		height: 600px;
		background: white;
		border-radius: 20px;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
	h2 {
		color: tomato;
		font-size: 2em;
	}
	
	.login_id {
		margin-top: 20px;
		width: 80%;
	}
	
	.login_id input {
		width: 100%;
		height: 50px;
		border-radius: 30px;
		margin-top: 10px;
		padding: 0px 20px;
		border: 1px solid lightgrey;
		outline: none;
	}
	
	.remember_id {
		margin-top: 0px;
		width: 80%;
	}
	
	.login_pwd {
		margin-top: 30px;
		width: 80%;
	}
	
	.login_pwd input {
		width: 100%;
		height: 50px;
		border-radius: 30px;
		margin-top: 10px;
		padding: 0px 20px;
		border: 1px solid lightgray;
		outline: none;
	}
	
	.login_etc {
		padding: 10px;
		width: 80%;
		font-size: 14px;
		display: flex;
		justify-content: flex-start;
		align-items: center;
		font-weight: bold;
	}
	
	.submit {
		margin-top: 40px;
		width: 80%;
	}
	
	button {
		cursor: pointer;
		width: 100%;
		font-size: 16px;
		padding: 7px 20px;
	}
</style>

<!-- jquery 사용을 위해 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- cookie 사용을 위해 추가 -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

</head>
<body>
<form class="wrap" action="loginAf.do" id="frm" method="post">
	<div class="wrap">
		<div class="login">
			<h2>Login</h2>
			
				<div class="login_id">
					<label for="id">아이디</label>
					<div>
					<input type="text" id="id" name="id">
					</div>
				</div>
				<div class="remember_id">
					<div class="checkbox">
					<input type="checkbox" id="chk_save_id">아이디 저장
					</div>
				</div>
				
				<div class="login_pwd">
					<label for="id">비밀번호</label>
					<div>
					<input type="password" id="pwd" name="pwd">
					</div>
				</div>
				
				<div class="login_etc">
					<div class="forgot_id">
					<a href="idFind.do">ID 찾기</a> &nbsp;
					</div>
					<div class="forgot_pwd">
					<a href="pwdFind.do">PW 찾기</a> &nbsp;
					</div>
					<div class="regi">
					<a href="regi.do">회원가입</a>
					</div>
				</div>
				
				<div class="submit">
					<button type="button" onclick="login()">로그인</button>
				</div>
		</div>
	</div>
</form>


<script type="text/javascript">
<!-- * 로그인: 로그인 버튼 클릭 시 id, pw 작성했는지 확인 후 데이터 전달 -->
function login() {
	if($("#id").val().trim() == ""){	
		alert("아이디를 입력하세요.")
	}
	else if($("#pwd").val().trim() == ""){
		alert("패스워드를 입력하세요.")
	}
	else {
		$("#frm").submit(); 			// form id="frm"
	}
}

<!--cookie 저장을 통해 ID 저장 기능 구현 --> 
 let user_id = $.cookie("user_id");			// cookie에서 user_id라는 이름의 데이터를 산출한다. == Model에서는 model.addattribute("list", list) 사용방식과 동일
 
 if(user_id != null){
	 $("#id").val(user_id);					// #id 값에 cookie의 user_id값 저장
 
	// 체크박스 표시
 	$("#chk_save_id").prop("checked", true)	// 다른방법으로는 > $("#chk_save_id").attr("checked", "checked");
 }
 
 /* 체크박스 체크 시 동작 */
 $("#chk_save_id").click(function() {
//	alert("체크박스 click 동작확인용");
	
	// 체크박스가 체킹되었을 때 id 값이 있는 지 없는 지 확인하여 cookie값 저장
	if($("#chk_save_id").is(":checked")){
//		alert("체크박스 활성화 확인용");
		
		if($("#id").val().trim() == ""){
	 		alert("id를 입력해 주십시오.");
	 		$("#chk_save_id").prop("checked", false); 	// id가 없으므로 체크표시 해제
	 		$("#id").val("");							// 및 id 초기화
	 	}
	 	else {
	 		$.cookie("user_id", $("#id").val().trim(), {expires:7, path:'./'})		// expires: 유효기간 7일, path: 모든 경로의 cookie를 가져옴
	 	}
	}
	else {
//		alert("체크박스 해제 확인용");
		$.removeCookie("user_id", {path:'./'});			// expires를 설정하지 않으면 삭제된다.
	}
 });
</script>

</body>
</html>