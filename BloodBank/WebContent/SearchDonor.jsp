<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="Login.MySQLCon"%>
<% if(session.getAttribute("uname")!=null)
{
    

%>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">

<title>Search Donor</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/component.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>


<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/simple-sidebar.css" rel="stylesheet">


</head>

<body>

	<div id="wrapper">

		 <!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a id="Profile"
					href="<%=application.getContextPath()%>/Profile.jsp">Profile</a></li>
				<li><a id="viewDonorMenu"
					href="<%=application.getContextPath()%>/ViewDonor.jsp">View Donors</a></li>
				<li><a id="searchDonorMenu"
					href="<%=application.getContextPath()%>/SearchDonor.jsp">Search Donor</a></li>
				<li><a id="registerDonorMenu"
					href="<%=application.getContextPath()%>/RegisterDonor.jsp">Register as Donor</a>
				</li>
				<li><a id="registerRecipient"
					href="<%=application.getContextPath()%>/RegisterRecipient.jsp">Register as Recipient</a></li>
				<li><a id="logout"
					href="<%=application.getContextPath()%>/Logout.jsp">Logout</a></li>
			</ul>
		</div>
        <!-- /#sidebar-wrapper -->
        
		 <!-- Page Content -->
		<div id="page-content-wrapper">
		 <div class="container-fluid">
			<div class="container">
				<a href="#menu-toggle" style="background-color:black;color:white;" class="btn btn-default" id="menu-toggle">Pool
					Menu</a><br>	
				<form class="form-horizontal" id="contact-form" role="form"
					action="<%=application.getContextPath() %>/SearchDonor" method="post">
					<h2 align="center">Search Donors</h2>
					
						<div class="form-group">
							<label class="col-sm-3 control-label" for="bloodgroup">Blood Group</label>
							<div class="col-sm-7">
								<select class="selectpicker form-control"
									
									id="bloodgroup" required="true" name="bloodgroup">
									<option style="cursor: pointer;">Select Blood Group</option>
									<%
										try {

											int count = 0, flag = 0;
											Connection con = MySQLCon.main(null);
											//String username=(String) session.getAttribute("uname");
											String sql2 = "SELECT distinct bloodgroup FROM test.donor ;";
											PreparedStatement p2 = con.prepareStatement(sql2);
											ResultSet r1 = p2.executeQuery();
											while (r1.next()) {
									%>
									<option style="cursor: pointer;" value =<%=r1.getString(1)%>><%=r1.getString(1)%></option>
									<%
										}

										} catch (Exception e) {
											e.printStackTrace();
										}
									%>

								</select>

							</div>
						</div>
						
						<div class="form-group">
						<div class="col-sm-7 col-sm-offset-3">
							<button type="submit" class="btn btn-primary btn-block">Search</button>
						</div>
					</div>
				</form>
				<!-- /form -->

				<table>
					<th> Donor ID </th>
					<th> Name </th>
					<th> Blood Group </th>
					<tr>
					<td></td>
					<td></td>
					<td></td>
					</tr>
				</table>
			</div>
			<!-- ./container -->
			</div>
		</div>
		<!-- /#page-content-wrapper -->	

	</div>
	<!-- /#wrapper -->

	

	<!-- Menu Toggle Script -->
	<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
<% }
else
{
     
      response.sendRedirect("index.jsp");

 
}
%>