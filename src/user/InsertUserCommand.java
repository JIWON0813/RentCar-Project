package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.UserDAO;
import db.UserDTO;

public class InsertUserCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		dto.setId(req.getParameter("id"));
		dto.setName(req.getParameter("name"));
		dto.setAddress(req.getParameter("address"));
		dto.setBirth(req.getParameter("birth"));
		dto.setDriver(req.getParameter("driver"));
		dto.setEmail(req.getParameter("email"));
		dto.setPassword(req.getParameter("passwd"));
		dto.setPhone(req.getParameter("phone"));
		String msg = null , url = null;
		int res = 0;
		try {
			res = dao.InsertUser(dto);
		}catch(Exception e) {}
		if(res == 0) {
			msg = "ȸ�����Կ� �����߽��ϴ�.";
			url = "main.do";
		}else if(res == -1){
			msg = "�̹� �����ϴ� id�Դϴ�.";
			url = "main.do";
		}else {
			msg = "ȸ�������� ���������� �Ϸ�Ǿ����ϴ�.";
			url = "main.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "message.jsp";
	}

}
