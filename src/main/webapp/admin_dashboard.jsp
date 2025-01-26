<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"> <!-- For icons -->
    <style>
        body {
            background-color: #f0f8ff; /* Light blue background */
            font-family: Arial, sans-serif;
            overflow-x: hidden;
        }
        .navbar a {
            color: white;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px 20px;
            margin: 10px 0;
        }
        .sidebar a:hover {
            background-color: #0288d1;
        }
        .main-content {
            padding: 20px;
        }
        .card {
            background-color: #ffffff; /* White card */
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .footer {
            background-color: #7be6f3;
            text-align: center;
            padding: 10px;
            position: absolute;
            bottom: 0;
            width: 100%;
            color: white;
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="bg-light py-2 border-bottom">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <!-- Left Section -->
            <div class="d-flex align-items-center">
                <img src="images/toys-mania-42.png" alt="Toys Store Logo" style="max-height: 40px;">
            </div>

            <!-- Right Section: Navigation -->
            <nav class="d-flex flex-grow-1 justify-content-center align-items-center">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="adduser">Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="addcategory">Category</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="getProductList">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="getAllOrders">Orders</a>
                    </li>
                </ul>
            </nav>

            <!-- Icons Section -->
            <div class="d-flex">
                <a href="index.jsp" class="text-dark"><i class="bi bi-box-arrow-right"></i></a>
            </div>
        </div>
    </div>
</header>

<div class="d-flex">

    <!-- Main Content -->
    <div class="main-content container-fluid mt-5">
        <h2 class="mb-4 text-center">Welcome to Your Admin Dashboard</h2>

        <!-- First Row -->
        <div class="row justify-content-center mb-4">
            <!-- Products Card -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card border-info shadow-sm" style="height: 150px;">
                    <div class="card-body d-flex flex-column justify-content-center text-center">
                        <h5 class="card-title text-info">Products</h5>
                        <h3 class="display-6">120</h3>
                    </div>
                </div>
            </div>

            <!-- Orders Card -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card border-danger shadow-sm" style="height: 150px;">
                    <div class="card-body d-flex flex-column justify-content-center text-center">
                        <h5 class="card-title text-danger">Orders</h5>
                        <h3 class="display-6">75</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Second Row -->
        <div class="row justify-content-center">
            <!-- Users Card -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card border-primary shadow-sm" style="height: 150px;">
                    <div class="card-body d-flex flex-column justify-content-center text-center">
                        <h5 class="card-title text-primary">Users</h5>
                        <h3 class="display-6">500</h3>
                    </div>
                </div>
            </div>

            <!-- Categories Card -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card border-success shadow-sm" style="height: 150px;">
                    <div class="card-body d-flex flex-column justify-content-center text-center">
                        <h5 class="card-title text-success">Categories</h5>
                        <h3 class="display-6">15</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer mt-5 text-center py-3">
            <p class="mb-0 text-muted">&copy; 2025 Your Company</p>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
