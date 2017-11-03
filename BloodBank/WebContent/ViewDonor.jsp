<%@page import="java.sql.*"%>
<%@page import="java.io.Console"%>
<%@ page language="java" import="Login.MySQLCon"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

<title>Blood Donation</title>

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
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<a href="#menu-toggle" style="background-color:black;color:white;" class="btn btn-default" id="menu-toggle">Pool
					Menu</a><br>
				<h2 align="center">All Pools</h2>	
				 <table class="table table-bordered">
		    		<thead>
				      <tr>
				        <th>Donor ID</th>
				        <th>Name</th>
				        <th>Blood Group</th>
						<th>Email</th>
						<th>Phone</th>			        
				      </tr>
			    	</thead>
			      <tbody>
				      <tr>

		<%
	        try{
		    	   
	   	     Connection con=MySQLCon.main(null);
	   	     
	   	     String username=(String) session.getAttribute("uname");
	   	  	 System.out.println(username+" username");
	   		 String sql="SELECT * FROM donor;";
		     PreparedStatement p=con.prepareStatement(sql);
	   	    
		     ResultSet r=p.executeQuery();
	 	    
			     while(r.next()){
			    	 out.println("<td>"+r.getString(1)+"</td>");
			    	 out.println("<td>"+r.getString(2)+"</td>");
		 	    	 out.println("<td>"+r.getString(3)+"</td>");
		 	    	 out.println("<td>"+r.getString(4)+"</td>");
		 	    	 out.println("<td>"+r.getString(5)+"</td></tr>");
			     } 
	        } catch(NullPointerException n) {
		   	   n.printStackTrace();
		   	  
		      } catch (Exception e) {
		   	  
				// TODO: handle exception
		   	   e.printStackTrace();
			}
	     
        %>
  
			    </tbody>
		  </table>	
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

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