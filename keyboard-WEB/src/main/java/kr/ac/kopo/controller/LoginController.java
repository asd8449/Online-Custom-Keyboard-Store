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
			return "redirect:/";
		}
		session.setAttribute("loginErrorMsg", "아이디나 비밀번호가 일치하지 않습니다.");
		return "redirect:/member/loginPage.do";
	}

}
