package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.UserDAO;
import db.UserDTO;

public class UserListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		List<UserDTO> list = null;
		try {
			list = dao.userList();
		}catch(Exception e) {}
		req.setAttribute("list", list);
		return "WEB-INF/admin/userlist.jsp";
	}

}
