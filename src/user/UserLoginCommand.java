package user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.UserDAO;
import db.UserDTO;

public class UserLoginCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		dto.setId(req.getParameter("id"));
		dto.setPassword(req.getParameter("passwd"));
		int res = 1;
		try {
			res = dao.checkId(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String msg = null , url ="main.do";
		if(res == 0) {
			msg = "로그인 성공했습니다.";
		session.setAttribute("id", dto.getId() );
		session.setAttribute("passwd", dto.getPassword());
		}
		else {
			msg = "아이디, 비밀번호를 확인해주세요";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
