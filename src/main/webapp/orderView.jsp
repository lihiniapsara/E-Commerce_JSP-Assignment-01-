<%--
  Created by IntelliJ IDEA.
  User: LIHINI
  Date: 1/25/2025
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Orders" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.OrderDetail" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        main {
            flex: 1;
        }
        footer {
            background-color: #f8f9fa;
            border-top: 1px solid #dee2e6;
        }
    </style>
</head>
<body>

<!-- Header / Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="images/mainnew.png" height="40" width="40"/> Waggy Pet Shop
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="admin_dashboard.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adduser">User</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addcategory">Category</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="getProductList">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="orderView.jsp">Order</a>
                </li>
            </ul>
            <div class="d-flex align-items-center">
                <!-- Logout Icon -->
                <a href="#" id="logoutLink" class="nav-link"><i class="bi bi-box-arrow-right"></i></a>
            </div>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6" id="text">
                <br>
                <br>
                <h1>order <span>view!</span></h1>
                <h2>view All <span>orders here</span></h2>

            </div>
        </div>
    </div>
</section>

<br><br>
<section class="product-management-section py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <!-- Items Table -->
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                    </thead>
                    <%
                        List<OrderDetail> orders = (List<OrderDetail>) request.getAttribute("odList");
                        if (orders != null && !orders.isEmpty()) {
                            for (OrderDetail order : orders) {

                    %>

                    <tbody>
                    <tr>
                        <td><%= order.getId() %></td>
                        <td><%= order.getOrder().getUser().getUserName() %></td>
                        <td><%= order.getProduct().getName() %></td>
                        <td><%= order.getPrice() %></td>
                        <td><%= order.getQuantity() %></td>
                        <td><%= order.getOrder().getTotal() %></td>

                    </tr>
                    <!-- More items can be dynamically added here -->
                    </tbody>
                    <%
                            }
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    document.getElementById("logoutLink").addEventListener("click", function(event) {
        // Prevent the default link behavior
        event.preventDefault();

        // Use SweetAlert2 for confirmation
        Swal.fire({
            title: 'Are you sure?',
            text: "You will be logged out!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, log out!'
        }).then((result) => {
            // If the user confirms, redirect to index.jsp
            if (result.isConfirmed) {
                // Redirect after showing success message
                window.location.href = "index.jsp";
            }
        });
    });
</script>

</body>
</html>
