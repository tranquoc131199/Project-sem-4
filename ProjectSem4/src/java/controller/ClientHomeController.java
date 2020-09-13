/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.CompleteProduct;
import dao.CategoryDAO;
import dao.CustomerDAO;
import dao.ProductDAO;
import dao.WishlistDAO;
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

/**
 *
 * @author Acer Nitro 5
 */
@Controller
public class ClientHomeController {

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
    public String homeIndex(HttpSession session, Model model) {
        //set session
        Customers customer = (Customers) session.getAttribute("customerLogin");
        //hiển thị thanh nvarbar(các category Parntent)
        String navbarHtm = generateNavbar();
        //lây 1 sản phẩm có % giảm giá cao nhất
        Products bestSaleOneProduct = productDAO.getBestSaleProduct();
        //lây 1 sản phẩm bán chạy nhất
        Products bestSellOneProduct = productDAO.getBestSellProduct();
        //lây 12 sản phẩm có % giảm giá cao nhất
        List<Products> bestSaleTweProduct = productDAO.getTopTwelveBestSaleForProducts();
        //lây 12 sản phẩm bán chạy nhất
        List<Products> bestSellTweProduct = productDAO.getTopTwelveBestSellForProducts();
        //lây 4 sản phẩm mới nhất
        List<Products> fourNewProduct = productDAO.getFourNewProduct();

        //gọi hàm sử lý common của product để gọi ra list các sản phẩm.() n 
        CompleteProduct productSale = null;
        CompleteProduct productSell = null;
        List<CompleteProduct> pro12Sale = new ArrayList<>();
        List<CompleteProduct> pro12Sell = new ArrayList<>();
        List<CompleteProduct> fourNewProList = new ArrayList<>();

        //nếu chưa đăng nhập chỉ hiên thị sản ph  ẩm và không hiển thị ra whislist
        if (customer == null) {
            if (bestSaleOneProduct != null) {
                productSale = new CompleteProduct(bestSaleOneProduct, null, null);
            }

            if (bestSaleOneProduct != null) {
                productSell = new CompleteProduct(bestSellOneProduct, null, null);
            }
            //hiển thị ra 12 sản phâm giảm giá nhiều nhất từ database lên màn hình
            if (bestSaleTweProduct.size() > 0) {
                for (Products product : bestSaleTweProduct) {
                    CompleteProduct completeProduct = new CompleteProduct(product, null, null);
                    completeProduct.setIsNewProduct(productDAO.checkNewProduct(product.getProductId()));
                    pro12Sale.add(completeProduct);
                }
            }
            //hiển trị ra 12 sản phẩm bán chạy nhất từ database
            if (bestSellTweProduct.size() > 0) {
                for (Products product : bestSellTweProduct) {
                    CompleteProduct completeProduct = new CompleteProduct(product, null, null);
                    completeProduct.setIsNewProduct(productDAO.checkNewProduct(product.getProductId()));
                    pro12Sell.add(completeProduct);
                }
            }
            //hiển thị ra màn hình 4 sản phẩm có ngày tạo mới nhát để sale
            if (fourNewProduct.size() > 0) {
                for (Products product : fourNewProduct) {
                    CompleteProduct completeProduct = new CompleteProduct(product, null, null);
                    completeProduct.setIsNewProduct(productDAO.checkNewProduct(product.getProductId()));
                    fourNewProList.add(completeProduct);
                }
            }
        } // khi người dugnf đăng nhập thì hiển thị thêm thông tin của wishlists ở ngoài trang chủ
        else {
            List<Wishlists> wishlists = customerDAO.getWishlistsByCustomerId(customer.getCustomerId());

            if (bestSaleOneProduct != null) {
                productSale = new CompleteProduct(bestSaleOneProduct, customer, wishlists);
            }

            if (bestSaleOneProduct != null) {
                productSell = new CompleteProduct(bestSellOneProduct, customer, wishlists);
            }
            //hiển thị ra 12 sản phâm giảm giá nhiều nhất từ database lên màn hình
            if (bestSaleTweProduct.size() > 0) {
                for (Products product : bestSaleTweProduct) {
                    CompleteProduct completeProduct = new CompleteProduct(product, customer, wishlists);
                    completeProduct.setIsNewProduct(productDAO.checkNewProduct(product.getProductId()));
                    pro12Sale.add(completeProduct);
                }
            }
            //get 12 product have the highest sellQty
            if (bestSellTweProduct.size() > 0) {
                for (Products product : bestSellTweProduct) {
                    CompleteProduct completeProduct = new CompleteProduct(product, customer, wishlists);
                    completeProduct.setIsNewProduct(productDAO.checkNewProduct(product.getProductId()));
                    pro12Sell.add(completeProduct);
                }
            }
            //hiển thị ra màn hình 4 sản phẩm có ngày tạo mới nhát để sale
            if (fourNewProduct.size() > 0) {
                for (Products product : fourNewProduct) {
                 CompleteProduct completeProduct = new CompleteProduct(product, customer, wishlists);
                   completeProduct.setIsNewProduct(productDAO.checkNewProduct(product.getProductId()));
                   fourNewProList.add(completeProduct);
               }            }
        }

        if (customer != null) {
            model.addAttribute("customer", customer);
        }
        if (navbarHtm.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtm);
        }

        if (productSale != null) {
            model.addAttribute("bestSaleProduct", productSale);
        }

        if (productSell != null) {
            model.addAttribute("bestSellProduct", productSell);
        }

        if (pro12Sale.size() > 0) {
            model.addAttribute("best12SaleProducts", pro12Sale);
        }

        if (pro12Sell.size() > 0) {
            model.addAttribute("best12SellProducts", pro12Sell);
        }
        if (fourNewProList.size() > 0) {
            model.addAttribute("fourNewestProducts", fourNewProList);
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
                    htm += "<h3 class='list-links-title'><a href='/ProjectSem4/product/index.htm?brandId=&categoryId=" + ct.getCategoryId() + "&view=&sort=&pageSize=&keyword='>" + ct.getCategoryName() + "</a></h3>";
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
                htm += "<li><a href='/ProjectSem4/product/index.htm?brandId=&categoryId=" + c.getCategoryId() + "&view=&sort=&pageSize=&keyword='>" + c.getCategoryName() + "</a></li>";
            }
        }
        return htm;
    }
}
