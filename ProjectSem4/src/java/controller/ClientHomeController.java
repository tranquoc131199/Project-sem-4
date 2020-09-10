/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import entities.Categories;
import entities.Customers;
import entities.Products;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Acer Nitro 5
 */
@Controller
public class ClientHomeController {

    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;

    @Autowired
    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @RequestMapping(value = "index")
    public String homeIndex(HttpSession session, Model model) {
        //set session
        Customers customer = (Customers) session.getAttribute("customerLogin");
        String navbarHtm = generateNavbar();
        //lây 1 sản phẩm có % giảm giá cao nhất
        Products bestSaleProduct = productDAO.getBestSaleProduct();
        

        if (customer != null) {
            model.addAttribute("customer", customer);
        }
        if (navbarHtm.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtm);
        }

        model.addAttribute("title", "QTB-Store");
        return "Customer/home-index";
    }

    private String generateNavbar() {
        String htm = "";
        List<Categories> categories = categoryDAO.getParentCategories();

        for (Categories c : categories) {
            if (categoryDAO.isParentCategory(c.getCategoryId())) {
                htm += "<li class='dropdown side-dropdown'>";
                htm += "<a class='dropdown-toggle' data-toggle='dropdown' aria-expanded='true'>" + c.getCategoryName() + "<i class='fa fa-angle-right'></i></a>";
                htm += "<div class='custom-menu'>";
                htm += "<div class='row'>";

                List<Categories> children = categoryDAO.getChildrenCategoriesByParentId(c.getCategoryId());

                for (Categories ct : children) {
                    htm += "<div class='col-md-4'>";
                    htm += "<ul class='list-links'>";
                    htm += "<li>";
                    htm += "<h3 class='list-links-title'><a href='/ProjectSem4/product/index.html?brandId=&categoryId=" + ct.getCategoryId() + "&view=&sort=&pageSize=&keyword='>" + ct.getCategoryName() + "</a></h3>";
                    htm += "</li>";
                    htm += "</ul>";
                    htm += "<hr>";
                    htm += "<hr class='hidden-md hidden-lg'>";
                    htm += "</div>";
                }
                htm += "</div>";
                htm += "</div>";
                htm += "</li>";
            } else {
                htm += "<li><a href='/ProjectSem4/product/index.html?brandId=&categoryId=" + c.getCategoryId() + "&view=&sort=&pageSize=&keyword='>" + c.getCategoryName() + "</a></li>";
            }
        }
        return htm;
    }
}
