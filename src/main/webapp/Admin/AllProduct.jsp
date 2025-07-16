<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.org.Product"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products - Shoe Factory</title>
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;900&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
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
            color: #000000;
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
            justify-content: center;
            align-items: center;
            background: linear-gradient(90deg, #e2e2e2, #c9d6ff);
            padding: 20px;
        }

        .container {
            border-radius: 8px;
            background: white;
            padding: 20px;
            
            width: 90%;
            box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            flex-direction: column;
            overflow-x: auto;
        }

        h2 {
            margin-bottom: 20px;
            font-weight: 600;
            font-size: 24px;
            color: #000000;
            text-align: center;
        }

        table {
            width: 100%;
            min-width: 600px;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
            font-size: 14px;
        }

        th {
            background: linear-gradient(90deg, #000, #2d2828);
            color: white;
            font-weight: 100;
            font-size: 15px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .remove-btn {
            padding: 5px 10px;
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
        
      
        
        
        
       

        footer {
            width: 100%;
            padding: 10px;
            text-align: center;
            background: linear-gradient(90deg, #000, #555);
            color: white;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            table {
                min-width: 100%;
            }

            th, td {
                padding: 10px;
                font-size: 12px;
            }

            button {
                padding: 8px 16px;
                font-size: 14px;
            }

            .container {
                padding: 15px;
                width: 100%;
            }

            h2 {
                font-size: 20px;
            }
        }

        @media (max-width: 480px) {
            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }

            th, td {
                padding: 8px;
                font-size: 12px;
            }

            button {
                padding: 6px 12px;
                font-size: 12px;
            }

            .container {
                padding: 10px;
            }

            h2 {
                font-size: 18px;
            }
        }
    </style>
</head>

<body>


   
    <header>
        <a href="#" class="logo">Shoe Factory</a>
        <a href="${pageContext.request.contextPath}/Admin/Admin.jsp">
            <button>Home</button>
        </a>
    </header>

    <main>
        <div class="container">
            <h2>All Products</h2>

            <table>
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Image</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Get the products from the request
                        List<Product> products = (List<Product>) request.getAttribute("products");
                        
                        if (products == null || products.isEmpty()) { 
                    %>
                        <tr>
                            <td colspan="7" style="text-align: center">No products available</td>
                        </tr>
                    <% 
                        } else { 
                            // Loop through the products
                            for (Product product : products) { 
                    %>
                        <tr>
                            <td style="text-align: center"><%= product.getId() %></td>
                            <td><%= product.getProductName() %></td>
                            <td><%= product.getDescription() %></td>
                            <td><%= product.getCategory() %></td>
                            <td><%= product.getPrice() %></td>
                            <td><%= product.getStatus() %></td>
                           
                           <td> 
                           <% if (product.getBase64Image() != null && !product.getBase64Image().isEmpty()) { %>
                            <img src="data:image/jpeg;base64,<%= product.getBase64Image() %>" 
                             alt="Product Image" style="max-width: 100px; height: auto;">
                           
                           <% } else { %>
                              <img src="${pageContext.request.contextPath}/images/default-placeholder.png" 
                                 alt="No Image" style="max-width: 100px; height:auto ;">
                                 <% } %>
                              </td>
                           
                            
                            <td id="action">
                                <!-- Example button for removing a product -->
                                <form action="${pageContext.request.contextPath}/removeproduct" method="post">
                                    <input type="hidden" name="productid" value="<%= product.getId() %>">
                                    <button type="submit" class="remove-btn">Remove</button>
                                </form>
                               
                            </td>
                        </tr>
                    <% 
                            } 
                        }
                    %>
                </tbody>
            </table>
        </div>
    </main>

    <footer>
        <p>@Shoe Factory</p>
    </footer>
</body>
</html>

