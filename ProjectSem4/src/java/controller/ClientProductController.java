/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.sun.javafx.css.Combinator;
import common.CommentProduct;
import common.CompleteProduct;
import common.FilterProduct;
import common.paging;
import common.validate;
import dao.CatalogDAO;
import dao.CategoryDAO;
import dao.CustomerDAO;
import dao.NewDAO;
import dao.ProductDAO;
import entities.Brands;
import entities.Catalogs;
import entities.Categories;
import entities.Customers;
import entities.ProductComments;
import entities.ProductImages;
import entities.Products;
import entities.Wishlists;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    private NewDAO newDAO;
    private CatalogDAO catalogDAO;

    @Autowired
    public void setCatalogDAO(CatalogDAO catalogDAO) {
        this.catalogDAO = catalogDAO;
    }

    @Autowired
    public NewDAO getNewDAO() {
        return newDAO;
    }

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

        String newHtml = generateNewsHtml();
        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }

        if (navHtm.length() > 0) {
            model.addAttribute("navbarHtm", navHtm);
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

    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail(RedirectAttributes attributes, HttpSession session, Model model, String productId) {
        Customers customer = (Customers) session.getAttribute("customerLogin");
        Products product = productDAO.getProductById(validate.convertStringToInt(productId, 0));
        CompleteProduct pcl;

        //kiểm tra status đã mở chưa
        if (product == null || product.getProductStatus() == 0) {
            attributes.addFlashAttribute("error", "Mã sản phẩm không hợp lệ!");
            return "redirect:index.htm";
        }

        List<Products> relateProducts = productDAO.getFourProductRelated(product.getProductId());
        List<CompleteProduct> productCompletes = new ArrayList<>();
        CompleteProduct productDetail = null;
        String navbarHtm = categoryDAO.generateNavbar();

        if (customer == null) {
            pcl = new CompleteProduct(product, null, null);
            pcl.setIsNewProduct(productDAO.checkNewProduct(product.getProductId()));

            relateProducts.stream().map((p) -> {
                CompleteProduct pc = new CompleteProduct(p, null, null);
                pc.setIsNewProduct(productDAO.checkNewProduct(p.getProductId()));
                return pc;
            }).forEachOrdered((pc) -> {
                productCompletes.add(pc);
            });

        } else {
            List<Wishlists> wishlists = customerDAO.getWishlistsByCustomerId(customer.getCustomerId());
            pcl = new CompleteProduct(product, customer, wishlists);
            pcl.setIsNewProduct(productDAO.checkNewProduct(product.getProductId()));

            relateProducts.stream().map((p) -> {
                CompleteProduct pc = new CompleteProduct(p, customer, wishlists);
                pc.setIsNewProduct(productDAO.checkNewProduct(p.getProductId()));
                return pc;
            }).forEachOrdered((pc) -> {
                productCompletes.add(pc);
            });
            pcl = new CompleteProduct(product, customer, wishlists);

        }

        List<ProductImages> productImages = productDAO.getAllImagesByProductId(product.getProductId());
        List<ProductComments> productComments = productDAO.getAllCommentsOfProductById(product.getProductId());
        List<CommentProduct> commentProducts = new ArrayList();

        if (productComments.size() > 0) {
            productComments.stream().map((cmt) -> new CommentProduct(cmt)).forEachOrdered((commentProduct) -> {
                commentProducts.add(commentProduct);
            });
        }
        String newHtml = generateNewsHtml();
        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }
        if (navbarHtm.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtm);
        }
        if (productCompletes.size() > 0) {
            model.addAttribute("relateProducts", productCompletes);
        }
        if (productImages.size() > 0) {
            model.addAttribute("productImages", productImages);
        }
        if (commentProducts.size() > 0) {
            model.addAttribute("productComments", commentProducts);
            model.addAttribute("countComments", productComments.size());
        }

        model.addAttribute("product", pcl);
        model.addAttribute("customer", customer);
        return "Customer/product-detail";
    }

    @RequestMapping(value = "CommentProduct", method = RequestMethod.POST)
    public String CommentProduct(RedirectAttributes attributes, HttpSession session, int productId, int productCommentRate, String productCommentContent) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:/customer/login.htm";
        }

        Customers customer = (Customers) session.getAttribute("customerLogin");
        Products product = productDAO.getProductById(productId);
        if ("".equals(productCommentContent)) {
            attributes.addFlashAttribute("error", "Bình luận sản phẩm không được để trống!");
            return "redirect:detail.htm?productId=" + productId;
        }

        ProductComments productComment = new ProductComments();
        productComment.setCustomerId(customer);
        productComment.setProductCommentContent(productCommentContent);
        productComment.setProductCommentRate(productCommentRate);
        productComment.setProductId(product);
        productComment.setProductCommentStatus(1);
        productComment.setProductCommentTime(new Date());

        boolean check = productDAO.commentProduct(productComment);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể bình luận / đánh giá sản phẩm vào lúc này!");
            return "redirect:detail.htm?productId=" + productId;
        } else {
            attributes.addFlashAttribute("success", "Bình luận / đánh giá sản phẩm thành công!");
            return "redirect:detail.htm?productId=" + productId;
        }
        //return "redirect:detail.htm?productId=" + productId;
    }

        private String generateNewsHtml() {
        String html = "";
        List<Catalogs> catalogs = catalogDAO.getAllParentCatalogsFrontEnd();

        for (Catalogs c : catalogs) {
            html += "<div class='col-md-4'>";
            html += "<ul class='list-links'>";
            html += "<li>";
            html += "<h3 class='list-links-title'><a href='/ProjectSem4/new/index.htm?catalogId=" + c.getCatalogId() + "'>" + c.getCatalogName() + "</a></h3>";
            html += "</li>";

            List<Catalogs> children = catalogDAO.getAllChildrenCatalogsByParentIdFrontEnd(c.getCatalogId());

            html = children.stream().map((ct) -> "<li><a href='/ProjectSem4/new/index.htm?catalogId=" + ct.getCatalogId() + "'>" + ct.getCatalogName() + "</a></li>").reduce(html, String::concat);

            html += "</ul>";
            html += "<hr class='hidden-md hidden-lg'>";
            html += "</div>";
        }

        return html;
    }
}
