package com.warehouse.service;

import java.util.List;

import com.warehouse.model.Product;
import com.warehouse.model.Store;

public interface ProductService {

	List<Product> getAllProducts();

	void saveStoreAndProducts(Store storeAndProducts);

	boolean deleteProductById(int productId, int storeId);

	List<Product> searchByProduct(String storeName, String storeType, String productName);

}
