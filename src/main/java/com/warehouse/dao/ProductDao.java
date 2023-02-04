package com.warehouse.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.warehouse.model.Product;

@Component
public class ProductDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	// saving product
	@Transactional
	public void saveProduct(Product product) {
		this.hibernateTemplate.saveOrUpdate(product);
	}
	
	// get all products
	public List<Product> getAllProducts() {
		return this.hibernateTemplate.loadAll(Product.class);
	}

	// deleting single Product by Id
	@Transactional
	public void deleteProduct(int productId) {
		Product product = this.hibernateTemplate.load(Product.class, productId);
		this.hibernateTemplate.delete(product);
	}
	
}
