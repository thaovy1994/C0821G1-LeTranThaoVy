package service;

import bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    boolean save(Product product);

    void edit(Product product);

    void delete(Product product);
}
