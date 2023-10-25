package market.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		String sql ="insert into users values(userseq.nextval,?,?,?,?)";
		ps =conn.prepareStatement(sql);
		ps.setString(1, ub.getName());
		ps.setString(2, ub.getId());
		ps.setString(3, ub.getPassword());
		ps.setString(4, ub.getHp());
		cnt = ps.executeUpdate();
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
	
	
}
