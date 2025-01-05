package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.item.vo.ItemVO;
import kr.ac.kopo.service.ItemService;

public class ItemDetailController implements Controller {

	private ItemService itemService;
	public ItemDetailController() {
		itemService = new ItemService();
	}
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		ItemVO search = new ItemVO(no);
		ItemVO item = itemService.selectByNo(search);
		return null;
	}

}
