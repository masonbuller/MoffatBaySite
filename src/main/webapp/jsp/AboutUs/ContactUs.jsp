<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>Contact Us</title>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="/Moffat-Bay/css/ContactUs.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
	<%
		if (session == null || session.getAttribute("email") == null) {
			request.setAttribute("loginStatus", "Login");
		} else {
			request.setAttribute("loginStatus", "Logged In");
		}
	%>
	<nav class="navbar navbar-expand-xl navbar-light bg-light">
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
          				<a class="nav-link" href="/Moffat-Bay/jsp/Reservation/LodgingOptions.jsp">Book Reservation</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp">Reservation Lookup</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/AboutUs/ContactUs.jsp">Contact Us</a>
        			</li>
        			<%
        				if (request.getAttribute("loginStatus") == "Logged In") {
        			%>
        				<li class="nav-item dropdown">
          					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				<%= request.getAttribute("loginStatus") %>
          					</a>
          						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          							<form action="/Moffat-Bay/account" method="post">
            							<li><button class="dropdown-item" type="submit">My Account</button></li>
            						</form>
          							<form action="/Moffat-Bay/logout" method="post">
            							<li><button class="dropdown-item" type="submit">Log Out</button></li>
            						</form>
          						</ul>
        				</li>
        			<% 
        				} else {
        			%>
        				<li class="nav-item px-2">
          					<a class="nav-link" href="/Moffat-Bay/jsp/Login/loginForm.jsp"><%= request.getAttribute("loginStatus") %></a>
        				</li>
        			<%
        				}
        			%>
      			</ul>
    		</div>
  		</div>
	</nav>
	<div class="container-fluid" id="containerHeader">
		<section class="row justify-content-center">
			<section class="text-center" id="header">
				<h1>Questions?</h1>
				<h3>Contact us by calling, emailing, or fill out our form to send us a message!</h3>
			</section>
		</section>
	</div>
	<div class="container-fluid" id="container1">
		<section class="row justify-content-center">
			<section class="col-12" id="inline">
				<section class="text-center" id="grouped">
					<form class="form-container" method="post" action="/Moffat-Bay/contact">
						<div class="form-group col-md-4 rounded" id="section1">
							<p class="message">Send us a message and we will get back to you shortly.</p>
							<div class="form-group">
								<label class="form-label font-weight-bold">Full Name</label> 
								<input type="text" class="form-control" name="fullname" id="fullname" required>
							</div>
							<div class="form-group">
								<label class="form-label font-weight-bold">Email Address</label>
								<input type="text" class="form-control" name="email" pattern="^(?=.{1,100}$)[a-zA-Z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" oninvalid="this.setCustomValidity('Please match the format example@domain.com')" oninput="this.setCustomValidity('')" required>
							</div>
							<div class="form-group">
								<label class="form-label font-weight-bold">Phone Number</label> 
								<input type="tel" class="form-control" name="phone" id="phone" pattern="^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" required>
							</div>
							<div class="form-group">
								<label class="form-label font-weight-bold">Message</label> 
								<textarea class="form-control" name="message" id="message" rows="3" required></textarea>
							</div>
							<div class="button-group" id="formbutton">
								<button type="submit" class="btn btn-outline-success">Submit</button>
							</div>
						</div>
						<div class="form-group col-md-4 rounded" id="section2">
							<div class="email-group">
								<label class="title">Email</label>
								<label>moffat-bay@lodging.org</label>
							</div>
							<div class="phone-group">
								<label class="title">Phone</label>
								<label>435-549-2393</label>
							</div>
							<div class="address-group">
								<label class="title">Address</label>
								<label>2468 W Bounty Rd, Lake Park MI, 48329</label>
							</div>
						</div>
					</form>
				</section>
			</section>
		</section>
	</div>
	<jsp:include page="/jsp/Landing/Footer.jsp" flush="true"/>
</body>
</html>