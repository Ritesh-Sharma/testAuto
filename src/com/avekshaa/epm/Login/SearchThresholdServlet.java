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
public class SearchThresholdServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			// System.out.println("Invoke Search User Servlet.......");
			List epmConfigurationDetails = new ArrayList();
			EPMConfigurationBean epmConfigurationBean = new EPMConfigurationBean();
			epmConfigurationBean.setThresholdinteraction(request.getParameter("tid"));
			epmConfigurationDetails = EPMConfigurationMasterDAO.findThreshold(epmConfigurationBean);

			HttpSession session = request.getSession(true);

			if (epmConfigurationDetails != null && epmConfigurationDetails.size() > 0) {
				System.out.println("Threshold Details Found....");
				session.setAttribute("thresholdInfo", epmConfigurationDetails);
				response.sendRedirect("jsp/SelectedThresholdListing.jsp");
			}

			else {
				System.out.println("Threshold Does Not Exist...");
				session.setAttribute("epmConfigStatus",
						"Threshold Does Not Exist...");
				response.sendRedirect("jsp/EPMConfigStatus.jsp");
			}

		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
