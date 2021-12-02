package service;

import bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();            //~showAll
    Product findById(Integer id);
    boolean save(Product product);      //~update
    void delete(Product product);
}
