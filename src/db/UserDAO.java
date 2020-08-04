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

public class UserDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	static DataSource ds;
	static {
		try {
			Context init = new InitialContext(); // javax.naming.*
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.err.println("lookup 실패 : " + e.getMessage());
		}
	}

	public String checkLogin(String id, String passwd) throws SQLException {
		try {
		String sql = "select password from member where id = ?";
		con = ds.getConnection();
		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		String msg = null, url = null;
		boolean check = rs.next();
		if (check) {

			if (!rs.getString("password").equals(passwd)) {
				msg = "패스워드가 일치하지 않습니다";
				url = "main.jsp";
			} else {
				msg = id + "님 환영합니다";
				url = "main.jsp?id="+id+"&passwd=" +passwd;
				
			}
		} else {
			msg = "아이디가 없습니다";
			url = "main.jsp";
		}

		return "massage.jsp";
		}finally {
			if(con != null) con.close();
			if(ps != null) ps.close();
			if(rs != null) rs.close();
		}
	}

	public int InsertUser(UserDTO dto) throws SQLException {
		try {
		con = ds.getConnection();
		String sql = "insert into member values(?,?,?,?,?,?,?,?,sysdate,0)";
		ps = con.prepareStatement(sql);		
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getName());
		ps.setString(3, dto.getPassword());
		ps.setString(4, dto.getAddress());
		ps.setString(5, dto.getEmail());
		ps.setString(6, dto.getPhone());
		ps.setString(7, dto.getBirth());
		ps.setString(8, dto.getDriver());
		int check = checkId(dto);
		int res = 0;
		if(check == -1) {
			return -1;
		}else {
			res = ps.executeUpdate();
		}		
		return res;
		}finally {
			if(con != null) con.close();
			if(ps != null) ps.close();
		}
	}
	
	public int checkId(UserDTO dto) throws SQLException {
			con = ds.getConnection();
			String sql = "select id from member";
			ps = con.prepareStatement(sql);		
			rs = ps.executeQuery();
			while(rs.next()) {
				if(dto.getId().equals(rs.getString("id"))) {
					return -1;
				}
			}
			return 0;
			
	}
	
	public List userList() throws SQLException {
		
		try {
		con = ds.getConnection();
		String sql = "select * from member";
		ps = con.prepareStatement(sql);		
		rs = ps.executeQuery();
		List<UserDTO> list = new ArrayList<>();
		while(rs.next()) {
			UserDTO dto = new UserDTO();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setPassword(rs.getString("password"));
			dto.setAddress(rs.getString("address"));
			dto.setEmail(rs.getString("email"));
			dto.setPhone(rs.getString("phone"));
			dto.setBirth(rs.getString("birth"));
			dto.setDriver(rs.getString("driver"));
			dto.setRegidate(rs.getDate("regidate"));
			list.add(dto);
		}
		return list;
		}finally {
			if(con != null) con.close();
			if(ps != null) ps.close();
			if(rs != null) rs.close();
		}
	}
}
