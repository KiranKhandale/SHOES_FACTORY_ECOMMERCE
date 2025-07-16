package controllers.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import database.org.DbConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/removeproduct")
public class RemoveProduct extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		PrintWriter out = res.getWriter();
        res.setContentType("text/html");
		
		try (Connection con = DbConnection.getConnection())
		{
			
			String myproductid = req.getParameter("productid");
			
			//String sql = "DELETE FROM orders WHERE pid = ?" ;
			String sql2 = "DELETE FROM products WHERE id = ?";		
			
			 //PreparedStatement ps = con.prepareStatement(sql);
			 PreparedStatement ps2 = con.prepareStatement(sql2);
			 
			// ps.setInt(1, Integer.parseInt(myproductid));
			 ps2.setInt(1, Integer.parseInt(myproductid));
			 
			// int count = ps.executeUpdate();
			 int count2=ps2.executeUpdate();
			 
			 if(count2>0)
			 {
				    
		         
				    out.println("<script type=\"text/javascript\">");
	                out.println("alert('Product Removed Successfully');");
	                out.println("</script>");
	                RequestDispatcher rd = req.getRequestDispatcher("/Admin/Admin.jsp");
                    rd.include(req, res);
				
			 }
			 else 
			 {
				   
		         
				    out.println("<script type=\"text/javascript\">");
	                out.println("alert('Something Wen't Wrong');");
	                out.println("</script>");
	                RequestDispatcher rd = req.getRequestDispatcher("/Admin/Admin.jsp");
                    rd.include(req, res);
			 }
		}
		
		catch(Exception e)
		{
			 e.printStackTrace();
			 
			 
	           System.out.println("<h3 style='color:red'>An error occurred: " + e.getMessage() + "</h3>");
	            
	            // Redirect to a fallback page (e.g., login/registration)
	          	req.setAttribute("alertMessage", "Product is Ordered by someone!");
        	    req.getRequestDispatcher("/Admin/Admin.jsp").forward(req, res);
        	    
        	    
	           
		}
		
	}
	
	

}
