package kr.ac.kopo.member.dao;

import java.util.List;

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
		return member;
	}

	@Override
	public List<MemberVO> selectAll() {
		List<MemberVO> memberList = sqlSession.selectList("dao.MemberDAO.selectAll");
		return null;
	}
}
