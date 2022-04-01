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
</head>

<body>
	
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section>
			<div class="d-flex justify-content-end mt-1">
				<c:if test="${not empty userName }">
					<div class="text-end mr-4">${userName }님 <a href="/user/sign_out">로그아웃</a> </div>
				</c:if> 	
			</div>
							
			<article class="d-flex mt-3">
						
				<div class="posting text-input col-6">
				
					<c:forEach var="postDetail" items="${postList}">
						
						<!-- 글 포스팅 상단(이름 및 글수정 및 삭제) -->		 			
		 				<div class="font d-flex justify-content-between my-3">
		 					<div>
		 						<i class="bi bi-person-circle"></i> <span>${postDetail.post.userName } </span>
		 					</div>
		 					<div>
	 							<a href="#" class="moreBtn text-dark" data-post-id="${postDetail.post.id }" data-toggle="modal" data-target="#exampleModalCenter"><i class="bi bi-three-dots"></i></a>
		 					</div>
		 				</div>
							
						<!-- 글 포스팅 이미지 -->
						<div class="imageBox mb-3">
							<img src="${postDetail.post.imagePath }" class="w-100">
			 			</div>
			 			
			 			<!-- 좋아요 버튼 및 댓글 버튼 -->
				 		<h4>
				 			<c:choose>
					 			<c:when test="${postDetail.like }">
					 				<%-- 좋아요 누른 버튼 빨갛고 가득찬 하트 --%>
					 				<a href="#" class="likeBtn2" data-post-id="${postDetail.post.id }"><i class="bi bi-heart-fill text-danger"></i> </a>
					 			</c:when>
					 			<c:otherwise>
					 				<%-- 좋아요 아닌 비어있는 하트 --%>
					 				<a href="#" class="likeBtn text-dark" data-post-id="${postDetail.post.id }"><i class="bi bi-heart"></i>  </a>
					 			</c:otherwise>
				 			</c:choose>
				 			<i class="bi bi-chat"></i> 
			 			</h4>			 				
				 		
				 		<!-- 좋아요 개수 -->
			 			<span><b>좋아요</b> ${postDetail.likeCount}개 </span>
				 			
				 		<!-- 글 포스팅 글쓴이 및 내용 -->	
			 			<div>
			 				<span><b> ${postDetail.post.userName }</b></span> <br>
			 				<span> ${postDetail.post.content }</span>
			 			</div>
						
						<!-- 댓글 리스트 -->				 	
				 		<div class="mt-3">
				 			<c:forEach var="comment" items="${postDetail.commentList }">
								<div class="mt-1">
									<b>${comment.userName }</b> ${comment.comment }
								</div>
							</c:forEach>
						</div>
						
						<!-- 댓글 인풋창 -->
			 			<div class="d-flex text-dark my-2">
		 					<h4><i class="bi bi-emoji-laughing mr-3"></i> </h4> 
		 					<input type="text" class="form-control mr-3"  id="commentInput${postDetail.post.id }"> 
		 					<button class="btn btn-light mr-3 commentBtn" data-post-id="${postDetail.post.id }">등록</button>
			 			</div> 
						
						<hr>	
 					</c:forEach>

				</div>
				
				<div class="col-6">
					
					<div class="friend-box d-flex justify-content-center align-items-center border mb-3">
						
						<!-- 추천 친구 -->
						<div>
							<h4>회원님을 위한 추천 친구</h4>
							
							<ul>
								<li>marondal <a href="#">팔로우</a> 	</li> 
								<li>1_juuun  <a href="#">팔로우</a>	</li> 
							</ul>
						</div>

					</div>
					
					<!-- 광고창 -->
					<div class="ad-box d-flex justify-content-center align-items-center border">
						<div>
							ad-link
						</div>
					</div>			
				</div>
				
			</article>
			
		</section>
				
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />

	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">

	    	<div class="modal-body text-center">
	      		<button type="button" class="btn btn-primary">수정하기</button>
	      		<button type="button" class="btn btn-danger" id="deleteBtn">삭제하기</button>
	      	</div>

	    </div>
	  </div>
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
					data:{"postId":postId, "comment":comment},
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
				e.preventDefault(); // a tag의 기능을 취소시키는 메소드
				
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
			
			$(".likeBtn2").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
								
				$.ajax({
					type:"get",
					url:"/post/like_cancel",
					data:{"postId":postId},
					success:function(data) {
						
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}
					},
					error:function() {
						alert("좋아요 취소 에러");
					}
					
				});
							
			});
			
			$(".moreBtn").on("click", function(e){
				e.preventDefault();
			
				let postId = $(this).data("post-id");
				
				$("#deleteBtn").data("post-id", postId);
				// <a href ="" data-post-id="3">
			
			});
						
			$("#deleteBtn").on("click", function(e) {
				e.preventDefault();				
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}, 
					error:function() {
						alert("삭제 에러");
					}
								
				});
						
			});
			
			
		});	
	
	</script>  

</body>
	
</html>