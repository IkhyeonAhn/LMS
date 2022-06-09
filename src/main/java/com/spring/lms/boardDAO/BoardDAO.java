package com.spring.lms.boardDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<HashMap<String, Object>> BoardList(){
		
		return sqlSession.selectList("board.boardList");
	}
}
