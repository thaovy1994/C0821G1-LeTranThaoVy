package service.impl;

import bean.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    //gọi obj của bên Repository qua => dùng nguyên lý DI của SOLID
    private IProductRepository productRepository= new ProductRepository();
    @Override
    public List<Product> findAll() {
        return this.productRepository.findAll();
    }

    @Override
    public Product findById(Integer id) {
        return null;
    }

    @Override
    public boolean save(Product product) {
        return false;
    }
}
