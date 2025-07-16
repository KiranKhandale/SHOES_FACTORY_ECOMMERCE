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
import model.org.Product;

@WebServlet("/Admin/AllProduct")

public class AllProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        res.setContentType("text/html");

        try (Connection con = DbConnection.getConnection()) {
            // Initialize the product list
            ArrayList<Product> productList = new ArrayList<>();

            // SQL query to fetch products
            String query = "SELECT id, product_name, description, category, price, status, image FROM products";

            // Prepare and execute the statement
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            // Iterate through the result set and populate the product list
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setStatus(rs.getString("status"));
                product.setImage(rs.getBytes("image"));
                
                productList.add(product);
            }

            // Set the product list as a request attribute
            req.setAttribute("products", productList);

            // Forward to the JSP page
            RequestDispatcher rd = req.getRequestDispatcher("/Admin/AllProduct.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            // Log and handle the exception
            e.printStackTrace();
            out.print("<h3 style='color:red'>An error occurred: " + e.getMessage() + "</h3>");
            
            // Redirect to a fallback page (e.g., login/registration)
            RequestDispatcher rd = req.getRequestDispatcher("/LogReg.html");
            rd.include(req, res);
        }
    }
}
