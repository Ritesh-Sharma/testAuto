package com.avekshaa.epm.Login;

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
public class EndPointMasterListingServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			// System.out.println("Invoke User Listing Servlet.......");
			List epmMasterList = new ArrayList();

			/*UserMasterBean userMasterBean = new UserMasterBean();
			userMasterBean.setUserName(request.getParameter("un"));*/
			epmMasterList = EndPointMasterDAO.listAllEpm();

			HttpSession session = request.getSession(true);

			if (epmMasterList != null) {
				System.out.println("EPM Master Details Found....");
				session.setAttribute("EPMInfo", epmMasterList);
				response.sendRedirect("jsp/EndPointMasterListing.jsp");
			}

			else {
				System.out.println("EPM Records Does Not Exist...");
				session.setAttribute("userCreationStatus",
						"EPM Records Does Not Exist...");
				// response.sendRedirect("jsp/UserCreationStatus.jsp"); //Status
				// Page
			}

		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
