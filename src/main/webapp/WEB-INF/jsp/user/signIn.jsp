<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원스타그램 로그인</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
 
<body>

	<div id="wrap">
	
		<header></header>
	
		<section class="d-flex justify-content-center align-items-center">
	
			<div>
				<div class="join-box my-5">
					<div class="w-100 p-5">
						<form id="loginForm">
							<input type="text" id="loginIdInput" class="form-control" placeholder="사용자 이름 또는 이메일">
							<input type="password" id="passwordInput" class="form-control mt-3" placeholder="비밀번호">
							<button type="submit" id="joinBtn" class="btn btn-primary btn-block my-5">로그인</button>
						</form>
						<hr>
						<div class="text-center text-dark">비밀번호를 잊으셨나요?</div>
					</div>

				</div>
				
				<div class="d-flex login-box justify-content-center align-items-center">
					계정이 없으신가요? <a href="http://localhost:8080/user/signup_view"> 회원가입</a>
				</div>
			</div>
				
				
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
		<script>
		
		$(document).ready(function() {
			
			$("#loginForm").on("submit", function(e) {
				
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력해주세요");
					return ;
				}
				
				if(password == null || password == "") {
					alert("비밀번호를 입력해주세요");
					return ;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/now"
						} else {
							alert("아이디 비밀번호를 확인하세요");
						}
					}
					, error:function(e) {
						alert("로그인실패");
					}
				});
			});
		});
	
	</script>
	
	</div>
</body>
</html>