<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wonstagram 포스팅</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>

<body>
	
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section>
			
			<h2 class="text-center my-3">새 게시물 만들기</h2>
		 	
		 	<article class="d-flex">
		 	
			 		<div class="d-flex justify-content-center col-8">
			 			
			 			<div class="d-flex justify-content-center align-items-center">
			 				<a href="#" id="imageIcon"><i class="bi bi-image text-dark"></i> </a>
			 				<input type="file" id="fileInput" class="d-none">
			 			</div>
			 			
			 		</div>
			 		
			 		<div class="text-input col-4 d-flex justify-content-center align-items-center">
			 			
			 	
			 			<div>
			 			
			 				<div>
				 				<h4 class="mt-3"><i class="bi bi-person-circle mr-3"></i> </h4>
				 			</div>
				 			
				 			<textarea rows="10" cols="50" class="form-control mt-3" placeholder="하고 싶은 말을 적어보세요···" id="contentInput"></textarea>
							
							<div class="d-flex justify-content-end align-items-end">	 		
					 			<button class="btn btn-info my-3" type="button" id="uploadBtn">공유하기</button>
							</div>
						
						</div>			 		
											 	
			 		</div>
		 		
		 	</article>
		
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script>
	
	$(document).ready(function() {
						
			$("#uploadBtn").on("click", function() {
				
				let content = $("#contentInput").val().trim();
				
				if(content == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				// 파일 유효성 검사
				// $("#fileInput")[0].files[0]
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택해주세요");
					return;
				}
				
				let formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0] );
				
				$.ajax({
					type:"post",
					url:"/post/create_post",
					data:formData,
					enctype:"multipart/form-data",
					processData:false,
					contentType:false,
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/posting_now";
						} else {
							alert("글쓰기 실패");
						}
					}, 
					error:function() {
						alert("글쓰기 에러");
					}
				});
			});
			
			$("#imageIcon").on("click", function() {
				// fileInput 클릭된 효과
				$("#fileInput").click();
			});
			
		
	});
	
	
	
	
	
	</script>
	


</body>
</html>