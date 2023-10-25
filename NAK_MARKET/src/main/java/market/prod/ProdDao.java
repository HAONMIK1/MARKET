package market.prod;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import market.users.UserBean;
import market.users.UserDAO;

public class ProdDao {
	Connection conn=null;
	ResultSet rs =null;
	PreparedStatement ps =null;
	
	public static ProdDao instance = new ProdDao();
	public static ProdDao getInstance() {
		return instance;
	}
	private ProdDao() {
	}
	
	private Connection getConnection() throws Exception{
		Context initContext =new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds =(DataSource)envContext.lookup("jdbc/OracleDB");
		conn=ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	public int insertUser(ProdBean pb) throws Exception {
		Connection conn=getConnection();
		int cnt=0;
		String sql ="insert into prodtrade values(tradeseq.nextval, ?,?, ?,?,?,?,?) ;";
		ps =conn.prepareStatement(sql);
		ps.setString(1, pb.getId());
		ps.setString(2, pb.getTimg());
		ps.setString(3, pb.getTname());
		ps.setString(4, pb.getTcate());
		ps.setString(5, pb.getTlocation());
		ps.setInt(6, pb.getTprice());
		ps.setString(7, pb.getTinfor());
		cnt = ps.executeUpdate();
		return cnt;
	}
	
}
