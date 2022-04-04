package com.potenter.instagram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.potenter.instagram.common.FileManagerService;
import com.potenter.instagram.post.comment.bo.CommentBO;
import com.potenter.instagram.post.comment.model.Comment;
import com.potenter.instagram.post.dao.PostDAO;
import com.potenter.instagram.post.like.bo.LikeBO;
import com.potenter.instagram.post.model.Post;
import com.potenter.instagram.post.model.PostDetail;


@Service
public class PostBO {
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, userName, filePath, content);
	}
	
	public int deletePost(int postId, int userId) {
		
		// postId 기준으로 post 객체 불러오기
		Post post = postDAO.selectPost(postId);
		
		if(post.getUserId() == userId) {
			
			// 파일 삭제
			FileManagerService.removeFile(post.getImagePath());
			
			// 좋아요 삭제
			likeBO.deleteLikeByPostId(postId);
			
			// 댓글 삭제
			commentBO.deleteCommentByPostId(postId);
			
			return postDAO.deletePost(postId);	
		}
		
		return 0;	
	}
	
	public Post selectPost(int id) {
		return postDAO.selectPostById(id);
	}
	
	public int updatePost(int postId, int userId, String imagePath, String content) {
		
		Post post = postDAO.selectPost(postId);
		
		if(post.getUserId() == userId) {
			
			return postDAO.updatePost(postId, imagePath, content);
		}
		
		return 0;
	}
	
	
	public List<PostDetail> getPostList(int userId) {
		
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();	
		
		// 포스트 마다 댓글 좋아요 가져오기
		for(Post post : postList) {
			// post id를 이용해서 좋아요 개수 조회
			int likeCount = likeBO.getLikeCount(post.getId());
			
			// 댓글 리스트 가져오기
			List<Comment> commentList = commentBO.getCommentList(post.getId());
			
			// 로그인한 사용자가 좋아요를 눌렀는지 여부
			boolean isLike = likeBO.isLike(post.getId(), userId);
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setPost(post);
			postDetail.setLikeCount(likeCount);
			postDetail.setCommentList(commentList);
			postDetail.setLike(isLike);
			
			postDetailList.add(postDetail);
			
		}
		return postDetailList;
	}
	
}
