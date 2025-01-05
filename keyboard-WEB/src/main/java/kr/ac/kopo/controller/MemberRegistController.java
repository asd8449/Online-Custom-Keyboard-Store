package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.service.MemberService;

public class MemberRegistController implements Controller {
	
	private MemberService memberService;
	
	public MemberRegistController() {
		memberService = new MemberService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO member = new MemberVO();
		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setEmailName(request.getParameter("email_id"));
		member.setEmailDomain(request.getParameter("email_domain"));
		member.setPhone(request.getParameter("ph_first") + request.getParameter("ph_second") + request.getParameter("ph_third"));
        try {
            memberService.join(member); // 회원가입 로직 호출
            // 성공 시 로그인 페이지로 리다이렉트, 성공 메시지 추가
            request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다. 로그인하세요!");
            return "redirect:/member/loginPage.do";
        } catch (Exception e) {
            e.printStackTrace();
            // 실패 시 회원가입 페이지로 이동, 실패 메시지 추가
            request.setAttribute("alertMsg", "회원가입에 실패했습니다. 다시 시도하세요.");
            return "/member/registerForm.jsp";
        }
	}

}
