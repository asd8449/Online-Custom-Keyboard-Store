package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.cart.vo.CartVO;
import kr.ac.kopo.item.vo.ItemVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.service.CartService;
import kr.ac.kopo.service.ItemService;

public class CartInsertController implements Controller {
	private CartService cartService;
	private ItemService itemService;
	public CartInsertController() {
		cartService = new CartService();
		itemService = new ItemService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);;
		MemberVO member = (MemberVO)session.getAttribute("user");
		if(member == null) {
			session.setAttribute("loginError", 2);
			return "redirect:/";
		}
		int no = Integer.parseInt(request.getParameter("no"));
		CartVO search = new CartVO();
		search.setItemCd(no);
		search.setUserId(member.getId());
		System.out.println(no + member.getId());
		CartVO cart = cartService.selectItemByUser(search);
		System.out.println(cart);
		ItemVO sItem = new ItemVO();
		sItem.setNo(no);
		ItemVO item = itemService.selectByNo(sItem);;
		if(cart != null) {
			System.out.println("ㅇㅇ");
			int i = cart.getQuantity() + 1;
			System.out.println(cart.getCartId() + ", " + i);
			cart.setQuantity(i);
			cartService.updateQuantity(cart);
		}else {
			System.out.println("ㄴㄴ");
			search.setItemNm(item.getName());
			search.setPrice(item.getPrice());
			cartService.insertCart(search);
		}
		session.setAttribute("success", 1);
		return "/item/detail.do?no="+no;
	}

}
