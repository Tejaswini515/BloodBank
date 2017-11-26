<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">

<title>Request for Blood</title>

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
            <form class="form-horizontal" id="contact-form"  action="<%=application.getContextPath() %>/requestforblood" method ="post">
                <h2 align="center">Request For Blood</h2>
                 <div class="form-group">
                    <label for="Name" class="col-sm-3 control-label">Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="name" required="true" name="name" placeholder="Name" class="form-control" autofocus>
                        
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="text" id="email" required="true" name="email" placeholder="Email" class="form-control" autofocus>
                        
                    </div>
                </div>                
                <div class="form-group">
                    <label for="phone" class="col-sm-3 control-label">Phone Number</label>
                    <div class="col-sm-9">
                        <input type="number" id="phone" required="true" name="phone" placeholder="Phone Number" class="form-control">
                    </div>
                </div>
               <div class="form-group">
					<label class="col-sm-3 control-label" for="bloodgroup">BloodGroup</label>
					<div class="col-sm-7">
						<select class="selectpicker form-control"									
							id="bloodgroup" required="true" name="bloodgroup">
							<option style="cursor: pointer;">Select BloodGroup</option>									
							<option style="cursor: pointer;" value ="A+">A+</option>
							<option style="cursor: pointer;" value ="A-">A-</option>
							<option style="cursor: pointer;" value ="B+">B+</option>
							<option style="cursor: pointer;" value ="B-">B-</option>
							<option style="cursor: pointer;" value ="AB+">AB+</option>
							<option style="cursor: pointer;" value ="AB-">AB-</option>
							<option style="cursor: pointer;" value ="O+">O+</option>
							<option style="cursor: pointer;" value ="O-">O-</option>																		
						</select>
					</div>
				</div>
               
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary btn-block">Request</button>
                    </div>
                </div>
            </form> <!-- /form -->
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