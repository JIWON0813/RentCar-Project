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

import com.oreilly.servlet.MultipartRequest;

public class CarDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	static DataSource ds;
	static {
		try {
			Context init = new InitialContext(); // javax.naming.*
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.err.println("lookup ½ÇÆÐ : " + e.getMessage());
		}
	}

	public List<CarDTO> carList() throws SQLException {
		try {
			String sql = "select * from car";
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<CarDTO> list = new ArrayList<>();
			while (rs.next()) {
				CarDTO dto = new CarDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setType(rs.getString("type"));
				dto.setFuel(rs.getString("fuel"));
				dto.setMaxpeople(rs.getInt("maxpeople"));
				dto.setPlace(rs.getString("place"));
				dto.setRent(rs.getString("rent"));
				dto.setPrice(rs.getInt("price"));
				dto.setImage(rs.getString("image"));
				list.add(dto);
			}
			return list;
		} finally {
			if (con != null)
				con.close();
			if (ps != null)
				ps.close();
			if (rs != null)
				rs.close();
		}
	}
	
	public int insertCar(MultipartRequest mr) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "insert into car values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("id"));
			ps.setString(2, mr.getParameter("name"));
			ps.setString(3, mr.getParameter("type"));
			ps.setString(4, mr.getParameter("fuel"));
			ps.setInt(5, Integer.parseInt(mr.getParameter("maxpeople")));
			ps.setString(6, mr.getParameter("place"));
			ps.setString(7, mr.getParameter("rent"));
			ps.setInt(8, Integer.parseInt(mr.getParameter("price")));
			ps.setString(9, mr.getFilesystemName("image"));
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}
