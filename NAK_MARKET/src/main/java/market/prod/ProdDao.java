package market.prod;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import market.produser.ProdUserBean;
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
	public int insertUser(ProdBean pb,int tnum) throws Exception {
		Connection conn=getConnection();
		int cnt=0;
		String sql ="insert into prodtrade values(ptradeseq.nextval,?,?,?,?,?,?,?,?)";
		ps =conn.prepareStatement(sql);
		ps.setString(1, pb.getId());
		ps.setString(2, pb.getTimg());
		ps.setString(3, pb.getTname());
		ps.setString(4, pb.getTcate());
		ps.setString(5, pb.getTlocation());
		ps.setInt(6, pb.getTprice());
		ps.setString(7, pb.getTinfor());
		ps.setInt(8, tnum);
		cnt = ps.executeUpdate();
		return cnt;
	}
	public ArrayList<ProdBean> selectProd() throws Exception{
		Connection conn=getConnection();
		ArrayList<ProdBean> lists =new ArrayList<ProdBean>() ; 
		String sql = "select * from prodtrade";
		ps =conn.prepareStatement(sql);
		rs   = ps.executeQuery();
		while(rs.next()) {
			ProdBean pb=new ProdBean(); 
			pb.setPnum(rs.getString("pnum"));
			pb.setId(rs.getString("pid"));
			pb.setTimg(rs.getString("pimg"));
			pb.setTcate(rs.getString("pcate"));
			pb.setTname(rs.getString("pname"));
			pb.setTlocation(rs.getString("plocation"));
			pb.setTprice(Integer.parseInt(rs.getString("pprice")));
			pb.setTinfor(rs.getString("pinfor"));
			lists.add(pb);
		}
		return lists;
	}
	public ProdBean selectNumProd(String pnum)throws Exception{
		Connection conn=getConnection();
		ProdBean pb=new ProdBean(); 
		String sql = "select * from prodtrade where pnum = "+pnum;
		ps =conn.prepareStatement(sql);
		rs   = ps.executeQuery();
		if(rs.next()) {
			pb.setTnum(Integer.parseInt(rs.getString("tnum")));
			pb.setPnum(rs.getString("pnum"));
			pb.setId(rs.getString("pid"));
			pb.setTimg(rs.getString("pimg"));
			pb.setTcate(rs.getString("pcate"));
			pb.setTname(rs.getString("pname"));
			pb.setTlocation(rs.getString("plocation"));
			pb.setTprice(Integer.parseInt(rs.getString("pprice")));
			pb.setTinfor(rs.getString("pinfor"));
		}
		return pb;
		
	}
	public int DeleteNumIDProd(int tnum, String id)throws Exception{
		Connection conn=getConnection();
		int cnt =0;
		String sql = "delete from prodtrade where pid = ? and tnum = ? ";
		ps =conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setInt(2, tnum);
		cnt   = ps.executeUpdate();
		
		return cnt;
		
	}
	public int UpdateUser(ProdBean pb,String id,int tnum) throws Exception{
		int cnt = 0;

        conn = getConnection();
        
        String sql = "update prodtrade set pimg = ? ,pname =? ,pcate = ?,  pprice =? , pinfor = ? where pid = ? and tnum = ?";

        ps = conn.prepareStatement(sql);
        ps.setString(1, pb.getTimg());
        ps.setString(2, pb.getTname());
        ps.setString(3, pb.getTcate());
        ps.setInt(4, pb.getTprice());
        ps.setString(5, pb.getTinfor());
        ps.setString(6, id);
        ps.setInt(7, tnum);

        cnt = ps.executeUpdate();
    return cnt;
	}
	public ArrayList<ProdBean> selectTloca(String tloca) throws Exception{
		Connection conn=getConnection();
		ArrayList<ProdBean> lists =new ArrayList<ProdBean>() ; 
		String sql = "select * from prodtrade where plocation = ?";
		ps =conn.prepareStatement(sql);
		ps.setString(1, tloca);
		rs   = ps.executeQuery();
		while(rs.next()) {
			ProdBean pb=new ProdBean(); 
			pb.setPnum(rs.getString("pnum"));
			pb.setId(rs.getString("pid"));
			pb.setTimg(rs.getString("pimg"));
			pb.setTcate(rs.getString("pcate"));
			pb.setTname(rs.getString("pname"));
			pb.setTlocation(rs.getString("plocation"));
			pb.setTprice(Integer.parseInt(rs.getString("pprice")));
			pb.setTinfor(rs.getString("pinfor"));
			lists.add(pb);
		}
		return lists;
	}
	public ArrayList<ProdBean> selectTcate(String tcate)throws Exception{
		Connection conn=getConnection();
		ArrayList<ProdBean> lists =new ArrayList<ProdBean>() ; 
		String sql = "select * from prodtrade where pcate = ?";
		ps =conn.prepareStatement(sql);
		ps.setString(1, tcate);
		rs   = ps.executeQuery();
		while(rs.next()) {
			ProdBean pb=new ProdBean(); 
			pb.setPnum(rs.getString("pnum"));
			pb.setId(rs.getString("pid"));
			pb.setTimg(rs.getString("pimg"));
			pb.setTcate(rs.getString("pcate"));
			pb.setTname(rs.getString("pname"));
			pb.setTlocation(rs.getString("plocation"));
			pb.setTprice(Integer.parseInt(rs.getString("pprice")));
			pb.setTinfor(rs.getString("pinfor"));
			lists.add(pb);
		}
		return lists;
	}
	public ArrayList<ProdBean> selectSearch(String search)throws Exception{
		Connection conn=getConnection();
		ArrayList<ProdBean> lists =new ArrayList<ProdBean>() ; 
		String sql = "select * from prodtrade where pname like ? or pinfor like ?";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, "%" + search + "%");
	    ps.setString(2, "%" + search + "%");
		rs   = ps.executeQuery();
		while(rs.next()) {
			ProdBean pb=new ProdBean(); 
			pb.setPnum(rs.getString("pnum"));
			pb.setId(rs.getString("pid"));
			pb.setTimg(rs.getString("pimg"));
			pb.setTcate(rs.getString("pcate"));
			pb.setTname(rs.getString("pname"));
			pb.setTlocation(rs.getString("plocation"));
			pb.setTprice(Integer.parseInt(rs.getString("pprice")));
			pb.setTinfor(rs.getString("pinfor"));
			lists.add(pb);
		}
		return lists;
	}
}
