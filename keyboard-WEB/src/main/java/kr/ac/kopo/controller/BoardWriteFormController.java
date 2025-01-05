package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.service.BoardService;

public class BoardWriteFormController implements Controller {

    private BoardService boardService;

    public BoardWriteFormController() {
        boardService = new BoardService();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(false);

        // (1) 세션/로그인 체크
        if (session == null || session.getAttribute("user") == null) {
            if (session != null) {
                session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다.");
            }
            return "redirect:/member/loginPage.do"; // 로그인 페이지로 리다이렉트
        }

        // (2) "no" 파라미터 확인 => 수정 모드인지 등록 모드인지 구분
        String noStr = request.getParameter("no");
        if (noStr != null && !noStr.trim().isEmpty()) {
            // 수정 모드
            int no = Integer.parseInt(noStr);
            
            // DB에서 해당 글 조회
            BoardVO param = new BoardVO();
            param.setOriNo(no);
            BoardVO board = boardService.selectByNo(param);

            if (board == null) {
                // 글이 존재하지 않으면 목록으로 이동 or 에러 알림
                request.setAttribute("alertMsg", "존재하지 않는 게시글입니다.");
                return "/board/list.do";
            }

            // 조회한 글 정보를 request에 담아 JSP로 넘김
            request.setAttribute("board", board);
        }
        // noStr이 없거나 공백 => 새 글 작성 모드(별도 작업 없음)

        // (3) 폼 페이지로 forward
        return "/jsp/board/writeForm.jsp";
    }
}
