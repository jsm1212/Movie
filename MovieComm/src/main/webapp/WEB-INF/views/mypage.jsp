<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.time.DateFormatUtils"%>
<%@page import="java.util.Date"%>
<%@page import="mul.camp.seven.dto.MemberDto"%>
<%@page import="java.util.List"%>
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
<title>MyPage</title>

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
				<h4 class="mb-3">마이페이지</h4>
				<br>
				<!-- 회원정보 -->
				<form id="frm" action="userEdit.do" method="post">
					<div class="row">
					
						<div class="col-md-6 mb-3">
							<label for="id">아이디</label>
							<input type="text" class="form-control" name="id" id="id" value="<%=user.getId() %>" readonly="readonly">
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="nickname">닉네임</label>
							<input type="text" class="form-control" name="nickname" id="nickname" value="<%=user.getNickname() %>" readonly="readonly">
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="name">이름</label>
							<input type="text" class="form-control" name="name" id="name" value="<%=user.getName() %>" readonly="readonly">
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="age">나이</label>
							<input type="text" class="form-control" name="age" id="age" value="<%=user.getAge() %>" readonly="readonly">
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
						<label for="email">이메일</label>
						<input type="email" class="form-control" name="email" id="email" value="<%=user.getEmail() %>" readonly="readonly">
					</div>
					
					<div class="mb-3">
						<label for="regi_date">가입날짜</label>
						<%
							Date date = new Date();
							String dateToStr = DateFormatUtils.format(user.getRegi_date(), "yyyy-MM-dd");
						%>
						<input type="text" class="form-control" name="regi_date" id="regi_date" value="<%=dateToStr %>" readonly="readonly">
					</div>
					
					<div class="mb-3"></div>
					<input type="submit" value="회원정보 수정">
				</form>
				
				<!-- 게시글 불러오기 -->
				<div>
					<table class="table table-hover" style="width: 1000px">
					
					</table>
				</div>
			</div>
		</div>
	</div>


</body>
</html>