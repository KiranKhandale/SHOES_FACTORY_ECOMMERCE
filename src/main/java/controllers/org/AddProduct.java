package controllers.org;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import database.org.DbConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/Admin/addproduct")
@MultipartConfig
public class AddProduct extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
    	PrintWriter out=res.getWriter();
    	String myproductName = req.getParameter("ProductName");
        String mydescription = req.getParameter("Description");
        String mycategory = req.getParameter("Category");
        String myprice = req.getParameter("Price");
        String mystatus = req.getParameter("Status");
        
        Part filepart=req.getPart("Image"); //for image input
        
        String filename=filepart.getSubmittedFileName();//for file name
        
        try(InputStream is=filepart.getInputStream())
        {
        	
        	long maxsize=1*1024*1024;
        	
        	if(filepart.getSize()< maxsize)
        	{	
        	try(Connection con=DbConnection.getConnection())
        	{
        		String query="INSERT INTO products (product_name, description, category, price, status, image) VALUES (?, ?, ?, ?, ?, ?)";
        		
        		try(PreparedStatement ps = con.prepareStatement(query))
        		{
        			ps.setString(1, myproductName);
                    ps.setString(2, mydescription);
                    ps.setString(3, mycategory);
                    
                    ps.setBigDecimal(4, new java.math.BigDecimal(myprice));
                    ps.setString(5, mystatus);
                    ps.setBlob(6, is);
                   
                    
                    
                    int count = ps.executeUpdate();

                    if (count > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Product added Successful');");
                        out.println("</script>");
                        
                        
                        RequestDispatcher rd = req.getRequestDispatcher("/Admin/AddProduct.jsp");
                        rd.include(req, res);
                        
                        
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Unsuccessful. Please try again.');");
                        out.println("location='Admin/AddProduct.jsp';");
                        out.println("</script>");
                    }
        		}
        	}
        }
        else 
        {
        	out.println("<script type=\"text/javascript\">");
            out.println("alert('Max size 1 MB');");
            out.println("</script>");	
            
            RequestDispatcher rd = req.getRequestDispatcher("/Admin/AddProduct.jsp");
            rd.include(req, res);
        }
        }
        
        catch(Exception e)
        {
        	res.setContentType("text/html");
        	e.printStackTrace();
        	out.print("<h3 style='color:red'>Exception occured"+e.getMessage()+"</h3>");
			RequestDispatcher rd=req.getRequestDispatcher("/AddProduct.jsp");
			
			rd.include(req, res);
        	
        }
        
      out.println("Product uploaded successfully!");
    }
}
