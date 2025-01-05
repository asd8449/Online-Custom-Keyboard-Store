package kr.ac.kopo.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.mybatis.MyConfig;

public class BoardDAOImpl implements BoardDAO {

	private SqlSession sqlSession;
	
	public BoardDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}
	
	@Override
	public List<BoardVO> selectAllBoard() throws Exception {
		sqlSession.clearCache();
		List<BoardVO> boardList = sqlSession.selectList("dao.BoardDAO.selectBoard");
		for(BoardVO board : boardList) {
			System.out.println(board.toString());
		}
		return boardList;
	}

	@Override
	public int insertBoard(BoardVO board) {
		System.out.println(board);
		sqlSession.insert("dao.BoardDAO.insertBoard", board);
	    sqlSession.commit();
	    return sqlSession.selectOne("dao.BoardDAO.getCurrentBoardNo");
	}

	@Override
	public BoardVO selectByNo(BoardVO search) {
		sqlSession.clearCache();
		BoardVO board = sqlSession.selectOne("dao.BoardDAO.selectByNo", search);
		return board;
	}

	@Override
	public List<BoardFileVO> selectBoardFiles(BoardVO search) {
		return sqlSession.selectList("dao.BoardDAO.selectBoardFiles", search);
	}

	@Override
	public void deleteByNo(BoardVO board) {
		sqlSession.delete("dao.BoardDAO.deleteFileByNo", board);
		sqlSession.delete("dao.BoardDAO.deleteByNo", board);
		sqlSession.commit();
	}

	@Override
	public void insertBoardFile(BoardFileVO file) {
		sqlSession.insert("dao.BoardDAO.insertBoardFile", file);
		sqlSession.commit();
	}

	@Override
	public List<BoardFileVO> getFilesByBoardNo(BoardVO search) {
        return sqlSession.selectList("dao.BoardDAO.selectBoardFiles", search);

	}

	@Override
	public void updateBoard(BoardVO board) {
		System.out.println(board);
		sqlSession.update("dao.BoardDAO.updateBoard", board);
		sqlSession.commit();
	}

	@Override
	public void deleteBoardFiles(int oriNo) {
		
	}

}
