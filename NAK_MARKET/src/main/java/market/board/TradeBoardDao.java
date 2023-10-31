package market.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class TradeBoardDao {
	Connection conn=null;
	ResultSet rs =null;
	PreparedStatement ps =null;
	
	public static TradeBoardDao instance = new TradeBoardDao();
	public static TradeBoardDao getInstance() {
		return instance;
	}
	private TradeBoardDao() {
	}
	
	private Connection getConnection() throws Exception{
		Context initContext =new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds =(DataSource)envContext.lookup("jdbc/OracleDB");
		conn=ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	public int insertUser(TradeBoardBean pb,int tnum) throws Exception {
		Connection conn=getConnection();
		int cnt=0;
		String sql ="insert into prodBoards values(board_seq.nextval,?,?,?,?,?,?,?,?,?)";
		ps =conn.prepareStatement(sql);
		ps.setString(1, pb.getId());
		ps.setInt(2, pb.getTnum());
		ps.setInt(3, pb.getReadcount());
		ps.setInt(4, pb.getRef());
		ps.setInt(5, pb.getStep());
		ps.setInt(6, pb.getDepth());
		ps.setTimestamp(7, pb.getRegdate());
		ps.setString(8, pb.getContent());
		ps.setString(9, pb.getIp());
		cnt = ps.executeUpdate();
		return cnt;
	}
	public ArrayList<TradeBoardBean> selectProd(String id,int tnum) throws Exception{
		Connection conn=getConnection();
		ArrayList<TradeBoardBean> lists =new ArrayList<TradeBoardBean>() ; 
		String sql = "select * from prodBoards where id = ? and tnum = ? and step= 0";
		ps =conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setInt(2, tnum);
		rs   = ps.executeQuery();
		while(rs.next()) {
			TradeBoardBean pb=new TradeBoardBean(); 
			pb.setNum(Integer.parseInt(rs.getString("num")));
			pb.setId(rs.getString("id"));
			pb.setTnum(Integer.parseInt(rs.getString("tnum")));
			pb.setReadcount(Integer.parseInt(rs.getString("readcount")));
			pb.setRef(Integer.parseInt(rs.getString("ref")));
			pb.setStep(Integer.parseInt(rs.getString("step")));
			pb.setDepth(Integer.parseInt(rs.getString("depth")));
			pb.setRegdate(rs.getTimestamp("regdate"));
			pb.setContent(rs.getString("content"));
			pb.setIp(rs.getString("ip"));
			lists.add(pb);
		}
		return lists;
	}
	
	public int DeleteNumIDProd(int tnum, String id)throws Exception{
		Connection conn=getConnection();
		int cnt =0;
		String sql = "delete from prodBoards where id = ? and tnum = ? ";
		ps =conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setInt(2, tnum);
		cnt   = ps.executeUpdate();
		
		return cnt;
		
	}
	public int insertArticle(TradeBoardBean bb) throws Exception{ // 원글쓰기
		Connection conn=getConnection();
		int cnt = -1;
		String sql = "insert into prodBoards(num,id,tnum,"
				+ "regdate,ref,step,depth,content,ip) "
				+ "values(board_seq.nextval,?,?,"
				+ "?,board_seq.currval,?,?,?,?)";
		
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getId());
			ps.setInt(2, bb.getTnum());
			
			ps.setTimestamp(3,bb.getRegdate());
			ps.setInt(4, 0);
			ps.setInt(5, 0);
			ps.setString(6, bb.getContent());
			ps.setString(7, bb.getIp());

			return cnt = ps.executeUpdate();

		}
	public int replyArticle(TradeBoardBean bb)throws Exception {
		Connection conn=getConnection();

		int cnt = -1;
		String sql = "insert into prodBoards(num,id,tnum,"
				+ "regdate,ref,step,depth,content,ip) "
				+ "values(board_seq.nextval,?,?,?,?,?,?,?,?)";
		
			cnt =ps.executeUpdate();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getId());
			ps.setInt(2, bb.getTnum());
			ps.setTimestamp(3,bb.getRegdate());

			ps.setInt(4, bb.getRef());
			ps.setInt(5, bb.getStep()+1);
			ps.setInt(6, bb.getDepth()+1);
			ps.setString(7, bb.getContent());
			ps.setString(8, bb.getIp());

			return cnt = ps.executeUpdate();

		} 
	public ArrayList<TradeBoardBean> selectReply(String id,int num,int ref) throws Exception{
		Connection conn=getConnection();
		ArrayList<TradeBoardBean> lists =new ArrayList<TradeBoardBean>() ; 
		String sql = "select * from prodBoards where id = ? and num = ? and ref = ? and step = 1";
		ps =conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setInt(2, num);
		ps.setInt(3, ref);
		rs   = ps.executeQuery();
		while(rs.next()) {
			TradeBoardBean pb=new TradeBoardBean(); 
			pb.setNum(Integer.parseInt(rs.getString("num")));
			pb.setId(rs.getString("id"));
			pb.setTnum(Integer.parseInt(rs.getString("tnum")));
			pb.setReadcount(Integer.parseInt(rs.getString("readcount")));
			pb.setRef(ref);
			pb.setStep(Integer.parseInt(rs.getString("step")));
			pb.setDepth(Integer.parseInt(rs.getString("depth")));
			pb.setRegdate(rs.getTimestamp("regdate"));
			pb.setContent(rs.getString("content"));
			pb.setIp(rs.getString("ip"));
			lists.add(pb);
		}
		return lists;
	}
}
