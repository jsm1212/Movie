<%@page import="mul.camp.seven.dto.ContactDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ContactDto contact = (ContactDto)request.getAttribute("contact"); // BbsController.answer(model)
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<h1>상세글보기</h1>

<div align="center">

<table class="table table-bordered" style="width: 1000px">
<tr>
	<th>작성자</th>
	<td><%=contact.getId() %></td>
</tr>

<tr>
	<th>제목</th>
	<td><%=contact.getTitle() %></td>
</tr>

<tr>
	<th>작성일</th>
	<td><%=contact.getWdate() %></td>
</tr>

<tr>
	<th>내용</th>
	<td align="center">
		<textarea rows="15" cols="100" readonly="readonly"><%=contact.getContent() %></textarea>
	</td>
</tr>
</table>
</div>
</body>
</html>