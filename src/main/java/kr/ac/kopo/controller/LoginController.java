package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.service.MemberService;

public class LoginController implements Controller {
	
	private MemberService memberService;
	
	public LoginController() {
		memberService = new MemberService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		MemberVO user = new MemberVO(id, pwd);
		MemberVO member = memberService.selectToLogin(user);
		HttpSession session = request.getSession();
		if(member != null) {
			session.setAttribute("user", member);
			System.out.println(member);
			return "redirect:/";
		}
		session.setAttribute("error", 1);
		return "redirect:/member/loginPage.do";
	}

}
