<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
		<title>Book Reservation</title>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="/Moffat-Bay/css/registrationForm.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
	<%
		HttpSession mysession = request.getSession(false);
		if (mysession == null || mysession.getAttribute("email") == null) {
			request.setAttribute("loginStatus", "Login");
		} else {
			request.setAttribute("loginStatus", "Logged In");
		}
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<div class="container-fluid">
    		<a class="navbar-brand px-4" href="/Moffat-Bay/jsp/Landing/LandingPage.jsp">
    			<img alt="logo" src="/Moffat-Bay/images/SalishSalmon.png" width="30px" height="30px">
    			Moffat Bay
    		</a>
    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarNav">
      			<ul class="navbar-nav">
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/Landing/LandingPage.jsp">Home</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/Attractions/Attractions.jsp">Attractions</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/Reservation/BookReservation.jsp">Book Reservation</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp">Reservation Lookup</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/UserRegistration/UserRegistration.jsp">User Registration</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/AboutUs/AboutUs.jsp">About Us</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/Login/loginForm.jsp"><%= request.getAttribute("loginStatus") %></a>
        			</li>
      			</ul>
    		</div>
  		</div>
	</nav>
<%
		if (session.getAttribute("errorMessage") != null) {
			if (session.getAttribute("errorMessage") == "BookingError") {
				session.setAttribute("message", "Unable to make reservation");
			} else if (session.getAttribute("errorMessage") == "ExistingReservation") {
				session.setAttribute("message", "Existing reservation. Please call customer support for assistance with making multiple reservations");
			} else if (session.getAttribute("errorMessage") == "NegativeDays") {
				session.setAttribute("message", "End date must be at least one day after the start date.");
			} else if (session.getAttribute("errorMessage") == "DateBefore") {
				session.setAttribute("message", "Date range cannot start or end before the current date");
			} else if (session.getAttribute("errorMessage") == "YearAfter") {
				session.setAttribute("message", "Year must be before 2028. Please contact us for details on booking past this date.");
			} else {
				session.setAttribute("message", "Debugging check code");
			} 
			%>
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
  				<strong>ERROR:</strong> <%= session.getAttribute("message") %>
  				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
	<%
			session.removeAttribute("errorMessage");
		}
	%>
	<div class="container-fluid" id="container">
		<section class="row justify-content-center">
			<section class="col-12 col-sm-6 col-md-4">
				<form class="form-container" action="/Moffat-Bay/reservation" method="post">
					<div class="text-center">
						<img src="/Moffat-Bay/images/SalishSalmon.png" width="150">
					</div>
					<div class="form-group">
						<h1 class="text-center">Moffat Bay</h1>
					</div>
					<div class="form-group">
						<label class="form-label font-weight-bold">Select Start Date</label>
						<input type="date" class="form-control" name="checkin" required>
					</div>
					<div class="form-group">
						<label class="form-label font-weight-bold">Select End Date</label>
						<input type="date" class="form-control" name="checkout" required>
					</div>
					<div class="form-group">
						<label class="form-label font-weight-bold">Guests</label>
						<input type="number" class="form-control" name="guestamt" min="1" max="10" required>
					</div>
					<div class="form-group">
						<label class="form-label font-weight-bold">Room Type</label>
							<select name="room_type" id="room_type" required>
								<option value="1 King Bed">1 King Bed</option>
								<option value="1 Queen Bed">1 Queen Bed</option>
								<option value="2 Queen Beds">2 Queen Beds</option>
								<option value="2 Full Beds">2 Full Beds</option>
							</select>
					</div>
					
					<div class="button-group">
						<button type="submit" class="btn btn-outline-success">View Booking Summary</button>
					</div>
					<div class="form-footer">
          				<p> Already have a reservation? <a href="/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp">Look Up Here</a></p>
        			</div>
				</form>
			</section>
		</section>
	</div>
	<jsp:include page="/jsp/Landing/Footer.jsp" flush="true"/>
</body>
</html>