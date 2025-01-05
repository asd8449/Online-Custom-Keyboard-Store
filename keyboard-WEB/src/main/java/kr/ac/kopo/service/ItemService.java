package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.item.dao.ItemDAO;
import kr.ac.kopo.item.dao.ItemDAOImpl;
import kr.ac.kopo.item.vo.ItemVO;

public class ItemService {

	private ItemDAO itemDao;
	
	public ItemService() {
		itemDao = new ItemDAOImpl();
	}

	public List<ItemVO> selectByCategory(ItemVO item) throws Exception{
		List<ItemVO> itemList = itemDao.selectByCategory(item);
		return itemList;
	}

	public ItemVO selectByNo(ItemVO search) {
		ItemVO item = itemDao.selectByNo(search);
		return item;
	}
}
