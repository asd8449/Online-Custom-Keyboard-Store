package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.service.BoardService;

public class ManageBoardController implements Controller {

	private BoardService boardService;

	public ManageBoardController() {
		boardService = new BoardService();
		
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);

		// 세션이 없거나 로그인된 사용자가 없을 경우
		if (session == null || session.getAttribute("user") == null) {
			if (session != null) {// 사용자 null

				session.setAttribute("alertMsg", "관리자 권한이 필요한 서비스입니다.");
			}
			return "redirect:/member/loginPage.do"; // 로그인 페이지로 리다이렉트
		}
		if (session.getAttribute("user") != null) {
			MemberVO member = (MemberVO) session.getAttribute("user");
			if (!member.getType().equals("S")) {
				session.setAttribute("alertMsg", "관리자 권한이 필요한 서비스입니다.");
				return "redirect:/";
			}
		}
		List<BoardVO> boardList = boardService.searchAllBoard();
		request.setAttribute("boardList", boardList);
		return "/jsp/admin/board/manageBoard.jsp";
	}

}
