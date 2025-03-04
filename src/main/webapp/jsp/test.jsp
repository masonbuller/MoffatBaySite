<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Landing Page</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="/Moffat-Bay/css/test.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
	<%
		if (session == null || session.getAttribute("email") == null) {
			request.setAttribute("loginStatus", "Login");
		} else {
			request.setAttribute("loginStatus", "Logged In");
		}
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand px-4"
				href="/Moffat-Bay/jsp/Landing/LandingPage.jsp"> <img alt="logo"
				src="/Moffat-Bay/images/SalishSalmon.png" width="30px" height="30px">
				Moffat Bay
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item px-2"><a class="nav-link"
						href="/Moffat-Bay/jsp/Landing/LandingPage.jsp">Home</a></li>
					<li class="nav-item px-2"><a class="nav-link"
						href="/Moffat-Bay/jsp/Attractions/Attractions.jsp">Attractions</a>
					</li>
					<li class="nav-item px-2"><a class="nav-link"
						href="/Moffat-Bay/jsp/Reservation/BookReservation.jsp">Book&nbsp;Reservation</a>
					</li>
					<li class="nav-item px-2"><a class="nav-link"
						href="/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp">Reservation&nbsp;Lookup</a>
					</li>
					<li class="nav-item px-2"><a class="nav-link"
						href="/Moffat-Bay/jsp/AboutUs/AboutUs.jsp">About&nbsp;Us</a></li>
					<%
        				if (request.getAttribute("loginStatus") == "Logged In") {
        			%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <%= request.getAttribute("loginStatus") %>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<form action="/Moffat-Bay/logout" method="post">
								<li><button class="dropdown-item" type="submit">Log
										Out</button></li>
							</form>
						</ul></li>
					<% 
        				} else {
        			%>
					<li class="nav-item px-2"><a class="nav-link"
						href="/Moffat-Bay/jsp/Login/loginForm.jsp"><%= request.getAttribute("loginStatus") %></a>
					</li>
					<%
        				}
        			%>
				</ul>
			</div>
		</div>
	</nav>
	<%
		if (session.getAttribute("landingMessage") != null) {
			if (session.getAttribute("landingMessage") == "loginSuccess") {
				session.setAttribute("message", "Successfully logged in");
			} else if (session.getAttribute("landingMessage") == "bookingSuccess") {
				session.setAttribute("message", "Reservation booked successfully");
			} else if (session.getAttribute("landingMessage") == "contactSuccess") {
				session.setAttribute("message", "Contact request sent successfully. Someone will be in touch with you shortly");
			} else if (session.getAttribute("landingMessage") == "logoutSuccess") {
				session.setAttribute("message", "Successfully logged out.");
			}
			
			%>
	<div class="alert alert-success alert-dismissible fade show"
		role="alert">
		<strong>Success!</strong>
		<%= session.getAttribute("message") %>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
		}
		
		session.removeAttribute("landingMessage");
	%>
	<div class="container-fluid" id="container2">
		<section class="row justify-content-center">
			<section id="inline">
				<section class="col-md-6 text-center" id="group2">
					<div class="image" id="sections">
						<img alt="logo" src="/Moffat-Bay/images/oneking.jpg" height="400px">
					</div>
					<div class="col-md-6 text-center" id="sections">
						<p>Descript</p>
					</div>
				</section>
			</section>
		</section>
	</div>
</body>
</html>