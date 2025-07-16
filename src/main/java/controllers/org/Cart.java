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
import model.org.Product;

@WebServlet("/Cart")
public class Cart extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
    	
    	PrintWriter out = res.getWriter();
        res.setContentType("text/html");

        
        String myuid = req.getParameter("uid");

        int uid1 = Integer.parseInt(myuid);
        

        try (Connection con = DbConnection.getConnection()) 
        {
            
        	ArrayList<AddToCartModel> orderList = new ArrayList<>();
            	
                // ✅ Retrieve cart details after insertion
                String select_query = "SELECT o.oid, o.quantity, p.product_name, p.description, p.price, p.size, p.image, p.id "
                		+ "FROM orders o JOIN products p ON o.pid = p.id WHERE o.uid = ? AND o.status='inactive';";
                
                try (PreparedStatement ps2 = con.prepareStatement(select_query)) {
                    ps2.setInt(1, uid1);

                    ResultSet rs = ps2.executeQuery();
                    AddToCartModel ad = null;

                    while (rs.next()) {
                    	
                        ad = new AddToCartModel();
                        
                        
                        ad.setOid(rs.getInt("oid"));
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
                    req.setAttribute("cartItem", orderList);
                    
                    
                    // ✅ Forward to Profile.jsp (instead of include)
                    RequestDispatcher rd = req.getRequestDispatcher("/Customer/Cart.jsp");
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
