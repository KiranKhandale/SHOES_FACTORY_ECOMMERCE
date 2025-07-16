package controllers.org;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
	    PrintWriter out=res.getWriter();
		HttpSession session =req.getSession();
		
		session.invalidate();
		
		 out.println("<script type=\"text/javascript\">");
         out.println("alert('Logout Successfull');");
         out.println("</script>");
		
		RequestDispatcher rd=req.getRequestDispatcher("/index.html");
		rd.include(req,res);
	}
}
