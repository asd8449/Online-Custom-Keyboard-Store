package kr.ac.kopo.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.mybatis.MyConfig;

public class BoardDAOImpl implements BoardDAO {

	private SqlSession sqlSession;
	
	public BoardDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}
	
	@Override
	public List<BoardVO> selectAllBoard() throws Exception {
		List<BoardVO> boardList = sqlSession.selectList("dao.BoardDAO.selectBoard");
		sqlSession.clearCache();
		for(BoardVO board : boardList) {
			System.out.println(board.toString());
		}
		return boardList;
	}

	@Override
	public int insertBoard(BoardVO board) {
		 int i = sqlSession.insert("dao.BoardDAO.insertBoard", board);
		 sqlSession.commit();
		 System.out.println(i);
		 return i;
	}

	@Override
	public BoardVO selectByNo(BoardVO search) {
		BoardVO board = sqlSession.selectOne("dao.BoardDAO.selectByNo", search);
		System.out.println(board);
		return board;
	}

}
