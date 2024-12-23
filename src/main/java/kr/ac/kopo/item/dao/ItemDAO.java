package kr.ac.kopo.item.dao;

import java.util.List;

import kr.ac.kopo.item.vo.ItemVO;

public interface ItemDAO {
	public List<ItemVO> selectByCategory(ItemVO item);

	public ItemVO selectByNO(ItemVO search);

	public int updateItem(ItemVO item);

	public int insertBoard(ItemVO item);

	public int deleteBoard(ItemVO item);
}
