package com.potenter.instagram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.potenter.instagram.post.model.Post;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId, 
			@Param("userName") String userName, 
			@Param("imagePath") String imagePath,
			@Param("content") String content);
	
	public List<Post> selectPostList();
	
}
