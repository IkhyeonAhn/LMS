package com.spring.lms.boardService;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.lms.boardDAO.BoardDAO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	public List<HashMap<String, Object>> BoardList(){
		
		return boardDAO.BoardList();
	}
	
}
