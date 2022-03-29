<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wonstagram</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<body>
	
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section>
			
			<article class="d-flex mt-3">
				
				<div class="col-6">
					<div>
						<c:forEach var="post" items="${postList }" >
		 				
		 				<div class="text_input h4 mr-3"><i class="bi bi-person-circle"></i>${post.userName }</div>
							<div>
								<img src="${post.imagePath }" class="w-100">
			 				</div>
			 		
			 			<h4>
			 				<a href="#" class="likeBtn" data-post-id="${post.id }"><i class="bi bi-heart"></i> </a> 
			 				<i class="bi bi-chat"></i> 
			 				<i class="bi bi-send-fill"></i>
			 			</h4>			 				
			 		
			 			<h4><b>좋아요</b> 100개</h4>
			 			
			 			<div>
			 				<span><b>${post.userName }</b></span> <br>
			 				<span>${post.content }</span>
			 			</div>
			 			
			 			<div class="middle-size m-2">
							<div class="mt-1">
								<b>바다</b> 우왁 거기가 어딘가여?
							</div>
							<div class="mt-1">
								<b>신보람</b> 혼자 가니 좋냐?
							</div>
							<div class="mt-1">
								<b>남라</b> 냠냠
							</div>
						</div>
			 			
			 			<div class="d-flex text-dark mt-3">
		 					<h4><i class="bi bi-emoji-laughing mr-3"></i> </h4> 
		 					<input type="text" class="form-control mr-3"  id="commentInput${post.id }"> 
		 					<button class="btn btn-light mr-3 commentBtn" data-post-id="${post.id }">등록</button>
			 			</div>
			 			
		 			</div>
		 			</c:forEach>
		 				
				</div>
				
				<div class="col-6">
					
					<div class="d-flex justify-content-center align-items-center h-50 border mb-3">

						<div>
							<h4>회원님을 위한 추천 친구</h4>
							
							<ul>
								<li>marondal <a href="#">팔로우</a> 	</li> 
								<li>1_juuun  <a href="#">팔로우</a>	</li> 
							</ul>
						</div>

					</div>
					
					<div class="d-flex justify-content-center align-items-center h-50 border mb-3">
						<div>
							ad-link
						</div>
					</div>			
				</div>
				
			</article>
			
		</section>
				
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	
	
	<script>
	
		
		$(document).ready(function() {
				
			$(".commentBtn").on("click", function() {
				let postId = $(this).data("post-id");
				// $("#commentInput4")
				let comment = $("#commentInput" + postId).val();
				
				if(comment == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post",
					url:"/post/comment/create",
					data:{"postId":postId, "content":comment},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 쓰기 실패");
						}
						
					},
					error:function() {
						alert("댓글 쓰기 에러")
					}
					
				});
								
			});
			
			$(".likeBtn").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data) {
						
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					},
					error:function() {
						alert("좋아요 에러");
					}
					
				});
				
				
			});
				
		});
	
	
	
	</script>
	
	
</body>
</html>