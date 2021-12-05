package repository;

import bean.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void save(Product product);

    void edit(Product product);

    void delete(Product product);
}
