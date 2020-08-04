package admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import db.CarDAO;


public class InsertCarOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String upPath = req.getServletContext().getRealPath("files");		
		MultipartRequest mr = null;
		CarDAO dao = new CarDAO();
		int res = 0;
		try {			
			mr = new MultipartRequest(req, upPath, 10*1024*1024, "EUC-KR");
			res = dao.insertCar(mr);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		String msg = null, url = null;
		if (res>0) {
			msg = "차량 등록 성공!! ";
			url = "rentlist.admin";
		}else {
			msg = "차량 등록 실패!! ";
			url = "insertCar.admin";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
