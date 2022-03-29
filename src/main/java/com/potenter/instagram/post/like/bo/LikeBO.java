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
	
}
