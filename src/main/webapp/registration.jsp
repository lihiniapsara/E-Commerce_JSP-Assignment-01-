<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #d3d3d3; /* Ash color */
        }
    </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-4" style="width: 400px; border-radius: 8px;">
        <!-- Logo Section -->
        <div class="text-center mb-4">
            <img src="images/toys-mania-42.png" alt="Logo" class="img-fluid">
        </div>

        <!-- Tabs -->
        <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="true" style="color: black;  border: none;">Login</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="signup-tab" data-bs-toggle="tab" data-bs-target="#signup" type="button" role="tab" aria-controls="signup" aria-selected="false" style="color: black;">Sign Up</button>
            </li>
        </ul>

        <!-- Tab Content -->
        <div class="tab-content">
            <!-- Login Tab -->
            <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                <h5 class="mb-3">Login</h5>
                <form id="loginForm" action="login" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
                            <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility('password', this)">
                                <i class="bi bi-eye"></i>
                            </button>
                        </div>
                    </div>
                    <div class="d-flex align-items-center mb-3">
                        <button type="submit" class="btn btn-danger me-3">Log in</button>
                        <div>
                            <input type="checkbox" id="remember-me">
                            <label for="remember-me">Remember me</label>
                        </div>
                    </div>
                    <a href="#" class="text-decoration-none">Lost your password?</a>
                </form>
            </div>

            <%
                String message =  request.getParameter("loginError");
                if (message != null) {
                    System.out.println(message);
            %>

            <script>
                Swal.fire({
                    icon: "error",
                    title: "Oops...",
                    text: "Login Failed!",
                });
            </script>
            <%
                }
            %>

            <!-- Sign Up Tab -->
            <div class="tab-pane fade" id="signup" role="tabpanel" aria-labelledby="signup-tab">
                <h5 class="mb-3">Sign Up</h5>
                <form id="signupForm" action="registration" method="post">
                    <div class="mb-3">
                        <label for="fullname" class="form-label">Name</label>
                        <input type="text" class="form-control" id="fullname" name="name" placeholder="Enter fullname">
                    </div>
                    <div class="mb-3">
                        <label for="signup-email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="signup-email" name="email" placeholder="Enter email">
                    </div>
                    <div class="mb-3">
                        <label for="signup-password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="signup-password" name="password" placeholder="Enter password">
                    </div>
                    <div class="mb-3">
                        <label for="confirm-password" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirm-password" name="confirm_password" placeholder="Enter password">
                    </div>
                    <button type="submit" class="btn btn-danger">Sign Up</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
