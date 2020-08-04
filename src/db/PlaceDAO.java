package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PlaceDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	static DataSource ds;
	static {
		try {
			Context init = new InitialContext();	//javax.naming.*
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			System.err.println("lookup ½ÇÆÐ : " + e.getMessage());
		}
	}
	
	
	public List<PlaceDTO> placeList() throws SQLException{
		try {
		String sql = "select * from place";
		con = ds.getConnection();
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		List<PlaceDTO> list = new ArrayList<>();
		while(rs.next()) {
			PlaceDTO dto = new PlaceDTO();
			dto.setName(rs.getString("name"));
			dto.setStack(rs.getInt("stack"));
			dto.setPossible(rs.getInt("possible"));
			dto.setMax(rs.getInt("max"));
			list.add(dto);
		}
		return list;
		}finally {
			if(con != null) con.close();
			if(ps != null) ps.close();
			if(rs != null) rs.close();
		}
	}


	public int insertPlace(String name, String max) throws SQLException {
		try {
		con = ds.getConnection();
		String sql = "insert into place values(?,0,0,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setInt(2, Integer.parseInt(max));
		int res = ps.executeUpdate();
		return res;
		}finally {
			if(con != null) con.close();
			if(ps != null) ps.close();
		}
	}


	public int deletePlace(String name) throws SQLException {
		try {
		con = ds.getConnection();
		String sql = "delete from place where name =?";
		ps = con.prepareStatement(sql);
		ps.setString(1, name);
		int res = ps.executeUpdate();
		return res;
		}finally {
			if(con != null) con.close();
			if(ps != null) ps.close();
		}
	}
}
