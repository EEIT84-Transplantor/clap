package payment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import member.model.MemberDAO;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CreditCardjdbcDAO implements CreditCardDAO {
	
	// 測試程式
		public static void main(String[] args) {
			ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
			CreditCardDAO cdao = (CreditCardDAO) context.getBean("creditCardDAO");
			List<CreditCardVO> list = cdao.selectByEmail("caca@gmail.com");
			
			System.out.print(list.get(0).getCc_cvv());
			
			CreditCardVO vo = new CreditCardVO();
			CreditCard creditCard = new CreditCard();
			creditCard.setCc_number("caca@gmail.com");
			creditCard.setCc_number("111111111111111");
			vo.setCc_goodthru("10/18");
			vo.setCc_cvv("333");
			vo.setCreditCard(creditCard);
           // System.out.println(cdao.insert(vo).getCc_cvv());
           // System.out.println(cdao.delete(vo.getCc_number()));
            
		}
	
	private DataSource dataSource;
	private Connection conn = null;
	private static final String SELECT_BY_EMAIL = "select * from creditcard where mb_email=?";
	private static final String SELECT_BY_CCNUMBER = "select * from creditcard where cc_number=?";
	private static final String INSERT = "insert into creditcard(mb_email,cc_number,cc_goodrhru,cc_cvv) values(?,?,?,?)";
	private static final String DELETE = "delete from creditcard where cc_number=?";
	
    public CreditCardjdbcDAO(){
		
	}
    
    public void setDataSource(DataSource dataSource){
    	this.dataSource = dataSource;
    };
	
	@Override
	public List<CreditCardVO> selectByEmail(String mb_email) {
		List<CreditCardVO> result = new ArrayList<CreditCardVO>();
		PreparedStatement ps= null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(SELECT_BY_EMAIL);
			ps.setString(1,mb_email);
			rs =ps.executeQuery();
			while(rs.next()){
			CreditCardVO temp = new CreditCardVO();
			CreditCard creditCard = new CreditCard();
			creditCard.setCc_number(rs.getString("cc_number"));
			creditCard.setMb_email(rs.getString("mb_email"));
			temp.setCreditCard(creditCard);
			temp.setCc_goodthru(rs.getString("cc_goodrhru"));
			temp.setCc_cvv(rs.getString("cc_cvv"));
			
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
	public CreditCardVO selectByCcNumber(String mb_email, String cc_number) {
		CreditCardVO result = null;
		PreparedStatement ps= null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(SELECT_BY_CCNUMBER);
			ps.setString(1,cc_number);
			rs =ps.executeQuery();
			if(rs.next()){
			result = new CreditCardVO();
			CreditCard creditCard = new CreditCard();
			creditCard.setCc_number(rs.getString("cc_number"));
			creditCard.setMb_email(rs.getString("mb_email"));
			result.setCreditCard(creditCard);
			result.setCc_goodthru(rs.getString("cc_goodrhru"));
			result.setCc_cvv(rs.getString("cc_cvv"));
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
	public CreditCardVO insert(CreditCardVO creditCardVO) {
		CreditCardVO result = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			ps = conn.prepareStatement(INSERT);
			ps.setString(1, creditCardVO.getCreditCard().getMb_email());
			ps.setString(2, creditCardVO.getCreditCard().getCc_number());
			ps.setString(3, creditCardVO.getCc_goodthru());
			ps.setString(4, creditCardVO.getCc_cvv());
			
			if(ps.executeUpdate() == 1){
				result = creditCardVO;
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
	public boolean delete(String cc_number, String mb_email) {
		// TODO Auto-generated method stub
		return false;
	}

	

}
