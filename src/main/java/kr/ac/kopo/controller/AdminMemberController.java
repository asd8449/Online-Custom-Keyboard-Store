package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.service.MemberService;

public class AdminMemberController implements Controller {
	
	private MemberService memberService;
	
	public AdminMemberController() {
		memberService = new MemberService();
	}
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		MemberVO member = (MemberVO)session.getAttribute("user");
		if(member == null || member.getType().equals("S")) {
			request.setAttribute("error", 2);
			return "/";
		}
		List<MemberVO> memberList = memberService.selectAll();
		return "/jsp/admin/memberManage.jsp";
	}

}