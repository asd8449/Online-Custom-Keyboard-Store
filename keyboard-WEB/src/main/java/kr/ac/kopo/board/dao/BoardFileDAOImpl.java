package kr.ac.kopo.board.dao;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.mybatis.MyConfig;

public class BoardFileDAOImpl implements BoardFileDAO {
	private SqlSession sqlSession;
	
	public BoardFileDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}
	
}
