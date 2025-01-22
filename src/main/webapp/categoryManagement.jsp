<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment_01_jsp.entity.Category" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
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
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
        }
    </style>
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

<main class="container my-5">
    <h2 class="mb-4">Category Management</h2>

    <div class="d-flex justify-content-end mb-3">
        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCategoryModal">Add Category</button>
    </div>

    <table class="table table-bordered">
        <thead class="table-dark">
        <tr>
            <th>Category Code</th>
            <th>Category Name</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Category> categories = (List<Category>) request.getAttribute("categories");
            if (categories != null && !categories.isEmpty()) {
                for (Category category : categories) {
        %>
        <tr>
            <td><%= category.getId() %></td>
            <td><%= category.getName() %></td>
            <td><%= category.getDescription() %></td>
            <td>
                <button id="edit-btn" class="btn btn-sm btn-success"
                        data-bs-toggle="modal"
                        data-bs-target="#editCategoryModal"
                        data-id="<%= category.getId() %>"
                        data-name="<%= category.getName() %>"
                        data-description="<%= category.getDescription() %>">
                    <i class="bi bi-pencil"></i> Edit
                </button>
                <button id="delete-btn" class="btn btn-sm btn-danger"
                        data-bs-toggle="modal"
                        data-bs-target="#deleteCategoryModal"
                        data-id="<%= category.getId() %>">
                    <i class="bi bi-trash"></i> Delete
                </button>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="4" class="text-center">No categories found</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</main>

<footer class="py-4">
    <div class="container">
        <p class="mb-0">&copy; 2025 Toys Store. All Rights Reserved.</p>
    </div>
</footer>

<!-- Add Category Modal -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="addcategory" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCategoryModalLabel">Add Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="categoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="categoryName" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <input type="text" class="form-control" id="description" name="description" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Add Category</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Edit Category Modal -->
<div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="editCategoryForm" action="updateCategory" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCategoryModalLabel">Edit Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="editCategoryCode" class="form-label">Category Code</label>
                        <input type="text" class="form-control" id="editCategoryCode" name="id" required>
                    </div>
                    <div class="mb-3">
                        <label for="editCategoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="editCategoryName" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="editDescription" class="form-label">Description</label>
                        <input type="text" class="form-control" id="editDescription" name="description" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Update Category</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Delete Category Modal -->
<div class="modal fade" id="deleteCategoryModal" tabindex="-1" aria-labelledby="deleteCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="deleteCategory" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteCategoryModalLabel">Delete Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this category?</p>
                    <input type="hidden" id="deleteCategoryCode" name="categoryCode">
                </div>
                <div class="modal-footer">
                    <form id="deleteCategoryForm" action="deleteCategory" method="post">
                        <input type="hidden" name="id" id="deleteCategoryId">
                        <button type="submit" class="btn btn-danger">Delete</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </form>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="JQ/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"></script>
<script>
    // Populate Edit Modal
    $(document).on('click', '#edit-btn', function () {
        const id = $(this).data('id');
        const name = $(this).data('name');
        const description = $(this).data('description');

        $('#editCategoryCode').val(id);
        $('#editCategoryName').val(name);
        $('#editDescription').val(description);
    });

    const deleteCategoryModal = document.getElementById('deleteCategoryModal');

    deleteCategoryModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        const categoryCode = button.getAttribute('data-id');
        const deleteCategoryIdInput = document.getElementById('deleteCategoryCode');

        deleteCategoryIdInput.value = categoryCode;
    });

</script>
</body>
</html>
