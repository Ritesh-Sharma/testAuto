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
public class CreateEndPointServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			System.out.println("Invoke Create End Point Servlet.......");
			EndPointMasterBean endPointMasterBean = new EndPointMasterBean();
			
			int epid = Integer.parseInt(request.getParameter("epid"));
			int port = Integer.parseInt(request.getParameter("port"));
			int type = Integer.parseInt(request.getParameter("type"));
			int status = Integer.parseInt(request.getParameter("status"));
			
			endPointMasterBean.setEpid(epid);
			endPointMasterBean.setEpdesc(request.getParameter("epdesc"));
			endPointMasterBean.setIpaddress(request.getParameter("ipaddress"));
			endPointMasterBean.setPort(port);
			endPointMasterBean.setType(type);
			endPointMasterBean.setStatus(status);
			
			endPointMasterBean = EndPointMasterDAO.createEndPoint(endPointMasterBean);

			HttpSession session = request.getSession(true);
			if (endPointMasterBean.isValid()) {
				System.out.println("End Point Created Successfully...");
				session.setAttribute("endPointStatus",
						"End Point Created Successfully...");
				// response.sendRedirect("jsp/UserCreationStatus.jsp");
				// //logged-in page
			}

			else {
				System.out.println("End Point Already Exist...");
				session.setAttribute("endPointStatus",
						"End Point Already Exist...");
				// response.sendRedirect("jsp/UserCreationStatus.jsp"); //Status
				// Page
			}
			response.sendRedirect("jsp/EndPointStatus.jsp"); // Status Page
		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
