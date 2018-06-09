package com.niit.ProductController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.niit.Model.Product;
import com.niit.Service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService pdService;
	
	Product product;
	
	@GetMapping("/")
	public String addProduct(Model model)
	{
		model.addAttribute("products",new Product());
		model.addAttribute("list",pdService.getAll());
		return "AddProduct";
		
	}
	@PostMapping("/product/add")
	public String addProduct1(@ModelAttribute("products")Product product)//model
	 {
		
			if(product.getProductId()!=0) 
			{
				pdService.addservice(product);	
			}
			
		return "redirect:/"; //  to redirect to root element which calls mapped
		} 
	
	@GetMapping("/remove/{productId}")
	public String removeEmloyee(@PathVariable("productId") int productId)
	{
		
		pdService.deleteService(productId);
        return "redirect:/";
   }
	@GetMapping("/edit/{productId}")
	public String editproduct(@PathVariable("productId") int id, Model model) {
		model.addAttribute("products", pdService.getProductbyId(id));
		//model.addAttribute("employees", serveobj.getAll());
		return "UpdateProduct";
	}
	@PostMapping("/product/modify") 
	public String modifyProduct(@ModelAttribute("products") Product product)// model
	{

		if (product.getProductId() != 0) {
			pdService.updateservice(product);
		}

		return "redirect:/"; // to redirect to root element 
	}
}
