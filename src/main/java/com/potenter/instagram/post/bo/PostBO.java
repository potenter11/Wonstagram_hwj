package com.potenter.instagram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.potenter.instagram.common.FileManagerService;
import com.potenter.instagram.post.dao.PostDAO;
import com.potenter.instagram.post.like.bo.LikeBO;
import com.potenter.instagram.post.model.Post;
import com.potenter.instagram.post.model.PostDetail;

@Service
public class PostBO {
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, userName, filePath, content);
	}
	
	public List<PostDetail> getPostList(int userId) {
		
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();	
		
		// 포스트 마다 댓글 좋아요 가져오기
		for(Post post : postList) {
			// post id를 이용해서 좋아요 개수와 댓글 리스트 조회
			int likeCount = likeBO.getLikeCount(post.getId());
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setPost(post);
			postDetail.setLikeCount(likeCount);
			
			postDetailList.add(postDetail);
			
		}
		return postDetailList;
	}
	
}
