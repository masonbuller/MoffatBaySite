<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>JDBC Connector</title>
</head>
<body>
<%
    Connection con = null;
    Statement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/MoffatBay";

        con = DriverManager.getConnection(url,"root","Summertime250!");
        stmt = con.createStatement();

        stmt = con.createStatement();
    } catch (SQLException e) {
        System.out.println("Connection failed");
    }
    
    
    
 // Create Reservation table
    try {
        String sql = "DROP TABLE IF EXISTS Reservation";
        stmt.executeUpdate(sql);
    } catch (SQLException e) {
        System.out.println("Reservation table existence check failed");
    }
    
    try {
    	String sql = "CREATE TABLE Reservation (ReservationID int NOT NULL AUTO_INCREMENT, Check_In date NOT NULL, Check_Out date NOT NULL, Guest_Amt int NOT NULL, Subtotal double NOT NULL, Tax double NOT NULL, Total_Cost double NOT NULL, CustomerID int NOT NULL, RoomID int NOT NULL, PRIMARY KEY(ReservationID))";
    	stmt.executeUpdate(sql);
    } catch (SQLException e) {
    	System.out.println(e);
    }
    
    try {
    	String sql = "ALTER TABLE Reservation AUTO_INCREMENT=1000";
    	stmt.executeUpdate(sql);
    } catch (SQLException e) {
    	System.out.println("Alter Reservation table auto increment failed");
    }
    
    

    // Create Room Table
    try {
        String sql = "DROP TABLE IF EXISTS Room";
        stmt.executeUpdate(sql);
    } catch (SQLException e) {
        System.out.println("Room table existence check failed");
    }
    
    try {
    	String sql = "CREATE TABLE Room (RoomID int NOT NULL AUTO_INCREMENT, Bed_type varchar(20) NOT NULL, Cost double NOT NULL, PRIMARY KEY(RoomID));";
    	stmt.executeUpdate(sql);
    } catch (SQLException e){
    	System.out.println("Create Room table failed");
    }
    
    try {
    	String sql = "ALTER TABLE Room AUTO_INCREMENT=001";
    	stmt.executeUpdate(sql);
    } catch (SQLException e) {
    	System.out.println("Alter room table auto increment failed");
    }
    
    
    
    // Create Registration Table
    try {
        String sql = "DROP TABLE IF EXISTS Registration";
        stmt.executeUpdate(sql);
    } catch (SQLException e) {
        System.out.println("Registration table existence check failed");
    }
    
    try {
    	String sql = "CREATE TABLE Registration (CustomerID int NOT NULL AUTO_INCREMENT, FirstName varchar(50) NOT NULL, LastName varchar(50) NOT NULL, PhoneNumber varchar(20) NOT NULL, Email varchar(100) NOT NULL, Password varchar(60) NOT NULL, PRIMARY KEY(CustomerID))";
    	stmt.executeUpdate(sql);
    	
    } catch (SQLException e) {
    	System.out.println("Create Registration table failed");
    }
    
    try {
    	String sql = "ALTER TABLE Registration AUTO_INCREMENT=4000;";
    	stmt.executeUpdate(sql);
    } catch (SQLException e) {
    	System.out.println("Alter Registration table auto increment failed");
    }
    
    
    
    // Create Login Table
    try {
        String sql = "DROP TABLE IF EXISTS Login";
        stmt.executeUpdate(sql);
    } catch (SQLException e) {
        System.out.println("Login table existence check failed");
    }
    
    try {
    	String sql = "CREATE TABLE Login (Email varchar(100) NOT NULL, Password varchar(60) NOT NULL, PRIMARY KEY(Email))";
    	stmt.executeUpdate(sql);
    	
    } catch (SQLException e) {
    	System.out.println("Create login table failed");
    }
    
    
    
    
    // Add foreign key to registration table
    // Has to be done after login table is created becuase the existing Registration table is dropped and recreated letting us drop the existing login table
    // If you create login table first, it cannot drop because of the existing foreign key
    try {
    	String sql = "ALTER TABLE Registration ADD CONSTRAINT Registration_Email_FK FOREIGN KEY(Email) REFERENCES Login(Email);";
    	stmt.executeUpdate(sql);
    } catch (SQLException e) {
    	System.out.println("Alter Registration table foreign key Email failed");
    }
    
    
    
    
	// A new reservation table must be created before the registration table and the foreign key after so that the new reservation table 
	// does not have a foreign key referencing registration allowing the registration table to be dropped
    try {
    	String sql = "ALTER TABLE Reservation ADD CONSTRAINT Reservation_CustomerID_FK FOREIGN KEY(CustomerID) REFERENCES Registration(CustomerID)";
    	stmt.executeUpdate(sql);
    } catch (SQLException e) {
    	System.out.println("Alter Reservation table foreign key CustomerID failed");
    }
    
    try {
    	String sql = "ALTER TABLE Reservation ADD CONSTRAINT Reservation_RoomID_fk FOREIGN KEY(RoomID) REFERENCES Room(RoomID)";
    	stmt.executeUpdate(sql);
    } catch (SQLException e) {
    	System.out.println("Alter Reservation table foreign key RoomID failed");
    }
    
    
    
    
    try {
        String sql = "DROP TABLE IF EXISTS ContactUs";
        stmt.executeUpdate(sql);
    } catch (SQLException e) {
        System.out.println("ContactUs table existence check failed");
    }
    
    try {
    	String sql = "CREATE TABLE ContactUs (TicketID int NOT NULL AUTO_INCREMENT, Name varchar(50) NOT NULL, Email varchar(50) NOT NULL, PhoneNumber varchar(12) NOT NULL, FormText varchar(200) NOT NULL, PRIMARY KEY(TicketID))";
    	stmt.executeUpdate(sql);
    } catch (SQLException e) {
    	System.out.println("Create contact table failed");
    }
    
%>
</body>
</html>