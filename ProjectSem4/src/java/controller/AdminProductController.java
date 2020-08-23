/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import entities.Categories;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Acer Nitro 5
 */
public class AdminProductController {

    private CategoryDAO categoryDAO;

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }
    
    @RequestMapping("/category")
    public String loadCategory(Model model){    
        List<Categories> allCategory = categoryDAO.getAllCategory();
        model.addAttribute("listCategory", allCategory);
        return "Admin/category-list";        
    }
    
    @RequestMapping("/category/initInsertCategory")
    public String initInsertCategory(Model model){      
        return null;        
    }
    
    
    
    

   
}
