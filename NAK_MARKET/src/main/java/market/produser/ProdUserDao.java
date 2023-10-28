package market.produser;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	public ArrayList<ProdUserBean> selectID(String userid) throws Exception{
		Connection conn=getConnection();
		ArrayList<ProdUserBean> lists =new ArrayList<ProdUserBean>() ; 
		String sql = "select * from prodtrade_"+userid;
		ps =conn.prepareStatement(sql);
		rs   = ps.executeQuery();
		while(rs.next()){
			ProdUserBean pub=new ProdUserBean(); 
			pub.setTnum(Integer.parseInt(rs.getString("tnum")));
			pub.setTimg(rs.getString("timg"));
			pub.setTcate(rs.getString("tcate"));
			pub.setTname(rs.getString("tname"));
			pub.setTlocation(rs.getString("tlocation"));
			pub.setTprice(Integer.parseInt(rs.getString("tprice")));
			pub.setTinfor(rs.getString("tinfor"));
			lists.add(pub);
		}
		return lists;
	}
	public int insertUser(ProdUserBean pb, String id) throws Exception{
	    int cnt = 0;

	        conn = getConnection();
	        String tableName = "prodtrade_" + id;
	        String seqName = "trade_" + id+"seq";
	        
	        String sql = "INSERT INTO " + tableName + " VALUES("+seqName+".nextval, ?, ?, ?, ?, ?, ?)";

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
	public ProdUserBean selectNumProd(String tnum, String id)throws Exception{
		Connection conn=getConnection();
		ProdUserBean pb=new ProdUserBean(); 
		String sql = "select * from prodtrade_"+id+" where tnum = "+tnum;
		ps =conn.prepareStatement(sql);
		rs   = ps.executeQuery();
		if(rs.next()) {
			pb.setTnum(Integer.parseInt(rs.getString("tnum")));
			pb.setTimg(rs.getString("timg"));
			pb.setTcate(rs.getString("tcate"));
			pb.setTname(rs.getString("tname"));
			pb.setTlocation(rs.getString("tlocation"));
			pb.setTprice(Integer.parseInt(rs.getString("tprice")));
			pb.setTinfor(rs.getString("tinfor"));
		}
		return pb;
		
	}
	public int DeleteNumProd(String tnum, String id)throws Exception{
		Connection conn=getConnection();
		int cnt =0;
		String sql = "delete from prodtrade_"+id+" where tnum = "+tnum;
		ps =conn.prepareStatement(sql);
		cnt   = ps.executeUpdate();
		
		return cnt;
		
	}
	


}
