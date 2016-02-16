package com.avekshaa.epm.Login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class CreateThresholdServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			int responseTime = Integer.parseInt(request.getParameter("responsetime"));
			int defaultResponseTime = Integer.parseInt(request.getParameter("defaultresponsetime"));
			int timeWindowLength = Integer.parseInt(request.getParameter("timewindowlength"));
			int noOfSamples = Integer.parseInt(request.getParameter("noofsamples"));
			int enablEepmEngine = Integer.parseInt(request.getParameter("enableepmengine"));
			//int status = Integer.parseInt(request.getParameter("status"));
			
			System.out.println("Invoke Create Threshold Servlet.......");
			EPMConfigurationBean epmConfigurationBean = new EPMConfigurationBean();
			epmConfigurationBean.setThresholdinteraction(request.getParameter("thresholdinteraction"));
			epmConfigurationBean.setResponsetime(responseTime);
			epmConfigurationBean.setDefaultresponsetime(defaultResponseTime);
			epmConfigurationBean.setAveragecreation(request.getParameter("averagecreation"));
			epmConfigurationBean.setTimewindowlength(timeWindowLength);
			epmConfigurationBean.setNoofsamples(noOfSamples);
			epmConfigurationBean.setEnableepmengine(enablEepmEngine);
			//epmConfigurationBean.setStatus(status);
			
			epmConfigurationBean = EPMConfigurationMasterDAO.createThreshold(epmConfigurationBean);

			HttpSession session = request.getSession(true);
			if (epmConfigurationBean.isValid()) {
				System.out.println("Threshold Created Successfully...");
				session.setAttribute("epmConfigStatus",
						"Threshold Created Successfully...");
				// response.sendRedirect("jsp/UserCreationStatus.jsp");
				// //logged-in page
			}

			else {
				System.out.println("Threshold Already Exist...");
				session.setAttribute("epmConfigStatus",
						"Threshold Already Exist...");
				// response.sendRedirect("jsp/UserCreationStatus.jsp"); //Status
				// Page
			}
			response.sendRedirect("jsp/EPMConfigStatus.jsp"); // Status Page
		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
