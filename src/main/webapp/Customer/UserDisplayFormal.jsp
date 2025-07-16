<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.org.UserProduct"%>
<%@ page import="java.util.List" %>
<%@page import="model.org.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Products</title>
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

       
        main {
            flex: 1;
        }

          header {
        background: linear-gradient(90deg, #000, #555);
        color: white;
        padding: 10px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: auto; /* Adjust height based on content */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        position: sticky;
        top: 0;
    }

          header h1 {
        font-size: 1.8rem; /* Adjust font size for smaller screens */
        letter-spacing: 3px;
    }

        nav {
        display: flex;
        justify-content: space-around;
        align-items: center;
        gap: 10px;
        }

       nav a {
        color: white;
        text-decoration: none;
        padding: 8px 15px;
        font-size: 0.9rem;
        border-radius: 5px;
        transition: background-color 0.3s ease, color 0.3s ease;
        white-space: nowrap; /* Prevent text wrapping */
    }

        nav a:hover {
            background-color: #007bff;
            color: #fff;
        }

        #cart-link {
            position: relative;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

          #cart-link i {
        font-size: 24px;
    }

        #cart-link:hover {
            transform: scale(1.2);
        }

        h3 {
            text-align: center;
            margin-top: 20px 0;
            padding:15px;
            color: Black;
        }

        /* Product Grid Styles */
     #product-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            padding: 10px;
            background-color: #f9f9f9;
        }

        #product-container div {
            border: 1px solid #ddd;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            background: #fff;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        #product-container div:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        #product-container img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        #product-container h3 {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 10px;
            font-family: 'Poppins', sans-serif;
        }

        #product-container p {
            font-size: 0.95rem;
            color: #666;
            margin-bottom: 10px;
            font-family: 'Poppins', sans-serif;
        }

        #product-container a {
            text-decoration: none;
            background: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            display: inline-block;
            font-size: 0.95rem;
            transition: background-color 0.3s ease;
            font-family: 'Poppins', sans-serif;
        }

        #product-container a:hover {
            background: #0056b3;
        }
        
        #product-container button{
        
        
              text-decoration: none;
              background: #007bff;
              color: white;
              padding: 10px 20px;
              border-radius: 8px;
              display: inline-block;
              font-size: 0.95rem;
              transition: background-color 0.3sease;
              font-family: 'Poppins', sans-serif;
              border: #007bff;
        }

        /* Footer Styles */
        footer {
            background: linear-gradient(90deg, #000, #555);
            color: white;
            text-align: center;
            height: 40px;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            bottom: 0;
            left: 0;
            right: 0;
            box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.2);
            font-family: 'Poppins', sans-serif;
        }

        footer p {
            margin: 0;
            font-size: 1rem;
        }

        footer .social-links a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-size:0.9rem;
            transition: color 0.3s ease;
            font-family: 'Poppins', sans-serif;
        }

        footer .social-links a:hover {
            color: #007bff;
        }
        
        @media (max-width: 768px) {
        header {
            flex-direction: column;
            text-align: center;
        }

        header h1 {
            margin-bottom: 10px;
            font-size: 1.5rem;
        }

        nav {
            flex-wrap: wrap;
            justify-content: center;
        }

        nav a {
            font-size: 0.85rem;
            padding: 6px 10px;
        }

        #cart-link i {
            font-size: 20px;
        }
    }
        
    @media (max-width: 480px) {
        header h1 {
            font-size: 1.2rem;
        }

        nav a {
            font-size: 0.8rem;
            padding: 5px 8px;
        }

        #cart-link i {
            font-size: 18px;
        }
    }
    </style>
</head>
<body>
    <header>
        <h1>Shoes Factory</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/Customer/Profile.jsp">Home</a>          
            <a href="#cart" id="cart-link">
                <i class='bx bxs-cart'></i>
            </a>
        </nav>
    </header>

    <h3>Our Exclusive Formal Collection</h3>
    <main id="product-container">
        <%
        User user = (User) session.getAttribute("session_object");
            // Retrieve the product list from the request attribute
            List<UserProduct> products = (List<UserProduct>) request.getAttribute("products2");
        
            if (products != null && !products.isEmpty()) {
                for (UserProduct p : products) {
        %>
        <div>
            <td>
                <% if (p.getBase64Image() != null && !p.getBase64Image().isEmpty()) { %>
                <img src="data:image/jpeg;base64,<%= p.getBase64Image() %>" alt="Product Image">
                <% } else { %>
                <img src="${pageContext.request.contextPath}/images/default-placeholder.png" alt="No Image">
                <% } %>
            </td>
            <h3><%= p.getProductName() %></h3>
            <p><%= p.getDescription() %></p>
            <p><strong>Price: ₹  <%= p.getPrice() %></strong></p>
            
            
            <form action="${pageContext.request.contextPath}/addToCart" method="post">
              <input type="hidden" name="pid" value="<%= p.getId()%>">
              <input type="hidden" name="uid" value="<%= user.getUid()%>">
              <button type="submit">Add to Cart</button>
             </form>
           </div>
        <%
                }
            } else {
        %>
        <p>No products available at the moment.</p>
        <%
            }
        %>
    </main>

    <footer>
        <p>&copy; 2025 Shoes Factory. All Rights Reserved.</p>
        <div class="social-links">
            <a href="#">Facebook</a>
            <a href="#">Instagram</a>
            <a href="#">Twitter</a>
        </div>
    </footer>
</body>
</html>


