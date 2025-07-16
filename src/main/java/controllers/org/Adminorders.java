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
import model.org.AddToCartModel;

@WebServlet("/orders")
public class Adminorders extends HttpServlet{

	 protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	        
	    	
	    	PrintWriter out = res.getWriter();
	        res.setContentType("text/html");

	        try (Connection con = DbConnection.getConnection()) 
	        {
	            
	        	ArrayList<AddToCartModel> orderList = new ArrayList<>();
	            	
	                // ✅ Retrieve Orders details after insertion
	                String select_query = "SELECT o.oid, o.size, o.quantity,o.uid, p.product_name, p.description, p.price, p.size, p.image, p.id\r\n"
	                		+ "FROM orders o \r\n"
	                		+ "JOIN products p \r\n"
	                		+ "ON o.pid = p.id \r\n";
	                		
	                		
	                
	                try (PreparedStatement ps2 = con.prepareStatement(select_query)) {
	                   

	                    ResultSet rs = ps2.executeQuery();
	                    AddToCartModel ad = null;

	                    while (rs.next()) {
	                    	
	                        ad = new AddToCartModel();
	                        
	                        
	                        ad.setOid(rs.getInt("oid"));
	                        ad.setUid(rs.getInt("uid"));
	                        ad.setProductname(rs.getString("product_name"));
	                        ad.setDescription(rs.getString("description"));
	                        ad.setPrice(rs.getInt("price"));
	                        ad.setQuantity(rs.getInt("quantity"));
	                        ad.setSize(rs.getInt("size"));
	                        ad.setImage(rs.getBytes("image"));
	                        ad.setPid(rs.getInt("id"));
	                        
	                        orderList.add(ad);
	                    }
	                    rs.close();

	                    // ✅ Store the cart item in request scope
	                    req.setAttribute("orderItem", orderList);
	                    
	                    
	                    // ✅ Forward to Profile.jsp (instead of include)
	                    RequestDispatcher rd = req.getRequestDispatcher("/Admin/Adminorders.jsp");
	                    rd.forward(req, res);
	                    return;
	                }
	            

	        } catch (Exception e) {
	            e.printStackTrace(); // Print the stack trace for debugging
	            res.setContentType("text/html");
	            out.print("<h3 style='color:red'>Exception occurred: " + e.getMessage() + "</h3>");
	            RequestDispatcher rd = req.getRequestDispatcher("/index.html");
	            rd.include(req, res);
	        }
	    }
}

