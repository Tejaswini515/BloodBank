package Login;

import java.sql.*;

public class MySQLCon {
	public static Connection main(String args[]) {
		try {

			// step1 load the driver class
			Class.forName("com.mysql.jdbc.Driver");

			// step2 create the connection object
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "2358");

			System.out.println("Connection is  established");
			return con;

			// step5 close the connection object

		} catch (Exception e) {
			System.out.println(e);
		}

		return null;

	}
}