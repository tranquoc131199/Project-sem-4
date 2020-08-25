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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Acer Nitro 5
 */
@Controller
@RequestMapping(value = "admin")
public class AdminProductController {

    private CategoryDAO categoryDAO;

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @RequestMapping(value = "category", method = RequestMethod.GET)
    public String loadCategory(Model model) {
        List<Categories> allCategory = categoryDAO.getAllCategory();
        model.addAttribute("allCategory", allCategory);
        return "Admin/category-list";
    }

    @RequestMapping(value = "category/initInsertCategory")
    public String initInsertCategory(Model model) {
        int maxPiority = categoryDAO.getMaxCategoryPiority();
        if (maxPiority >= 0) {
            model.addAttribute("maxPiority", maxPiority + 1);
        }
        List<Categories> categories = categoryDAO.getAllCategory();
        model.addAttribute("categories", categories);
        return "Admin/category-insert";
    }

    @RequestMapping(value = "category/insertCategory")
    public String insertCategory(Model model) {
        return null;
    }

}
