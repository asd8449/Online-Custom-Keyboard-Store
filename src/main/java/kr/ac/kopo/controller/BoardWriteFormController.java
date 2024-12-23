package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BoardWriteFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		if(session.getAttribute("user") == null) {
			session.setAttribute("loginError", 1);
			return "redirect:/";
		}
		return "/jsp/board/writeForm.jsp";
//		return "redirect:/login.do";
	}

}
