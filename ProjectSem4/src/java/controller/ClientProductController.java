/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.sun.javafx.css.Combinator;
import common.CompleteProduct;
import common.FilterProduct;
import common.paging;
import common.validate;
import dao.CategoryDAO;
import dao.CustomerDAO;
import dao.ProductDAO;
import entities.Brands;
import entities.Categories;
import entities.Customers;
import entities.Products;
import entities.Wishlists;
import java.util.ArrayList;
import java.util.List;
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
        //khởi tạo brand
        Brands brand = null;
        //khởi tạo category
        Categories category = null;

        String keyword = "";

        //set sessioin để tìm kiếm theo tên sản phẩm
        if (session.getAttribute("productNameClient") != null) {
            keyword = (String) session.getAttribute("productNameClient");
        }

        //check xem hãng sản xuất có tồn tại không hoặc status có được sử dụng k 
        if (brandId != null && !brandId.equals("")) {
            // chờ thắng commit để ghép vafp(tạm thời lấy từ productDao)
            brand = productDAO.getBrandById(validate.convertStringToInt(brandId, 0));

            if (brand == null || brand.getBrandStatus() != 1) {
                attributes.addFlashAttribute("error", "Mã hãng sản xuất không tồn tại!");
                return "redirect:/product/index.htm";
            }
        } else {
            brandId = "";
        }

        //check xem dah mục sản phẩm có tồn tại haowjc có status =1 không
        if (categoryId != null && !categoryId.equals("")) {
            category = categoryDAO.getCategoryById(validate.convertStringToInt(categoryId, 0));

            if (category == null || category.getCategoryStatus() != 1) {
                attributes.addFlashAttribute("error", "Mã danh mục sản phẩm không tồn tại!");
                return "redirect:/product/index.html";
            }
        } else {
            categoryId = "";
        }

        if (page == null || page <= 0) {
            page = 1;
        }
        if (pageSize == null || (pageSize != 12 && pageSize != 24 && pageSize != 60)) {
            pageSize = 12;
        }

        if (sort == null || sort != 1 && sort != 2 && sort != 3 && sort != 4 && sort != 5 && sort != 6 && sort != 7) {
            sort = 1;
        }

        if (view == null || (!view.equals("grid") && !view.equals("list"))) {
            view = "grid";
        }

        //khai báo list Brand
        List<Brands> brands;
        //khai bao list categories
        List<Categories> categories;
        //khai bao list product
        List<Products> products;
        //khai bao đối tượng phân trang
        paging paging;
        //khai báo đối tượng lọc
        FilterProduct filters;
        // số trang
        String pagingHtm = "";
        //đường link đầu
        String firstLink = "/ProjectSem4/product/index.html?brandId=" + brandId + "&categoryId=" + categoryId + "&view=" + view + "&sort=" + sort + "&keyword=" + keyword + "&pageSize=" + pageSize;
        //đường link tiếp theo
        String currentLink = "/ProjectSem4/product/index.html{p}&brandId=" + brandId + "&categoryId=" + categoryId + "&view=" + view + "&sort=" + sort + "&keyword=" + keyword + "&pageSize=" + pageSize;
        List<CompleteProduct> productCompletes = new ArrayList<>();
        List<CompleteProduct> proByBrand = new ArrayList<>();
        //navbar categories product
        String navHtm = categoryDAO.generateNavbar();

        // lấy ra tổng số sản phẩm. 
        int totalRecords = productDAO.countProductFilterForPaging(brand, category, keyword);
        if (totalRecords > pageSize) {
            paging = new paging(page, totalRecords, pageSize, currentLink, firstLink);
            filters = productDAO.filterProductsForClient(paging.startRecord, pageSize, brand, category, keyword, sort);
            products = filters.products;
            brands = filters.brands;
            categories = filters.categories;
            pagingHtm = paging.generateHtmlFrontend();
        } else {
            filters = productDAO.filterProductsForClient(0, totalRecords, brand, category, keyword, sort);
            products = filters.products;
            brands = filters.brands;
            categories = filters.categories;
        }
        if (customer == null) {
            if (products.size() > 0) {
                for (Products pro : products) {
                    CompleteProduct completeProduct = new CompleteProduct(pro, null, null);
                    completeProduct.setIsNewProduct(productDAO.checkNewProduct(pro.getProductId()));
                    productCompletes.add(completeProduct);
                }
            }
        } else {
            List<Wishlists> wishlists = customerDAO.getWishlistsByCustomerId(customer.getCustomerId());
            if (products.size() > 0) {
                for (Products pro : products) {
                    CompleteProduct completeProduct = new CompleteProduct(pro, customer, wishlists);
                    completeProduct.setIsNewProduct(productDAO.checkNewProduct(pro.getProductId()));
                    productCompletes.add(completeProduct);
                }
            }
            model.addAttribute("customer", customer);
        }

        if (navHtm.length() > 0) {
            model.addAttribute("navbarHtml", navHtm);
        }

        if (pagingHtm.length() > 0) {
            model.addAttribute("paging", pagingHtm);
        }

        if (categories.size() > 0) {
            model.addAttribute("parentCategories", categories);
        }

        if (brands.size() > 0) {
            model.addAttribute("brands", brands);
        }

        if (productCompletes.size() > 0) {
            model.addAttribute("products", productCompletes);
        }

        if (brand != null) {
            model.addAttribute("brandId", brand.getBrandId());
        }

        if (category != null) {
            model.addAttribute("categoryId", category.getCategoryId());
        }

        if (keyword.length() > 0) {
            model.addAttribute("keyword", keyword);
        }

        model.addAttribute("brandId", brandId);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("view", view);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("sort", sort);
        model.addAttribute("keyword", keyword);

        return "Customer/product-list";
    }

}
