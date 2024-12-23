package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.dao.MemberDAOImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class MemberService {
	private MemberDAO memberDao;
	
	public MemberService() {
		memberDao = new MemberDAOImpl();
	}
	
	public MemberVO selectToLogin(MemberVO user) {
		return memberDao.selectToLogin(user);
	}

	public List<MemberVO> selectAll() {
		return memberDao.selectAll();
	}
}
