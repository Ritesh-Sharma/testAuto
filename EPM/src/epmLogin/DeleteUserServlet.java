package epmLogin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class DeleteUserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			// System.out.println("Invoke Delete User Servlet.......");
			String userName = request.getParameter("deleteuser");
			// System.out.println("Delete User :" +userName);
			String isUserDeleted = UserMasterDAO.disableUser(userName);
			HttpSession session = request.getSession(true);
			if (isUserDeleted.equals("S")) {
				System.out.println("User Deleted Successfully...");
				session.setAttribute("userCreationStatus",
						"User Deleted Successfully...");
				response.sendRedirect("jsp/UserStatus.jsp");
			}
		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
