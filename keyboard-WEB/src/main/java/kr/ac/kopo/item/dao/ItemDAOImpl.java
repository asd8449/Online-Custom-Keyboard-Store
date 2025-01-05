package kr.ac.kopo.item.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.item.vo.ItemVO;
import kr.ac.kopo.mybatis.MyConfig;

public class ItemDAOImpl implements ItemDAO {
	
	private SqlSession sqlSession;
	
	public ItemDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	@Override
	public List<ItemVO> selectByCategory(ItemVO item) {
		List<ItemVO> itemList = sqlSession.selectList("dao.ItemDAO.selectByCategory", item);
		System.out.println(itemList.toString());
		return itemList;
	}

	@Override
	public ItemVO selectByNo(ItemVO search) {
		ItemVO item = sqlSession.selectOne("dao.ItemDAO.selectOne", search);
		return item;
	}
	
}
