package kr.ac.kopo.member.dao;

import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO selectToLogin(MemberVO member);

	public List<MemberVO> selectAll();
}
