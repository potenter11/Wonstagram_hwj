package com.potenter.instagram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potenter.instagram.post.bo.PostBO;
import com.potenter.instagram.post.model.Post;

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
	public String now(Model model) {
		
		List<Post> postList = postBO.getPostList();
		
		model.addAttribute("postList", postList);
		
		return "post/now";
	}
}
