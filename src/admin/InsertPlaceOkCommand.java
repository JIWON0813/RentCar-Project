package admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.PlaceDAO;

public class InsertPlaceOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PlaceDAO dao = new PlaceDAO();
		int res = 0;
		try {			
			res = dao.insertPlace(req.getParameter("name"),req.getParameter("max"));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		String msg = null, url = null;
		if (res>0) {
			msg = "장소 등록 성공!! ";
			url = "placelist.admin";
		}else {
			msg = "장소 등록 실패!! ";
			url = "insertPlace.admin";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
