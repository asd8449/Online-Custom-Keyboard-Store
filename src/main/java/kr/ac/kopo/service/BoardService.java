package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardService {
	
	private BoardDAO boardDao;
	
	public BoardService() {
		boardDao = new BoardDAOImpl();
	}
	
	public List<BoardVO> searchAllBoard() throws Exception{
		List<BoardVO> boardList = boardDao.selectAllBoard();
		return boardList;
	}

	public boolean insertBoard(BoardVO board) {
		return boardDao.insertBoard(board) != 1;
	}

	public BoardVO selectByNo(BoardVO search) {
		BoardVO board = boardDao.selectByNo(search);
		System.out.println(board);
		return board;
	}
	

}
