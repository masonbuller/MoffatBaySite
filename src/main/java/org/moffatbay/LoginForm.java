package org.moffatbay;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import org.moffatbay.*;
import com.password4j.*;

/**
 * Servlet implementation class LoginForm
 */
@WebServlet("/login")
public class LoginForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			session = req.getSession();
		}
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		try {
			ResultSet rs = SQLStatements.checkLogin(email);
			if (!rs.next()) {
				session.setAttribute("errorMessage", "LoginIncorrect");
				resp.sendRedirect("jsp/Login/loginForm.jsp");
			} else {
				String passwordData = rs.getString("password");
				boolean verification = Password.check(password, passwordData).withBcrypt();
				if (verification) {
					session.setAttribute("email", email);
					session.setAttribute("landingMessage", "loginSuccess");
					resp.sendRedirect("jsp/Landing/LandingPage.jsp");
				} else {
					session.setAttribute("errorMessage", "LoginIncorrect");
					resp.sendRedirect("jsp/Login/loginForm.jsp");
				}
			} 
		} catch (SQLException e) {
			System.out.println(e);
			session.setAttribute("errorMessage", "SystemError");
			resp.sendRedirect("jsp/Login/loginForm.jsp");
		} catch (ClassNotFoundException e) {
			System.out.println(e);
			session.setAttribute("errorMessage", "SystemError");
			resp.sendRedirect("jsp/Login/loginForm.jsp");
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}