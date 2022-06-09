package com.spring.lms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.lms.boardService.BoardService;

@Controller
@RequestMapping("/board")
public class boardController {

	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/")
	public ModelAndView boardList() {
		
		ModelAndView mv = new ModelAndView("board/board");
		
		mv.addObject("list", boardService.BoardList());
		
		return mv;
	}
	
	@GetMapping("/boardWrite")
	public String boardWrite() {
		
		//유저 로그인확인
		
		return "board/boardWrite";
	}
	
	@PostMapping("/boardWrite")
	public void boardWrite(HttpServletRequest rq) {
		
		String b_title = rq.getParameter("b_title");
		System.out.println(b_title);
	}
}