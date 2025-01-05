package kr.ac.kopo.member.dao;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.mybatis.MyConfig;

public class MemberDAOImpl implements MemberDAO {

	private SqlSession sqlSession;

	public MemberDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	public MemberVO selectToLogin(MemberVO user) {

		MemberVO member = sqlSession.selectOne("dao.MemberDAO.selectMember", user);
		System.out.println(member);
		return member;
	}

	@Override
	public boolean isIdAvailable(String id) {
		int count = sqlSession.selectOne("dao.MemberDAO.checkId", id); // checkId 쿼리 호출
		return count == 0; // 중복되지 않은 경우 true 반환
	}

	@Override
	public void join(MemberVO member) {
		sqlSession.insert("dao.MemberDAO.join", member);
		sqlSession.commit();
	}
}
