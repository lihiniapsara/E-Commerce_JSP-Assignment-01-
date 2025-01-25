<%@ page import="lk.ijse.assignment_01_jsp.entity.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
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

<main class="container mt-5">
    <h2 class="text-center mb-4">User Management</h2>

    <!-- Search and Add User -->

    <div class="d-flex justify-content-between align-items-center mb-3">
<%--
        <div class="input-group w-50">
            <input type="text" class="form-control" placeholder="Search users..." id="searchUser">
            <button class="btn btn-primary" type="button">Search</button>
        </div>
--%>
        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addUserModal" id="addUserBtn">Add User</button>
    </div>


    <!-- User Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody id="userTableBody">
            <%
                List<User> users = (List<User>) request.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    for (User user : users) {
            %>

            <tr>
                <td><%= user.getUserId() %></td>
                <td><%= user.getUserName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getRole() %></td>
                <td>
                    <button id="edit-btn" class="btn btn-sm btn-success"
                            data-bs-toggle="modal"
                            data-bs-target="#editUserModal"
                            data-id="<%= user.getUserId() %>"
                            data-username="<%= user.getUserName() %>"
                            data-email="<%= user.getEmail() %>"
                            data-role="<%= user.getRole() %>">
                        <i class="bi bi-pencil"></i> Edit
                    </button>
                    <button id="delete-btn" class="btn btn-sm btn-danger"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteUserModal"
                            data-id="<%= user.getUserId() %>">
                        <i class="bi bi-trash"></i> Delete
                    </button>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5" class="text-center">No users found</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</main>

<footer class="py-4" style="background-color: #343a40; color: #ffffff;">
    <div class="container">
        <div class="d-flex justify-content-between">
            <p class="mb-0" style="text-align: center; width: 100%;">&copy; 2025 Toys Store. All Rights Reserved.</p>
        </div>
    </div>
</footer>

<!-- Add User Modal -->
<div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addUserModalLabel">Add User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addUserForm" action="adduser" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input name="name" type="name" class="form-control" id="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input name="email" type="email" class="form-control" id="email" required>

                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input name="password" type="password" class="form-control" id="password">

                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <select class="form-select" id="role" name="role" required>
                            <option value="Admin">Admin</option>
                            <option value="User">User</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Save User</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit User Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editUserForm" action="updateUser" method="post">
                    <div class="mb-3">
                        <label for="editId" class="form-label">UserID</label>
                        <input name="id" type="text" class="form-control" id="editId" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="editUsername" class="form-label">Username</label>
                        <input name="name" type="text" class="form-control" id="editUsername" required>
                    </div>
                    <div class="mb-3">
                        <label for="editEmail" class="form-label">Email</label>
                        <input name="email" type="email" class="form-control" id="editEmail" required>
                    </div>
                    <div class="mb-3">
                        <label for="editRole" class="form-label">Role</label>
                        <select name="role" class="form-select" id="editRole" required>
                            <option value="Admin">Admin</option>
                            <option value="User">User</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Update User</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete User Model-->
<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteUserModalLabel">Confirm Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this user?</p>
            </div>
            <div class="modal-footer">
                <form id="deleteUserForm" action="deleteUser" method="post">
                    <input type="hidden" name="id" id="deleteUserId">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="JQ/jquery-3.7.1.min.js"></script>
<script>
    // For Edit User Modal functionality
    $(document).on('click', '#edit-btn', function () {
        console.log("button")
        // Retrieve user data from data attributes
        var userId = $(this).data('id');
        var username = $(this).data('username');
        var email = $(this).data('email');
        var role = $(this).data('role');

        // Populate the modal form with user data
        $('#editId').val(userId);
        $('#editUsername').val(username);
        $('#editEmail').val(email);
        $('#editRole').val(role);
    });



    // Get the delete modal element
    const deleteUserModal = document.getElementById('deleteUserModal');

    // Add an event listener to the modal when it is about to be shown
    deleteUserModal.addEventListener('show.bs.modal', function (event) {
        // Button that triggered the modal
        const button = event.relatedTarget;

        // Extract user ID from data-* attribute
        const userId = button.getAttribute('data-id');

        // Get the delete modal hidden input
        const deleteUserIdInput = document.getElementById('deleteUserId');

        // Set the hidden input value with the user ID
        deleteUserIdInput.value = userId;
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
