package com.warehouse.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import com.warehouse.model.Store;


@Component
public class StoreDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	// saving store
	@Transactional
	public void saveStore(Store store) {
		this.hibernateTemplate.saveOrUpdate(store);
	}
	
	// get all stores
	public List<Store> getStores() {
		return this.hibernateTemplate.loadAll(Store.class);
	}

	// deleting store
	@Transactional
	public void deleteStore(int storeId) {
		Store store = this.hibernateTemplate.load(Store.class, storeId);
		this.hibernateTemplate.delete(store);
	}

	// find single store
	public Store findStoreById(int storeId) {
		return this.hibernateTemplate.get(Store.class, storeId);
	}
	
}
