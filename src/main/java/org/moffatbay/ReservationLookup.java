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
import java.util.Date;

import org.moffatbay.SQLStatements;


@WebServlet("/lookup")
public class ReservationLookup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationLookup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		try {
			if (session == null) {
				session = request.getSession();
			}
			String reservationID = (String) request.getParameter("reservationID");
			String email = (String) request.getParameter("email");
			if (reservationID != "") {
				int resID = Integer.parseInt(reservationID);
				ResultSet reservation = SQLStatements.getFromReservationID(resID);
				if (reservation.next()) {
					String check_in = reservation.getString("Check_In");
					String check_out = reservation.getString("Check_Out");
					int guests = reservation.getInt("Guest_Amt");
					double subtotal = reservation.getDouble("Subtotal");
					double tax = reservation.getDouble("Tax");
					double total = reservation.getDouble("Total_Cost");
					int roomID = reservation.getInt("RoomID");
					ResultSet roomType = SQLStatements.getRoomType(roomID);
					if (roomType.next()) {
						String room = roomType.getString("Bed_type");
						SimpleDateFormat checkData = new SimpleDateFormat("yyyy-MM-dd");
						Date checkInDate = checkData.parse(check_in);
						Date checkOutDate = checkData.parse(check_out);
									
						SimpleDateFormat checkDisplay = new SimpleDateFormat("EEEE, MMMM d, yyyy");
						String myDate = checkDisplay.format(checkInDate) + " - " + checkDisplay.format(checkOutDate);
									
						NumberFormat moneyformatter = NumberFormat.getCurrencyInstance();
						String subtotalF = moneyformatter.format(subtotal);
						String taxF = moneyformatter.format(tax);
						String totalF = moneyformatter.format(total);
						
						session.setAttribute("resID", reservationID);
						session.setAttribute("dates", myDate);
						session.setAttribute("room", room);
						session.setAttribute("guests", guests);
						session.setAttribute("subtotal", subtotalF);
						session.setAttribute("tax", taxF);
						session.setAttribute("total", totalF);
						response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/LookupSummary.jsp");
					} else {
						session.setAttribute("errorMessage", "NoReservation");
						response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp");
					}
				} else {
					session.setAttribute("errorMessage", "NoReservation");
					response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp");
				}
			} else if (email != "") {
				ResultSet customer = SQLStatements.getCustomerID(email);
				if (customer.next()) {
					int customerID = customer.getInt("CustomerID");
					ResultSet reservation2 = SQLStatements.checkReservation(customerID);
					if (reservation2.next()) {
						ResultSet resID = SQLStatements.findReservationID(customerID);
						if (resID.next()) {
							int id = resID.getInt("ReservationID");
							String check_in = reservation2.getString("Check_In");
							String check_out = reservation2.getString("Check_Out");
							int guests = reservation2.getInt("Guest_Amt");
							double subtotal = reservation2.getDouble("Subtotal");
							double tax = reservation2.getDouble("Tax");
							double total = reservation2.getDouble("Total_Cost");
							int roomID = reservation2.getInt("RoomID");
							ResultSet roomType = SQLStatements.getRoomType(roomID);
							if (roomType.next()) {
								String room = roomType.getString("Bed_type");
								SimpleDateFormat checkData = new SimpleDateFormat("yyyy-MM-dd");
								Date checkInDate = checkData.parse(check_in);
								Date checkOutDate = checkData.parse(check_out);
											
								SimpleDateFormat checkDisplay = new SimpleDateFormat("EEEE, MMMM d, yyyy");
								String myDate = checkDisplay.format(checkInDate) + " - " + checkDisplay.format(checkOutDate);
											
								NumberFormat moneyformatter = NumberFormat.getCurrencyInstance();
								String subtotalF = moneyformatter.format(subtotal);
								String taxF = moneyformatter.format(tax);
								String totalF = moneyformatter.format(total);
								
								session.setAttribute("resID", id);
								session.setAttribute("dates", myDate);
								session.setAttribute("room", room);
								session.setAttribute("guests", guests);
								session.setAttribute("subtotal", subtotalF);
								session.setAttribute("tax", taxF);
								session.setAttribute("total", totalF);
								
								response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/LookupSummary.jsp");
								
							} else {
								session.setAttribute("errorMessage", "NoReservation");
								response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp");
							}
						} else {
							session.setAttribute("errorMessage", "SystemError");
							response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp");
						}
					} else {
						session.setAttribute("errorMessage", "NoReservation");
						response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp");
					}
				} else {
					session.setAttribute("errorMessage", "SystemError");
					response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp");
				}
			} else {
				session.setAttribute("errorMessage", "BlankFields");
				response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp");
			}
		} catch (SQLException e) {
			session.setAttribute("errorMessage", "SystemError");
			response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp");
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			session.setAttribute("errorMessage", "SystemError");
			response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp");
			System.out.println(e);
		} catch (ParseException e) {
			session.setAttribute("errorMessage", "SystemError");
			response.sendRedirect("/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp");
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
