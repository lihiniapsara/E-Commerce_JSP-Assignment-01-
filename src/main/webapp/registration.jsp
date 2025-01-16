<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - E-commerce</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }

        .signup-container {
            background-color: rgba(84, 82, 82, 0.95);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        .image-section {
            background: url('images/ECommerce.jpg') no-repeat center center;
            background-size: cover;
            border-radius: 12px;
            height: 100%;
            min-height: 500px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 25px;
            font-weight: bold;
            padding: 0.5rem 1rem;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .form-label {
            font-weight: bold;
            color: #fff;
        }

        .form-control {
            border-radius: 10px;
        }

        h2 {
            font-size: 2.5em;
            font-weight: bold;
            color: #fff;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        p {
            color: #fff;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row shadow-lg rounded">
        <!-- Left Side Image -->
        <div class="col-md-6 image-section d-none d-md-block"></div>
        <!-- Right Side Form -->
        <div class="col-md-6 p-4 d-flex justify-content-center align-items-center bg-dark text-light">
            <div class="signup-container w-100">
                <h2 class="mb-4">Sign Up</h2>
                <form action="signup" method="post">
                    <div class="mb-3 text-start">
                        <label for="fullname" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="confirm-password" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirm-password" name="confirm-password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-50">Sign Up</button>
                </form>
                <p class="mt-3">Already have an account? <a href="index.jsp" class="text-primary">Login</a></p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
