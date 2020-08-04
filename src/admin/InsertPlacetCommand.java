package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.PlaceDAO;
import db.PlaceDTO;

public class InsertPlacetCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PlaceDAO dao = new PlaceDAO();
		List<PlaceDTO> list = null;
		try {
			list = dao.placeList();
		}catch(Exception e) {}
		req.setAttribute("list", list);
		return "WEB-INF/admin/insertPlace.jsp";
	}

}
