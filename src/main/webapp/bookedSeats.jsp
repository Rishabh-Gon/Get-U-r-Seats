<%@ page import="pojo.Ticket"%>
<%@ page import="pojo.User"%>
<%@ page import="pojo.Seat"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Bookings</title>
<link rel="stylesheet" href="css/bookedSeats.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setHeader("Expires", "0"); // Proxies

	User user = (User) session.getAttribute("user");
	String username = user.getUsername();

	if (username == null) {
		response.sendRedirect("index.jsp");
	}
	%>
	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="home.jsp"><h3>Movie Hall</h3></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="MovieServlet">Browse
							Movies</a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Main Content: Movie List -->
	<div class="container my-4">
		<h2 class="text-center mb-4">Booked Shows</h2>
		<%
		List<Ticket> Tickets = (List<Ticket>) request.getAttribute("Tickets"); // Ticket list passed from servlet
		System.out.println("Tickets : "+Tickets);
		if (Tickets.size() != 0) {
			for (Ticket tickets : Tickets) {
		%>
		<div class="row">


			<div class="col-md-4 col-lg-3 mb-4">
				<div class="movie-card">
					<img src="img/<%=tickets.getMovie().getId()%>.png"
						alt="<%=tickets.getMovie().getTitle()%>" class="movie-poster">
					<div class="movie-details">
						<h5><%=tickets.getMovie().getTitle()%></h5>
						<p class="text-muted">
							Genre:
							<%=tickets.getMovie().getGenre()%></p>
						<p>
							Rating:
							<%=tickets.getMovie().getRating()%>
							/ 10
						</p>
						<p>
							Release Year:
							<%=tickets.getMovie().getReleaseYear()%></p>
						<p>
							Your Seats:
							<%
						for (Seat seats : tickets.getSeats()) {
							out.print(seats.getRowLetter() + seats.getSeatNumber() + " ");
						}
						%>

						</p>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		} else {
		out.print("<div class='text-center'><h4>Seems like you don't have any booked shows at the moment...</br><a href='MovieServlet' class='btn-primary'>Continue Booking?</a></h4></div>");
		}
		%>

	</div>

	<!-- Footer -->
	<footer>
		<p>© 2024 Get U'r Seats || Terms & Conditions || Privacy Policy</p>
	</footer>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>