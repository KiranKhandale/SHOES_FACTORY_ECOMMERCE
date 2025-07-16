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


@WebServlet("/checkout")
public class Cheakout extends HttpServlet {


protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
    	
    	PrintWriter out = res.getWriter();
        res.setContentType("text/html");

        String size = req.getParameter("size");
        String quantity = req.getParameter("quantity");
        String oid = req.getParameter("orderid");
        
        int mysize = Integer.parseInt(size);
        int myquantity = Integer.parseInt(quantity);
        int myoid = Integer.parseInt(oid);

      
        

        try (Connection con = DbConnection.getConnection()) 
        {
   
        	String updateQuery = "UPDATE orders SET size = ?, quantity = ?, status = 'active' WHERE oid = ?";

                
                try (PreparedStatement ps = con.prepareStatement(updateQuery)) 
                {
                    ps.setInt(1, mysize);
                    ps.setInt(2, myquantity);
                    ps.setInt(3, myoid);

                    int rs = ps.executeUpdate();
                    

                    if (rs>0) {
                    	
                    	req.setAttribute("alertMessage2", "Product added! Cheak Your Orders");
                    	req.getRequestDispatcher("/Customer/Profile.jsp").forward(req, res);
                    }
                   

                    else {
                    	req.setAttribute("alertMessage2", "ERROR!");
                    	req.getRequestDispatcher("/Customer/Profile.jsp").forward(req, res);
                    }
                    
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
