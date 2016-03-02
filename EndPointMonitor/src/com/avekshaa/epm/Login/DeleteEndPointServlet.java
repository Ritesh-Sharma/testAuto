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
public class DeleteEndPointServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			// System.out.println("Invoke Delete User Servlet.......");
			int deleteEpId = Integer.parseInt(request.getParameter("deleteendpoint"));
			System.out.println("Delete End Point :" +deleteEpId);
			String isEndPointDeleted = EndPointMasterDAO.disableEndPoint(deleteEpId);
			HttpSession session = request.getSession(true);
			if (isEndPointDeleted.equals("S")) {
				System.out.println("End Point Deleted Successfully...");
				session.setAttribute("endPointStatus",
						"End Point Deleted Successfully...");
				response.sendRedirect("jsp/EndPointStatus.jsp");
			}
		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
