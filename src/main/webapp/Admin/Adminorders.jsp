<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.org.AddToCartModel" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="model.org.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Details</title>
  <style>
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;900&display=swap");

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }

    body {
      font-family: "Poppins", sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
      color: #333;
    }

    header {
      background: linear-gradient(90deg, #000, #555);
      color: white;
      padding-top: 6px;
      position: relative;
      top: 0;
      z-index: 1000;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
      display: flex;
      justify-content: space-between;
      align-items: center;
      height: 80px;
      padding: 0 20px;
    }

    header h1 {
      font-size: 1.5rem;
    }

    header nav a {
      color: white;
      text-decoration: none;
      margin: 0 10px;
      font-size: 1rem;
    }

    header nav a:hover {
      text-decoration: none;
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

    .container {
      width: 100%;
      margin: 20px auto;
    }

    h2 {
      margin-bottom: 15px;
      color: #333;
      font-size: 1.8rem;
    }

    .section {
      background: white;
      margin-bottom: 30px;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .delivery-address p,
    .payment-method p {
      margin: 5px 0;
      font-size: 1rem;
      line-height: 1.5;
    }

.product-header,
.product-item {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
  gap:10px;
}

.product-header {
  font-weight: bold;
  background-color: #f8f8f8;
  border-radius: 8px;
  text-align:center;
}

.product-item {
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 10px;
  background: #fefefe;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.product-photo img {
  width: 100%;
  max-width: 150px;
  height: 150px;
  object-fit: cover;
  border-radius: 8px;
}

.product-name,
.product-description,
.product-size,
.product-quantity,
.product-price {
  text-align: center;
  font-size: 1rem;
}

.action-buttons {
  text-align: center;
}

.cancel-btn {
  padding: 10px 15px;
  background-color: red;
  color: white;
  border: none;
  border-radius: 5px;
  font-size: 1rem;
  cursor: pointer;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.15);
  transition: background-color 0.3s ease, transform 0.2s ease;
}

.checkout-btn:hover {
  background-color: #0056b3;
  transform: translateY(-2px);
}

@media (max-width: 768px) {
  .product-header,
  .product-item {
    grid-template-columns: 1fr;
    text-align: center;
  }

  .product-photo img {
    max-width: 100px;
    margin: 0 auto;
  }

  .cancel-btn {
    width: 100%;
    padding: 12px;
  }
}

.payment-method {
  margin-top: 20px;
  background: white;
  padding: 20px;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.payment-method h2 {
  margin-bottom: 15px;
  font-size: 1.5rem;
  color: #333;
  text-align: center;
}

.payment-details {
  display: flex;
  flex-direction: column;
  gap: 10px;
  font-size: 1rem;
  color: #555;
  padding: 10px 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  border: 1px solid #ddd;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.payment-details p {
  margin: 0;
  line-height: 1.6;
}

.payment-details strong {
  color: #333;
}

@media (max-width: 768px) {
  .payment-method h2 {
    font-size: 1.2rem;
  }

  .payment-details {
    padding: 15px;
  }
}



@media print {

.product-header .img{
display:none;
}

header button{
display:none;
}
    body {
        font-size: 14px;
        color: black;
    }

    /* Adjust Page Margins */
    @page {
        size: A4;  /* Set paper size: A4, Letter, etc. */
        margin: 20mm; /* Adjust margins */
    }

     .product-quantity p{
          display:none;
          font-weight:normal;
     }
     
     .product-size p{
          display:none;
          font-weight:normal;
     }
    /* Center the content */
    .print-container {
        width: 100%;
        max-width: 800px;
        margin: auto;
        padding: 20px;
    }

    /* Hide Elements that Shouldn't Print */
    .no-print {
        display: none;
    }

    /* Adjust Table Layout for Print */
   

    

   
    .cancel-btn{
    display:none;
    }
    .product-photo img{
    display:none;
    }
    .product-item{
    display:flex;
    flex-direction:row;
    }
}



    footer {
       width: 100%;
            padding: 10px;
            text-align: center;
            background: linear-gradient(90deg, #000, #555);
            color: white;
    }


  </style>
</head>
<body>

  <header>
    <h1>Order Details</h1>
    <nav>
      <a href="${pageContext.request.contextPath}/Admin/Admin.jsp"><button>Home</button></a>
      <button onclick="printPage()">Print</button>
    </nav>
  </header>

  <div class="container">
  
   <!-- Delivery Address -->
    
    
    
  <!-- Product Details -->
<div class="section product-details-section">
  <h2>Product Details</h2>
  <div class="product-header">
    <div>Order id</div>
    <div>User id</div>
    <div class="img">Image</div>
    <div>Name</div>
    
    <div>Size</div>
    <div>Quantity</div>
    <div>Total-Price</div>
  </div>
  <% 
    ArrayList<AddToCartModel> orderList = (ArrayList<AddToCartModel>) request.getAttribute("orderItem");

    if (orderList == null || orderList.isEmpty()) { 
  %>
    <p style="text-align: center; padding: 20px;">No products available</p>
  <% 
    } else { 
      for (AddToCartModel order : orderList) { 
  %>
  <div class="product-item">
   
   <div class="product-id"><%= order.getOid() %></div>
    <div class="user-id"><%= order.getUid() %></div>
    
     <div class="product-photo">
      <% if (order.getBase64Image() != null && !order.getBase64Image().isEmpty()) { %>
        <img src="data:image/jpeg;base64,<%= order.getBase64Image() %>" alt="Product Image">
      <% } else { %>
        <img src="${pageContext.request.contextPath}/images/default-placeholder.png" alt="No Image">
      <% } %>
    </div>
    
    
    <div class="product-name"><%= order.getProductname() %></div>
   
    <div class="product-size"><%= order.getSize() %></div>
    <div class="product-quantity"><%= order.getQuantity() %></div>
    <div class="product-price"> <%= order.getPrice() * order.getQuantity() %>/-</div>
   
  </div>
  <% 
      } 
    } 
  %>
</div>


</div>

  <footer>
    <p>@Shoe Factory</p>
  </footer>

</body>

        <script>
                function printPage() {
                    window.print(); // Opens the print dialog
                 }
       </script>
</html>