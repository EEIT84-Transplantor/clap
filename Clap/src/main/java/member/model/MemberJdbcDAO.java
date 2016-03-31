package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MemberJdbcDAO implements MemberDAO {

	// 測試程式
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		MemberDAO mdao = (MemberDAO) context.getBean("memberDAO");
		System.out.println(mdao.selectAll());
	}


	private DataSource dataSource;
	private Connection conn = null;
	private static final String SELECT_ALL = "select * from Member";
	private static final String SELECT_BY_EMAIL = "select * from Member where email=?";
	private static final String INSERT = "insert into Member(email,password) values(?,?)";
	private static final String UPDATE = "update Member set password=? where email=?";
	private static final String DELETE = "delete from Member where email=?";

	public MemberJdbcDAO() {

	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<MemberVO> selectAll() {
		List<MemberVO> result = null;

		try {		
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(SELECT_ALL);
			ResultSet rs;
			rs = ps.executeQuery();
			while (rs.next()) {
				if (result == null) {
					result = new ArrayList<MemberVO>();
				}
				MemberVO mvo = new MemberVO();
				mvo.setEmail(rs.getString("email"));
				mvo.setPassword(rs.getBytes("password"));
				result.add(mvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	@Override
	public MemberVO selectByEmail(String email) {
		MemberVO result = null;
		try {
			conn=dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(SELECT_BY_EMAIL);
			ResultSet rs;
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = new MemberVO();
				result.setEmail(rs.getString("email"));
				result.setPassword(rs.getBytes("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	@Override
	public MemberVO insert(String email, byte[] password) {
		MemberVO result = null;

		try {
			conn=dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(INSERT);
			ps.setString(1, email);
			ps.setString(2, password.toString());

			int returnedValue = ps.executeUpdate();
			if (returnedValue == 1) {
				result = new MemberVO();
				result.setEmail(email);
				result.setPassword(password);
				;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	@Override
	public boolean update(String email, byte[] password) {
		boolean result = false;

		try {
			conn=dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(UPDATE);
			System.out.println(email + password);
			ps.setString(1, password.toString());
			ps.setString(2, email);
			int returnedValue = ps.executeUpdate();
			if (returnedValue == 1) {
				result = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println(result);
		return result;
	}

	@Override
	public boolean delete(String email) {
		boolean result = false;

		try {
			conn=dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(DELETE);

			ps.setString(1, email);
			int returnedValue = ps.executeUpdate();
			if (returnedValue == 1) {
				result = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println(result);
		return result;
	}

}
