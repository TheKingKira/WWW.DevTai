<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <style>
    .product-card {
      transition: transform 0.2s;
    }
    .product-card:hover {
      transform: translateY(-5px);
    }
    .cart-badge {
      background-color: #dc3545;
      color: white;
      border-radius: 50%;
      padding: 2px 6px;
      font-size: 12px;
    }
    .product-image {
      height: 200px;
      object-fit: cover;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="products">
      <i class="fas fa-store"></i> Cửa hàng điện tử
    </a>
    <div class="navbar-nav ms-auto">
      <a class="nav-link" href="cart">
        <i class="fas fa-shopping-cart"></i> Giỏ hàng
        <c:if test="${not empty sessionScope.cart and sessionScope.cart.totalItems > 0}">
          <span class="cart-badge">${sessionScope.cart.totalItems}</span>
        </c:if>
      </a>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <div class="row">
    <div class="col-12">
      <h2 class="text-center mb-4">Danh sách sản phẩm</h2>

      <c:if test="${param.added == 'true'}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="fas fa-check-circle"></i> Đã thêm sản phẩm vào giỏ hàng!
          <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
      </c:if>
    </div>
  </div>

  <div class="row">
    <c:forEach items="${products}" var="product">
      <div class="col-md-6 col-lg-4 col-xl-3 mb-4">
        <div class="card product-card h-100 shadow-sm">
          <img src="images/${product.image}" class="card-img-top product-image"
               alt="${product.name}" onerror="this.src='images/no-image.jpg'">
          <div class="card-body d-flex flex-column">
            <h5 class="card-title">${product.name}</h5>
            <p class="card-text text-muted flex-grow-1">${product.description}</p>
            <div class="mt-auto">
              <p class="card-text">
                <strong class="text-primary">
                  <fmt:formatNumber value="${product.price}" type="currency"
                                    currencySymbol="₫" pattern="#,##0 ¤"/>
                </strong>
              </p>
              <form action="cart" method="post" class="d-flex gap-2">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="productId" value="${product.id}">
                <div class="input-group">
                  <input type="number" name="quantity" value="1" min="1"
                         class="form-control form-control-sm" style="max-width: 80px;">
                  <button type="submit" class="btn btn-primary btn-sm">
                    <i class="fas fa-cart-plus"></i> Thêm
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>

  <c:if test="${empty products}">
    <div class="row">
      <div class="col-12 text-center">
        <div class="alert alert-info">
          <i class="fas fa-info-circle"></i> Hiện tại không có sản phẩm nào.
        </div>
      </div>
    </div>
  </c:if>
</div>

<footer class="bg-dark text-light text-center py-3 mt-5">
  <div class="container">
    <p>&copy; 2024 Cửa hàng điện tử. All rights reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>