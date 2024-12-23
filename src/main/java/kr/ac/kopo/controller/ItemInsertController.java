package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.item.vo.ItemVO;
import kr.ac.kopo.service.ItemService;

public class ItemInsertController implements Controller {

private ItemService itemService;
	
	public ItemInsertController() {
		itemService = new ItemService();
	}
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ItemVO item = new ItemVO();
		item.setName(request.getParameter("name"));
		item.setCategory(request.getParameter("category")); 
		item.setStock(Integer.parseInt(request.getParameter("stock")));
		item.setManufacturer(request.getParameter("manufacturer")); 
		item.setPrice(Integer.parseInt(request.getParameter("price")));
		item.setDescription(request.getParameter("description"));
		HttpSession session = request.getSession(true);
		if(itemService.insertItem(item)) {
			request.setAttribute("insertError", 1);
		}else {
			request.setAttribute("insertSuccess", 1);
		}
		return "/admin/itemManage.do";
	}

}
