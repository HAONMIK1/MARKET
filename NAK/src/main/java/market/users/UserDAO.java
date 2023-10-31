package market.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	Connection conn=null;
	ResultSet rs =null;
	PreparedStatement ps =null;
	
	public static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {
	}
	
	private Connection getConnection() throws Exception{
		Context initContext =new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds =(DataSource)envContext.lookup("jdbc/OracleDB");
		conn=ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	public int insertUser(UserBean ub) throws Exception {
		Connection conn=getConnection();
		int cnt=0;
		String sql ="insert into users values(?,?,?,?)";
		ps =conn.prepareStatement(sql);
		ps.setString(1, ub.getName());
		ps.setString(2, ub.getId());
		ps.setString(3, ub.getPassword());
		ps.setString(4, ub.getHp());
		cnt = ps.executeUpdate();
		createTable(conn, ub.getId());
		return cnt;
	}
	public boolean selectID(String userid) throws Exception{
		boolean check=false;
		Connection conn=getConnection();
		String sql = "select * from users where id = ?";
		ps =conn.prepareStatement(sql);
		ps.setString(1, userid);
		rs   = ps.executeQuery();
		if(rs.next()) {
			check =true;
		}
		return check;
	}
	public boolean selectUser(UserBean ub)  throws Exception{
		boolean check=false;
		Connection conn=getConnection();
		String sql = "select * from users where id = ? ";
		ps =conn.prepareStatement(sql);
		ps.setString(1, ub.getId());
		rs   = ps.executeQuery();
		if(rs.next()) {
			if(rs.getString("password").equals(ub.getPassword())) {
			check =true;
			}
		}
		return check;
	}
	public String searchNameHP(UserBean ub) throws Exception {
		String id="";
		Connection conn=getConnection();
		String sql = "select * from users where name = ? ";
		ps =conn.prepareStatement(sql);
		ps.setString(1, ub.getName());
		rs   = ps.executeQuery();
		if(rs.next()) {
			if(rs.getString("hp").equals(ub.getHp())) {
				id= rs.getString("id");
			}
		}else {}
		return id;
	}
	public String searchIDNameHp(UserBean ub) throws Exception{
		String pw ="";
		Connection conn=getConnection();
		String sql = "select * from users where name = ? and id=? and hp=?";
		ps =conn.prepareStatement(sql);
		ps.setString(1, ub.getName());
		ps.setString(2, ub.getId());
		ps.setString(3, ub.getHp());
		rs   = ps.executeQuery();
		if(rs.next()) {
			pw = rs.getString("password");
		}else {}
		return pw;
	}

	private void createTable(Connection conn, String id) throws SQLException {
        String tableName = "prodtrade_" + id;
        String seqName = "trade_" + id+"seq";

String createTableSQL = "CREATE TABLE " + tableName + " ("
	            + "tnum NUMBER , "
	            + "timg VARCHAR(255), "
	            + "tname VARCHAR(255), "
	            + "tcate VARCHAR(255), "
	            + "tlocation VARCHAR(255), "
	            + "tprice NUMBER, "
	            + "tinfor VARCHAR(255)"
	            + ")";
	    
	    PreparedStatement createTableStatement = conn.prepareStatement(createTableSQL);
	    createTableStatement.executeUpdate();
	 
	    String createSequenceSQL = "CREATE SEQUENCE " + seqName + " "
	            + "START WITH 1 "
	            + "INCREMENT BY 1 "
	            + "MAXVALUE 999999999 "
	            + "NOCYCLE";
	    
	    PreparedStatement createSequenceStatement = conn.prepareStatement(createSequenceSQL);
	    createSequenceStatement.executeUpdate();
	}

	
}
