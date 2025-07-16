package controllers.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.org.DbConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterForm")
public class Register extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        res.setContentType("text/html");

        String myname = req.getParameter("name1");
        String myemail = req.getParameter("email1");
        String mypassword = req.getParameter("password1");
        String mycity = req.getParameter("city1");
        String mystreet=req.getParameter("street1");
        String mypin=req.getParameter("pin1");
        int mypin1=Integer.parseInt(mypin);
        String myphone=req.getParameter("phone1");

        try (Connection con = DbConnection.getConnection()) {
            // Step 1: Check if user already exists
            String select_query = "SELECT * FROM register WHERE email = ?";
            try (PreparedStatement ps = con.prepareStatement(select_query)) {
                ps.setString(1, myemail);
                
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // User already exists
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('User Already Exists!');");
                        out.println("</script>");
                        RequestDispatcher rd = req.getRequestDispatcher("/LogReg.html");
                        rd.include(req, res);
                        return;
                    }
                }
            }

            // Step 2: Insert new user
            String insert_query = "INSERT INTO register (name, email, password, city, street, pin, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(insert_query)) {
                ps.setString(1, myname);
                ps.setString(2, myemail);
                ps.setString(3, mypassword);
                ps.setString(4, mycity);
                ps.setString(5, mystreet);
                ps.setInt(6, mypin1);
                ps.setString(7, myphone);

                int count = ps.executeUpdate();

                if (count > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Registration Successful');");
                    out.println("</script>");
                    RequestDispatcher rd = req.getRequestDispatcher("/LogReg.html");
                    rd.include(req, res);
                    
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Registration Unsuccessful. Please try again.');");
                    out.println("location='/LogReg.html';");
                    out.println("</script>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the stack trace for debugging
            res.setContentType("text/html");
            out.print("<h3 style='color:red'>Exception occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("/LogReg.html");
            rd.include(req, res);
        }
    }
}
