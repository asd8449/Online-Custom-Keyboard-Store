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
		sqlSession.clearCache();
		System.out.println(itemList.toString());
		return itemList;
	}

	@Override
	public ItemVO selectByNO(ItemVO search) {
		ItemVO item = sqlSession.selectOne("dao.ItemDAO.selectByNo", search);
		sqlSession.commit();
		return item;
	}

	@Override
	public int updateItem(ItemVO item) {
		int i = sqlSession.update("dao.ItemDAO.update", item);
		sqlSession.commit();
		return i;
	}

	@Override
	public int insertBoard(ItemVO item) {
		int i = sqlSession.insert("dao.ItemDAO.insert", item);
		sqlSession.commit();
		return i;
	}

	@Override
	public int deleteBoard(ItemVO item) {
		int i = sqlSession.delete("dao.ItemDAO.delete", item);
		sqlSession.commit();
		return i;
	}
	
}
