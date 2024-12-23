package kr.ac.kopo.cart.dao;

import java.util.List;

import kr.ac.kopo.cart.vo.CartVO;

public interface CartDAO {
	public List<CartVO> selectCart(CartVO cart);

	public CartVO selectItemByUser(CartVO search);

	public void updateQuantity(CartVO cart);

	public void insertCart(CartVO cart);

	public void deleteCart(CartVO cart);
}
