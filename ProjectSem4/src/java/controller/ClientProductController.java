/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import dao.CustomerDAO;
import dao.ProductDAO;
import entities.Customers;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Acer Nitro 5
 */
@Controller
@RequestMapping(value = "product")
public class ClientProductController {

    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;
    private CustomerDAO customerDAO;

    @Autowired
    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @Autowired
    public void setCustomerDAO(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    @RequestMapping(value = "index")
    public String index(HttpSession session, RedirectAttributes attributes, Model model, String brandId, String categoryId, String view, Integer sort, Integer pageSize, Integer page) {
        //set session
        Customers customer = (Customers) session.getAttribute("customerLogin");
        
        
        

        return "Customer/product-list";
    }

}
