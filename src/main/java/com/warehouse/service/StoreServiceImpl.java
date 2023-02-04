package com.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.dao.StoreDao;
import com.warehouse.model.Store;


@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDao storeDao;

	//saving a store
	public void saveStore(Store store) {
		storeDao.saveStore(store);
	}
	
	//get all the stores
	public List<Store> getAllStores() {
		return storeDao.getStores();
	}
	
	//get single store by id
	public Store findProductsAndStore(int storeId) {
		return storeDao.findStoreById(storeId);
	}

	//delete store by id
	public void deleteStore(int storeId) {
		storeDao.deleteStore(storeId);
	}
	
	//get store names only
	public String[] getStoreNames() {
		List<Store> stores = getAllStores();
		String storeNames[] = new String[stores.size()];
		for(int i = 0; i<stores.size(); i++) {
			storeNames[i] = stores.get(i).getStoreName(); 
		}
		return storeNames;
	}
	
}
