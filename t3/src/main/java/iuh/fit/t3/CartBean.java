package iuh.fit.t3;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CartBean {
    private List<CartItemBean> items;

    public CartBean() {
        items = new ArrayList<>();
    }

    public List<CartItemBean> getItems() {
        return items;
    }

    public void setItems(List<CartItemBean> items) {
        this.items = items;
    }

    // Thêm sản phẩm vào giỏ hàng
    public void addItem(Product product, int quantity) {
        for (CartItemBean item : items) {
            if (item.getProduct().getId() == product.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        items.add(new CartItemBean(product, quantity));
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public void removeItem(int productId) {
        Iterator<CartItemBean> iterator = items.iterator();
        while (iterator.hasNext()) {
            CartItemBean item = iterator.next();
            if (item.getProduct().getId() == productId) {
                iterator.remove();
                break;
            }
        }
    }

    // Cập nhật số lượng sản phẩm
    public void updateItem(int productId, int quantity) {
        if (quantity <= 0) {
            removeItem(productId);
            return;
        }

        for (CartItemBean item : items) {
            if (item.getProduct().getId() == productId) {
                item.setQuantity(quantity);
                break;
            }
        }
    }

    // Tính tổng tiền
    public double getTotalAmount() {
        double total = 0;
        for (CartItemBean item : items) {
            total += item.getTotalPrice();
        }
        return total;
    }

    // Tính tổng số lượng sản phẩm
    public int getTotalItems() {
        int total = 0;
        for (CartItemBean item : items) {
            total += item.getQuantity();
        }
        return total;
    }

    // Kiểm tra giỏ hàng có rỗng không
    public boolean isEmpty() {
        return items.isEmpty();
    }

    // Xóa toàn bộ giỏ hàng
    public void clear() {
        items.clear();
    }
}