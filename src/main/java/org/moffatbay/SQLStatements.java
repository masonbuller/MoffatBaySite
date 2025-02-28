package org.moffatbay;

import java.io.Serializable;
import java.sql.*;
import com.password4j.*;

public class SQLStatements implements Serializable{
	
	static Connection connection = null;
    static Statement statement = null;
    static ResultSet resultSet = null;
    
	public static ResultSet checkReservation(int customerID) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
			PreparedStatement statement = connection.prepareStatement("SELECT * from Reservation WHERE CustomerID = ?");
			statement.setInt(1, customerID);
			resultSet = statement.executeQuery();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		
		return resultSet;
	}
	
	public static ResultSet getFromReservationID(int reservationID) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
			PreparedStatement statement = connection.prepareStatement("SELECT * from Reservation WHERE ReservationID = ?");
			statement.setInt(1, reservationID);
			resultSet = statement.executeQuery();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		
		return resultSet;
	}
	
	public static ResultSet checkLogin(String email) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
	        PreparedStatement statement = connection.prepareStatement("SELECT * from Login WHERE email = ?");
	        statement.setString(1, email);
	        resultSet = statement.executeQuery();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
        
        return resultSet;
	}
	
	public static void registerLogin(String email, String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
	        PreparedStatement statement = connection.prepareStatement("INSERT INTO Login(Email, Password) VALUES(?, ?)");
	        statement.setString(1, email);
	        statement.setString(2, password);
	        statement.executeUpdate();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
	}
	
	public static void registerUser(String firstName, String lastName, String phone, String email, String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
	        PreparedStatement statement = connection.prepareStatement("INSERT INTO Registration(FirstName, LastName, PhoneNumber, Email, Password) VALUES(?, ?, ?, ?, ?)");
	        statement.setString(1, firstName);
	        statement.setString(2, lastName);
	        statement.setString(3, phone);
	        statement.setString(4, email);
	        statement.setString(5, password);
	        statement.executeUpdate();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
	}
	
	public static void bookReservation(String check_in, String check_out, int guest_amt, double subtotal, double tax, double total, int customerID, int roomID) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
	        PreparedStatement statement = connection.prepareStatement("INSERT INTO Reservation(Check_In, Check_Out, Guest_Amt, Subtotal, Tax, Total_Cost, CustomerID, RoomID) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
	        statement.setString(1, check_in);
	        statement.setString(2, check_out);
	        statement.setInt(3, guest_amt);
	        statement.setDouble(4, subtotal);
	        statement.setDouble(5, tax);
	        statement.setDouble(6, total);
	        statement.setInt(7, customerID);
	        statement.setInt(8, roomID);
	        statement.executeUpdate();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
	}
	
	public static void contactForm(String name, String email, String phone, String text) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
	        PreparedStatement statement = connection.prepareStatement("INSERT INTO ContactUs(Name, Email, PhoneNumber, FormText) VALUES(?, ?, ?, ?)");
	        statement.setString(1, name);
	        statement.setString(2, email);
	        statement.setString(3, phone);
	        statement.setString(4, text);
	        statement.executeUpdate();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
	}
	
	public static ResultSet getRoom(String roomType) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
	        PreparedStatement statement = connection.prepareStatement("SELECT * from Room WHERE Bed_type = ?");
	        statement.setString(1, roomType);
	        resultSet = statement.executeQuery();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
        
        return resultSet;
	}
	
	public static int getResID() throws ClassNotFoundException, SQLException {
		int id = -1;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
	        PreparedStatement statement = connection.prepareStatement("SELECT MAX(ReservationID) as resID FROM Reservation");
	        resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	        	id = resultSet.getInt("resID");
	        	id++;
	        }
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
        return id;
	}
	
	public static ResultSet getRoomType(int roomID) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
	        PreparedStatement statement = connection.prepareStatement("SELECT * from Room WHERE RoomID = ?");
	        statement.setInt(1, roomID);
	        resultSet = statement.executeQuery();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
        
        return resultSet;
	}
	
	public static ResultSet getCustomerID(String email) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
	        PreparedStatement statement = connection.prepareStatement("SELECT CustomerID from Registration WHERE email = ?");
	        statement.setString(1, email);
	        resultSet = statement.executeQuery();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
        
        return resultSet;
	}
	
	public static ResultSet findReservationID(int customerID) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBay","root","Summertime250!");
	        PreparedStatement statement = connection.prepareStatement("SELECT ReservationID from Reservation WHERE CustomerID = ?");
	        statement.setInt(1, customerID);
	        resultSet = statement.executeQuery();
		} catch (SQLException e){
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
        
        return resultSet;
	}
	
	
	public static void closeConnection() throws SQLException {
        try {
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}		