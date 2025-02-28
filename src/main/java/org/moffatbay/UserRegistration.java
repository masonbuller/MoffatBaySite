package org.moffatbay;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.password4j.*;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/registration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistration() {
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
		try {
			ResultSet rs = SQLStatements.checkLogin(email);
			if (rs.next()) {
				session.setAttribute("errorMessage", "ExistingEmail");
				resp.sendRedirect("jsp/UserRegistration/UserRegistration.jsp");
			} else {
				String firstName = req.getParameter("firstname");
				String lastName = req.getParameter("lastname");
				String phone = req.getParameter("phone");
				String password = req.getParameter("password");
				Hash hash = Password.hash(password).withBcrypt();
				String hashed = hash.getResult();
				SQLStatements.registerLogin(email, hashed);
				SQLStatements.registerUser(firstName, lastName, phone, email, hashed);
				session.setAttribute("loginSuccess", "Success");
				resp.sendRedirect("jsp/Login/loginForm.jsp");
			} 
		} catch (SQLException e) {
			System.out.println(e);
			session.setAttribute("errorMessage", "SystemError");
			resp.sendRedirect("jsp/UserRegistration/UserRegistration.jsp");
		} catch (ClassNotFoundException e) {
			System.out.println(e);
			session.setAttribute("errorMessage", "SystemError");
			resp.sendRedirect("jsp/UserRegistration/UserRegistration.jsp");
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