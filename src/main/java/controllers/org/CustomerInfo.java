package controllers.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import database.org.DbConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import model.org.Customer;


@WebServlet("/customer")
public class CustomerInfo extends HttpServlet {

	
	 protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	 {
	        PrintWriter out = res.getWriter();
	        res.setContentType("text/html");
	        
	        try(Connection con=DbConnection.getConnection())
	        {
	        	 ArrayList<Customer> CustomerList = new ArrayList<>();
	        	 
	        	 String query = "SELECT name, email, city, uid, street, pin, phone  FROM register";
	        	
	        	PreparedStatement ps=con.prepareStatement(query);
	        	ResultSet rs=ps.executeQuery();
	        	
	        	while(rs.next())
				{
					Customer c=new Customer();
					c.setName(rs.getString("name"));
					c.setEmail(rs.getString("email"));
					c.setUid(rs.getInt("uid"));
					c.setPhone(rs.getString("phone"));
					c.setStreet(rs.getString("street"));
					c.setCity(rs.getString("city"));
					c.setPin(rs.getInt("pin"));
					
					CustomerList.add(c);
					
				}	
	        	  // Set the product list as a request attribute
	            req.setAttribute("customer", CustomerList);

	            // Forward to the JSP page
	            RequestDispatcher rd = req.getRequestDispatcher("/Admin/CustomerInfo.jsp");
	            rd.forward(req, res);
	        	
	        
	        }
	        
	        catch(Exception e)
	        {
	        	e.printStackTrace();
				
				 res.setContentType("text/html");
					
					out.print("<h3 style='color:red'>Exception occured"+e.getMessage()+"</h3>");
					RequestDispatcher rd=req.getRequestDispatcher("/LogReg.html");
					
					rd.include(req, res);
	        	
	        }
     }
}
