<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Category" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header class="bg-light py-3 border-bottom">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <img src="images/toys-mania-42.png" alt="Toys Store Logo">
            </div>
            <nav class="d-flex flex-grow-1 justify-content-center align-items-center">
                <ul class="nav">
                    <li class="nav-item"><a class="nav-link text-dark" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="#">Users</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="#">Category</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="#">Products</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="#">Orders</a></li>
                </ul>
            </nav>
            <div>
                <a href="admin_dashboard.jsp" class="text-dark"><i class="bi bi-box-arrow-right"></i></a>
            </div>
        </div>
    </div>
</header>

<div class="container mt-5">
    <h1 class="text-center">Product Management</h1>
    <div class="d-flex justify-content-end mb-4">
        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal">Add Product</button>
    </div>
    <table class="table table-bordered table-striped mt-4">
        <thead class="table-dark">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Category</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Image</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {

        %>
        <tr>
            <td><%= product.getId() %>
            </td>
            <td><%= product.getName() %>
            </td>
            <td><%= product.getDescription()%>
            </td>
            <td><%= product.getCategory().getName() %>
            </td>
            <td><%= product.getPrice() %>
            </td>
            <td><%= product.getQuantity() %>
            </td>
            <td><img src="<%= request.getContextPath() %>/uploads/<%= product.getImageUrl() %>" alt="Product Image"
                     width="100"></td>
            <td>
                <button class="btn btn-sm btn-success"
                        data-bs-toggle="modal"
                        data-bs-target="#editProductModal"
                        data-id="<%= product.getId() %>"
                        data-name="<%= product.getName() %>"
                        data-price="<%=product.getPrice()%>"
                        data-qty="<%=product.getQuantity()%>"
                        data-description="<%=product.getDescription()%>">

                    <i class="bi bi-pencil"></i> Edit
                </button>
                <button class="btn btn-sm btn-danger"
                        data-bs-toggle="modal"
                        data-bs-target="#deleteProductModal"
                        data-id="<%= product.getId() %>">
                    <i class="bi bi-trash"></i> Delete
                </button>
            </td>
        </tr>
        <%
            }
        %>
        <%
        } else {
        %>
        <tr>
            <td colspan="6">No products found.</td>
        </tr>
        <%
            }
        %></tbody>
    </table>
</div>

<!-- Add Product Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Add Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addProductForm" action="saveProduct" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="name">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <select class="form-control" id="category" name="category" required>
                            <%
                                List<Category> categorie = (List<Category>) request.getAttribute("categories");
                                if (categorie != null && !categorie.isEmpty()) {
                                    for (Category category : categorie) {
                                        System.out.println(categorie + " " + category.getName());
                            %>
                            <option value="<%= category.getId() %>"><%= category.getName() %>
                            </option>

                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="number" class="form-control" id="price" name="price">
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="quantity" name="quantity">
                    </div>
                    <div class="mb-3">
                        <label for="image" class="form-label">Image</label>
                        <input type="file" class="form-control" id="image" name="productImage">
                    </div>
                    <button type="submit" class="btn btn-primary">Add Product</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit Product Modal -->
<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editProductForm" action="updateProduct" method="post"
                      enctype="application/x-www-form-urlencoded">
                    <div class="mb-3">
                        <label for="editProductId" class="form-label">Product ID</label>
                        <input name="pid" type="text" class="form-control" id="editProductId" required>
                    </div>
                    <div class="mb-3">
                        <label for="editProductName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="editProductName" name="name">
                    </div>
                    <div class="mb-3">
                        <label for="editDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="editDescription" name="description" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="category1" class="form-label">Category</label>
                        <select name="categoryId" class="form-select" id="category1" required>
                            <%
                                List<Category> categories = (List<Category>) request.getAttribute("categories");
                                if (categorie != null && !categorie.isEmpty()) {
                                    for (Category category : categories) {
                            %>
                            <option value="<%= category.getId() %>"><%= category.getName() %>
                            </option>

                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="editPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="editPrice" name="price">
                    </div>
                    <div class="mb-3">
                        <label for="editQuantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="editQuantity" name="quantity">
                    </div>
                    <%--<div class="mb-3">
                        <label for="editImage" class="form-label">Image</label>
                        <input type="file" class="form-control" id="editImage" name="image">
                    </div>--%>
                    <button type="submit" class="btn btn-success">Save Changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Product Modal -->
<div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="deleteProductModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteProductModalLabel">Delete Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this product?</p>
                <form id="deleteProductForm" action="deleteProduct" method="post">
                    <input type="hidden" id="deleteProductId" name="id">
                    <button type="submit" class="btn btn-danger">Delete</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="JQ/jquery-3.7.1.min.js"></script>
<%--
<script>
    // Pre-fill Edit Product Modal
    const editProductModal = document.getElementById('editProductModal');
    editProductModal.addEventListener('show.bs.modal', (event) => {
        const button = event.relatedTarget;
        const id = button.getAttribute('data-id');
        const name = button.getAttribute('data-name');
        const description = button.getAttribute('data-description');
        const category = button.getAttribute('data-category');
        const price = button.getAttribute('data-price');
        const quantity = button.getAttribute('data-quantity');
        const image = button.getAttribute('data-image');

        document.getElementById('editProductId').value = id;
        document.getElementById('editProductName').value = name;
        document.getElementById('editDescription').value = description;
        document.getElementById('editCategory').value = category;
        document.getElementById('editPrice').value = price;
        document.getElementById('editQuantity').value = quantity;
        document.getElementById('editImage').value = image;

        // Set the input fields with the corresponding data
        editProductDescriptionInput.value = button.getAttribute("data-description");
        editProductIdInput.value = productId;
        editProductNameInput.value = productName;
        editProductPriceInput.value = productPrice;
        editProductQuantityInput.value = productQuantity;

    });

    // Pre-fill Delete Product Modal
    const deleteProductModal = document.getElementById('deleteProductModal');
    deleteProductModal.addEventListener('show.bs.modal', (event) => {
        const button = event.relatedTarget;
        const id = button.getAttribute('data-id');
        document.getElementById('deleteProductId').value = id;
    });
</script>
--%>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const editModal = document.getElementById('editProductModal');
        const deleteModal = document.getElementById('deleteProductModal');

        editModal.addEventListener('show.bs.modal', (event) => {
            const button = event.relatedTarget; // Button that triggered the modal
            const productId = button.getAttribute('data-id');
            const productName = button.getAttribute('data-name');
            const productPrice = button.getAttribute('data-price');
            const productQty = button.getAttribute('data-qty');
            const productDescription = button.getAttribute('data-description');

            console.log(productId, "t5yuiolp;")

            // Populate modal fields
            document.getElementById('editProductId').value = productId;
            document.getElementById('editProductName').value = productName;
            document.getElementById('editPrice').value = productPrice;
            document.getElementById('editQuantity').value = productQty;
            document.getElementById('editDescription').value = productDescription;
        });

        deleteModal.addEventListener('show.bs.modal', (event) => {
            const button = event.relatedTarget; // Button that triggered the modal
            const productId = button.getAttribute('data-id');

            console.log(productId, "t5yuiolp;")

            // Populate modal fields
            document.getElementById('deleteProductId').value = productId;
        });
    });

</script>
</body>
</html>
