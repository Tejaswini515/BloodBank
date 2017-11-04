package Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Register
 */
@WebServlet("/registerdonor")
public class RegisterDonor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterDonor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   String username=request.getParameter("username");
	       String firstname=request.getParameter("name");
	       String email=request.getParameter("email");
	       String phoneno=request.getParameter("phone");
	       String password=request.getParameter("password");
	       
	       System.out.println(password+" password");
	      
	       try{
	    	   
	    	     Connection con=MySQLCon.main(null);
	    	    
	    	  
	    	     String sql="insert into donor values(?,?,?,?,?);";
	     	     PreparedStatement p=con.prepareStatement(sql);
	    	     
	    	     p.setString(1, username);
	    	     p.setString(2, password);
	    	     p.setString(3, firstname);
	    	     p.setString(4, email);
	    	     p.setString(5, phoneno);

	    	     p.executeUpdate();
		 		 System.out.println("Record is inserted into DBUSER table!");
		 		 response.sendRedirect("index.jsp");
		    	   
	    	      
	       }
	       catch(NullPointerException n)
	       {
	    	   n.printStackTrace();
	    	  
	       }
	       catch (Exception e) {
	    	  
			// TODO: handle exception
	    	   e.printStackTrace();
		}
	}

}
