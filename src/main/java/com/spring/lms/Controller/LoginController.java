package com.spring.lms.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.lms.Service.LoginService;

@Controller
public class LoginController {

	//@Autowired
	//private LoginService loginService;
	
	@GetMapping("/login") //로그인 페이지 이동
	public String loginPage(HttpServletRequest rq) {
		
		//전페이지 주소 따온 후 login.jsp에 파라미터로 주소 저장
		String referer = rq.getHeader("Referer");
		
		rq.setAttribute("beforePage", referer); //jsp에서 beforePage라는 이름으로 이전페이지 주소 저장
		
		return "login";
	}
	
	@PostMapping("/login.do")
	public String loginDo(HttpServletRequest rq) {
		
		String referer = (String) rq.getAttribute("beforPage");
		
		/*
		 * 로그인처리
		 */
		
		//로그인 후 페이지 이동
		if(referer != null) {
			
			return "redirect:/" + referer;
		}else {
			
			return "redirect:/main/";
		}
		
	}
	
	
	
	
	
	
}
