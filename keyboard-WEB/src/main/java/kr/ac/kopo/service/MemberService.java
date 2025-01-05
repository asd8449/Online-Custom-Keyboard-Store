package kr.ac.kopo.service;

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

	public boolean isIdAvailable(String id) {
		return memberDao.isIdAvailable(id);
	}

	public void join(MemberVO member) {
		memberDao.join(member);
	}
}
