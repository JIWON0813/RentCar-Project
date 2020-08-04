package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.PlaceDAO;

public class DeletePlaceCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("name");
		PlaceDAO dao = new PlaceDAO();
		int res = 0;
		try {
			res = dao.deletePlace(name);
		}catch(Exception e) {}
		String msg = null, url ="placelist.admin";
		if (res>0) {
			msg = "��� ���� ����!! ";
		}else {
			msg = "��� ���� ����!! ";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
