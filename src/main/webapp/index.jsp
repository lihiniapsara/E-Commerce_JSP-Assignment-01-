<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: LIHINI
  Date: 1/16/2025
  Time: 7:23 PM
  To change this template use File | Settings | File Templates.
--%>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Toys Store</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Custom Styles */
    .hero-section {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 2rem;
      background-color: #eaf6ff; /* Light blue background */
    }

    .hero-section h1 {
      font-size: 2.5rem;
      font-weight: bold;
      color: #123456;
    }

    .hero-section p {
      font-size: 1.2rem;
      margin-bottom: 20px;
    }

    .hero-section .btn-shop {
      background-color: #ff5757;
      color: white;
      border-radius: 20px;
      padding: 10px 20px;
    }

    .hero-content {
      flex: 1; /* Take up equal space */
      text-align: left; /* Align text to the left */
    }

    .hero-image {
      flex: 1; /* Take up equal space */
      text-align: right; /* Align image to the right */
    }

    .hero-image img {
      max-width: 100%; /* Ensure the image is responsive */
      height: auto;

    }

    nav .nav-link {
      font-family: 'Open Sans', sans-serif;
    }

    .main{
      font-family: "Microsoft JhengHei Light";
    }


    .limited-offer {
      background-color: #00c4cc;
      color: white;
      text-align: center;
      padding: 50px 20px;
    }

    .limited-offer h1 {
      font-weight: bold;
    }

    .timer {
      display: flex;
      justify-content: center;
      gap: 15px;
      margin: 20px 0;
    }

    .timer .time-box {
      background: white;
      color: #00c4cc;
      border-radius: 10px;
      padding: 15px;
      font-size: 18px;
      font-weight: bold;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .shop-now-btn {
      background: #ff6363;
      color: white;
      font-weight: bold;
      padding: 10px 20px;
      border-radius: 25px;
      text-decoration: none;
    }

    .shop-now-btn:hover {
      background: #d95454;
      text-decoration: none;
    }

    .row {
      justify-content: space-evenly;
    }

    .circle-img {
      width: 200px;
      aspect-ratio: 1/1;
      object-fit: cover; /* Optional, to maintain aspect ratio */
    }


    .circle-container {
      text-align: center;
    }

    p {
      text-align: center;
    }

    /* General Container Styles */
    .container.my-5 {
      margin-top: 3rem !important;
      margin-bottom: 3rem !important;
    }

    /* Column Styling */
    .col-md-6 {
      margin-bottom: 1.5rem;
    }

    /* Card Styles */
    .bg-light {
      background-color: #f8f9fa;
      border-radius: 8px;
      padding: 2rem;
    }

    .bg-dark {
      background-color: #343a40;
      color: #fff;
      border-radius: 8px;
      padding: 2rem;
    }

    /* Text Alignment */
    .text-center {
      text-align: center;
    }

    /* Buttons */
    .btn-danger {
      background-color: #dc3545;
      color: white;
      border: none;
      padding: 0.6rem 1.2rem;
      border-radius: 5px;
      font-size: 1rem;
      transition: background-color 0.3s ease;
    }

    .btn-danger:hover {
      background-color: #a71d2a;
    }

    /* Green Background Style */
    .d-flex {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    /* Adjust Text Alignment */
    .text-left {
      flex: 1;
      margin-right: 20px;
      text-align: left;
    }




    /* Green Background */
    .d-flex[style*="background-color: #d4edda;"] {
      background-color: #d4edda; /* Light green */
      border-radius: 8px;
      padding: 20px;
    }

    /* If you want to adjust further the layout */
    .d-flex[style*="background-color: #ff00ff;"] {
      background-color: #ff00ff; /* Green background */
      border-radius: 8px;
      padding: 20px;
    }


  </style>
</head>
<body>
<%
  String userId = request.getParameter("userId");
  System.out.println(userId + " :User ID");
  boolean isLoggedIn = (userId != null);
  if (userId != null) {
    System.out.println("logged in");
%>
<script>
  window.addEventListener('DOMContentLoaded', function () {
    var loginLink = document.getElementById("loginLink");
    var profileLink = document.getElementById("profileLink");

    if (loginLink && profileLink) {
      loginLink.style.display = "none";
      profileLink.style.display = "block";
    }
  });
</script>

<%
} else {
  System.out.println("not logged in");
%>
<script>
  window.addEventListener('DOMContentLoaded', function () {
    var loginLink = document.getElementById("loginLink");
    var profileLink = document.getElementById("profileLink");

    if (loginLink && profileLink) {
      loginLink.style.display = "block";
      profileLink.style.display = "none";
    }
  });
</script>
<%
  }
%>

<!-- Header Section -->
<header class="bg-light py-3 border-bottom">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <!-- Left Section -->
      <div class="d-flex align-items-center">
        <img src="images/toys-mania-42.png" alt="Toys Store Logo">
      </div>

      <!-- Right Section: Navigation -->
      <nav class="d-flex flex-grow-1 justify-content-center align-items-center">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link text-dark" href="getAllProductCustomerView">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="about.jsp">About Us</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="#footer">Contact Us</a>
          </li>
        </ul>
      </nav>

      <!-- Icons Section -->
      <div class="d-flex">

        <a href="#" class="text-dark me-3"><i class="bi bi-search"></i></a>
        <a href="#" class="text-dark me-3"><i class="bi bi-heart"></i></a>
        <a href="registration.jsp" class="text-dark me-3"><i class="bi bi-person"></i></a>
        <a href="getCartData" class="text-dark me-3"><i class="bi bi-cart"></i></a>
        <a href="getAllProductCustomerView" class="text-dark"><i class="bi bi-box-arrow-right"></i></a>
      </div>
    </div>
  </div>
</header>

<a href="admin_dashboard.jsp">Admin Dashboard</a>

<!-- Hero Section -->

<section class="hero-section d-flex align-items-center">
  <div class="hero-content">
    <h1 class="main">Best Toys For Kids</h1>
    <p>Starting from $9</p>
    <button class="btn btn-primary btn-lg">Shop Now</button>
  </div>



  <div class="hero-image">
    <img src="images/mainnew.png" alt="Baby with Teddy">
  </div>
</section>

<!-- Product Section -->
<section class="container my-5">
  <div class="text-center mb-4">
    <button class="btn btn-outline-primary mx-2">Best Seller</button>
    <button class="btn btn-outline-secondary mx-2">New Arrivals</button>
    <button class="btn btn-outline-secondary mx-2">On Sale</button>
  </div>

  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
    <!-- Product Card 1 -->

    <%
      List<Product> products = (List<Product>) request.getAttribute("products");
      if (products != null && !products.isEmpty()) {
        for (Product product : products) {

    %>

    <%--<%
      if(products != null){
      for (Product product : products) {

    %>--%>



    <div class="col">
      <div class="card border-0">
        <img src="<%= request.getContextPath() %>/uploads/<%= product.getImageUrl() %>" alt="Product Image" class="card-img-top" style="border-radius: 15px; height: 180px; object-fit: cover; margin-bottom: 15px;">
        <h5 class="card-title" style="font-size: 2.2rem; color: #333;"><%= product.getName() %></h5>
<%--
        <h5 class="card-title" style="font-size: 1.0rem; color: #333;"><%= product.getDescription() %></h5>
--%>

        <p class="card-price" style="color: #c4874a; font-size: 1.4rem;">Rs <%= product.getPrice() %>/=</p>


        <div class="card-body text-center">
          <p class="text-muted small">2-3 years</p>
          <h5 class="card-title">Sed tempus</h5>
          <a href="#" class="btn btn-outline-danger btn-sm">Add to cart</a>
        </div>
      </div>
    </div>

    <div class="modal fade" id="addToCartModal<%= product.getId() %>" tabindex="-1" aria-labelledby="addToCartModalLabel<%= product.getId() %>" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addToCartModalLabel<%= product.getId() %>">Add <%= product.getName() %> to Cart</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form>
              <!-- Hidden field for product ID -->
              <input type="hidden" name="productId" value="<%= product.getId() %>">

              <!-- Quantity input -->
              <div class="mb-3">
                <label for="quantity<%= product.getId() %>" class="form-label">Quantity</label>
                <input type="number" class="form-control" id="quantity<%= product.getId() %>" name="quantity" value="1" min="1" required>
              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="addCart(this)">Add to Cart</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>


  <%
        }
      }
    %>
    <script src="JQ/jquery-3.7.1.min.js"></script>


    <script>
      function addCart(button) {
        // Get the modal form closest to the button clicked
        var form = $(button).closest('form');

        // Get product ID and quantity values from the form
        var productId = form.find('input[name="productId"]').val();
        var quantity = form.find('input[name="quantity"]').val();

        // Send an AJAX POST request to the server
        $.ajax({
          url: '/addToCart', // Your server endpoint
          type: 'POST',
          data: {
            productId: productId,
            quantity: quantity
          },
          success: function(response) {
            // Handle success (e.g., show a message or update cart UI)
            alert('Product added to cart successfully!');
            // Optionally, close the modal
            $(form).closest('.modal').modal('hide');
          },
          error: function(xhr, status, error) {
            // Handle error
            alert('Error adding product to cart: ' + error);
          }
        });
      }

      function submitForm(button) {
        // Trigger the hidden form for the specific product
        $(button).siblings('.productForm').submit();
      }
    </script>

  <%--  <!-- Product Card 2 -->
    <div class="col">
      <div class="card border-0">
        <div class="position-relative">
          <span class="badge bg-danger text-white position-absolute top-0 start-0 m-2">$100.00</span>
          <img src="images/product3-300x300.png" class="card-img-top" alt="Product 2">
        </div>
        <div class="card-body text-center">
          <p class="text-muted small">5-8 years</p>
          <h5 class="card-title">Mauris cursus</h5>
          <p><s>$599.00</s> <span class="text-danger fw-bold">$499.00</span></p>
          <a href="#" class="btn btn-outline-danger btn-sm">Add to cart</a>
        </div>
      </div>
    </div>

    <!-- Product Card 3 -->
    <div class="col">
      <div class="card border-0">
        <div class="position-relative">
          <span class="badge bg-danger text-white position-absolute top-0 start-0 m-2">$100.00</span>
          <img src="images/product4-300x300.png" class="card-img-top" alt="Product 3">
        </div>
        <div class="card-body text-center">
          <p class="text-muted small">3-5 years</p>
          <h5 class="card-title">Aenean tortor</h5>
          <p><s>$799.00</s> <span class="text-danger fw-bold">$699.00</span></p>
          <a href="#" class="btn btn-outline-danger btn-sm">Add to cart</a>
        </div>
      </div>
    </div>

    <!-- Product Card 4 -->
    <div class="col">
      <div class="card border-0">
        <img src="images/product6-300x300.png" class="card-img-top" alt="Product 4">
        <div class="card-body text-center">
          <p class="text-muted small">1-2 years</p>
          <h5 class="card-title">Iectus mauris</h5>
          <p class="fw-bold">$399.00</p>
          <a href="#" class="btn btn-outline-danger btn-sm">Add to cart</a>
        </div>
      </div>
    </div>

    <!-- Additional Product Cards (Repeat as needed) -->
    <div class="col">
      <div class="card border-0">
        <img src="images/product7-300x300.png" class="card-img-top" alt="Product 5">
        <div class="card-body text-center">
          <p class="text-muted small">0-1 years</p>
          <h5 class="card-title">Redlo Sonews</h5>
          <p class="fw-bold">$300.00</p>
          <a href="#" class="btn btn-outline-danger btn-sm">Add to cart</a>
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card border-0">
        <img src="images/product8-300x300.png" class="card-img-top" alt="Product 6">
        <div class="card-body text-center">
          <p class="text-muted small">3-5 years</p>
          <h5 class="card-title">Drasd donews</h5>
          <p class="fw-bold">$500.00</p>
          <a href="#" class="btn btn-outline-danger btn-sm">Add to cart</a>
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card border-0">
        <img src="images/product9-300x300.png" class="card-img-top" alt="Product 7">
        <div class="card-body text-center">
          <p class="text-muted small">2-3 years</p>
          <h5 class="card-title">Wusto donews</h5>
          <p class="fw-bold">$300.00</p>
          <a href="#" class="btn btn-outline-danger btn-sm">Add to cart</a>
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card border-0">
        <img src="images/product12-300x300.png" class="card-img-top" alt="Product 8">
        <div class="card-body text-center">
          <p class="text-muted small">2-3 years</p>
          <h5 class="card-title">Erat scelerisqu</h5>
          <p class="fw-bold text-danger">$1,199.00</p>
          <a href="#" class="btn btn-outline-danger btn-sm">Add to cart</a>
        </div>
      </div>
    </div>
  </div>
--%>
  <!--  Pagination
   <div class="d-flex justify-content-center mt-4">
       <button class="btn btn-outline-secondary me-2">&lt;</button>
       <button class="btn btn-outline-secondary">&gt;</button>
   </div>-->
</section>

<section class="container my-5">
  <!-- Shop By Age Section -->
  <div class="container text-center my-5">
    <h1 class="fw-bold">Shop By <span style="color: #ff6363;">Age</span></h1>

    <!-- First Row -->
    <div class="row mt-4">
      <div class="col-md-2 col-6 mb-4">
        <div class="circle-container">
          <img src="images/cate1.png" alt="0-1 Years" class="circle-img">
        </div>
        <p class="center-text">0-1 years</p>
      </div>
      <div class="col-md-2 col-6 mb-4">
        <div class="circle-container">
          <img src="images/cat2.png" alt="1-2 Years" class="circle-img">
        </div>
        <p>1-2 years</p>
      </div>
      <div class="col-md-2 col-6 mb-4">
        <div class="circle-container">
          <img src="images/cate3.png" alt="2-3 Years" class="circle-img">
        </div>
        <p>2-3 years</p>
      </div>
    </div>

    <!-- Second Row -->
    <div class="row">
      <div class="col-md-2 col-6 mb-4">
        <div class="circle-container">
          <img src="images/cat4.png" alt="3-5 Years" class="circle-img">
        </div>
        <p>3-5 years</p>
      </div>
      <div class="col-md-2 col-6 mb-4">
        <div class="circle-container">
          <img src="images/cat5.png" alt="5-8 Years" class="circle-img">
        </div>
        <p>5-8 years</p>
      </div>
      <div class="col-md-2 col-6 mb-4">
        <div class="circle-container">
          <img src="images/cat6.png" alt="8-12 Years" class="circle-img">
        </div>
        <p>8-12 years</p>
      </div>
    </div>
  </div>
</section>

<section class="container my-5">
  <!-- Limited Period Offer Section -->
  <div class="row">
    <!-- Content Section on the Left -->
    <div class="col-md-6">
      <div class="limited-offer">
        <h1>Limited Period Offer</h1>
        <p class="fs-5">Buy 2 and get 30% off</p>
        <div class="timer">
          <div class="time-box">
            <span>00</span>
            <div>Days</div>
          </div>
          <div class="time-box">
            <span>00</span>
            <div>Hours</div>
          </div>
          <div class="time-box">
            <span>00</span>
            <div>Minutes</div>
          </div>
          <div class="time-box">
            <span>00</span>
            <div>Seconds</div>
          </div>
        </div>
        <a href="#" class="shop-now-btn">Shop Now</a>
      </div>
    </div>

    <!-- Image Section on the Right -->
    <div class="col-md-6 d-flex justify-content-center align-items-center">
      <img src="images/Screenshot_2025-01-18_103333-removebg-preview.png" alt="Offer Image" class="img-fluid">
    </div>
  </div>


<%--
  <div class="container my-5">
    <div class="row">
      <div class="col-md-6">
        <div class="d-flex align-items-center p-5" style="background-color: #d4edda; border-radius: 8px;">
          <div class="text-left">
            <h3>Star War Toys</h3>
            <p>Libera dom condimentum mauris vel malesuada lorem nulla nec enim.</p>
            <button class="btn btn-danger">Shop Now</button>
          </div>
          <div class="ml-auto">
            <img src="images/Screenshot_2025-01-18_103504-removebg-preview.png" alt="Star War Toy" class="img-fluid" style="max-height: 200px;">
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="d-flex align-items-center p-5" style="background-color: #562256; border-radius: 8px;">
          <div class="ml-auto">
            <img src="images/Screenshot_2025-01-18_103504-removebg-preview%20(1).png" alt="Space Toy" class="img-fluid mb-3" style="max-height: 200px;">
          </div>
          <div class="text-left">
            <h3>Star War Toys</h3>
            <p>Libera dom condimentum mauris vel malesuada lorem nulla nec enim.</p>
            <button class="btn btn-danger">Shop Now</button>
          </div>

        </div>

        <!--<div class="d-flex1 bg-success text-light p-5">
            &lt;!&ndash; Image on the left &ndash;&gt;
            <div class="mr-3">
                <img src="images/Screenshot_2025-01-18_103504-removebg-preview%20(1).png" alt="Space Toy" class="img-fluid mb-3" style="max-height: 200px;">
            </div>
            &lt;!&ndash; Text on the right &ndash;&gt;
            <div class="d-flex flex-column justify-content-center">
                <h3>Space Toys</h3>
                <p>Libera dom condimentum mauris vel malesuada lorem nulla nec enim.</p>
                <button class="btn btn-danger">Shop Now</button>
            </div>
        </div>-->
      </div>
    </div>
  </div>
--%>

  <section id="footer">
  <footer id style="background-color: #ADD8E6; color: white; padding: 2rem 0;">
    <div class="container">
      <div class="row">
        <!-- Welcome Section -->
        <div class="col-md-3">
          <h5>Welcome</h5>
          <p>Porttitor pharetra ullamcorper. Praesent varius erat vitae nibh laoreet cursus. Donec suscipit gravida viverra.</p>
          <p>Phasellus id nibh arcu a varius enim tempus a.</p>
        </div>

        <!-- More About Store -->
        <div class="col-md-3">
          <h5>More About Store</h5>
          <ul class="list-unstyled">
            <li>Multiple Branches</li>
            <li>Take Franchise</li>
            <li>Scheduled Offers</li>
            <li>FAQ</li>
            <li>More Links</li>
            <li>Terms</li>
          </ul>
        </div>

        <!-- Key Links -->
        <div class="col-md-3">
          <h5>Key Links</h5>
          <ul class="list-unstyled">
            <li>Order</li>
            <li>Download</li>
            <li>Address</li>
            <li>Logout</li>
            <li>Lost Password</li>
            <li>Register</li>
          </ul>
        </div>

        <!-- Contact Details -->
        <div class="col-md-3">
          <h5>Contact Details</h5>
          <p>Wheeling, West Virginia, 26003</p>
          <p>Contact: 304-559-3023</p>
          <p>Email: shopnow@store.com</p>
          <p>Email: contact@ama.com</p>
        </div>
      </div>

      <!-- Copyright Section -->
      <div class="row mt-4">
        <div class="col text-center">
          <p class="mb-0">&copy; Copyright | Th Shop Mania | Developed by ThemeHunk</p>
        </div>
      </div>
    </div>
  </footer>
  </section>

</section>
</body>




  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">


  <script src="JQ/jquery-3.7.1.min.js"></script>


</html>


