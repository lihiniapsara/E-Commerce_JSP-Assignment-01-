<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Cart" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Product" %><%--
  <%--
  Created by IntelliJ IDEA.
  User: LIHINI
  Date: 1/26/2025
  Time: 3:41 PM
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
            background-color: #ef8c8c; /* Orange background on hover */
            transform: scale(1.2); /* Scale button up on hover */
        }

        .btn-heart:hover i {
            color: #f10808; /* Change heart color to white on hover */
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
    String userId = (String) session.getAttribute("userId");
    System.out.println(userId + " : User ID placeorder.jsp");

    boolean isLoggedIn = (userId != null);
    if (isLoggedIn) {
        System.out.println("User is logged in");
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
    System.out.println("User is not logged in");
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

<section class="hero-section py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6" id="text">
                <h1 class="display-4">Your <span>Fav</span></h1>
                <p>Cart </p>
            </div>
        </div>
    </div>
</section>

<section id="cardSec">
    <div id="cardset" class="row g-4">
        <%
            List<Cart> cartList = (List<Cart>) request.getAttribute("cartList");
            List<Product> products = (List<Product>) request.getAttribute("productsforcart");

            if (products != null && cartList != null) {
                for (Product product : products) {
                    for (Cart cart : cartList) {
                        if (cart.getProduct().getId() == product.getId()) {
        %>
        <div class="card" style="width: 15rem; padding: 15px;">
            <img src="<%= request.getContextPath() %>/uploads/<%= product.getImageUrl() %>" alt="Product Image" class="card-img-top" style="height: 180px; object-fit: cover; margin-bottom: 15px;">
            <h5 class="card-title"><%= product.getName() %></h5>
            <p class="card-price">Rs <%= product.getPrice() %>/=</p>

            <div style="display: flex; justify-content: space-between;">
                <button class="btn btn-add-cart" data-bs-toggle="modal" data-bs-target="#orderModal-<%= product.getId() %>" style="font-size: 1rem;">
                    Place Order
                </button>
                <button class="btn-heart" data-bs-toggle="modal" data-bs-target="#deleteModal<%= product.getId() %>">
                    <i class="bi bi-trash"></i>
                </button>

            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="deleteModal<%= product.getId() %>" tabindex="-1" aria-labelledby="deleteModalLabel<%= product.getId() %>" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel<%= product.getId() %>">Delete Product <%= product.getName()%></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="deleteCart" method="post">
                            <!-- Hidden field to pass the product ID -->
                            <input type="hidden" name="cartId" value="<%= cart.getId() %>">
                            <p>Are you sure you want to delete this product?</p>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <!-- Submit the form to delete the product -->
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for Order Confirmation -->
        <div class="modal fade" id="orderModal-<%= product.getId() %>" tabindex="-1" aria-labelledby="orderModalLabel-<%= product.getId() %>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content rounded-3 shadow-lg">
                    <div class="modal-header border-0" style="background-color: #2c3e50; color: #fff;">
                        <h5 class="modal-title" id="orderModalLabel-<%= product.getId() %>">🛒 Confirm Your Order</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4">
                        <!-- Order Summary Section -->
                        <h6 class="fw-bold" style="color: #34495e;">Product: <%= product.getName() %></h6>
                        <p style="color: #7f8c8d;">Description: <%= product.getDescription() %></p>
                        <p class="fw-bold text-primary">Price: Rs <%= product.getPrice() %>/=</p>

                        <!-- Quantity Control -->
                        <div class="d-flex align-items-center justify-content-between">
                            <p style="color: #95a5a6;">Quantity: <span id="orderQuantity" class="fw-bold">In Stock : <%= product.getQuantity() %></span></p>
                            <button class="btn btn-outline-secondary btn-sm" id="decreaseQty" style="border-radius: 50%; width: 32px; height: 32px;" onclick="updateQuantity(-1,<%= product.getPrice() %>)">-</button>
                            <input type="text" id="quantityInput" class="form-control text-center" value="1" style="width: 50px;" readonly>
                            <button class="btn btn-outline-secondary btn-sm" id="increaseQty" style="border-radius: 50%; width: 32px; height: 32px;" onclick="updateQuantity(1)">+</button>
                        </div>
                        <hr>
                        <p class="fw-bold" style="color: #16a085;">Total: Rs <span id="orderTotal"><%= product.getPrice() %></span>/=</p>
                    </div>

                    <div class="modal-footer border-0 d-flex justify-content-between">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" onclick="document.getElementById('placeOrderForm-<%= product.getId() %>').submit()">Place Order</button>
                    </div>
                    <form action="placeOrder" method="post" id="placeOrderForm-<%= product.getId() %>">
                        <input type="hidden" name="qty" value="1" id="qty-<%= product.getId() %>">
                        <input type="hidden" name="pid" value="<%= product.getId() %>">
                        <input type="hidden" name="uid" value="<%= userId %>">
                        <input type="hidden" name="total" value="1" id="totalinput-<%= product.getId() %>">
                        <input type="hidden" name="price" value="<%= product.getPrice() %>">
                    </form>

                </div>
            </div>
        </div>

        <%
                        }
                    }
                }
            } else {
                System.out.println("Product or Cart list is null!");
            }
        %>
    </div>
</section>
<!-- Modal -->

<script src="JQ/jquery-3.7.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function updateQuantity(change, price) {
        const quantityInput = document.getElementById("quantityInput");
        const totalElement = document.getElementById("orderTotal");
        const totalInput = document.getElementById("totalinput");

        let currentQuantity = parseInt(quantityInput.value);

        // Ensure quantity does not go below 1 when decreasing
        if ((change < 0 && currentQuantity > 1) || change > 0) {
            // Update the quantity
            currentQuantity += change;
            quantityInput.value = currentQuantity;

            // Update the total price
            const newTotal = currentQuantity * price;
            totalElement.textContent = newTotal;
            totalInput.value = newTotal; // Update the hidden input for form submission
        }
    }

</script>

</body>

</html>
