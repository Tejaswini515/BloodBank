package Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RequestForBlood
 */
@WebServlet("/requestforblood")
public class RequestForBlood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestForBlood() {
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
		   HttpSession session=request.getSession();  
		   String username=(String) session.getAttribute("uname");
		   String name=request.getParameter("name");
	       String email=request.getParameter("email");
	       String phoneno=request.getParameter("phone");
	       String bloodgroup=request.getParameter("bloodgroup");
	       String d=request.getParameter("date");
	       String city=request.getParameter("city");
	       int quantity = Integer.parseInt(request.getParameter("quantity"));
	       
	       System.out.println(bloodgroup+" bloodgroup");
	      
	       try{
	    	   
	    	     Connection con=MySQLCon.main(null);
	    	    
	    	  
	    	     String sql="insert into recipient(name,bloodgroup,email,phone,date,city,quantity) values(?,?,?,?,?,?,?);";
	     	     PreparedStatement p=con.prepareStatement(sql);
	    	     
	    	     p.setString(1, name);
	    	     p.setString(2, bloodgroup);
	    	     p.setString(3, email);
	    	     p.setString(4, phoneno);
	    	     p.setString(5, d);
	    	     p.setString(6, city);
	    	     p.setInt(7, quantity);

	    	     p.executeUpdate();
		 		 System.out.println("Record is inserted into recipient table!");
		 		 response.sendRedirect("RequestForBlood.jsp");
		    	   
	    	      
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
