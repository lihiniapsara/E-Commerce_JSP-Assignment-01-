<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Product" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Category" %><%--
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
    .custom-footer {
      background-color: #293944; /* Example of a custom blue color */
    }


    /* Ensure the header content is aligned in a row */
    header .container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap; /* Allow content to wrap on smaller screens */
    }

    /* Category Dropdown container */
    header .container .my-4 {
      display: flex;
      align-items: center;
      margin-right: 20px; /* Space to the right of the dropdown */
    }

    /* Category Dropdown itself */
    #categoryDropdown {
      width: 200px;
      margin-left: 20px; /* Optional: Space between other elements and dropdown */
    }

    /* Ensure the dropdown doesn't have excessive margin */
    input-group {
      display: flex;
    }


    /* Navigation Styling */
    header nav {
      display: flex;
      justify-content: center;  /* Center align the navigation items */
      width: 100%;  /* Ensure navigation takes up full width */
    }

    header nav ul {
      display: flex;
      gap: 20px;  /* Space between each nav item */
      padding: 0;
      margin: 0;
      list-style: none;
    }

    header nav .nav-item {
      display: flex;
      align-items: center;
    }

    header nav .nav-link {
      text-decoration: none;
      color: #333;  /* Adjust the color if necessary */
      font-weight: 500;  /* Optional: Adjust font weight */
      transition: color 0.3s ease;
    }

    header nav .nav-link:hover {
      color: #007bff;  /* Change color on hover */
    }


    .hero-section .btn-light {
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .hero-section .btn-light:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }

    .hero-section {
      background-image: linear-gradient(to right, #486e98, #00bfff); /* Blue gradient */
    }

    .hero-section h1 {
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* Text shadow for emphasis */
    }


    /* Center the button within its parent container */
    #buttonWrapper {
        display: flex;
        justify-content: center; /* Horizontally center the button */
    }

    #heroButton {
        font-family: 'Poppins', sans-serif; /* Optional custom font */
        font-weight: bold;
        transition: all 0.3s ease-in-out;
    }

    /* Button hover effect */
    /*#heroButton:hover {
        background-color: #0d6efd; !* Primary color background *!
        color: #ffffff; !* White text on hover *!
        transform: scale(1.1); !* Slight zoom-in effect *!
    }*/


    .time-box {
      display: inline-flex;
      flex-direction: column;
      align-items: center;
      justify-content-center;
      border: 2px solid #0d6efd;
      border-radius: 8px;
      padding: 10px 15px;
      min-width: 70px;
    }

    .time-box span {
      font-size: 24px;
      font-weight: bold;
      color: #0d6efd;
    }

    .time-box div {
      font-size: 14px;
      color: #6c757d;
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

    body {
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }
    #footer {
      margin-top: auto;
    }

    /* Background color for the Shop By Age Section */
    /* Background color for the Shop By Age Section */
    #shop-by-age {
      background: linear-gradient(135deg, #ff00ff, #fc027f);  /* Light grey to slightly darker grey gradient */
      padding: 30px 0;
      border-radius: 10px; /* Optional: rounded corners */
    }

    #shop-by-age h1 {
      color: #333; /* Dark color for the header */
    }

    #shop-by-age p {
      color: #555; /* Slightly lighter color for text */
    }

    /* Background color for the Limited Period Offer Section */
    #limited-offer {
      background: linear-gradient(135deg, #ffefdb, #fbd97b); /* Soft yellow to light orange gradient */
      padding: 30px ; /* Remove padding */
      border-radius: 10px; /* Optional: rounded corners */
    }

    #limited-offer .row {
      margin: 0; /* Remove row margin */
    }

    #limited-offer .col-md-6 {
      padding: 0; /* Remove column padding */
    }

    .time-box {
      background: linear-gradient(135deg, #f0f8ff, #d9ebff); /* Light blue to even lighter blue gradient */
      padding: 10px;
      border-radius: 5px;
      text-align: center;
      margin: 0; /* Remove margin */
    }

    .btn-primary {
      background: linear-gradient(135deg, #ff6363, #ff1f1f); /* Red to darker red gradient for the button */
      border-color: #ff6363;
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
<header class="bg-light py-0 position-fixed w-100 border-bottom">
  <div class="container">
    <div class="d-flex flex-grow-1 justify-content-between align-items-center">
      <!-- Left Section -->
      <div class="d-flex align-items-center">
        <img src="images/toys-mania-42.png" alt="Toys Store Logo">
      </div>

      <!-- Right Section: Navigation -->
      <nav class="d-flex flex-grow-1 justify-content-center align-items-center">
        <ul class="nav ">
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
      <div class="container my-4">
        <%
          List<Category> categoriess = (List<Category>) request.getAttribute("categories");

        %>

        <!-- Dropdown for category names -->
        <div class="input-group mb-3">
          <!-- Dropdown to select category -->
          <form action="getProductViceCategory" id="searchForm">
            <select name="categoryId" id="categoryDropdown" class="form-select mb-4" onchange="handleCategoryChange()">
              <option value="all">All Categories</option>
              <%
                if (categoriess != null) {
                  for (Category category : categoriess) {
              %>
              <option value="<%= category.getId() %>"><%= category.getName() %></option>
              <%
                }
              }else {
              %>

              <option disabled>No categories available</option>
              <%
                }
              %>
            </select>

          </form>

        </div>
      </div>

      <!-- Icons Section -->
      <div class="d-flex">

        <a href="#" class="text-dark me-3"><i class="bi bi-heart"></i></a>
        <a href="registration.jsp" class="text-dark me-3" style="display: block"><i class="bi bi-person"></i></a>
        <a href="#" class="nav-link position-relative me-3" onclick="ifnavigate()"><i class="bi bi-cart"></i></a>
        <a href="getAllProductCustomerView" class="text-dark me-3"><i class="bi bi-box-arrow-right"></i></a>
      </div>
    </div>
  </div>
</header>

<a href="admin_dashboard.jsp">Admin Dashboard</a>

<!-- Hero Section -->

<section class="hero-section d-flex align-items-center justify-content-between bg-primary text-white py-5 mt-3">
  <div class="container">
    <div class="row align-items-center">
      <!-- Hero Text Content -->
      <div class="col-md-6 text-center text-md-start">
        <h1 class="display-3 fw-bold" style="font-family: 'Poppins', sans-serif;">Best Toys For Kids</h1>
        <p class="fs-4" style="font-family: 'Roboto', sans-serif;">Starting from <span class="fw-bold">$9</span></p>
        <!-- Centered Button -->
        <div id="buttonWrapper">
          <button id="heroButton" class="btn btn-light btn-lg shadow mt-3" style="color: #0d6efd;">
            <i class="bi bi-cart-plus me-2"></i>Shop Now
          </button>
        </div>
      </div>

      <!-- Hero Image -->
      <div class="col-md-6 text-center">
        <img src="images/mainnew.png" alt="Baby with Teddy" class="img-fluid rounded shadow">
      </div>
    </div>
  </div>
</section>
<a href="admin_dashboard.jsp">Admin Dashboard</a>

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


        <div style="display: flex; justify-content: space-between;">
          <form class="productForm" style="display: none;" method="get" action="getSingleProduct">
            <input type="hidden" name="productId" value="<%= product.getId() %>">
            <input type="hidden" name="userId" value="<%= userId %>">
          </form>
          <button class="btn btn-add-cart" onclick="submit(this,'.productForm')">Get Now</button>
          <button class="btn-heart" data-bs-toggle="modal" data-bs-target="#addToCartModal<%= product.getId() %>">
            <i class="bi bi-cart"></i>
          </button>
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

      function ifnavigate() {
        let userid = <%= userId %>;  // Initialize userid here before using it
        console.log(userid, 'cart ekata yanawa nadda kiyna eka');

        if (userid == null || userid === "") {
          alert("Please login first");
        } else {
          window.location.href = "getCartData";
        }
      }

      function addCart(button) {
        console.log(loginId, ' login id for add cart')


        if (loginId != null) {
          var form = $(button).closest('form');
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
          success: function (response) {
            // Handle success (e.g., show a message or update cart UI)
            alert('Product added to cart successfully!');
            // Optionally, close the modal
            $(form).closest('.modal').modal('hide');
          },
          error: function (xhr, status, error) {
            // Handle error
            alert('Error adding product to cart: ' + error);
          }
        });
      }else {
        alert("Please login first");
      }
      }

      function submit(button, link) {
        console.log("me hutta en na");
        let loginId = <%= userId %>;
        console.log(loginId, "awa")
        console.log(link, "link eka")
        if (loginId != null) {
          console.log("null na")
          $(button).siblings(link).submit();
        } else {
          alert("login first");
        }
      }

      function handleCategoryChange() {
        let dropdown = document.getElementById('categoryDropdown');
        let selectedValue = dropdown.value;

        if (selectedValue !== 'all') {
          document.getElementById('searchForm').submit();
        } else {
          // Optionally handle 'all' value differently
          console.log('All categories selected, not submitting the form.');
        }
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

<section id="shop-by-age" class="container p-0 my-0">
  <!-- Shop By Age Section -->
  <div class="container text-center p-0 my-0">
    <h1 class="fw-bold">Shop By <span style="color: #0a0a0a;">Age</span></h1>

    <!-- First Row -->
    <div class="row mt-4">
      <div class="col-md-2 col-6 mb-0">
        <div class="circle-container">
          <img src="images/cate1.png" alt="0-1 Years" class="circle-img">
        </div>
        <p class="center-text">0-1 years</p>
      </div>
      <div class="col-md-2 col-6 mb-0">
        <div class="circle-container">
          <img src="images/cat2.png" alt="1-2 Years" class="circle-img">
        </div>
        <p>1-2 years</p>
      </div>
      <div class="col-md-2 col-6 mb-0">
        <div class="circle-container">
          <img src="images/cate3.png" alt="2-3 Years" class="circle-img">
        </div>
        <p>2-3 years</p>
      </div>
    </div>

    <!-- Second Row -->
    <div class="row mb-0">
      <div class="col-md-2 col-6 mb-0">
        <div class="circle-container">
          <img src="images/cat4.png" alt="3-5 Years" class="circle-img">
        </div>
        <p>3-5 years</p>
      </div>
      <div class="col-md-2 col-6 mb-0">
        <div class="circle-container">
          <img src="images/cat5.png" alt="5-8 Years" class="circle-img">
        </div>
        <p>5-8 years</p>
      </div>
      <div class="col-md-2 col-6 mb-0">
        <div class="circle-container">
          <img src="images/cat6.png" alt="8-12 Years" class="circle-img">
        </div>
        <p>8-12 years</p>
      </div>
    </div>
  </div>
</section>

<section id="limited-offer" class="container my-0">
  <!-- Limited Period Offer Section -->
  <div class="row align-items-center">
    <!-- Content Section on the Left -->
    <div class="col-md-6 text-center text-md-start">
      <h1 class="fw-bold">Limited Period Offer</h1>
      <p class="fs-5">Buy 2 and get <span class="text-danger fw-bold">30% off</span></p>
      <div class="d-flex justify-content-center justify-content-md-start gap-3 mt-4">
        <div class="time-box">
          <span class="fs-3 fw-bold text-primary">28</span>
          <div>Days</div>
        </div>
        <div class="time-box">
          <span class="fs-3 fw-bold text-primary">15</span>
          <div>Hours</div>
        </div>
        <div class="time-box">
          <span class="fs-3 fw-bold text-primary">38</span>
          <div>Minutes</div>
        </div>
        <div class="time-box">
          <span class="fs-3 fw-bold text-primary">22</span>
          <div>Seconds</div>
        </div>
      </div>
      <a href="#" class="btn btn-primary mt-4 px-4 py-2">Shop Now</a>
    </div>

    <!-- Image Section on the Right -->
    <div class="col-md-6 text-center">
      <img src="images/WhatsApp%20Image%202025-01-26%20at%2019.25.21_312eb3dd.jpg" alt="Offer Image" class="img-fluid rounded shadow-sm">
    </div>
  </div>
</section>


<%--<section class="container my-5">
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
  <div class="row align-items-center">
    <!-- Content Section on the Left -->
    <div class="col-md-6 text-center text-md-start">
      <h1 class="fw-bold">Limited Period Offer</h1>
      <p class="fs-5">Buy 2 and get <span class="text-danger fw-bold">30% off</span></p>
      <div class="d-flex justify-content-center justify-content-md-start gap-3 mt-4">
        <div class="time-box">
          <span class="fs-3 fw-bold text-primary">28</span>
          <div>Days</div>
        </div>
        <div class="time-box">
          <span class="fs-3 fw-bold text-primary">15</span>
          <div>Hours</div>
        </div>
        <div class="time-box">
          <span class="fs-3 fw-bold text-primary">38</span>
          <div>Minutes</div>
        </div>
        <div class="time-box">
          <span class="fs-3 fw-bold text-primary">22</span>
          <div>Seconds</div>
        </div>
      </div>
      <a href="#" class="btn btn-primary mt-4 px-4 py-2">Shop Now</a>
    </div>

    <!-- Image Section on the Right -->
    <div class="col-md-6 text-center">
      <img src="images/Screenshot_2025-01-18_103333-removebg-preview.png" alt="Offer Image" class="img-fluid rounded shadow-sm">
    </div>
  </div>
</section>--%>

<section id="footer">
  <footer class="custom-footer text-white py-5">
    <div class="container">
      <div class="row">
        <!-- Welcome Section -->
        <div class="col-md-3 mb-4">
          <h5 class="fw-bold">Welcome</h5>
          <p class="small">Porttitor pharetra ullamcorper. Praesent varius erat vitae nibh laoreet cursus. Donec suscipit gravida viverra.</p>
        </div>

        <!-- More About Store -->
        <div class="col-md-3 mb-4">
          <h5 class="fw-bold">More About Store</h5>
          <ul class="list-unstyled small">
            <li><a href="#" class="text-white text-decoration-none">Multiple Branches</a></li>
            <li><a href="#" class="text-white text-decoration-none">Take Franchise</a></li>
            <li><a href="#" class="text-white text-decoration-none">Scheduled Offers</a></li>
            <li><a href="#" class="text-white text-decoration-none">FAQ</a></li>
          </ul>
        </div>

        <!-- Key Links -->
        <div class="col-md-3 mb-4">
          <h5 class="fw-bold">Key Links</h5>
          <ul class="list-unstyled small">
            <li><a href="#" class="text-white text-decoration-none">Order</a></li>
            <li><a href="#" class="text-white text-decoration-none">Download</a></li>
            <li><a href="#" class="text-white text-decoration-none">Logout</a></li>
          </ul>
        </div>

        <!-- Contact Details -->
        <div class="col-md-3 mb-4">
          <h5 class="fw-bold">Contact Details</h5>
          <p class="small">Wheeling, West Virginia, 26003</p>
          <p class="small">Contact: 304-559-3023</p>
          <p class="small">Email: <a href="mailto:shopnow@store.com" class="text-white text-decoration-none">shopnow@store.com</a></p>
        </div>
      </div>

      <!-- Divider -->
      <hr class="bg-white opacity-50">

      <!-- Copyright Section -->
      <div class="row mt-3">
        <div class="col text-center">
          <p class="small mb-0">&copy; 2025 | <strong>Th Shop Mania</strong> | Developed by <a href="#" class="text-white text-decoration-none fw-bold">ThemeHunk</a></p>
        </div>
      </div>
    </div>
  </footer>
</section>
</body>

<script>
  function addCart(button) {
    var form = $(button).closest('form');
    var productId = form.find('input[name="productId"]').val();
    var quantity = form.find('input[name="quantity"]').val();

    console.log("Adding to cart:", productId, quantity);

    $.ajax({
      url: 'http://localhost:8080/Assignment_01_JSP_war_exploded/getAllProductCustomerView/cartSave',
      method: 'POST',
      data: {
        productId: productId,
        quantity: quantity,
        userId : '<%= userId %>'
      },
      success: function(response) {
        console.log('Success:', response);
        alert('Product added to cart successfully!');
        $(form).closest('.modal').modal('hide');
      },
      error: function(xhr, status, error) {
        console.log('Error:', xhr.responseText);
        alert('Error adding product to cart: ' + error);
      }
    });
  }

  function submitForm(button) {
    var form = button.parentElement.querySelector('.productForm');
    form.submit();
  }
  function isloggin() {
    var loginLink = <%=isLoggedIn%>
    if (loginLink) {
      console.log("add to cart");
    }else {
      console.log('logging first')

    }
  }
</script>



  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">


  <script src="JQ/jquery-3.7.1.min.js"></script>


</html>


