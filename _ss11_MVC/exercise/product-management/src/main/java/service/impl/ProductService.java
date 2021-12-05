package service.impl;

import bean.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    //gọi obj của bên Repository qua => dùng nguyên lý DI của SOLID
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        try {
            List<Product> products = productRepository.findAll();
            if (products.size() == 0) {
                return null;
            }
            return products;
        } catch (Exception e) {
            e.getMessage();
            return null;
        }
    }

    @Override
    public boolean save(Product product) {
        if (checkProduct(product)) {
            productRepository.save(product);
            return true;
        } else {
            System.out.println("err");
            return false;
        }
    }

    @Override
    public void edit(Product product) {
        productRepository.edit(product);
    }

    @Override
    public void delete(Product product) {
        productRepository.delete(product);
    }


    public boolean checkProduct(Product product) {
        if (product.getProductId() < 0) {
            return false;
        }
        if (!product.getProductName().matches("^[a-z A-z]+$")) {
            return false;
        }
        return true;
    }
}
