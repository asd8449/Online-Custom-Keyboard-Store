package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.item.vo.ItemVO;
import kr.ac.kopo.service.ItemService;

public class ItemPageController implements Controller {

	private ItemService itemService;

	public ItemPageController() {
		itemService = new ItemService();
		
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		ItemVO item = new ItemVO(category);
		List<ItemVO> itemList = itemService.selectByCategory(item);
		request.setAttribute("category", category);
		request.setAttribute("itemList", itemList);
		return "/jsp/board/itemPage.jsp";
	}

}