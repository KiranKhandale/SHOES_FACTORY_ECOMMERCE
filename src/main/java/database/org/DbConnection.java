package database.org;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DbConnection {

	
	public static Connection getConnection()
	{
		
		Connection con=null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc_db","root","12345");
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
	
}
