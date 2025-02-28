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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import com.password4j.*;

/**
 * Servlet implementation class BookReservation
 */
@WebServlet("/reservationSummary")
public class ReservationSummary extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationSummary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		try {
			if (session == null) {
				resp.sendRedirect("jsp/Reservation/BookReservationError.jsp");
			} else {
				int customerID = (int) session.getAttribute("customerID");
				ResultSet reservationCheck = SQLStatements.checkReservation(customerID);
				if (reservationCheck.next()) {
					session.setAttribute("errorMessage", "ExistingReservation");
					resp.sendRedirect("jsp/Reservation/BookReservationError.jsp");
				} else {
					String check_in = (String) session.getAttribute("check_in");
					String check_out = (String) session.getAttribute("check_out");
					String guests = (String) session.getAttribute("guests");
					int guestNum = Integer.parseInt(guests);
					double subtotal = (double) session.getAttribute("subtotal");
					double tax = (double) session.getAttribute("tax");
					double total = (double) session.getAttribute("total");
					
					int roomID = (int) session.getAttribute("roomID");
					
					SQLStatements.bookReservation(check_in, check_out, guestNum, subtotal, tax, total, customerID, roomID);
					session.setAttribute("landingMessage", "bookingSuccess");
					resp.sendRedirect("jsp/Landing/LandingPage.jsp");
				}
			}
		} catch (IOException e) {
			System.out.println(e);
			session.setAttribute("errorMessage", "BookingError");
			resp.sendRedirect("jsp/Reservation/BookReservation.jsp");
		} catch (Exception e){
			System.out.println(e);
			session.setAttribute("errorMessage", "BookingError");
			resp.sendRedirect("jsp/Reservation/BookReservation.jsp");
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