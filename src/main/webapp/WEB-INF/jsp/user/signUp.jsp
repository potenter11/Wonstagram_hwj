<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>

<body>
	
	<div id="wrap">
		
		<header>
		</header>
		
		<section class="d-flex justify-content-center align-items-center">
			<div>
				<div class="join-box my-5">
					<div class="m-5">
						<div class="d-flex">
							<input type="text" class="form-control col-9 mt-5" placeholder="사용자 이름 또는 이메일">
							<button type="button" class="btn btn-primary btn-block col-3 mt-5">중복확인</button>
						</div>
						<input type="text" class="form-control mt-3" placeholder="성명">
						<input type="text" class="form-control mt-3" placeholder="전화번호">
						<input type="password" class="form-control mt-3" placeholder="비밀번호">
						
						<button type="button" class="btn btn-primary btn-block my-5">가입하기</button>
					</div>

				</div>
				
				<div class="d-flex login-box justify-content-center align-items-center">
					계정이 있으신가요? <a href="#"> 로그인</a>
				</div>
			</div>
		
		</section>
		
		<footer class="d-flex justify-content-center align-items-center">
			<small>Copyright 2022. wonstagram all rights reserved.</small>
		</footer>
	
	</div>
	
	
</body>
</html>