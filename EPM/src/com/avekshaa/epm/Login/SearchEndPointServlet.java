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
public class SearchEndPointServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			// System.out.println("Invoke Search User Servlet.......");
			List endPointDetails = new ArrayList();

			UserMasterBean userMasterBean = new UserMasterBean();
			EndPointMasterBean endPointMasterBean = new EndPointMasterBean();

			int epid = Integer.parseInt(request.getParameter("ep"));
			
			endPointMasterBean.setEpid(epid);
			
			endPointDetails = EndPointMasterDAO.findSelectedEndPoint(endPointMasterBean);

			HttpSession session = request.getSession(true);

			if (endPointDetails != null && endPointDetails.size() > 0) {
				System.out.println("End Point Details Found....");
				session.setAttribute("EndPointInfo", endPointDetails);
				response.sendRedirect("jsp/SelectedEndPointListing.jsp");
			}

			else {
				System.out.println("End Point Does Not Exist...");
				session.setAttribute("endPointStatus",
						"End Point Does Not Exist...");
				response.sendRedirect("jsp/EndPointStatus.jsp");
			}

		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
