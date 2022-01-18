<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Movie Site</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<style>
		.title{
			float: center;
		}
		.login-input-section-wrap{
		margin:200px;
		padding:30px;
			flex-direction: column;
			align-items: center;
			float: right;
			border: 4px solid #9C9C9C;
		}
		.login-input-wrap{
			width: 465px;
			height :48px;
		}
		
				
		</style>
	</head>
	<body>
	<iframe src="//ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@TopBar_EX" width="100%" height="80" title="" frameborder="0" scrolling="no" topmargin="0" 
	leftmargin="0" marginwidth="0" marginheight="0" name="TopBanner" id="TopBanner"></iframe>
	
	<a href="home" class="title" title="site main으로 가기">Site name</a>
		<div class="login-input-section-wrap">
			<div class="login-button-wrap">
				<a href="login" ><button class="btn btn-info btn-md">로그인</button></a>
				<a href="newUser"><button class="btn btn-info btn-md">회원가입</button></a>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col">
					<button type="button" class="btn btn-secondary">자유게시판</button>
					<button type="button" class="btn btn-secondary">실시간 순위</button>
					<button type="button" class="btn btn-secondary">예매 정보</button>
					<button type="button" class="btn btn-secondary">Event</button>
				</div>
			</div>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	</body>
</html>
