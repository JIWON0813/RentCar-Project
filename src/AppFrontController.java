import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="*.do")
public class AppFrontController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=EUC-KR");
		req.setCharacterEncoding("EUC-KR");
		
		String reqUri = req.getRequestURI();
		String upPath = req.getContextPath();
		String cmd = reqUri.substring(upPath.length());
		
		String nextPage = null;
		if(cmd.equals("/main.do")) {
			nextPage= "main.jsp";
		}
		else if(cmd.equals("/register.do")) {
			nextPage= "register.user";
		}
		else if(cmd.equals("/admin.do")) {
			nextPage = "adminMain.admin";
		}
		else if(cmd.equals("/rent.do")) {
			nextPage = "restMain.user";
		} else if(cmd.equals("/login.do")) {
			nextPage = "userLogin.user";
		} else if(cmd.equals("/logout.do")) {
			nextPage = "userLogout.user";
		}
		
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}

}
