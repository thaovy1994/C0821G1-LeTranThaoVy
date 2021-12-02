package repository;

import bean.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();            //~showAll
    Product findById(Integer id);
    void save(Product product);      //~update

}
