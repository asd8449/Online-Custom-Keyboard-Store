package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.cart.vo.CartVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.service.CartService;

public class CartController implements Controller {

	private CartService cartService;
	
	public CartController() {
		cartService = new CartService();
	}
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		if(session.getAttribute("user") == null) {
			session.setAttribute("loginError", 1);
			return "redirect:/";
		}
		MemberVO user = (MemberVO)session.getAttribute("user");
		CartVO cart = new CartVO();
		cart.setUserId(user.getId());
		List<CartVO> cartList = cartService.selectByUserId(cart);
		request.setAttribute("cartList", cartList);
		return "/jsp/cart/cart.jsp";
	}

}
