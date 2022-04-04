<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wonstagram 포스팅 수정</title>
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
					
					<c:forEach var="postDetail" items="${postList}">
							 	
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
				 			
				 			<textarea rows="10" cols="50" class="form-control mt-3" placeholder="하고 싶은 말을 적어보세요···" id="contentInput">${postDetail.post.content }</textarea>
							
							<div class="d-flex justify-content-end align-items-end">	 		
					 			<button class="btn btn-info my-3" type="button" id="uploadBtn">수정하기</button>
							</div>

						</div>			 		
										 	
			 		</div>
		
					</c:forEach>
					
		 	</article>
		
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>

</body>
</html>