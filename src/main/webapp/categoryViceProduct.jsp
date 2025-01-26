<%@ page import="lk.ijse.assignment_01_jsp.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: LIHINI
  Date: 1/26/2025
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@400;700&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

    <style>
        body {
            font-family: 'Baloo 2', cursive !important;
        }

        .py-5 {
            padding-top: 0rem !important;
        }

        .hero-section {
            padding-top: 0;
            background-color: #f8f2eb;
        }

        .hero-section h1 {
            color: #6c757d;
            font-weight: lighter;
            font-size: 4rem;
        }

        .hero-section span {
            color: orange;
        }

        .hero-section img {
            margin-left: 30%;
            margin-top: 54px;
            max-width: 100%;
        }

        .badge-warning {
            background-color: #f0ad4e;
        }

        .navbar-brand img {
            width: 50px;
        }

        .nav-link {
            font-size: 1.1rem;
        }

        #text{
            margin-top: -20px;
        }

        .btn-primary {
            margin-left: 15px;
            border-color: #6f6565;
            background-color: #bfb6a8;

        }

        .btn-primary:hover {
            background-color: #f8c78b;
        }

        footer {
            background-color: #f8f2eb;
        }

        footer p {
            font-size: 0.9rem;
        }

        #cardSec{
            padding:20px;
        }
        #cardset{
            padding-left:50px;
            padding-right:50px;
            display: flex;
            justify-content: center;
            flex-direction: row;
            flex-wrap: wrap;
        }
        #cardSec h1{
            margin-left: 100px;
        }

        #cardset {
            padding-left: 50px;
            padding-right: 50px;
            display: flex;
            justify-content: center;
            flex-direction: row;
            flex-wrap: wrap;
        }

        .card {
            margin: 30px;
            width: 14rem;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 15px;
            font-family: 'Baloo 2', cursive !important;
            transition: transform 0.3s ease, box-shadow 0.3s ease;

        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card h5 {
            font-size: 2.2rem;
            color: #333;
            font-family: 'Baloo 2', cursive !important;
        }

        .card-price {
            color: #c2973b;
            font-size: 1.4rem;
            font-family: 'Baloo 2', cursive !important;
        }

        .btn-add-cart {
            width: 50%;
            padding: 10px 0;
            font-weight: lighter;
            border-radius: 5px;
            border: 2px solid #333;
            background-color: transparent;
            color: #333;
            transition: transform 0.3s ease, background-color 0.3s ease, color 0.3s ease;
            margin-bottom: 10px;
        }

        .btn-add-cart:hover {
            background-color: #e58f48; /* Orange color on hover */
            color: #fff; /* White text on hover */
            border-color: #592e0f; /* Border changes to match the button color */
            transform: scale(1.2);
        }


        .btn-heart {
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid #333;
            background-color: transparent;
            transition: transform 0.3s ease, background-color 0.3s ease, color 0.3s ease;
        }

        /* Heart Icon Default Style */
        .btn-heart i {
            color: #554e57; /* Initial heart color */
            font-size: 2.4rem;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        /* Hover Effects */
        .btn-heart:hover {
            border-color: #ffffff;
            background-color: #d6aaec; /* Orange background on hover */
            transform: scale(1.2); /* Scale button up on hover */
        }

        .btn-heart:hover i {
            color: #f108e6; /* Change heart color to white on hover */
            transform: scale(1.2); /* Slightly scale up the heart icon */
        }
        .categoryName {
            font-size: 75px;
            color: #443e30;
            border-radius: 30px;
            background: linear-gradient(90deg, rgba(244,225,176,1) 0%, rgba(255,225,198,1) 35%, rgba(252,245,238,1) 62%, rgba(255,255,255,1) 100%);        }

    </style>

</head>
<body>
<%
    String userId = request.getParameter("userId");
    System.out.println(userId + " :User ID");
    boolean isLoggedIn = (userId != null);
    System.out.println(isLoggedIn + " : isLoggedIn");
    if (userId != null) {
        System.out.println("logged in");
%>
<script>
    console.log("Script loaded.");

    // Pass the isLoggedIn value as a string to JS
    let loggedIn = "<%= isLoggedIn ? "true" : "false" %>";
    console.log(loggedIn + " : loggedIn status");

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

<!-- Header / Navbar -->
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

<a href="admin_dashboard.jsp">admin </a>
<!-- Search Bar -->
<div class="container my-4">
    <%
        List<Category> categoriess = (List<Category>) request.getAttribute("categories");
    %>

    <!-- Dropdown for category names -->
    <div class="input-group mb-3">
        <!-- Dropdown to select category -->
        <form action="getProductViceCategory" id="searchForm">
            <select name="categoryId" id="categoryDropdown" class="form-select mb-4" onchange="document.getElementById('searchForm').submit()">
                <option value="all">All Categories</option>
                <%
                    if (categoriess != null) {
                        for (Category category : categoriess) {
                %>
                <option value="<%= category.getId() %>"><%= category.getName() %> </option>
                <%
                        }
                    }
                %>
            </select>

        </form>

    </div>
</div>


<!-- Hero Section -->
<section class="hero-section py-5">
    <div class="container">
        <div class="row align-items-center">


            <div class="col-md-6" id="text">
                <h1 class="display-4">Best Destination For <span>Your Pets</span></h1>
                <p>categories</p>
                <a href="#" class="btn btn-primary">Shop Now</a>
            </div>

            <div class="col-md-6">
                <img src="images/banner-img.png" alt="Dog with toy" height="450" width="350" />
            </div>
        </div>
    </div>
</section>

<button id="testbtn"> click me</button>


<Section id="cardSec">
    <div id="cardset" class="row g-4"

    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        String name=request.getParameter("categoryId");
    %>
    <h1 class="categoryName mb-4"><%= name %></h1>

    <%

        if (products != null) {
            for (Product product : products) {

    %>

    <div class="card" style="width: 15rem; padding: 15px;">
        <img src="<%= request.getContextPath() %>/uploads/<%= product.getImageUrl() %>" alt="Product Image" class="card-img-top" style="height: 180px; object-fit: cover; margin-bottom: 15px;">
        <h5 class="card-title"><%= product.getName() %></h5>
        <p class="card-price">Rs <%= product.getPrice() %>/=</p>

        <div style="display: flex; justify-content: space-between;">
            <form class="productForm" style="display: none;" method="get" action="getSingleProduct">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <input type="hidden" name="userId" value="<%= userId %>">
            </form>
            <button class="btn btn-add-cart" onclick="submit(this)">Get Now</button>
            <button class="btn-heart" data-bs-toggle="modal" data-bs-target="#addToCartModal<%= product.getId() %>">
                <i class="bi bi-cart"></i>
            </button>
        </div>
    </div>

    <!-- Modal for Adding to Cart -->
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

        }else {
            System.out.println("product na");
        }
    %>


    </div>
</Section>

<footer class="text-center py-4">
    <div class="container">
        <p>&copy; 2025 Waggy Pet Shop. All Rights Reserved.</p>
    </div>
</footer>


<script src="JQ/jquery-3.7.1.min.js"></script>

<script>
    let log;
    $("#testbtn").on("click", function() {
        console.log("clicked");
        log = <%=userId%>;
        console.log(log);
    })

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

    function submit(button) {
        console.log("me hutta en na");
        console.log(log,  "awa")
        if (log != null) {
            console.log("null na")
            $(button).siblings('.productForm').submit();
        }else {
            alert("login first");
        }
    }
</script>

<!-- Footer -->
<script>
    function addCart(button) {
        var form = $(button).closest('form');
        var productId = form.find('input[name="productId"]').val();
        var quantity = form.find('input[name="quantity"]').val();

        console.log("Adding to cart:", productId, quantity);

        $.ajax({
            url: 'http://localhost:8080/E_Commerrce_Web_war_exploded/cartSave',
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

