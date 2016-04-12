package payment.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class PromojdbcDAO implements PromoDAO {
	
	public static void main(String[] args){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		PromoDAO pdao = (PromoDAO)context.getBean("promoDAO");
		System.out.println(pdao.selectAll().size());
		System.out.println(pdao.selectByCode("222").getPm_tiltle());
//		PromoVO vvo = pdao.selectByCode("222");
//		vvo.setPm_code("777");
//		vvo.setPm_tiltle("test");
		pdao.delete("777");
	}
	
    private DataSource dataSource;
    private Connection conn = null;
    private static final String SELECT_ALL = "select * from promo";
	private static final String SELECT_BY_CODE = "select * from promo where pm_code=?";
	private static final String INSERT = "insert into promo(pm_code,pd_category,pm_expire,pm_tiltle,pm_discount) values(?,?,?,?,?)";
	private static final String UPDATE = "update promo set pd_category=?,pm_expire=?,pm_tiltle=?,pm_discount=? where pm_code=?";
	private static final String DELETE = "delete from promo where pm_code=?";
	
	public PromojdbcDAO() {
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<PromoVO> selectAll() {
		List<PromoVO> result = new ArrayList<PromoVO>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {		
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(SELECT_ALL);
			rs = ps.executeQuery();
			PromoVO temp = null;
			while (rs.next()) {
				temp = new PromoVO();
				temp.setPm_code(rs.getString("pm_code"));
				temp.setPd_category(rs.getInt("pd_category"));
				temp.setPm_discount(rs.getDouble("pm_discount"));
				temp.setPm_expire(rs.getDate("pm_expire"));
				temp.setPm_tiltle(rs.getString("pm_tiltle"));

				result.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(ps!=null){
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(conn!=null){
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
	public PromoVO selectByCode(String pm_code) {
		PromoVO result = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {		
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(SELECT_BY_CODE);
			ps.setString(1, pm_code);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = new PromoVO();
				result.setPm_code(rs.getString("pm_code"));
				result.setPd_category(rs.getInt("pd_category"));
				result.setPm_discount(rs.getDouble("pm_discount"));
				result.setPm_expire(rs.getDate("pm_expire"));
				result.setPm_tiltle(rs.getString("pm_tiltle"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(ps!=null){
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(conn!=null){
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
	public PromoVO insert(PromoVO promoVO) {
		PromoVO result = null;
		PreparedStatement ps = null;
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(INSERT);
			ps.setString(1, promoVO.getPm_code());
			ps.setInt(2, promoVO.getPd_category());
			ps.setDate(3, new java.sql.Date(promoVO.getPm_expire().getTime()));
			ps.setString(4, promoVO.getPm_tiltle());
			ps.setDouble(5, promoVO.getPm_discount());
			
			
			if(ps.executeUpdate() == 1){
				result = promoVO;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			
			if(ps!=null){
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(conn!=null){
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
	public boolean update(PromoVO promoVO) {
		boolean result = false;
		PreparedStatement ps = null;
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(UPDATE);
			ps.setInt(1, promoVO.getPd_category());
			ps.setDate(2, new java.sql.Date(promoVO.getPm_expire().getTime()));
			ps.setString(3, promoVO.getPm_tiltle());
			ps.setDouble(4, promoVO.getPm_discount());
			ps.setString(5, promoVO.getPm_code());
			
			if(ps.executeUpdate() == 1){
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			
			if(ps!=null){
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(conn!=null){
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
	public boolean delete(String pm_code) {
		boolean result = false;
        PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(DELETE);
			ps.setString(1, pm_code);
			
			if(ps.executeUpdate() == 1){
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			
			if(ps!=null){
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(conn!=null){
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
	public List<PromoVO> selectUnexpired() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<PromoVO> selectByStartDate(Date startDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PromoVO> selectByEndingDate(Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PromoVO> selectByCategory(Integer categoryId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PromoVO> selectByBetweenDates(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

}
