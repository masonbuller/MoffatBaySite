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
import java.text.NumberFormat;
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
@WebServlet("/reservation")
public class BookReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession(false);
			if (session == null) {
				session = req.getSession();
			}
			if (session.getAttribute("email") == null) {
				session.setAttribute("errorMessage", "ResNotLoggedIn");
				resp.sendRedirect("jsp/Login/loginForm.jsp");
			} else {
				String email = (String) session.getAttribute("email");
				String check_in = (String) req.getParameter("checkin");
				String check_out = (String) req.getParameter("checkout");
				String guest_amt = (String) req.getParameter("guestamt");
				String room_type = (String) req.getParameter("room_type");
							
				ResultSet room = SQLStatements.getRoom(room_type);
				ResultSet customer = SQLStatements.getCustomerID(email);
				if (room.next() && customer.next()) {
					int roomID = room.getInt("RoomID");
					double cost = room.getInt("Cost");
					int customerID = customer.getInt("CustomerID");
					
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					LocalDate start_date = LocalDate.parse(check_in, formatter);
					LocalDate end_date = LocalDate.parse(check_out, formatter);
					
					long days = ChronoUnit.DAYS.between(start_date, end_date);

					if (days <= 0) {
						session.setAttribute("errorMessage", "NegativeDays");
						resp.sendRedirect("jsp/Reservation/BookReservation.jsp");
					} else if (start_date.isBefore(LocalDate.now())) {
						session.setAttribute("errorMessage", "DateBefore");
						resp.sendRedirect("jsp/Reservation/BookReservation.jsp");
					} else if (start_date.isAfter(LocalDate.of(2028, 1, 1))) {
						session.setAttribute("errorMessage", "YearAfter");
						resp.sendRedirect("jsp/Reservation/BookReservation.jsp");
							
					} else {
						double subtotal = cost * days;
						subtotal = Math.round(subtotal * 100d) / 100d;
									
						double tax = subtotal * .07;
						tax = Math.round(tax * 100d) / 100d;
									
						double total = subtotal + tax;

						SimpleDateFormat checkData = new SimpleDateFormat("yyyy-MM-dd");
						Date checkInDate = checkData.parse(check_in);
						Date checkOutDate = checkData.parse(check_out);
									
						SimpleDateFormat checkDisplay = new SimpleDateFormat("EEEE, MMMM d, yyyy");
						String myDate = checkDisplay.format(checkInDate) + " - " + checkDisplay.format(checkOutDate);
									
						NumberFormat moneyformatter = NumberFormat.getCurrencyInstance();
						String subtotalF = moneyformatter.format(subtotal);
						String taxF = moneyformatter.format(tax);
						String totalF = moneyformatter.format(total);

						session.setAttribute("dateFormat", myDate);
						session.setAttribute("subtotalF", subtotalF);
						session.setAttribute("taxF", taxF);
						session.setAttribute("totalF", totalF);
						
						session.setAttribute("room_type", room_type);
						
						// For SQL Insertion
						session.setAttribute("check_in", check_in);
						session.setAttribute("check_out", check_out);
						session.setAttribute("guests", guest_amt);
						session.setAttribute("subtotal", subtotal);
						session.setAttribute("tax", tax);
						session.setAttribute("total", total);
						
						session.setAttribute("roomID", roomID);
						session.setAttribute("customerID", customerID);
						
						int id = SQLStatements.getResID();
						if (id != -1) {
							session.setAttribute("resID", id);
							resp.sendRedirect("jsp/Reservation/ReservationSummary.jsp");
						} else {
							session.setAttribute("errorMessage", "BookingError");
							resp.sendRedirect("jsp/Reservation/BookReservation.jsp");
						}
					}
					
				} else {
					session.setAttribute("errorMessage", "BookingError");
					resp.sendRedirect("jsp/Reservation/BookReservation.jsp");
				}
			} 
		} catch (IOException e) {
			System.out.println(e);		 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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