<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.org.Product"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="model.org.AddToCartModel"%>
<%@page import="model.org.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>All Products - Shoe Factory</title>
    <link
      href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
      rel="stylesheet"
    />
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;900&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            width: 100%;
            padding: 15px 5%;
            background: linear-gradient(90deg, #000, #555);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: clamp(18px, 2vw, 25px);
            color: #ffffff;
            text-decoration: none;
            font-weight: 600;
        }

        button {
            padding: 10px 20px;
            color: #000;
            font-weight: 500;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background: white;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        main {
            flex: 1;
            display: flex;
            flex-derection:column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(90deg, #e2e2e2, #c9d6ff);
            padding: 20px;
        }

        h2 {
            text-align: center;
            font-size: xx-large;
        }

        .cart-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            width: 100%;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            padding: 15px;
            background: #f9f9f9;
            box-shadow: 1px 2px 5px rgba(0, 0, 0, 0.1);
            border-bottom: 2px solid black;
            padding-bottom: 10px;
        }

        .cart-item img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 15px;
        }

        .cart-info h3 {
            font-size: 16px;
            font-weight: 600;
            width: 400px;
        }

        .cart-info p {
            font-size: 14px;
            color: #666;
            width: 400px;
        }

        .price {
             padding:40px;
            font-size: large;
            font-weight: 600;
        }

        .cart-controls {
            display: flex;
            align-items: center;
            gap: 40px;
        }

        select {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background: linear-gradient(135deg, #e0e0e0, #ffffff);
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            width: 100px;
        }

       .quantity {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 5px;
    border-radius: 8px;
    
    
    width: 70px;
}

       .qty-input {
    width: 100%;
    height: 35px;
    text-align: center;
    font-size: 18px;
    font-weight: 400;
    color: #333;
   
    border-radius: 5px;
    outline: none;
   background: linear-gradient(135deg, #e0e0e0, #ffffff);
    
}

       


        .remove-btn {
            padding: 8px 12px;
            font-size: 14px;
            font-weight: 600;
            color: white;
            background: #ff0000;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .remove-btn:hover {
            background: #c00f0f;
        }
        
        .remove-btn a {
           text-decoration:none;
           color:white;
        }
        
        
        .checkout-btn {
    padding: 8px 12px;
            font-size: 14px;
            font-weight: 600;
            color: white;
            background: #218838;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
}

.checkout-btn:hover {
    background: #218838; /* Darker green */
}
        

        footer {
            width: 100%;
            padding: 10px;
            text-align: center;
            background: linear-gradient(90deg, #000, #555);
            color: white;
        }
        
        
        @media (max-width: 1024px) {
    .cart-container {
        width: 95%;
        padding: 15px;
    }

    .cart-item {
        flex-wrap: wrap;
        padding: 10px;
    }

    .cart-item img {
        width: 150px;
        height: 150px;
        margin-bottom: 10px;
    }

    .cart-info h3, .cart-info p {
        width: auto;
        text-align: center;
    }

    .cart-controls {
        flex-direction: column;
        align-items: center;
        gap: 5px;
    }

    select, .quantity {
        width: 100%;
    }
}

@media (max-width: 768px) {


    .checkout-btn {
        width: 100%;
    }


    header {
        flex-direction: column;
        text-align: center;
    }

    .cart-item {
        flex-direction: column;
        align-items: center;
        text-align: center;
        padding: 15px;
    }

    .cart-item img {
        width: 120px;
        height: 120px;
    }

    .cart-info h3, .cart-info p {
        width: 100%;
        font-size: 14px;
    }

    .cart-controls {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .quantity {
        width: 100%;
    }

    select {
        width: 100%;
    }

    .remove-btn {
        width: 100%;
        text-align: center;
    }
}

@media (max-width: 480px) {
    .cart-container {
        width: 100%;
        padding: 10px;
    }

    .cart-item {
        flex-direction: column;
        padding: 10px;
    }

    .cart-item img {
        width: 100px;
        height: 100px;
    }

    .cart-info h3, .cart-info p {
        font-size: 12px;
    }

    .price {
        font-size: 16px;
    }

    select {
        font-size: 14px;
        padding: 5px;
    }

    .qty-input {
        width: 50px;
        font-size: 14px;
    }

    .remove-btn {
        font-size: 12px;
        padding: 6px;
    }
}
        
    </style>
</head>
<body>

 <%-- Check if there is an alert message set in the request --%>
         <% String alertMessage = (String) request.getAttribute("alertMessage3"); %>
            <% if (alertMessage != null && !alertMessage.isEmpty()) { %>
               <script type="text/javascript">
                  alert("<%= alertMessage %>");
               </script>
         <% } %>

    <header>
        <a href="${pageContext.request.contextPath}/Customer/Profile.jsp" class="logo">Shoe Factory</a>
        <a href="${pageContext.request.contextPath}/Customer/Profile.jsp"><button>Home</button></a>
    </header>

    <main>
        <div class="cart-container">
        
            <h2>Your Cart Items</h2>

            <%
                // Retrieve the ArrayList from request attributes
                ArrayList<AddToCartModel> orderList = (ArrayList<AddToCartModel>) request.getAttribute("cartItem");

                if (orderList == null || orderList.isEmpty()) {
            %>
                <p style="text-align: center">No products available</p>
            <%
                } else {
                    // Loop through the products
                    for (AddToCartModel order : orderList) {
            %>
            
            
        <form action="${pageContext.request.contextPath}/checkout" method="POST">
            <div class="cart-item">
                
                <% if (order.getBase64Image() != null && !order.getBase64Image().isEmpty()) { %>
                <img src="data:image/jpeg;base64,<%= order.getBase64Image() %>" alt="Product Image">
                <% } else { %>
                <img src="${pageContext.request.contextPath}/images/default-placeholder.png" alt="No Image">
                <% } %>
                
                <div class="cart-info">
                    <h3><%= order.getProductname() %></h3>
                    <p><%= order.getDescription() %></p>
                </div>

                <div class="price">₹<%= order.getPrice() %></div>

                
                <div class="cart-controls">
                    <select name="size" required>
                     <option value="" disabled selected> Size</option>
                     <option value="6">6</option>
                     <option value="7">7</option>
                     <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                     <option value="11">11</option>
                     <option value="12">12</option>
                   </select>


                   <div class="quantity">
                   
                    <select name="quantity" required>
                        <option value="" disabled selected> Quantity</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                    
                     <input type="hidden" name="orderid" value="<%= order.getOid() %>">
                  </div>
                
                    
                    <%   User user = (User) session.getAttribute("session_object"); %>
      
                     <button type="#" class="remove-btn">
                     <a href="${pageContext.request.contextPath}/removecartproduct?productid=<%= order.getPid() %>&userid=<%= user.getUid() %>">Remove</a>
                     </button>
                     
                     
                      
                    <button class="checkout-btn" type="submit">Check Out</button>
                      
                     
                </div>
                
             
            </div>
        </form>
            <%
                    }
                }
            %>
            
                
           
        </div>
    </main>

    <footer>
        <p>@Shoe Factory</p>
    </footer>
    
   
    
</body>
</html>
