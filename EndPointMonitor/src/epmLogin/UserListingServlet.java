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
public class UserListingServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			// System.out.println("Invoke User Listing Servlet.......");
			List userDetails = new ArrayList();

			UserMasterBean userMasterBean = new UserMasterBean();
			userMasterBean.setUserName(request.getParameter("un"));
			userDetails = UserMasterDAO.findUser(userMasterBean);

			HttpSession session = request.getSession(true);

			if (userDetails != null) {
				System.out.println("User Details Found....");
				session.setAttribute("UserInfo", userDetails);
				response.sendRedirect("jsp/UserListing.jsp");
			}

			else {
				System.out.println("User Does Not Exist...");
				session.setAttribute("userCreationStatus",
						"User Does Not Exist...");
				// response.sendRedirect("jsp/UserCreationStatus.jsp"); //Status
				// Page
			}

		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
