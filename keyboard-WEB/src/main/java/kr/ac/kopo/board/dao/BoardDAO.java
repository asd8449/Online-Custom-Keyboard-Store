package kr.ac.kopo.board.dao;

import java.util.List;

import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;

public interface BoardDAO {

	List<BoardVO> selectAllBoard()throws Exception;

	int insertBoard(BoardVO board);

	BoardVO selectByNo(BoardVO search);

	List<BoardFileVO> selectBoardFiles(BoardVO search);

	void deleteByNo(BoardVO board);

	void insertBoardFile(BoardFileVO file);

	List<BoardFileVO> getFilesByBoardNo(BoardVO search);

	void updateBoard(BoardVO board);

	void deleteBoardFiles(int oriNo);
}
