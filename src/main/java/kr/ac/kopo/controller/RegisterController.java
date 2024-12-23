package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.service.MemberService;

public class RegisterController implements Controller {

	private MemberService memberService;
	
	public RegisterController() {
		memberService = new MemberService();
	}
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/jsp/member/registForm.jsp";
	}

}
