package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RentMainCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("startPlace", req.getParameter("startplace"));
		req.setAttribute("startDate", req.getParameter("startdate"));
		req.setAttribute("endDate", req.getParameter("enddate"));
		req.setAttribute("endPlace", req.getParameter("endplace"));
		return "WEB-INF/rent/rentMain.jsp";
	}

}
