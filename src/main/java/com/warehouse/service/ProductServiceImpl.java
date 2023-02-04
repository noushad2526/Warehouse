package com.warehouse.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.dao.ProductDao;
import com.warehouse.model.Product;
import com.warehouse.model.Store;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	StoreService storeService;
	
	//saving single product
	public void saveProducts(Product product) {
		productDao.saveProduct(product);
	}

	//saving store and its product
	public void saveStoreAndProducts(Store storeAndProducts) {
		//saving store
		storeService.saveStore(storeAndProducts);
		for (Product product : storeAndProducts.getProducts()) {
			product.setStoreId(storeAndProducts);
			//saving product
			saveProducts(product);
		}
	}

	//get all products
	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}

	//delete product
	public boolean deleteProductById(int productId,int storeId) {
		int count = 0;
		List<Product> products = productDao.getAllProducts();
		
		for (Product product : products) {
			if(product.getStoreId().getStoreId()==storeId) count++;
		}
		//deleting product
		productDao.deleteProduct(productId);
		//delete products and the store(with last product)
		if(count==1) {
			storeService.deleteStore(storeId);
			return true;
		}
		return false;
	}

	//to search from the table based on storeName storeType and productName
	public List<Product> searchByProduct(String storeName, String storeType, String productName) {
		
		List<Product> filteredProducts = new ArrayList<Product>();
		List<Product> allProducts = getAllProducts();
		
		for (Product product : allProducts) {
			
			if(product.getProductName().equalsIgnoreCase(productName) || 
				product.getStoreId().getStoreName().equalsIgnoreCase(storeName) ||
				product.getStoreId().getStoreType().equalsIgnoreCase(storeType)) {
				
				filteredProducts.add(product);
			}
		}
		return filteredProducts;
	}
}
