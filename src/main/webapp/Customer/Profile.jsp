
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="model.org.AddToCartModel"%>
<%@page import="model.org.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shoes Factory - Home Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Customer/Profile.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>

    <%-- Check if there is an alert message set in the request --%>
         <% String alertMessage = (String) request.getAttribute("alertMessage"); %>
            <% if (alertMessage != null && !alertMessage.isEmpty()) { %>
               <script type="text/javascript">
                  alert("<%= alertMessage %>");
               </script>
         <% } %>
         
         
          <% String alertMessage2 = (String) request.getAttribute("alertMessage2"); %>
            <% if (alertMessage2 != null && !alertMessage2.isEmpty()) { %>
               <script type="text/javascript">
                  alert("<%= alertMessage2 %>");
               </script>
         <% } %>
         
         
         <% String alertMessage3 = (String) request.getAttribute("alertMessage3"); %>
            <% if (alertMessage3 != null && !alertMessage3.isEmpty()) { %>
               <script type="text/javascript">
                  alert("<%= alertMessage3 %>");
               </script>
         <% } %>
    
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>Shoes Factory</h2>
        </div>
        <nav>
            <a href="Profile.jsp">Home</a>
            <a href="#" id="profile-link">Your Profile</a>
            <%   User user = (User) session.getAttribute("session_object"); %>
            <a href="${pageContext.request.contextPath}/retriveorders?uid=<%= user.getUid() %>">Your Orders</a>
        </nav>
        
        <div class="logout">
        <a href="${pageContext.request.contextPath}/Logout">
        <button id="logout-button">Log Out</button>
        </a>
            
        </div>
    </div>

    <div class="content">
        <header>

            <button id="sidebar-toggle" aria-label="Toggle Sidebar">&#9776;</button>
            <h1>Shoes Factory</h1>
            <nav>
                <a href="#">Home</a>
                <a id="prod" href="${pageContext.request.contextPath}/Customer/UserDisplayAll">Products</a>
                <a id="abot" href="#newsletter">About Us</a>
                <a href="#footer">Contact</a>
                
              
              
                <form action="${pageContext.request.contextPath}/Cart" method="post">
            
                     <input type="hidden" name="uid" value="<%= user.getUid()%>">
                       <button id="cart-link">
                         <i class='bx bxs-cart'></i>
                       </button>
             </form>
                
             
            </nav>
        </header>
        
        <div class="banner-container">
            <!-- Slide 1 -->
            <div class="banner" id="slide1">
                <img src="${pageContext.request.contextPath}/Customer/collection.jpg" alt="Banner Image 1" class="banner-image">
                <h2 class="banner-heading">Welcome to Shoes Factory</h2>
                <p class="banner-description">Your one-stop shop for the best footwear.</p>
                <a href="${pageContext.request.contextPath}/Customer/UserDisplayAll" class="btn">Shop Now</a>
            </div>
        
            <!-- Slide 2 -->
            <div class="banner" id="slide2">
                <img src="${pageContext.request.contextPath}/Customer/slide2.jpg" alt="Banner Image 2" class="banner-image">
                <h2 class="banner-heading">Discover Quality & Styl</h2>
                <p class="banner-description">Explore our latest collection of premium shoes.</p>
                <a href="${pageContext.request.contextPath}/Customer/UserDisplayAll" class="btn">Shop Now</a>
            </div>
        
            <!-- Slide 3 -->
            <div class="banner" id="slide3">
                <img src="${pageContext.request.contextPath}/Customer/slide3.jpg" alt="Banner Image 3" class="banner-image">
                <h2 class="banner-heading">Comfort Meets Fashion</h2>
                <p class="banner-description">Find the perfect pair for every occasion.</p>
                <a href="${pageContext.request.contextPath}/Customer/UserDisplayAll" class="btn">Shop Now</a>
            </div>
        
            <!-- Navigation Buttons -->
            <div class="banner-navigation">
                <button class="nav-btn prev" onclick="changeSlide(-1)">&#10094;</button>
                <button class="nav-btn next" onclick="changeSlide(1)">&#10095;</button>
            </div>
        </div>
        
        <div class="container">
            <section id="featured">
                <h2>Featured Products</h2>
                <div class="product-grid">
                    <div class="product" id="p">
                        <img src="${pageContext.request.contextPath}/Customer/cate1.jpg" alt="Sports Shoes">
                        <h3>Sports Shoes</h3>
                        <a href="${pageContext.request.contextPath}/Customer/UserDisplaySports" class="btn">Shop Now</a>
                    </div>
                    <div class="product">
                        <img src="${pageContext.request.contextPath}/Customer/cate2.jpg" alt="Casual Sneakers">
                        <h3>Casual Sneakers</h3>
                        <a href="${pageContext.request.contextPath}/Customer/UserDisplayCasual" class="btn">Shop Now</a>
                    </div>
                    <div class="product">
                        <img src="${pageContext.request.contextPath}/Customer/cate3.jpg" alt="Formal Shoes">
                        <h3>Formal Shoes</h3>
                        <a href="${pageContext.request.contextPath}/Customer/UserDisplayFormal" class="btn">Shop Now</a>
                    </div>
                </div>
            </section>

            <section id="sale">
                <h2>Current Sale</h2>
                <div class="sale-grid">
                    <div class="sale-item">
                        <img src="${pageContext.request.contextPath}/Customer/disc1.jpg" alt="Discounted Sports Shoes">
                        <h3>SPORTS SHOES</h3>
                        <p>UPTO 30% OFF</p>
                        <a href="${pageContext.request.contextPath}/Customer/UserDisplaySports" class="btn">Shop Sale</a>
                    </div>
                    <div class="sale-item">
                        <img src="${pageContext.request.contextPath}/Customer/disc2.jpg" alt="Discounted Casual Shoes">
                        <h3>CASUAL SHOES</h3>
                        <p>UPTO 50% OFF</p>
                        <a href="${pageContext.request.contextPath}/Customer/UserDisplayFormal" class="btn">Shop Sale</a>
                    </div>
                </div>
            </section>

            <section id="brands">
                <h2>Popular Brands</h2>
                <div class="brand-grid">
                    <div class="brand">
                        <img src="${pageContext.request.contextPath}/Customer/brand1.jpg" alt="Brand Logo 1">
                    </div>
                    <div class="brand">
                        <img src="${pageContext.request.contextPath}/Customer/brand2.jpg" alt="Brand Logo 2">
                    </div>
                    <div class="brand">
                        <img src="${pageContext.request.contextPath}/Customer/brand3.jpg" alt="Brand Logo 3">
                    </div>
                    <div class="brand">
                        <img src="${pageContext.request.contextPath}/Customer/brand4.jpg" alt="Brand Logo 4">
                    </div>
                </div>
            </section>

            <section id="newsletter">
                <h2>Subscribe to Our Newsletter</h2>
                <p>Get the latest updates on new arrivals and special discounts.</p>
                <form action="subscribeServlet" method="POST">
                    <input type="email" name="email" placeholder="Enter your email" required>
                    <a href="#p"><button class="btn">Subscribe</button></a>
                </form>
            </section>
        </div>
        
          
          
          
          <!-- Profile Section -->
     <div class="popup-section" id="profile-section">
        <div class="popup-header">
            <h2>Your Profile</h2>
            <button class="close-button" id="close-profile" aria-label="Close Profile">✖</button>
        </div>
        <div class="popup-content">
            <!-- User Logo -->
           <i class='bx bxs-user-circle' ></i>
              
           

            <!-- User Details -->
           
      <p><strong>Name : </strong> <%= user.getName() %></p>
      <p><strong>Email : </strong> <%= user.getEmail()%></p>
      <p><strong>Phone : </strong> <%= user.getPhone() %></p>
      <p><strong>Address : </strong> <%=user.getStreet()%> , <%=user.getCity()%> , <%=user.getPin() %></p>
            
        </div>
    </div>
        
    
    <!-- Backdrops -->
        <div class="popup-backdrop" id="cart-backdrop"></div>
        <div class="popup-backdrop" id="profile-backdrop"></div>





        <footer>
            <p>&copy; 2025 Shoes Factory. All Rights Reserved.</p>
            <div class="social-links" id="footer">
                <a href="${socialLinks.facebook}">Facebook</a>
                <a href="${socialLinks.instagram}">Instagram</a>
                <a href="${socialLinks.twitter}">Twitter</a>
            </div>
        </footer>
    </div>
</body>

<script>

document.addEventListener("DOMContentLoaded", () => {
	
    // Cart Section
   /*
   const cartButton = document.getElementById("cart-link");
    const cartSection = document.getElementById("cart-section");
    const closeCartButton = document.getElementById("close-cart");
    const cartBackdrop = document.getElementById("cart-backdrop");

    cartButton.addEventListener("click", () => {
        cartSection.classList.add("active");
        cartBackdrop.classList.add("active");
    });

    closeCartButton.addEventListener("click", () => {
        cartSection.classList.remove("active");
        cartBackdrop.classList.remove("active");
    });

    cartBackdrop.addEventListener("click", () => {
        cartSection.classList.remove("active");
        cartBackdrop.classList.remove("active");
    });*/

    
    // Profile Section
    const profileButton = document.getElementById("profile-link");
    const profileSection = document.getElementById("profile-section");
    const closeProfileButton = document.getElementById("close-profile");
    const profileBackdrop = document.getElementById("profile-backdrop");

    profileButton.addEventListener("click", () => {
        profileSection.classList.add("active");
        profileBackdrop.classList.add("active");
    });

    closeProfileButton.addEventListener("click", () => {
        profileSection.classList.remove("active");
        profileBackdrop.classList.remove("active");
    });

    profileBackdrop.addEventListener("click", () => {
        profileSection.classList.remove("active");
        profileBackdrop.classList.remove("active");
    });

    
   
});


    document.addEventListener("DOMContentLoaded", () => {
        const sidebarToggle = document.getElementById("sidebar-toggle");
        const sidebar = document.querySelector(".sidebar");
        const content = document.querySelector(".content");

        sidebarToggle.addEventListener("click", () => {
            sidebar.classList.toggle("open");
            content.classList.toggle("shifted");
        });
    });

    document.addEventListener("DOMContentLoaded", () => {
        const slides = document.querySelectorAll(".banner");
        const totalSlides = slides.length;
        let currentSlide = 0;
        let slideInterval;

        function showSlide(index) {
            slides.forEach((slide, i) => {
                slide.classList.remove("active");
                if (i === index) {
                    slide.classList.add("active");
                }
            });
        }

        function changeSlide(direction) {
            clearInterval(slideInterval);
            currentSlide = (currentSlide + direction + totalSlides) % totalSlides;
            showSlide(currentSlide);
            startSlideInterval();
        }

        function startSlideInterval() {
            slideInterval = setInterval(() => {
                currentSlide = (currentSlide + 1) % totalSlides;
                showSlide(currentSlide);
            }, 7000);
        }

        showSlide(currentSlide);
        startSlideInterval();

        document.querySelector(".prev").addEventListener("click", () => changeSlide(-1));
        document.querySelector(".next").addEventListener("click", () => changeSlide(1));
    });
    
    
    
    
  


</script>
</html>
