<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 Login 페이지</title>

<style type="text/css">
.center{
	margin: auto;		/* margin: 바깥쪽 여백 */
	width: 60%;
	border: 3px solid #0000ff; 
	padding: 10px;
}
</style>


<!-- jquery 사용을 위해 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- cookie 사용을 위해 추가 -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

</head>
<body>

<h2>로그인</h2>

<div class="center">								<!-- div는 태그를 단체로 묶어줄 때 사용하며 border가 자동으로 들어가있다. -->
<form action="loginAf.do" id="frm" method="post">

<table border="1">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" id="id" name="id" size="20"><br>
		<input type="checkbox" id="chk_save_id">아이디 저장
	</td>
</tr>
<tr>
	<th>패스워드</th>
	<td>
		<input type="password" id="pwd" name="pwd" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<!-- * 로그인 -->
		<!-- id, pwd를 입력하지 않는다면 넘어갈 수 없도록 button 설정: 클릭 시 login() 함수 실행 -->
		<button type="button" onclick="login()">로그인</button>
		
		<a href="idFind.do">아이디 찾기</a> &nbsp;&nbsp;
		<a href="pwdFind.do">패스워드 찾기</a>
	</td>
</tr>
<tr>
	<td style=border:none>
		<a href="regi.do">회원가입</a>
	</td>
</tr>
</table>

</form>
</div>

<!-- * 로그인: 로그인 버튼 클릭 시 id, pw 작성했는지 확인 후 데이터 전달 -->
<script type="text/javascript">
function login() {
	if($("#id").val().trim() == ""){	// trim: 중간을 제외한 양끝 공백 제거
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
/*  WEB 저장공간
 *  1) session: web sever의 저장공간(Back), java 언어 사용, login한 사용자의 정보를 저장 시 사용(object를 저장할 수 있다.)
 *  2) cookie: web client의 저장공간(Front), javascript 언어 사용, id/pw/방문횟수 등을 String으로 저장할 수 있다.
 */
 
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