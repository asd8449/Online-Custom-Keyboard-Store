package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.dao.BoardFileDAO;
import kr.ac.kopo.board.dao.BoardFileDAOImpl;
import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardService {
	
	private BoardDAO boardDao;
	private BoardFileDAO boardFileDao;
	
	public BoardService() {
		boardDao = new BoardDAOImpl();
		boardFileDao = new BoardFileDAOImpl();
	}
	
	public List<BoardVO> searchAllBoard() throws Exception{
		List<BoardVO> boardList = boardDao.selectAllBoard();
		return boardList;
	}

	public BoardVO selectByNo(BoardVO search) {
		BoardVO board = boardDao.selectByNo(search);
        if ("Y".equalsIgnoreCase(board.getHasFile())) {
            board.setFiles(boardDao.selectBoardFiles(search));
        }
		return board;
	}

	public void deleteByNo(BoardVO board) {
		boardDao.deleteByNo(board);
	}

	public void insertBoardWithFiles(BoardVO board) {
		int boardId = boardDao.insertBoard(board);

        // 파일 정보 저장
        if ("Y".equals(board.getHasFile()) && board.getFiles() != null) {
            for (BoardFileVO file : board.getFiles()) {
                file.setBoardNo(boardId); // 게시글 번호 설정
                boardDao.insertBoardFile(file);
            }
        }		
	}

    public List<BoardFileVO> getFilesByBoardNo(BoardVO search) {
        return boardDao.getFilesByBoardNo(search);
    }

    public void updateBoardWithFiles(BoardVO board) {
        // 1) 게시글 자체 업데이트
        boardDao.updateBoard(board); 
        // 예: update t_board set title=?, content=?, type=?, has_file=? where board_no=?

        // 2) 파일 정보 처리
        //    여기서는 기존 파일 전부 지운 뒤 새 파일 목록을 insert하는 예시
        boardDao.deleteBoardFiles(board.getOriNo());

        // 새 파일 insert
        if ("Y".equals(board.getHasFile()) && board.getFiles() != null) {
            for (BoardFileVO file : board.getFiles()) {
                // 수정된 글의 boardNo는 oriNo
                file.setBoardNo(board.getOriNo());
                boardDao.insertBoardFile(file);
            }
        }
    }

}
