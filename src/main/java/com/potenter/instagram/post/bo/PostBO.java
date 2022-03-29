package com.potenter.instagram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.potenter.instagram.common.FileManagerService;
import com.potenter.instagram.post.dao.PostDAO;
import com.potenter.instagram.post.model.Post;
import com.potenter.instagram.post.model.PostDetail;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, userName, content, imagePath);
		
	}
	
	public List<PostDetail> getPostList() {
		
		List<Post> postList = postDAO.selectPostList();
		
		// 포스트 마다 댓글 좋아요 가져오기
		for(Post post : postList) {
			// post id를 이용해서 좋아요 개수와 댓글 리스트 조회
			PostDetail postDetail = new PostDetail();
			// 좋아요 개수 얻어 오기 postId
			
		}
		
		// 그 정보를 하나의 데이터 클래스(DTO)를 만들어 보기
		
		// 새로운 클래스(DTO)를 리스트 형태로 구성
		
		
		
		return postList;
	}
	
}
