<%--
  Created by IntelliJ IDEA.
  User: LIHINI
  Date: 1/16/2025
  Time: 7:23 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - E-commerce</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      background: url('images/th.jpeg') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: Arial, sans-serif;
      color: #333;
    }


    .login-container {
      background-color: rgba(84, 82, 82, 0.95);
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
      width: 100%;
      max-width: 400px;
      text-align: center;
    }

    .login-logo {
      display: block;
      margin: 0 auto 1rem;
      width: 120px;
      height: 120px;
      background: url('images/R.png') no-repeat center center;
      background-size: cover;
      border-radius: 50%;
      border: 4px solid #007bff;
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
      color: #555;
    }

    .form-control {
      border-radius: 10px;
    }

    .text-muted {
      font-size: 14px;
    }

    .text-primary:hover {
      text-decoration: underline;
    }

    h2 {
        font-size: 3em;
        font-weight: bold;
        color: #000000;
    }
    input[type="text"], input[type="password"] {
        border-radius: 10px;
        padding: 10px;
        border: 1px solid #070707;
    }

    label {
        display: block;
        margin-bottom: 5px;
        color: white !important;
    }

    p {
        color: #000000 !important;
    }

  </style>
</head>

<body>
<div class="login-container">
  <div class="login-lo
  go"></div>
  <h2 class="mb-4">Login</h2>
  <form action="login" method="post">
    <div class="mb-3 text-start">
      <label for="username" class="form-label">Username</label>
      <input type="text" class="form-control" id="username" name="username" required>
    </div>
    <div class="mb-3 text-start">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <button type="submit" class="btn btn-primary w-50">Login</button>
  </form>
  <p class="mt-3 ">Don't have an account? <a href="registration.jsp" class="text-primary">Sign Up</a></p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
