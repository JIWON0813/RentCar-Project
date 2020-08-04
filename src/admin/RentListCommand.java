package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.CarDAO;
import db.CarDTO;

public class RentListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CarDAO dao = new CarDAO();
		List<CarDTO> list = null;
		try {
			list = dao.carList();
		}catch(Exception e) {}
		req.setAttribute("list", list);
		return "WEB-INF/admin/rentlist.jsp";
	}

}
