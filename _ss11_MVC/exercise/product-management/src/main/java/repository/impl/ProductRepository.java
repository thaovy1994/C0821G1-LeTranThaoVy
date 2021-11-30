package repository.impl;

import bean.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class ProductRepository implements IProductRepository {
    //tạo 1 map để giả 1 DB
    private static Map<Integer,Product> productMap;
    static {
        productMap = new TreeMap<>();
        productMap.put(1, new Product(111,"Milk",15000,5));
        productMap.put(2, new Product(222,"Candy",10000,2));
        productMap.put(3, new Product(333,"Cupcake",30000,3));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());           //ép Map sang List, value trả về Collection
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
