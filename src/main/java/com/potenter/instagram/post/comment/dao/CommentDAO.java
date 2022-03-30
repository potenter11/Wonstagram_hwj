package com.potenter.instagram.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.potenter.instagram.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("postId") int postId,
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("comment") String comment);
	
	public List<Comment> selectComment(@Param("postId") int postId);
	
}
