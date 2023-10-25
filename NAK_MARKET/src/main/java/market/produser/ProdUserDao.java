package market.produser;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import market.prod.ProdBean;


public class ProdUserDao {
	Connection conn=null;
	ResultSet rs =null;
	PreparedStatement ps =null;
	
	public static ProdUserDao instance = new ProdUserDao();
	public static ProdUserDao getInstance() {
		return instance;
	}
	private ProdUserDao() {
	}
	
	private Connection getConnection() throws Exception{
		Context initContext =new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds =(DataSource)envContext.lookup("jdbc/OracleDB");
		conn=ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	public int insertUser(ProdUserBean pb, String id) throws Exception{
	    int cnt = 0;

	
	        conn = getConnection();
	        String tableName = "prodtrade_" + id;
	        
	        if (!tableExists(conn, tableName)) {
	            // 테이블이 존재하지 않으면 CREATE TABLE 문 실행
	            createTable(conn, tableName);
	        }

	        String sql = "INSERT INTO " + tableName + " VALUES(tradeseq_"+tableName+".nextval, ?, ?, ?, ?, ?, ?);";

	        ps = conn.prepareStatement(sql);
	        ps.setString(1, pb.getTimg());
	        ps.setString(2, pb.getTname());
	        ps.setString(3, pb.getTcate());
	        ps.setString(4, pb.getTlocation());
	        ps.setInt(5, pb.getTprice());
	        ps.setString(6, pb.getTinfor());

	        cnt = ps.executeUpdate();
	    return cnt;
	}
	private boolean tableExists(Connection conn, String tableName) throws SQLException {
	    DatabaseMetaData meta = conn.getMetaData();
	    ResultSet tables = meta.getTables(null, null, tableName, null);
	    return tables.next();
	}

	private void createTable(Connection conn, String tableName) throws SQLException {
	    String createTableSQL = "CREATE TABLE " + tableName + " ("
	            + "id NUMBER PRIMARY KEY, "
	            + "timg VARCHAR(255), "
	            + "tname VARCHAR(255), "
	            + "tcate VARCHAR(255), "
	            + "tlocation VARCHAR(255), "
	            + "tprice NUMBER, "
	            + "tinfor VARCHAR(255)"
	            + ")";
	    
	    PreparedStatement createTableStatement = conn.prepareStatement(createTableSQL);
	    createTableStatement.executeUpdate();
	    
	    String createSequenceSQL = "CREATE SEQUENCE tradeseq_" + tableName + " NOCACHE";
        
        PreparedStatement ps = conn.prepareStatement(createSequenceSQL);
        ps.executeUpdate();
	}


}
