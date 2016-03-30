package dao;

import java.util.List;

import model.MemberVO;

public interface MemberDAO {

	public abstract List<MemberVO> selectAll();

	public abstract MemberVO selectByEmail(String email);

	public abstract MemberVO insert(String email, byte[] password);

	public abstract boolean update(String email, byte[] password);

	public abstract boolean delete(String email);

}