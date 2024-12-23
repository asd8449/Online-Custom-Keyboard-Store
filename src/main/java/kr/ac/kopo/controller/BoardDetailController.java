package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.service.BoardService;

public class BoardDetailController implements Controller {
	
	private BoardService boardService;
	
	public BoardDetailController() {
		boardService = new BoardService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		BoardVO search = new BoardVO();
		search.setNo(no);
		BoardVO board = boardService.selectByNo(search);
		request.setAttribute("board", board);
		System.out.println(board);
		return "/jsp/board/detail.jsp";
	}

}
