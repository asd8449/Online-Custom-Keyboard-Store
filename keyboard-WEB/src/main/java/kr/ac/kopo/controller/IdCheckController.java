package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.service.MemberService;

public class IdCheckController implements Controller {
	
	private MemberService memberService;
	
	public IdCheckController() {
		memberService = new MemberService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		boolean isAvailable = memberService.isIdAvailable(id);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        System.out.println(id);
        System.out.println(isAvailable);
        if (isAvailable) {
            response.getWriter().write("available"); // 사용 가능한 ID
        } else {
            response.getWriter().write("unavailable"); // 중복된 ID
        }

        return null; // AJAX 응답만 반환하므로 null 리턴
	}

}
