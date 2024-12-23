package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.item.vo.ItemVO;
import kr.ac.kopo.service.ItemService;

public class ItemDeleteController implements Controller {
	
	private ItemService itemService;

	public ItemDeleteController() {
		itemService = new ItemService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemVO item = new ItemVO();
		item.setNo(Integer.parseInt(request.getParameter("no")));
		//HttpSession session = request.getSession(false);
		itemService.deleteItem(item);
		return "redirect:/admin/itemManage.do";
	}

}
