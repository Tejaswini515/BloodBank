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

<title>Recipients</title>

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



<script type="text/javascript">
	function myFunction() {
		  // Declare variables 
		  var input, filter, table, tr, td, i;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		
		  // Loop through all table rows, and hide those who don't match the search query
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[2];
		    if (td) {
		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    } 
		  }
	}
</script>

<style>
	* {
	  box-sizing: border-box;
	}
	
	#myInput {
	  background-image: url('/css/searchicon.png');
	  background-position: 10px 10px;
	  background-repeat: no-repeat;
	  width: 100%;
	  font-size: 16px;
	  padding: 12px 20px 12px 40px;
	  border: 1px solid #ddd;
	  margin-bottom: 12px;
	}
	
	#myTable {
	  border-collapse: collapse;
	  width: 100%;
	  border: 1px solid #ddd;
	  font-size: 18px;
	}
	
	#myTable th, #myTable td {
	  text-align: left;
	  padding: 12px;
	}
	
	#myTable tr {
	  border-bottom: 1px solid #ddd;
	}
	
	#myTable tr.header, #myTable tr:hover {
	  background-color: #f1f1f1;
	}
</style>



</head>

<body>

	<div id="wrapper">

		 <!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a id="Profile"
					href="<%=application.getContextPath()%>/Profile.jsp">Profile</a></li>				
				<li><a id="DonorsMenu"
					href="<%=application.getContextPath()%>/Donors.jsp">Donors</a></li>
					<li><a id="RecipientsMenu"
					href="<%=application.getContextPath()%>/Recipients.jsp">Recipients</a></li>
				<li><a id="RegisterAsDonorMenu"
					href="<%=application.getContextPath()%>/RegisterAsDonor.jsp">Register As Donor</a>
				</li>
				<li><a id="RequestForBloodMenu"
					href="<%=application.getContextPath()%>/RequestForBlood.jsp">Request for Blood</a></li>
				<li><a id="DonateBloodMenu"
					href="<%=application.getContextPath()%>/DonateBlood.jsp">Donate Blood</a></li>				
				<li><a id="logout"
					href="<%=application.getContextPath()%>/Logout.jsp">Logout</a></li>
			</ul>
		</div>
        <!-- /#sidebar-wrapper -->
        
		 <!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<a href="#menu-toggle" style="background-color:black;color:white;" class="btn btn-default" id="menu-toggle">Blood Donation
					Menu</a><br>
				<h2 align="center">Search Recipients</h2>	
				<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Recipient.." title="Type in a name">
				 <table id="myTable" class="table table-bordered">
		    		<thead>
				      <tr>
				        <th>Recipient ID</th>
				        <th>Name</th>
				        <th>BloodGroup</th>
				        <th>Email</th>
				        <th>Phone</th>
				      </tr>
			    	</thead>
			      <tbody>
				      <tr>
				 													

		<%
	        try{
		    	   
	   	     Connection con=MySQLCon.main(null);
	   	     
	   	     //String username=(String) session.getAttribute("uname");
	   		 String sql="select * from test.recipient;";
		     PreparedStatement p=con.prepareStatement(sql);
	   	    
		     ResultSet r=p.executeQuery();
	 	    
			     while(r.next()){
			    	 out.println("<td>"+r.getString(1)+"</td>");
			    	 out.println("<td>"+r.getString(2)+"</td>");			    	 
		 	    	 out.println("<td>"+r.getString(3)+"</td>");
		 	    	 out.println("<td>"+r.getString(4)+"</td>");		 	    	 
		 	    	 out.println("<td>"+r.getString(5)+"</td> </tr>");
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