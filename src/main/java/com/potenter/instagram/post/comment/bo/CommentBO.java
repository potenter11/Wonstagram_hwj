package com.potenter.instagram.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potenter.instagram.post.comment.dao.CommentDAO;
import com.potenter.instagram.post.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int postId, int userId, String userName, String comment) {
		return commentDAO.insertComment(postId, userId, userName, comment);
	}
	
	public List<Comment> getCommentList(int postId) {
		return commentDAO.selectComment(postId);
	}
	
	public int deleteCommentByPostId(int postId) {
		return commentDAO.deleteComment(postId);
	}
}

