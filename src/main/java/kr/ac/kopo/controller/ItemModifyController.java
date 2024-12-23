package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.item.vo.ItemVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.service.ItemService;

public class ItemModifyController implements Controller {

	private ItemService itemService;

	public ItemModifyController() {
		itemService = new ItemService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		if (session == null || session.getAttribute("user") == null) {
			session.setAttribute("adminError", 1);
			return "redirect:/";
		}
		MemberVO member = (MemberVO) session.getAttribute("user");
		if (!member.getType().equals("S")) {
			session.setAttribute("adminError", 1);
			return "redirect:/";
		}
		if (request.getParameter("no") != null) {
			int no = Integer.parseInt(request.getParameter("no"));
			ItemVO item = itemService.selectByNo(new ItemVO(no));
			request.setAttribute("item", item);
		}
		return "/jsp/admin/itemModify.jsp";
	}

}
