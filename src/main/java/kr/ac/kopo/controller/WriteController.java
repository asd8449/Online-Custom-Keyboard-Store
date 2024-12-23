package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.service.BoardService;

public class WriteController implements Controller {
	
	private BoardService boardService;
	
	public WriteController() {
		boardService = new BoardService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setWriter(id);
		board.setContent(content);
		HttpSession session = request.getSession(true);
		if(boardService.insertBoard(board)) {
			session.setAttribute("insertError", 1);
		}else {
			session.setAttribute("insertSuccess", 1);
		}
		return "/board/list.do";
	}

}
