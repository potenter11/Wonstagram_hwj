package com.potenter.instagram.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signup_view")
	public String signUp() {
		return "user/signUp";
	}
	@GetMapping("signin_view")
	public String signIn() {
		return "user/signIn";
	}
	
}
