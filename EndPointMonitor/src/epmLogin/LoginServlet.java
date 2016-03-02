package epmLogin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			UserBean user = new UserBean();
			user.setUserName(request.getParameter("un"));
			user.setPassword(request.getParameter("pw"));
			user = UserDAO.login(user);

			if (user.isValid()) {

				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", user);
				System.out.println("Valid User..................");
				response.sendRedirect("jsp/Alerts.jsp"); // logged-in page
			}

			else {
				System.out.println("Invalid User..................");
				response.sendRedirect("jsp/InvalidLogin.jsp"); // error page
			}
		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
