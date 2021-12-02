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
        productMap.put(1, new Product(1,"Milk",15000,5));
        productMap.put(2, new Product(2,"Candy",10000,2));
        productMap.put(3, new Product(3,"Cupcake",30000,3));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());           //ép Map sang List, value trả về Collection
//        return new ArrayList<>();                               //test thử trường hợp List rỗng
    }

    @Override
    public Product findById(Integer id) {
        return null;
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getProductId(),product);
    }

    @Override
    public void delete(Product product) {
        productMap.remove(product.getProductId());
    }
}
