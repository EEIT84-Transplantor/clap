package member.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class MemberDAOHibernate implements MemberDAO {

	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session session;
	final private String SELECT_ALL = "from MemberVO";

	public MemberDAOHibernate() {
		
	}

	@Override
	public List<MemberVO> selectAll() {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		List<MemberVO> memberVOs = query.list();
		return memberVOs;
	}

	@Override
	public MemberVO selectByEmail(String email) {
		session = sessionFactory.getCurrentSession();
		MemberVO memberVO = session.get(MemberVO.class, email);
		return memberVO;
	}

	@Override
	public MemberVO insert(String email, byte[] password) {
		session = sessionFactory.getCurrentSession();
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email);
		memberVO.setPassword(password);
		try {
			session.save(memberVO);
			return memberVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public boolean update(String email, byte[] password) {
		session = sessionFactory.getCurrentSession();
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email);
		memberVO.setPassword(password);
		try {
			session.update(memberVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean delete(String email) {
		session = sessionFactory.getCurrentSession();
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email);
		try {
			session.delete(memberVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public MemberVO insert(MemberVO memberVO) {
		session = sessionFactory.getCurrentSession();
		
		try {
			session.save(memberVO);
			return memberVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean update(MemberVO memberVO) {
		session = sessionFactory.getCurrentSession();
		
		try {
			session.update(memberVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
