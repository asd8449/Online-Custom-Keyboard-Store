package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.cart.dao.CartDAO;
import kr.ac.kopo.cart.dao.CartDAOImpl;
import kr.ac.kopo.cart.vo.CartVO;

public class CartService {
	private CartDAO cartDao;
	
	public CartService() {
		cartDao = new CartDAOImpl();
	}
	
	public List<CartVO> selectByUserId(CartVO cart){
		List<CartVO> cartList = cartDao.selectCart(cart);
		return cartList;
	}

	public CartVO selectItemByUser(CartVO search) {
		CartVO cart = cartDao.selectItemByUser(search);
		return cart;
	}

	public void updateQuantity(CartVO cart) {
		cartDao.updateQuantity(cart);
	}

	public void insertCart(CartVO cart) {
		cartDao.insertCart(cart);
	}

	public void deleteCart(CartVO cart) {
		cartDao.deleteCart(cart);
	}
	
}
