package payment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class PromoCodejdbcDAO implements PromoCodeDAO {
	
	public static void main(String[] args){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		PromoCodeDAO  pdao = (PromoCodeDAO)context.getBean("promoCodeDAO");
		
		System.out.println(pdao.selectAll().size());
		System.out.println(pdao.selectByEmail("caca@gmail.com").size());
		
	//	pdao.insert("poan@gmail.com", "222");
	//	pdao.delete("poan@gmail.com", "222");
		
		System.out.println(pdao.selectPromoVOByEmail("caca@gmail.com").size());
	}
	
	
    private DataSource dataSource;
    private Connection conn = null;
    private static final String SELECT_ALL = "select * from promocode";
	private static final String SELECT_BY_EMAIL = "select * from promocode where mb_email=?";
	private static final String SELECT_BY_CODE = "select pm_code,pd_category,pm_discount,pm_expire,pm_title from promocode join promo on(pm_code=pc_code) where mb_email=?";
	private static final String INSERT = "insert into promocode(mb_email,pc_code) values(?,?)";
	private static final String DELETE = "delete from promocode where mb_email=? and pc_code=?";

	
	public PromoCodejdbcDAO() {
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<PromoCodeVO> selectAll() {
		List<PromoCodeVO> result = new ArrayList<PromoCodeVO>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(SELECT_ALL);
			rs = ps.executeQuery();
			PromoCodeVO temp = null;
			while(rs.next()){
				temp = new PromoCodeVO();
				PromoCode promoCodetemp = new PromoCode();
				promoCodetemp.setMb_email(rs.getString("mb_email"));
				promoCodetemp.setPm_code(rs.getString("pc_code"));
				temp.setPromoCode(promoCodetemp);
				result.add(temp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	public List<PromoCodeVO> selectByEmail(String mb_email) {
		List<PromoCodeVO> result = new ArrayList<PromoCodeVO>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(SELECT_BY_EMAIL);
			ps.setString(1, mb_email);
			
			rs = ps.executeQuery();
			PromoCodeVO temp = null;
			while(rs.next()){
				temp = new PromoCodeVO();
				PromoCode promoCodetemp = new PromoCode();
				promoCodetemp.setMb_email(rs.getString("mb_email"));
				promoCodetemp.setPm_code(rs.getString("pc_code"));
				temp.setPromoCode(promoCodetemp);
				
				result.add(temp);
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
	public List<PromoVO> selectPromoVOByEmail(String mb_email){
		List<PromoVO> result = new ArrayList<PromoVO>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
			
			try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(SELECT_BY_CODE);
			ps.setString(1, mb_email);
			rs = ps.executeQuery();
			PromoVO temp = null;
			while(rs.next()){
				temp = new PromoVO();
				temp.setPm_code(rs.getString("pm_code"));
				temp.setPd_category(rs.getInt("pd_category"));
				temp.setPm_discount(rs.getDouble("pm_discount"));
				temp.setPm_expire(rs.getDate("pm_expire"));
				temp.setPm_title(rs.getString("pm_title"));
				
				result.add(temp);
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
	public PromoCodeVO insert(String mb_email, String pc_code) {
		PromoCodeVO result = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(INSERT);
			ps.setString(1, mb_email);
			ps.setString(2, pc_code);
			System.out.println("ss");
			if(ps.executeUpdate() == 1){
				result = new PromoCodeVO();
				PromoCode promoCodetemp = new PromoCode();
				promoCodetemp.setMb_email(mb_email);
				promoCodetemp.setPm_code(pc_code);
				result.setPromoCode(promoCodetemp);
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
	public boolean delete(String mb_email,String pc_code) {
		boolean result = false;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(DELETE);
			ps.setString(1, mb_email);
			ps.setString(2, pc_code);
			
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
	public PromoCodeVO insert(PromoCode promoCode) {
		// TODO Auto-generated method stub
		return null;
	}

}
