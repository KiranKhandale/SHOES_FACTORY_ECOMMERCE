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

import model.org.UserProduct;

@WebServlet("/Customer/UserDisplayAll")

public class UserDisplayAll extends HttpServlet{
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter out = res.getWriter();
        res.setContentType("text/html");
        
        try (Connection con = DbConnection.getConnection())
        {
        	 ArrayList<UserProduct> UserProductList = new ArrayList<>();
        	 
        	 String query = "SELECT id, product_name, description, category, price, status, image FROM products";
        	 
        	 PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery();
             
          // Iterate through the result set and populate the product list
             while (rs.next()) {
                 UserProduct p = new UserProduct();
                 p.setId(rs.getInt("id"));
                 p.setProductName(rs.getString("product_name"));
                 p.setDescription(rs.getString("description"));
                 p.setCategory(rs.getString("category"));
                 p.setPrice(rs.getBigDecimal("price"));
                 p.setStatus(rs.getString("status"));
                 p.setImage(rs.getBytes("image"));
                 
                 UserProductList.add(p);
             }
             // Set the product list as a request attribute
             req.setAttribute("products2", UserProductList);

             // Forward to the JSP page
             RequestDispatcher rd = req.getRequestDispatcher("UserDisplayAll.jsp");
             rd.forward(req, res);
        }
        
        catch(Exception e)
        {
        	// Log and handle the exception
            e.printStackTrace();
            out.print("<h3 style='color:red'>An error occurred: " + e.getMessage() + "</h3>");
            
            // Redirect to a fallback page (e.g., login/registration)
            RequestDispatcher rd = req.getRequestDispatcher("/LogReg.html");
            rd.include(req, res);
        }
	}

}
