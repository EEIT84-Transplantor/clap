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

public class GiftCardjdbcDAO implements GiftCardDAO {

	public static void main(String[]  args){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		GiftCardDAO gdao = (GiftCardDAO) context.getBean("giftCardDAO");
		System.out.println(gdao.selectAll().size());
		System.out.println(gdao.selectByGcNumber("1111").getGc_code());
		
		GiftCardVO vo = new GiftCardVO();
		vo.setGc_amount(300.0);
		vo.setGc_available(1);
		vo.setGc_code("gccode3");
		vo.setGc_number("3333");
		
		//System.out.println(gdao.insert(vo).getGc_amount());
		vo.setGc_amount(350.0);
		//System.out.println(gdao.update(vo));
		//System.out.println(gdao.delete("3333"));
	}
	
	
	private DataSource dataSource;
	private Connection conn = null;
	private static final String SELECT_ALL = "select * from giftcard";
	private static final String SELECT_BY_GC_NUMBER = "select * from giftcard where gc_number=?";
	private static final String INSERT = "insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values(?,?,?,?)";
	private static final String UPDATE = "update giftcard set gc_code=?,gc_amount=?,gc_available=? where gc_number=?";
	private static final String DELETE = "delete from giftcard where gc_number=?";
	
	
	public GiftCardjdbcDAO() {
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<GiftCardVO> selectAll() {
		List<GiftCardVO> result = new ArrayList<GiftCardVO>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(SELECT_ALL);
			rs = ps.executeQuery();
			GiftCardVO temp = null;
			while(rs.next()){
				temp = new GiftCardVO();
				temp.setGc_code(rs.getString("gc_code"));
				temp.setGc_number(rs.getString("gc_number"));
				temp.setGc_amount(rs.getDouble("gc_amount"));
				temp.setGc_available(rs.getInt("gc_available"));
				
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
	public GiftCardVO selectByGcNumber(String gc_number) {
		GiftCardVO result = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(SELECT_BY_GC_NUMBER);
			ps.setString(1, gc_number);
			
			rs = ps.executeQuery();
			if(rs.next()){
				result = new GiftCardVO();
				result.setGc_amount(rs.getDouble("gc_amount"));
				result.setGc_available(rs.getInt("gc_available"));
				result.setGc_code(rs.getString("gc_code"));
				result.setGc_number(rs.getString("gc_number"));
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
	public GiftCardVO insert(GiftCardVO giftCardVO) {
		GiftCardVO result = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(INSERT);
			ps.setString(1, giftCardVO.getGc_number());
			ps.setString(2, giftCardVO.getGc_code());
			ps.setDouble(3, giftCardVO.getGc_amount());
			ps.setInt(4, giftCardVO.getGc_available());
			
			if(ps.executeUpdate() == 1){
				result = giftCardVO;
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
	public boolean update(GiftCardVO giftCardVO) {
		boolean result = false;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(UPDATE);
			ps.setString(1, giftCardVO.getGc_code());
			ps.setDouble(2, giftCardVO.getGc_amount());
			ps.setInt(3, giftCardVO.getGc_available());
			ps.setString(4, giftCardVO.getGc_number());
			
			if(ps.executeUpdate() == 1){
				return true;
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
	public boolean delete(String gc_number) {
		boolean result = false;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(DELETE);
			ps.setString(1, gc_number);

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

}
