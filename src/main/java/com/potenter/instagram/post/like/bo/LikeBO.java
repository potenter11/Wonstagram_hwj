package com.potenter.instagram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potenter.instagram.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int postId, int userId) {
		return likeDAO.insertLike(postId, userId);
	}
	
	public int getLikeCount(int postId) {
		return likeDAO.selectLikeCount(postId);
	}
	
	public boolean isLike(int postId, int userId) {
		int count = likeDAO.selectLikeCountByUserId(postId, userId);
		
		// 조회된 결과가 없으면 좋아요가 아닌 상태
//		if(count == 0) {
//			return false;
//		}else {
//			return true;
//		}		
		return (count != 0);		
	}
	
	public boolean isNotLike(int postId, int userId) {
		int count = likeDAO.deleteLikeCountByUserId(postId, userId);
		
		return (count != 0);
	}
	
}
