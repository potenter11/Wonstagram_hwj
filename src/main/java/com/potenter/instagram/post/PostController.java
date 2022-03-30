package com.potenter.instagram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potenter.instagram.post.bo.PostBO;
import com.potenter.instagram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/posting_create")
	public String posting() {
		return "post/creating";
	}
	
	@GetMapping("/posting_now")
	public String now(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.getPostList(userId);
		
		model.addAttribute("postList", postList);
		
		return "post/now";
	}
}
