<%--
  Created by IntelliJ IDEA.
  User: LIHINI
  Date: 1/25/2025
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Orders" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Orders" %>
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
<header class="bg-light py-3 border-bottom">
    <div class="container d-flex justify-content-between align-items-center">
        <img src="images/toys-mania-42.png" alt="Toys Store Logo">
        <nav>
            <ul class="nav">
                <li class="nav-item"><a class="nav-link text-dark" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="#">Orders</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="#">Products</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="#">Category</a></li>
            </ul>
        </nav>
        <a href="admin_dashboard.jsp" class="text-dark"><i class="bi bi-box-arrow-right"></i></a>
    </div>
</header>

<main class="container mt-5">
    <h2 class="text-center mb-4">Order View</h2>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Customer ID</th>
                <th>Product ID</th>
                <th>Qty</th>
                <th>Price</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Orders> orders = (List<Orders>) request.getAttribute("orders");
                if (orders != null && !orders.isEmpty()) {
                    for (Orders order : orders) {
            %>
            <tr>
               <%-- <td><%= orders.get %></td>
                <td><%= orders.getCustomerId() %></td>
                <td><%= orders.getProductId() %></td>
                <td><%= orders.getQuantity() %></td>
                <td><%= orders.getPrice() %></td>--%>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5" class="text-center">No orders found</td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</main>

<footer class="py-4 bg-dark text-white">
    <div class="container text-center">
        &copy; 2025 Toys Store. All Rights Reserved.
    </div>
</footer>

<script>
    // Add any required JavaScript for dynamic modal functionality or future enhancements
</script>
</body>
</html>
