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
public class UserMasterServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			System.out.println("Invoke User Master Servlet.......");
			UserMasterBean userMasterBean = new UserMasterBean();
			userMasterBean.setUserName(request.getParameter("un"));
			userMasterBean.setPassword(request.getParameter("pw"));
			userMasterBean.setUserId(request.getParameter("uid"));
			userMasterBean = UserMasterDAO.createUser(userMasterBean);

			HttpSession session = request.getSession(true);
			if (userMasterBean.isValid()) {
				System.out.println("User Created Successfully...");
				session.setAttribute("userCreationStatus",
						"User Created Successfully...");
				// response.sendRedirect("jsp/UserCreationStatus.jsp");
				// //logged-in page
			}

			else {
				System.out.println("User Already Exist...");
				session.setAttribute("userCreationStatus",
						"User Already Exist...");
				// response.sendRedirect("jsp/UserCreationStatus.jsp"); //Status
				// Page
			}
			response.sendRedirect("jsp/UserStatus.jsp"); // Status Page
		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
