<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원스타그램 회원가입</title>
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
						<div class="d-flex">
							<input type="text" id="loginIdInput" class="form-control" placeholder="사용자 이름 또는 이메일">
							<button type="button" id="checkDuplicate" class="btn btn-primary btn-sm ml-2 ">중복확인</button>
						</div>
						<div id="duplicateText" class="d-none"><small class="text-danger">중복된 ID입니다</small></div>
						<div id="possibleText" class="d-none"><small class="text-success">사용 가능한 ID입니다</small></div>
						<input type="text" id="nameInput" class="form-control mt-3" placeholder="성명">
						<input type="text" id="phoneNumberInput" class="form-control mt-3" placeholder="전화번호">
						<input type="password" id="passwordInput" class="form-control mt-3" placeholder="비밀번호">
						<input type="password" id="passwordConfirmInput" class="form-control mt-3" placeholder="비밀번호 확인">
						
						<button type="submit" id="joinBtn" class="btn btn-primary btn-block my-5">가입하기</button>
					</div>

				</div>
				
				<div class="d-flex login-box justify-content-center align-items-center">
					계정이 있으신가요? <a href="/user/signin_view"> 로그인</a>
				</div>
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
	
	$(document).ready(function(){
		// 중복체크 확인 여부
		var isChecked = false;
		// 중복여부
		var isDuplicate = true;
		
		$("#loginIdInput").on("input", function(){
			isChecked = false;
			isDuplicate = true;
			
			$("#duplicateText").addClass("d-none");
			$("#possibleText").addClass("d-none");
		});
		
		$("#joinBtn").on("click", function(e){
			
			e.preventDefault();
			
			let loginId = $("#loginIdInput").val();
			let name = $("#nameInput").val();
			let phoneNumber = $("#phoneNumberInput").val();
			let password = $("#passwordInput").val();
			let passwordConfirm = $("#passwordConfirmInput").val();
			
			if(loginId == "") {
				alert("아이디를 입력하세요");
				return;
			}
			if(!isChecked) {
				alert("아이디 중복체크를 하세요");
				return;
			}
			if(isDuplicate) {
				alert("중복된 아이디 입니다");
				return;
			}
			if(name == "") {
				alert("이름을 입력하세요");
				return;
			}
			if(phoneNumber == "") {
				alert("전화번호를 입력하세요");
				return;
			}
			if(password == "") {
				alert("비밀번호를 입력하세요");
				return;
			}
			if(password != passwordConfirm) {
				alert("비밀번호가 일치하지 않습니다");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/user/sign_up",
				data:{"loginId":loginId, "name":name, "phoneNumber":phoneNumber, "password":password},
				success:function(data) {
					if(data.result == "success"){
					// 회원가입 성공
					alert("회원가입 성공");
					} else {
						alert("회원가입 실패");
					}
				},
				error:function() {
					alert("회원가입 에러");
				}
			});
					
		});
		
		$("#checkDuplicate").on("click", function(){
			var loginId = $("#loginIdInput").val();
			
			if(loginId == "") {
				alert("아이디를 입력하세요");
				return;
			}
			
			$.ajax({
				type: "get",
				url: "/user/sign_duplicate",
				data:{"loginId":loginId},
				success:function(data) {
					
					isChecked = true;
					
					$("#duplicateText").addClass("d-none");
					$("#possibleText").addClass("d-none");
					
					if(data.is_duplicate) {
						$("#duplicateText").removeClass("d-none");
		
					} else {
						$("#possibleText").removeClass("d-none");

					}
					
					isDuplicate = data.is_duplicate;
				},
				error:function() {
					alert("중복확인 에러");
				}
			});
			
		});
				
		
	});
		
	</script>
	
	
</body>
</html>