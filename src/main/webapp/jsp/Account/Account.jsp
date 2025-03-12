<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Account Summary</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="/Moffat-Bay/css/Account.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
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
				<h1>Account Summary</h1>
			</section>
		</section>
	</div>
	<div class="container-fluid" id="containerMain">
		<section class="row justify-content-center">
			<section id="inline">
				<section class="col-md-3" id="menu">
					<div class="section">
						<a href="/Moffat-Bay/jsp/Account/Account.jsp">My Account</a>
					</div>
					<div class="section">
						<a href="/Moffat-Bay/jsp/Account/AccountRes.jsp">Reservation</a>
					</div>
				</section>
				<section class="col-md-3" id="grouped">
					<div class="infoHeader">
						<h3>Customer Info</h3>
					</div>
					<div class="section">
						<i class="bi bi-person h4"></i>
						<label class="info"><%= session.getAttribute("fname") %> <%=session.getAttribute("lname") %></label>
					</div>
					<div class="section">
						<i class="bi bi-envelope h4"></i>
						<label class="info"><%= session.getAttribute("email") %></label>
					</div>
					<div class="section">
						<i class="bi bi-telephone h4"></i>
						<label class="info"><%= session.getAttribute("phone") %></label>
					</div>
				</section>
			</section>
		</section>
	</div>
</body>
</html>