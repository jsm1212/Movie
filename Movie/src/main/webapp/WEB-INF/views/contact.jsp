<%@page import="java.util.List"%>
<%@page import="mul.camp.seven.dto.ContactDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ContactDto>contact = (List<ContactDto>)request.getAttribute("contactlist");
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
<h1>contact us</h1>
<div align="center">

<hr>
<select id="choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="내용을 입력해주세요.">

<button type="button" onclick="searchContact()">검색</button>

<br><hr><br>  
<table class="table table-hover" style="width: 1000px">

<thead>
<tr>
	<th>번호</th><th class="text-center">제목</th><th class="text-right">작성자</th>
</tr>
</thead>

<tbody>
<%
if(contact == null || contact.size() == 0){
	%>
	<tr>
		<td class="text-center" colspan="3">작성된 글이 없습니다</td> 
	</tr>
	<%
}else{
	
	for(int i = 0;i < contact.size(); i++){
		ContactDto contactlist = contact.get(i);
	%>
		<tr>	
			<th><%=i+1 %></th>
			<td>
				<a href="bbsdetail.do?seq=<%=contactlist.getSeq() %>"> <!-- bbsdetail.jsp 가는데 sequence 갖고감 -->
					<%=contactlist.getTitle() %>
				</a>
			</td>
			<td align="center"><%=contactlist.getId() %></td>
		</tr>
	<%
	}
}
%>
</tbody>

</table>

</div>

<div align="center">
	<a href="contactwrite.do">글쓰기</a>
</div>

<script type="text/javascript">
function searchContact() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href = "bbslist.do?choice=" + choice + "&search=" + search;
}

</script> 

</body>
</html>