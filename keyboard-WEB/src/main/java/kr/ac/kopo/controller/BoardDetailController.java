package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.board.vo.BoardFileVO;
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
        search.setOriNo(no);
        BoardVO board = boardService.selectByNo(search); // 게시글 1개 조회
        if (board == null) {
            // 게시글이 없는 경우
            request.setAttribute("alertMsg", "게시글이 존재하지 않습니다.");
            return "/board/list.do";
        }

        // 파일이 있을 경우, 파일 목록도 조회
        if ("Y".equals(board.getHasFile())) {
            List<BoardFileVO> files = boardService.getFilesByBoardNo(search);
            board.setFiles(files);
        }

        request.setAttribute("board", board);
        return "/jsp/board/boardDetail.jsp";
    }
}
