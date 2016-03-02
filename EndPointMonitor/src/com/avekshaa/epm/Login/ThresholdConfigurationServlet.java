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
public class ThresholdConfigurationServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {
			
			String action = request.getParameter("btnaction");
			System.out.println("Action: "+action);
			List epmConfigMasterList = new ArrayList();

			epmConfigMasterList = EPMConfigurationMasterDAO.findDefaultConfiguration();

			HttpSession session = request.getSession(true);

			if (epmConfigMasterList != null) {
				System.out.println("Threshold Details Found....");
				session.setAttribute("EPMInfo", epmConfigMasterList);
				if(action.startsWith("Modify"))
				{
					response.sendRedirect("jsp/DefaultConfiguration.jsp");
				}
				else
				{
				response.sendRedirect("jsp/AddThreshold.jsp");
				}
			}

			else {
				System.out.println("Threshold Details Does Not Exist...");
				session.setAttribute("userCreationStatus",
						"Threshold Details Does Not Exist...");
				// response.sendRedirect("jsp/UserCreationStatus.jsp"); //Status Page
			}

		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
