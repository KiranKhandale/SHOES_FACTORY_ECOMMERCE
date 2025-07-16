<%@page import="model.org.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Shoe Factory - Admin</title>
    
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;900&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        /* Base Styles */
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        header {
            width: 100%;
            padding: 15px 5%;
            background: linear-gradient(90deg, #000, #555);
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 99;
        }

        header h4 {
            font-weight: 400;
            color: white;
        }

        .logo {
            font-size: clamp(18px, 2vw, 25px);
            color: #ffffff;
            text-decoration: none;
            font-weight: 600;
        }

        button {
            padding: 10px;
            color: #000000;
            font-weight: 500;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: white;
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
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 40px;
            flex-wrap: wrap;
        }

        a {
            text-decoration: none;
        }

        .container button {
            width: clamp(150px, 20vw, 200px);
            height: clamp(150px, 20vw, 200px);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(90deg, #000, #555);
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .container button:hover {
            transform: scale(1.1);
        }

        .container i {
            font-size: clamp(40px, 5vw, 70px);
            color: white;
            margin-bottom: 10px;
            text-decoration: none;
        }

        .container h3 {
            color: #fff;
            font-size: clamp(14px, 1.5vw, 18px);
            text-align: center;
            font-weight: 600;
            text-decoration: none;
        }

        footer {
            width: 100%;
            padding: 10px;
            text-align: left;
            background: linear-gradient(90deg, #000, #555);
            color: white;
        }

        /* Enhanced Responsive Design */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                padding: 10px;
            }
            
            .container {
                gap: 20px;
            }
            
            button {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .container {
                gap: 10px;
                flex-direction: column;
            }
            
            .container button {
                width: 100%;
                max-width: 300px;
                height: auto;
                padding: 20px;
            }
            
            .container i {
                font-size: 30px;
            }
            
            .container h3 {
                font-size: 12px;
            }
            
            footer {
                text-align: center;
            }
        }
    </style>
</head>

<body>

 <%-- Check if there is an alert message set in the request --%>
         <% String alertMessage = (String) request.getAttribute("alertMessage"); %>
            <% if (alertMessage != null && !alertMessage.isEmpty()) { %>
               <script type="text/javascript">
                  alert("<%= alertMessage %>");
               </script>
         <% } %>

    <header>
        <a href="#" class="logo">Shoe Factory</a>
        
        <%    
          User user = (User) session.getAttribute("session_object");
        %>
        
        <h4>Admin - <%= user.getName() %></h4>
        <h4>Email - <%= user.getEmail() %></h4>
        
        <a href="${pageContext.request.contextPath}/Logout">
            <button>Logout</button>
        </a>
        
    </header>

    <main>
        <div class="container">
            <a href="${pageContext.request.contextPath}/Admin/AddProduct.jsp">
                <button>
                    <i class='bx bxs-file-plus'></i>
                    <h3>Add Product</h3>
                </button>
            </a>
            
            <a href="${pageContext.request.contextPath}/Admin/AllProduct">
                <button>
                    <i class='bx bxl-product-hunt'></i>
                    <h3>All Products</h3>
                </button>
            </a>
            
            <a href="${pageContext.request.contextPath}/orders">
                <button>
                    <i class='bx bxs-cart'></i>
                    <h3>Orders</h3>
                </button>
            </a>
            
            <a href="${pageContext.request.contextPath}/customer">
                <button>
                    <i class='bx bxs-user'></i>
                    <h3>Customers</h3>
                </button>
            </a>
        </div>
    </main>

    <footer>
        <p>@shoe factory</p>
    </footer>

</body>
</html>
