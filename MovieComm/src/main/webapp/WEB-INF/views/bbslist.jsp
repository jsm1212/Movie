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
<title>Insert title here</title>
</head>
<body>

<h1>bbslist</h1>
<h1>로그인 성공! 😊<h1>

<!-- 마이페이지 이동 시 id도 함께 이동 -->
<a href="mypage.do?id=<%=user.getId() %>">마이페이지</a>

</body>
</html>