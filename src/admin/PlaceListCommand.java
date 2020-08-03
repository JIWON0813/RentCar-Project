package admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.PlaceDAO;
import db.PlaceDTO;

public class PlaceListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PlaceDAO dao = new PlaceDAO();
		List<PlaceDTO> list = null;
		try {
			 list = dao.placeList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("list", list);
		return "WEB-INF/admin/placelist.jsp";
	}

}
