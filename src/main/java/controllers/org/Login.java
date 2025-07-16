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
import jakarta.servlet.http.HttpSession;
import model.org.User;

import javax.swing.JOptionPane;



@WebServlet("/LoginForm")
public class Login extends HttpServlet
{

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		PrintWriter out=res.getWriter();
		res.setContentType("text/html");
		
		String myemail=req.getParameter("email1");
		String mypassword=req.getParameter("password1");
		
		
	try
	{
		if(myemail.equals("admin@123")&& mypassword.equals("admin123"))
		{
			User user=new User();
			user.setName("Ajit Khopade");
			user.setEmail("KhopadeAdmin@gmail.com");
			
			HttpSession session=req.getSession();
			session.setAttribute("session_object", user);
			
			RequestDispatcher rd=req.getRequestDispatcher("Admin/Admin.jsp");
			rd.forward(req,res);	
		}
			
		else 
		{
			Connection con=DbConnection.getConnection();
			
			String select_query="select * from register where email=? and password=?";
		
			PreparedStatement ps=con.prepareStatement(select_query);
			ps.setString(1,myemail);
			ps.setString(2,mypassword);
			
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				User user=new User();
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setUid(rs.getInt("uid"));
				user.setPhone(rs.getString("phone"));
				user.setStreet(rs.getString("street"));
				user.setCity(rs.getString("city"));
				user.setPin(rs.getInt("pin"));
				
				System.out.println(rs.getString("uid"));
				
				
				HttpSession session=req.getSession();
				session.setAttribute("session_object", user);
				
				RequestDispatcher rd=req.getRequestDispatcher("Customer/Profile.jsp");
				rd.forward(req, res);
				
				}
			else
			{
				    out.println("<script type=\"text/javascript\">");
	                out.println("alert('Email Id and Password did not match. Please try again.');");
	                out.println("</script>");
				
				RequestDispatcher rd=req.getRequestDispatcher("/LogReg.html");
				rd.include(req,res);
			}
		}
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
