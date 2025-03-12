package org.moffatbay;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

/**
 * Servlet implementation class AccountSummary
 */
@WebServlet("/account")
public class AccountSummary extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AccountSummary() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		try {
			if (session == null || session.getAttribute("email") == null) {
				session = request.getSession();
				session.setAttribute("landingErrorMessage", "accountSummary");
				response.sendRedirect("jsp/Landing/LandingPage.jsp");
			} else {
				String email = (String) session.getAttribute("email");
				ResultSet customerInfo = SQLStatements.getRegistrationInfo(email);
				if (customerInfo.next()) {
					String fname = customerInfo.getString("FirstName");
					String lname = customerInfo.getString("LastName");
					String pnum = customerInfo.getString("PhoneNumber");
					int custID = customerInfo.getInt("CustomerID");
					
					session.setAttribute("fname", fname);
					session.setAttribute("lname", lname);
					session.setAttribute("phone", pnum);
					ResultSet reser = SQLStatements.checkReservation(custID);
					
					if (reser.next()) {
						int reservationID = reser.getInt("ReservationID");
						String check_in = reser.getString("Check_In");
						String check_out = reser.getString("Check_Out");
						int guests = reser.getInt("Guest_Amt");
						int roomID = reser.getInt("RoomID");
						double total = reser.getDouble("Total_Cost");
						ResultSet roomType = SQLStatements.getRoomType(roomID);
						if (roomType.next()) {
							String room = roomType.getString("Bed_type");
							SimpleDateFormat checkData = new SimpleDateFormat("yyyy-MM-dd");
							Date checkInDate = checkData.parse(check_in);
							Date checkOutDate = checkData.parse(check_out);
										
							SimpleDateFormat checkDisplay = new SimpleDateFormat("EEEE, MMMM d, yyyy");
							String myDate = checkDisplay.format(checkInDate) + " - " + checkDisplay.format(checkOutDate);
							
							NumberFormat moneyformatter = NumberFormat.getCurrencyInstance();
							String totalF = moneyformatter.format(total);
							
							session.setAttribute("resID", reservationID);
							session.setAttribute("dates", myDate);
							session.setAttribute("room", room);
							session.setAttribute("guests", guests);
							session.setAttribute("total", total);
							response.sendRedirect("jsp/Account/Account.jsp");
						}
					} else {
						session.setAttribute("Reservation", "False");
						response.sendRedirect("jsp/Account/Account.jsp");
					}
				}
			}
		} catch (SQLException e) {
			session.setAttribute("landingErrorMessage", "accountSummary");
			response.sendRedirect("jsp/Landing/LandingPage.jsp");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			session.setAttribute("landingErrorMessage", "accountSummary");
			response.sendRedirect("jsp/Landing/LandingPage.jsp");
			e.printStackTrace();
		} catch (ParseException e) {
			session.setAttribute("landingErrorMessage", "accountSummary");
			response.sendRedirect("jsp/Landing/LandingPage.jsp");
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
