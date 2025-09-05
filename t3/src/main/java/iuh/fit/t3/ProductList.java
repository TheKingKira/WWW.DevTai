package iuh.fit.t3;

import java.util.ArrayList;
import java.util.List;

public class ProductList {
    private static List<Product> products;

    static {
        products = new ArrayList<>();
        // Tạo dữ liệu mẫu
        products.add(new Product(1, "Laptop Dell XPS 13", 25000000, "Laptop cao cấp cho doanh nhân", "laptop-dell.jpg"));
        products.add(new Product(2, "iPhone 15 Pro", 30000000, "Smartphone mới nhất từ Apple", "iphone-15.jpg"));
        products.add(new Product(3, "Samsung Galaxy S24", 20000000, "Android flagship từ Samsung", "galaxy-s24.jpg"));
        products.add(new Product(4, "MacBook Air M3", 28000000, "Laptop siêu mỏng từ Apple", "macbook-air.jpg"));
        products.add(new Product(5, "Sony WH-1000XM5", 8000000, "Tai nghe chống ồn cao cấp", "sony-headphone.jpg"));
        products.add(new Product(6, "iPad Pro 12.9", 26000000, "Máy tính bảng chuyên nghiệp", "ipad-pro.jpg"));
        products.add(new Product(7, "Apple Watch Series 9", 10000000, "Đồng hồ thông minh", "apple-watch.jpg"));
        products.add(new Product(8, "AirPods Pro", 6000000, "Tai nghe không dây cao cấp", "airpods-pro.jpg"));
    }

    public static List<Product> getAllProducts() {
        return products;
    }

    public static Product getProductById(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    public static void addProduct(Product product) {
        products.add(product);
    }

    public static boolean removeProduct(int id) {
        return products.removeIf(product -> product.getId() == id);
    }

    public static void updateProduct(Product updatedProduct) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == updatedProduct.getId()) {
                products.set(i, updatedProduct);
                break;
            }
        }
    }
}