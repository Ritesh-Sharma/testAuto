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
public class EPMConfigurationMasterListingServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {
			List epmConfigMasterList = new ArrayList();

			epmConfigMasterList = EPMConfigurationMasterDAO.listAllEpm();

			HttpSession session = request.getSession(true);

			if (epmConfigMasterList != null) {
				System.out.println("EPM Configuration Master Details Found....");
				session.setAttribute("EPMInfo", epmConfigMasterList);
				response.sendRedirect("jsp/EPMConfigurationMasterListing.jsp");
			}

			else {
				System.out.println("EPM Configuration Does Not Exist...");
				session.setAttribute("userCreationStatus",
						"EPM Configuration Records Does Not Exist...");
				// response.sendRedirect("jsp/UserCreationStatus.jsp"); //Status Page
			}

		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
