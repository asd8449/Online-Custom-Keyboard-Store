package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.item.vo.ItemVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.service.ItemService;

public class AdminItemController implements Controller {
	
	private ItemService itemService;
	
	public AdminItemController() {
		itemService = new ItemService();
	}
	
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
		List<ItemVO> itemList = itemService.selectByCategory(null);
		request.setAttribute("itemList", itemList);
		return "/jsp/admin/itemList.jsp";
	}

}
