package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO selectToLogin(MemberVO member);

	public boolean isIdAvailable(String id);

	public void join(MemberVO member);
}
