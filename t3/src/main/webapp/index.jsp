<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chào mừng đến với cửa hàng điện tử</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0;
        }
        .feature-card {
            transition: transform 0.3s;
        }
        .feature-card:hover {
            transform: translateY(-10px);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-store"></i> Cửa hàng điện tử
        </a>
    </div>
</nav>

<div class="hero-section text-center">
    <div class="container">
        <h1 class="display-4 fw-bold mb-4">Chào mừng đến với cửa hàng điện tử</h1>
        <p class="lead mb-5">Khám phá những sản phẩm công nghệ mới nhất với giá tốt nhất</p>
        <a href="products" class="btn btn-light btn-lg">
            <i class="fas fa-shopping-bag"></i> Xem sản phẩm
        </a>
    </div>
</div>

<div class="container my-5">
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card feature-card h-100 text-center border-0 shadow">
                <div class="card-body">
                    <i class="fas fa-shipping-fast fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">Giao hàng nhanh</h5>
                    <p class="card-text">Miễn phí vận chuyển toàn quốc, giao hàng trong 1-2 ngày</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card feature-card h-100 text-center border-0 shadow">
                <div class="card-body">
                    <i class="fas fa-shield-alt fa-3x text-success mb-3"></i>
                    <h5 class="card-title">Bảo hành chính hãng</h5>
                    <p class="card-text">Tất cả sản phẩm đều có bảo hành chính hãng từ nhà sản xuất</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card feature-card h-100 text-center border-0 shadow">
                <div class="card-body">
                    <i class="fas fa-headset fa-3x text-warning mb-3"></i>
                    <h5 class="card-title">Hỗ trợ 24/7</h5>
                    <p class="card-text">Đội ngũ chăm sóc khách hàng luôn sẵn sàng hỗ trợ bạn</p>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center mt-5">
        <h2 class="mb-4">Bắt đầu mua sắm ngay hôm nay!</h2>
        <a href="products" class="btn btn-primary btn-lg">
            <i class="fas fa-store"></i> Khám phá sản phẩm
        </a>
    </div>
</div>

<footer class="bg-dark text-light text-center py-4 mt-5">
    <div class="container">
        <p>&copy; 2024 Cửa hàng điện tử. All rights reserved.</p>
        <p>
            <a href="products" class="text-light">Sản phẩm</a> |
            <a href="cart" class="text-light">Giỏ hàng</a>
        </p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>