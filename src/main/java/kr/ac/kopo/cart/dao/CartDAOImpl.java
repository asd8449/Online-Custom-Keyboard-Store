package kr.ac.kopo.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.cart.vo.CartVO;
import kr.ac.kopo.mybatis.MyConfig;

public class CartDAOImpl implements CartDAO {

	private SqlSession sqlSession;
	
	public CartDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}
	
	@Override
	public List<CartVO> selectCart(CartVO cart) {
		List<CartVO> cartList = sqlSession.selectList("dao.CartDAO.selectCart", cart);
		sqlSession.clearCache();
		return cartList;
	}

	@Override
	public CartVO selectItemByUser(CartVO search) {
		CartVO cart = sqlSession.selectOne("dao.CartDAO.selectCart2", search);
		System.out.println(cart);
		sqlSession.clearCache();
		return cart;
	}

	@Override
	public void updateQuantity(CartVO cart) {
		sqlSession.update("dao.CartDAO.updateQuantity", cart);
		sqlSession.commit();
	}

	@Override
	public void insertCart(CartVO cart) {
		sqlSession.insert("dao.CartDAO.insertCart", cart);
		sqlSession.commit();
	}

	@Override
	public void deleteCart(CartVO cart) {
		sqlSession.delete("dao.CartDAO.deleteCart", cart);
		sqlSession.commit();
	}

}
