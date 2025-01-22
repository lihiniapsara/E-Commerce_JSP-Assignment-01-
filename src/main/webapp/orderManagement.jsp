<%@ page import="jakarta.persistence.criteria.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: LIHINI
  Date: 1/22/2025
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Header Section -->
<header class="bg-primary text-white p-3">
    <div class="container d-flex justify-content-between align-items-center">
        <h1>Order Management</h1>
        <nav>
            <a href="home.jsp" class="text-white me-3">Home</a>
            <a href="user_management.jsp" class="text-white me-3">Users</a>
            <a href="category_management.jsp" class="text-white me-3">Category</a>
            <a href="product_management.jsp" class="text-white me-3">Products</a>
            <a href="order_management.jsp" class="text-white me-3">Orders</a>
            <a href="logout.jsp" class="text-white"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </nav>
    </div>
</header>

<!-- Main Section -->
<main class="container my-5">
    <h2 class="mb-4">Create New Order</h2>

    <!-- Order Form -->
    <form action="addOrder" method="post">
        <div class="row">
            <div class="col-md-3 mb-3">
                <label for="customerId" class="form-label">Customer ID</label>
                <input type="text" class="form-control" id="customerId" name="customerId" required>
            </div>
            <div class="col-md-3 mb-3">
                <label for="productId" class="form-label">Product ID</label>
                <input type="text" class="form-control" id="productId" name="productId" required>
            </div>
            <div class="col-md-2 mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" class="form-control" id="price" name="price" required>
            </div>
            <div class="col-md-2 mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" required>
            </div>
            <div class="col-md-2 d-flex align-items-end mb-3">
                <button type="submit" class="btn btn-success">Add Order</button>
            </div>
        </div>
    </form>

    <h3 class="my-4">Order List</h3>

    <!-- Order Table -->
    <table class="table table-bordered">
        <thead class="table-dark">
        <tr>
            <th>Order ID</th>
            <th>Customer ID</th>
            <th>Product ID</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Assuming you have a list of orders in the request
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) {
        %>
        <tr>
            <%--<td><%= order.getOrderId() %></td>
            <td><%= order.getCustomerId() %></td>
            <td><%= order.getProductId() %></td>
            <td><%= order.getPrice() %></td>
            <td><%= order.getQuantity() %></td>
            <td><%= order.getTotalPrice() %></td>
            <td>
                <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editOrderModal"
                        data-orderid="<%= order.getOrderId() %>"
                        data-customerid="<%= order.getCustomerId() %>"
                        data-productid="<%= order.getProductId() %>"
                        data-price="<%= order.getPrice() %>"
                        data-quantity="<%= order.getQuantity() %>">
                    Edit
                </button>
                <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteOrderModal"
                        data-orderid="<%= order.getOrderId() %>">
                    Delete
                </button>
            </td>--%>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7" class="text-center">No orders found</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</main>

<!-- Edit Order Modal -->
<div class="modal fade" id="editOrderModal" tabindex="-1" aria-labelledby="editOrderModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="updateOrder" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="editOrderModalLabel">Edit Order</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="editOrderId" name="orderId">
                    <div class="mb-3">
                        <label for="editCustomerId" class="form-label">Customer ID</label>
                        <input type="text" class="form-control" id="editCustomerId" name="customerId" required>
                    </div>
                    <div class="mb-3">
                        <label for="editProductId" class="form-label">Product ID</label>
                        <input type="text" class="form-control" id="editProductId" name="productId" required>
                    </div>
                    <div class="mb-3">
                        <label for="editPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="editPrice" name="price" required>
                    </div>
                    <div class="mb-3">
                        <label for="editQuantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="editQuantity" name="quantity" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Update Order</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Delete Order Modal -->
<div class="modal fade" id="deleteOrderModal" tabindex="-1" aria-labelledby="deleteOrderModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="deleteOrder" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteOrderModalLabel">Delete Order</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this order?</p>
                    <input type="hidden" id="deleteOrderId" name="orderId">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Delete</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2025 Order Management System. All rights reserved.</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Modal Pre-fill Script -->
<script>
    const editOrderModal = document.getElementById('editOrderModal');
    const deleteOrderModal = document.getElementById('deleteOrderModal');

    editOrderModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        const orderId = button.getAttribute('data-orderid');
        const customerId = button.getAttribute('data-customerid');
        const productId = button.getAttribute('data-productid');
        const price = button.getAttribute('data-price');
        const quantity = button.getAttribute('data-quantity');

        document.getElementById('editOrderId').value = orderId;
        document.getElementById('editCustomerId').value = customerId;
        document.getElementById('editProductId').value = productId;
        document.getElementById('editPrice').value = price;
        document.getElementById('editQuantity').value = quantity;
    });

    deleteOrderModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        const orderId = button.getAttribute('data-orderid');
        document.getElementById('deleteOrderId').value = orderId;
    });
</script>

</body>
</html>
