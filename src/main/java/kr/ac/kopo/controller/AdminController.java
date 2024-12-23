package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.member.vo.MemberVO;

public class AdminController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		if(session == null || session.getAttribute("user") == null) {
			session.setAttribute("adminError", 1);
			return "redirect:/";
		}
		MemberVO member = (MemberVO)session.getAttribute("user");
		if(!member.getType().equals("S")) {
			session.setAttribute("adminError", 1);
			return "redirect:/";
		}
		return "/jsp/admin/adminPage.jsp";
	}

}
