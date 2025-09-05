<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .cart-item {
            border-bottom: 1px solid #dee2e6;
        }
        .cart-item:last-child {
            border-bottom: none;
        }
        .product-image-small {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }
        .quantity-input {
            max-width: 80px;
        }
        .total-section {
            background-color: #f8f9fa;
            border-radius: 10px;
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
            <a class="nav-link" href="products">
                <i class="fas fa-arrow-left"></i> Tiếp tục mua sắm
            </a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <h2 class="mb-4">
                <i class="fas fa-shopping-cart"></i> Giỏ hàng của bạn
            </h2>
        </div>
    </div>

    <c:choose>
        <c:when test="${empty sessionScope.cart or sessionScope.cart.isEmpty()}">
            <div class="row">
                <div class="col-12">
                    <div class="text-center py-5">
                        <i class="fas fa-shopping-cart fa-5x text-muted mb-3"></i>
                        <h4 class="text-muted">Giỏ hàng trống</h4>
                        <p class="text-muted">Bạn chưa có sản phẩm nào trong giỏ hàng</p>
                        <a href="products" class="btn btn-primary">
                            <i class="fas fa-shopping-bag"></i> Bắt đầu mua sắm
                        </a>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="row">
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Sản phẩm trong giỏ hàng</h5>
                        </div>
                        <div class="card-body p-0">
                            <c:forEach items="${sessionScope.cart.items}" var="item" varStatus="status">
                                <div class="cart-item p-3">
                                    <div class="row align-items-center">
                                        <div class="col-md-2">
                                            <img src="images/${item.product.image}"
                                                 class="product-image-small"
                                                 alt="${item.product.name}"
                                                 onerror="this.src='images/no-image.jpg'">
                                        </div>
                                        <div class="col-md-4">
                                            <h6 class="mb-1">${item.product.name}</h6>
                                            <small class="text-muted">${item.product.description}</small>
                                        </div>
                                        <div class="col-md-2">
                                            <strong class="text-primary">
                                                <fmt:formatNumber value="${item.product.price}" type="currency"
                                                                  currencySymbol="₫" pattern="#,##0 ¤"/>
                                            </strong>
                                        </div>
                                        <div class="col-md-2">
                                            <form action="cart" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="update">
                                                <input type="hidden" name="productId" value="${item.product.id}">
                                                <div class="input-group">
                                                    <input type="number" name="quantity"
                                                           value="${item.quantity}" min="0"
                                                           class="form-control quantity-input"
                                                           onchange="this.form.submit()">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-md-1">
                                            <strong>
                                                <fmt:formatNumber value="${item.totalPrice}" type="currency"
                                                                  currencySymbol="₫" pattern="#,##0 ¤"/>
                                            </strong>
                                        </div>
                                        <div class="col-md-1">
                                            <form action="cart" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="remove">
                                                <input type="hidden" name="productId" value="${item.product.id}">
                                                <button type="submit" class="btn btn-outline-danger btn-sm"
                                                        onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="mt-3">
                        <form action="cart" method="post" class="d-inline">
                            <input type="hidden" name="action" value="clear">
                            <button type="submit" class="btn btn-outline-warning"
                                    onclick="return confirm('Bạn có chắc muốn xóa toàn bộ giỏ hàng?')">
                                <i class="fas fa-trash-alt"></i> Xóa toàn bộ giỏ hàng
                            </button>
                        </form>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="card total-section">
                        <div class="card-header">
                            <h5 class="mb-0">Thông tin đơn hàng</h5>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Số lượng sản phẩm:</span>
                                <strong>${sessionScope.cart.totalItems}</strong>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Tạm tính:</span>
                                <strong>
                                    <fmt:formatNumber value="${sessionScope.cart.totalAmount}" type="currency"
                                                      currencySymbol="₫" pattern="#,##0 ¤"/>
                                </strong>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Phí vận chuyển:</span>
                                <span class="text-success">Miễn phí</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between mb-3">
                                <strong>Tổng cộng:</strong>
                                <strong class="text-primary fs-5">
                                    <fmt:formatNumber value="${sessionScope.cart.totalAmount}" type="currency"
                                                      currencySymbol="₫" pattern="#,##0 ¤"/>
                                </strong>
                            </div>

                            <div class="d-grid gap-2">
                                <button class="btn btn-primary btn-lg" onclick="checkout()">
                                    <i class="fas fa-credit-card"></i> Thanh toán
                                </button>
                                <a href="products" class="btn btn-outline-secondary">
                                    <i class="fas fa-arrow-left"></i> Tiếp tục mua sắm
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="card mt-3">
                        <div class="card-body">
                            <h6 class="card-title">
                                <i class="fas fa-truck"></i> Thông tin vận chuyển
                            </h6>
                            <ul class="list-unstyled mb-0">
                                <li><small class="text-muted">• Miễn phí vận chuyển toàn quốc</small></li>
                                <li><small class="text-muted">• Giao hàng trong 1-2 ngày</small></li>
                                <li><small class="text-muted">• Hỗ trợ đổi trả trong 7 ngày</small></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<footer class="bg-dark text-light text-center py-3 mt-5">
    <div class="container">
        <p>&copy; 2024 Cửa hàng điện tử. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function checkout() {
        alert('Chức năng thanh toán đang được phát triển!');
    }

    // Auto-submit form when quantity changes
    document.querySelectorAll('.quantity-input').forEach(input => {
        input.addEventListener('change', function() {
            if (this.value < 0) {
                this.value = 0;
            }
            this.form.submit();
        });
    });
</script>
</body>
</html>