package com.warehouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.warehouse.model.Product;
import com.warehouse.model.Store;
import com.warehouse.service.ProductService;
import com.warehouse.service.StoreService;


@Controller
public class ProductController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	ProductService productService;
	
	//get all products and redirect to home page
	@RequestMapping("/getAllProducts")
	public String allProducts(Model m) {
		List<Product> allProducts = productService.getAllProducts();
		m.addAttribute("products", allProducts);
		return "home";
	}
	
	//redirect to add product page
	@RequestMapping("/addProduct")
	public String addProduct() {
		return "add_product";
	}
	
	//redirect to add product page with store and product details
	@RequestMapping("/editProduct/{storeId}")
	public String editProduct(@PathVariable(value="storeId") int storeId, Model m) {
		Store productsAndStore = storeService.findProductsAndStore(storeId);
		List<Product> products = productsAndStore.getProducts();
		m.addAttribute("store", productsAndStore);
		m.addAttribute("products", products);
		return "update_product";
	}

	//save or update the store and product
	@RequestMapping("/saveOrUpdateStore")
	public RedirectView saveOrUpdateStore(@ModelAttribute Store storeAndProducts, HttpServletRequest request) {
		productService.saveStoreAndProducts(storeAndProducts);
		RedirectView redirectView = new RedirectView(); 
		redirectView.setUrl(request.getContextPath()+"/getAllProducts");
		return redirectView;
	}
	
	
	//delete products and the store(with last product)
		@RequestMapping("/deleteProduct/{productId}/{storeId}")
		public RedirectView deleteProduct(@PathVariable(value="productId") int productId, @PathVariable(value="storeId") int storeId, HttpServletRequest request) {
			productService.deleteProductById(productId, storeId);
			RedirectView redirectView = new RedirectView(); 
			redirectView.setUrl(request.getContextPath()+"/getAllProducts");
			return redirectView; 
		}
	
		//delete product on update and the store(with last product)
		@RequestMapping("/deleteProductOnUpdate/{productId}/{storeId}")
		public RedirectView deleteProductOnUpdate(@PathVariable(value="productId") int productId, @PathVariable(value="storeId") int storeId, Model m, HttpServletRequest request) {
			boolean lastProduct = productService.deleteProductById(productId, storeId);
			RedirectView redirectView = new RedirectView(); 
			if(lastProduct) {
				redirectView.setUrl(request.getContextPath()+"/getAllProducts");
			}else redirectView.setUrl(request.getContextPath()+"/editProduct/"+storeId);
			return redirectView; 
		}
		
	//to search from the table based on storeName storeType or productName
	@RequestMapping("/search")
	public String searchByProductName(@RequestParam(value="storeName") String storeName, @RequestParam(value="storeType") String storeType, @RequestParam(value="productName") String productName, Model m) {
		List<Product> filteredProduct = productService.searchByProduct(storeName, storeType, productName);
		m.addAttribute("products", filteredProduct);
		return "home";
	}
	
}
