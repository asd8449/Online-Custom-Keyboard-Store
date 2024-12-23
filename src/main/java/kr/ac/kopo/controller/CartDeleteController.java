package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.cart.vo.CartVO;
import kr.ac.kopo.service.CartService;

public class CartDeleteController implements Controller {
	private CartService cartService;
	public CartDeleteController() {
		cartService = new CartService();
	}
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		CartVO cart = new CartVO();
		cart.setCartId(no);
		cartService.deleteCart(cart);
		return "redirect:/cart/cart.do";
	}

}
