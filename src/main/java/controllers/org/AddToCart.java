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

@WebServlet("/addToCart")
public class AddToCart extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String mypid = req.getParameter("pid");
        String myuid = req.getParameter("uid");

        // Validate input
        if (mypid == null || myuid == null || mypid.isEmpty() || myuid.isEmpty()) {
            out.println("<script>alert('Invalid Product or User ID!');</script>");
            req.getRequestDispatcher("/Customer/Profile.jsp").include(req, res);
            return;
        }

        int uid1, pid1;
        try {
            uid1 = Integer.parseInt(myuid);
            pid1 = Integer.parseInt(mypid);
        } catch (NumberFormatException e) {
            out.println("<script>alert('Invalid User ID or Product ID!');</script>");
            req.getRequestDispatcher("/Customer/Profile.jsp").include(req, res);
            return;
        }

        try (Connection con = DbConnection.getConnection()) {

            // ✅ Check if product already exists in cart **BEFORE** insertion
            String productCheckQuery = "SELECT * FROM orders WHERE uid = ? AND pid = ? AND status IN ('active', 'inactive')";
            try (PreparedStatement psCheck = con.prepareStatement(productCheckQuery)) {
                psCheck.setInt(1, uid1);
                psCheck.setInt(2, pid1);
                try (ResultSet rsCheck = psCheck.executeQuery()) {
                    if (rsCheck.next()) {
                        req.setAttribute("alertMessage3", "Product Already in Cart! Or Check Yours Orders!");
                        req.getRequestDispatcher("/Customer/Profile.jsp").forward(req, res);
                        return;
                    }
   
                   
                }
            }

            // ✅ Insert product into the orders table
            String insertQuery = "INSERT INTO orders (uid, pid, quantity) VALUES (?, ?, 1)";
            try (PreparedStatement psInsert = con.prepareStatement(insertQuery)) {
                psInsert.setInt(1, uid1);
                psInsert.setInt(2, pid1);

                int count = psInsert.executeUpdate();
                if (count > 0) {

                    // ✅ Retrieve cart details after insertion
                    String selectQuery = "SELECT o.oid, o.quantity, p.product_name, p.description, p.price, p.size, p.image "
                            + "FROM orders o JOIN products p ON o.pid = p.id WHERE o.uid = ?";
                    
                    ArrayList<AddToCartModel> orderList = new ArrayList<>();
                    try (PreparedStatement psSelect = con.prepareStatement(selectQuery)) {
                        psSelect.setInt(1, uid1);
                        try (ResultSet rs = psSelect.executeQuery()) {
                            while (rs.next()) {
                                AddToCartModel ad = new AddToCartModel();
                                ad.setOid(rs.getInt("oid"));
                                ad.setProductname(rs.getString("product_name"));
                                ad.setDescription(rs.getString("description"));
                                ad.setPrice(rs.getInt("price"));
                                ad.setQuantity(rs.getInt("quantity"));
                                ad.setSize(rs.getInt("size"));
                                ad.setImage(rs.getBytes("image"));
                                orderList.add(ad);
                            }
                        }
                    }

                    // ✅ Store the cart item in request scope
                    req.setAttribute("cartItem", orderList);
                    req.setAttribute("alertMessage", "Product added to cart successfully!");

                    req.getRequestDispatcher("/Customer/Profile.jsp").forward(req, res);
                } else {
                    out.println("<script>alert('Add to Cart failed. Try again!');</script>");
                    req.getRequestDispatcher("/Customer/Profile.jsp").include(req, res);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.print("<h3 style='color:red'>Exception occurred: " + e.getMessage() + "</h3>");
            req.getRequestDispatcher("/index.html").include(req, res);
        }
    }
}
