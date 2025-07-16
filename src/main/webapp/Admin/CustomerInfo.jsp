<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.org.Customer"%>
<%@ page import="java.util.ArrayList" %>

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
            background: #f8f9fa;
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
            transition: 0.3s ease-in-out;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        button:hover {
            background: #ddd;
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            border-radius: 8px;
            background: white;
            padding: 20px;
            width: 90%;
            max-width: 1200px;
            box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            flex-direction: column;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        h2 {
            margin-bottom: 20px;
            font-weight: 600;
            font-size: 24px;
            color: #000000;
            text-align: center;
        }

        .table-container {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        table {
            width: 100%;
            min-width: 700px;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
            font-size: 14px;
            word-break: break-word;
            white-space: nowrap;
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

        footer {
            width: 100%;
            padding: 10px;
            text-align: center;
            background: linear-gradient(90deg, #000, #555);
            color: white;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
                width: 100%;
            }

            h2 {
                font-size: 20px;
            }
        }

        @media (max-width: 480px) {
            header {
                flex-direction: column;
                text-align: center;
                padding: 10px;
            }

            .logo {
                font-size: 16px;
            }

            button {
                padding: 5px 10px;
                font-size: 11px;
            }

            .container {
                padding: 8px;
                width: 95%;
            }

            h2 {
                font-size: 16px;
                margin-bottom: 15px;
            }

            th, td {
                padding: 6px;
                font-size: 10px;
            }

            footer {
                padding: 8px;
                font-size: 12px;
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
            <h2>Our Customers</h2>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>User Id</th>
                            <th>Phone</th>
                            <th>Street</th>
                            <th>City</th>
                            <th>Pin</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% ArrayList<Customer> customers = (ArrayList<Customer>) request.getAttribute("customer");
                        if (customers == null || customers.isEmpty()) { %>
                            <tr><td colspan="7" style="text-align: center">No Details available</td></tr>
                        <% } else { for (Customer customer : customers) { %>
                            <tr>
                                <td><%= customer.getName() %></td>
                                <td><%= customer.getEmail() %></td>
                                <td><%= customer.getUid() %></td>
                                <td><%= customer.getPhone() %></td>
                                <td><%= customer.getStreet() %></td>
                                <td><%= customer.getCity() %></td>
                                <td><%= customer.getPin() %></td>
                            </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <footer>
        <p>@Shoe Factory</p>
    </footer>
</body>
</html>
