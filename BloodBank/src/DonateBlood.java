import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Login.MySQLCon;

/**
 * Servlet implementation class DonateBlood
 */
@WebServlet("/donateblood")
public class DonateBlood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonateBlood() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();  
		String username=(String) session.getAttribute("uname");
		int recipientid=Integer.parseInt(request.getParameter("recipientid"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		//Date date = null;
		int donorid = 0;
		try{
	    	   
   	     Connection con=MySQLCon.main(null);
   	     String donorsql="SELECT donorid FROM test.donor WHERE name = '"+username+"';";
   	     PreparedStatement p1=con.prepareStatement(donorsql);
   	     ResultSet r=p1.executeQuery();
	     
	     while(r.next()){
	    	 donorid = r.getInt(1);
	     }
	     
	     System.out.println("donor id "+ donorid);
	    
   	     String sql="insert into donates(donorid,recipientid,date,quantity) values(?,?,?,?);";
	     PreparedStatement p=con.prepareStatement(sql);
	     
	     Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	     
	     p.setInt(1, donorid);
	     p.setInt(2, recipientid);
	     p.setTimestamp(3, timestamp);
	     p.setInt(4, quantity);

	     p.executeUpdate();
		 System.out.println("Record is inserted into donate table!");
		 response.sendRedirect("DonateBlood.jsp");
 	   
	      
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
