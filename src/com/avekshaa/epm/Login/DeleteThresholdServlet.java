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
public class DeleteThresholdServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			// System.out.println("Invoke Delete User Servlet.......");
			String deletethreshold = request.getParameter("deletethreshold");
			System.out.println("Delete End Point :" +deletethreshold);
			String isThresholdDeleted = EPMConfigurationMasterDAO.disableThreshold(deletethreshold);
			HttpSession session = request.getSession(true);
			if (isThresholdDeleted.equals("S")) {
				System.out.println("Threshold Deleted Successfully...");
				session.setAttribute("epmConfigStatus",
						"Threshold Deleted Successfully...");
				response.sendRedirect("jsp/EPMConfigStatus.jsp");
			}
		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
