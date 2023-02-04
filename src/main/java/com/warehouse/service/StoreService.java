package com.warehouse.service;

import java.util.List;

import com.warehouse.model.Store;

public interface StoreService{

	List<Store> getAllStores();

	Store findProductsAndStore(int storeId);

	void saveStore(Store store);

	void deleteStore(int storeId);

	String[] getStoreNames();

}
