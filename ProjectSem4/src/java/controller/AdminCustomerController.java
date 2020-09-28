/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.validate;
import common.paging;
import dao.CustomerDAO;
import dao.FeedbackDAO;
import dao.LogoDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import entities.Admins;
import entities.Customers;
import entities.FeedbackCatalogs;
import entities.Feedbacks;
import entities.Logoes;
import entities.Orders;
import entities.ProductComments;
import entities.Wishlists;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Thang Pham
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminCustomerController {

    private CustomerDAO customerDAO;

    private FeedbackDAO feedbackDAO;

    private ProductDAO productDAO;

    private LogoDAO logoDAO;

    private OrderDAO orderDAO;

    @Autowired
    public void setLogoDAO(LogoDAO logoDAO) {
        this.logoDAO = logoDAO;
    }

    @Autowired
    public void setCustomerDAO(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    @Autowired
    public void setFeedbackDAO(FeedbackDAO feedbackDAO) {
        this.feedbackDAO = feedbackDAO;
    }

    @Autowired
    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @Autowired
    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    @RequestMapping(value = "/customer")
    public String index(HttpSession session, Model model, Integer page) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        List<Customers> customers;
        
        String customerName = "";

        if (session.getAttribute("customerName") != null) {
            customerName = (String) session.getAttribute("customerName");
        }

        if (page == null || page <= 0) {
            page = 1;
        }

        if (customerName == null) {
            customerName = "";
        }

        int totalRecords = customerDAO.countAllCustomers();
        String firstLink = "/ProjectSem4/admin/customer.htm?customerName=" + customerName;
        String currentLink = "/ProjectSem4/admin/customer.htm{p}&customerName=" + customerName;
        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        String iconImage = "";

        if (totalRecords > 0) {
            paging paging = new paging(page, totalRecords, 12, currentLink, firstLink);

            if (customerName.equals("")) {
                customers = customerDAO.getAllCustomers(paging.startRecord, 12);
                session.removeAttribute("customerName");
            } else {
                customers = customerDAO.searchCustomersByName(customerName, paging.startRecord, 12);
            }

            if (customers.size() > 0) {
                model.addAttribute("customers", customers);
            }

            if (paging.generateHtml().length() > 0) {
                model.addAttribute("paging", paging.generateHtml());
            }
        }

        if (logo != null) {
            logoImage = logo.getLogoImage();
        }

        if (logoImage.length() > 0) {
            model.addAttribute("logo", logoImage);
        }

        if (iconImage.length() > 0) {
            model.addAttribute("icon", iconImage);
        }

        model.addAttribute("title", "Danh sách người dùng");
        return "Admin/customer-list";
    }

    @RequestMapping(value = "/customer/detail")
    public String detailCustomer(RedirectAttributes attributes, HttpSession session, Model model, String customerId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        Customers customer = customerDAO.getCustomerById(validate.convertStringToInt(customerId, 0));

        if (customer == null) {
            attributes.addFlashAttribute("error", "Mã khách hàng không tồn tại!");
            return "redirect:/admin/customer.htm";
        }

        List<ProductComments> productComments = customerDAO.getProductCommentsByCustomerId(customer.getCustomerId());
        List<Wishlists> wishlists = customerDAO.getWishlistsByCustomerId(customer.getCustomerId());
        Integer countBoughtProductsByCustomerId = customerDAO.countBoughtProductsByCustomerId(customer.getCustomerId());
//        List<Orders> orders = orderDAO.getAllOrdersByCustomerId(customer.getCustomerId());
        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        String iconImage = "";

        if (productComments.size() > 0) {
            model.addAttribute("productComments", productComments);
        }

        if (wishlists.size() > 0) {
            model.addAttribute("wishlistSize", wishlists.size());
        }

        if (countBoughtProductsByCustomerId >= 0) {
            model.addAttribute("boughtProducts", countBoughtProductsByCustomerId);
        }

        if (logo != null) {
            logoImage = logo.getLogoImage();
        }

        if (logoImage.length() > 0) {
            model.addAttribute("logo", logoImage);
        }

        if (iconImage.length() > 0) {
            model.addAttribute("icon", iconImage);
        }

        model.addAttribute("customer", customer);
        model.addAttribute("title", "Thông tin người dùng");
        return "Admin/customer-detail";
    }

    @RequestMapping(value = "/customer/search")
    public String searchCustomer(RedirectAttributes attributes, HttpSession session, Model model, String customerName) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        session.setAttribute("customerName", customerName);
        return "redirect:/admin/customer.htm";
    }

    @RequestMapping(value = "/customer/disable")
    public String disableCustomer(RedirectAttributes attributes, HttpSession session, String customerId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Customers customer = customerDAO.getCustomerById(validate.convertStringToInt(customerId, 0));

        if (customer == null) {
            attributes.addFlashAttribute("error", "Mã khách hàng không tồn tại!");
            return "redirect:/admin/customer.htm";
        }

        if (customerDAO.disableCustomer(validate.convertStringToInt(customerId, 0))) {
            attributes.addFlashAttribute("success", "Cập nhật khách hàng thành công!");
            return "redirect:/admin/customer.htm";
        } else {
            attributes.addFlashAttribute("error", "Cập nhật khách hàng không thành công!");
            return "redirect:/admin/customer.htm";
        }
    }

    @RequestMapping(value = "/customer/enable")
    public String enableCustomer(RedirectAttributes attributes, HttpSession session, String customerId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Customers customer = customerDAO.getCustomerById(validate.convertStringToInt(customerId, 0));

        if (customer == null) {
            attributes.addFlashAttribute("error", "Mã khách hàng không tồn tại!");
            return "redirect:/admin/customer.htm";
        }

        if (customerDAO.enableCustomer(validate.convertStringToInt(customerId, 0))) {
            attributes.addFlashAttribute("success", "Cập nhật khách hàng thành công!");
            return "redirect:/admin/customer.htm";
        } else {
            attributes.addFlashAttribute("error", "Cập nhật khách hàng không thành công!");
            return "redirect:/admin/customer.htm";
        }
    }

    @RequestMapping(value = "/customer/disable-product-comment")
    public String disableProductComment(RedirectAttributes attributes, HttpSession session, Integer productCommentId, Integer customerId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        ProductComments productComment = customerDAO.getProductCommentById(productCommentId);

        if (productComment == null) {
            attributes.addFlashAttribute("error", "Mã bình luận sản phẩm không tồn tại!");
            return "redirect:detail.htm?customerId=" + customerId;
        }

        boolean check = customerDAO.updateProductCommentStatus(productCommentId, 0);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật bình luận sản phẩm không thành công!");
            return "redirect:detail.htm?customerId=" + customerId;
        } else {
            attributes.addFlashAttribute("success", "Cập nhật bình luận sản phẩm thành công!");
            return "redirect:detail.htm?customerId=" + customerId;
        }
    }

    @RequestMapping(value = "/customer/enable-product-comment")
    public String enableProductComment(RedirectAttributes attributes, HttpSession session, Integer productCommentId, Integer customerId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        ProductComments productComment = customerDAO.getProductCommentById(productCommentId);

        if (productComment == null) {
            attributes.addFlashAttribute("error", "Mã bình luận sản phẩm không tồn tại!");
            return "redirect:detail.htm?customerId=" + customerId;
        }

        boolean check = customerDAO.updateProductCommentStatus(productCommentId, 1);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật bình luận sản phẩm không thành công!");
            return "redirect:detail.htm?customerId=" + customerId;
        } else {
            attributes.addFlashAttribute("success", "Cập nhật bình luận sản phẩm thành công!");
            return "redirect:detail.htm?customerId=" + customerId;
        }
    }

//    @RequestMapping(value = "/customer/disable-news-comment")
//    public String disableNewsComment(RedirectAttributes attributes, HttpSession session, Integer newCommentId, Integer customerId) {
//        if (session.getAttribute("adminLogin") == null) {
//            return "redirect:/admin/login.html";
//        }
//
//
//        if (newComment == null) {
//            attributes.addFlashAttribute("error", "Mã bình luận tin tức không tồn tại!");
//            return "redirect:detail.html?customerId=" + customerId;
//        }
//
//        boolean check = customerDAO.updateNewCommentStatus(newCommentId, 0);
//
//        if (!check) {
//            attributes.addFlashAttribute("error", "Cập nhật bình luận sản phẩm không thành công!");
//            return "redirect:detail.html?customerId=" + customerId;
//        } else {
//            attributes.addFlashAttribute("success", "Cập nhật bình luận sản phẩm thành công!");
//            return "redirect:detail.html?customerId=" + customerId;
//        }
//    }
//    @RequestMapping(value = "/customer/enable-news-comment")
//    public String enableNewsComment(RedirectAttributes attributes, HttpSession session, Integer newCommentId, Integer customerId) {
//        if (session.getAttribute("adminLogin") == null) {
//            return "redirect:/admin/login.html";
//        }
//
//        NewComments newComment = customerDAO.getNewCommentById(newCommentId);
//
//        if (newComment == null) {
//            attributes.addFlashAttribute("error", "Mã bình luận tin tức không tồn tại!");
//            return "redirect:detail.html?customerId=" + customerId;
//        }
//
//        boolean check = customerDAO.updateNewCommentStatus(newCommentId, 1);
//
//        if (!check) {
//            attributes.addFlashAttribute("error", "Cập nhật bình luận sản phẩm không thành công!");
//            return "redirect:detail.html?customerId=" + customerId;
//        } else {
//            attributes.addFlashAttribute("success", "Cập nhật bình luận sản phẩm thành công!");
//            return "redirect:detail.html?customerId=" + customerId;
//        }
//    }
//    @RequestMapping(value = "/customer/disable-promotion-comment")
//    public String disablePromotionComment(RedirectAttributes attributes, HttpSession session, Integer promotionCommentId, Integer customerId) {
//        if (session.getAttribute("adminLogin") == null) {
//            return "redirect:/admin/login.html";
//        }
//
//        PromotionComments promotionComment = customerDAO.getPromotionCommentById(promotionCommentId);
//
//        if (promotionComment == null) {
//            attributes.addFlashAttribute("error", "Mã bình luận chương trình khuyến mãi không tồn tại!");
//            return "redirect:detail.html?customerId=" + customerId;
//        }
//
//        boolean check = customerDAO.updatePromotionCommentStatus(promotionCommentId, 0);
//
//        if (!check) {
//            attributes.addFlashAttribute("error", "Cập nhật bình luận sản phẩm không thành công!");
//            return "redirect:detail.html?customerId=" + customerId;
//        } else {
//            attributes.addFlashAttribute("success", "Cập nhật bình luận sản phẩm thành công!");
//            return "redirect:detail.html?customerId=" + customerId;
//        }
//    }
//
//    @RequestMapping(value = "/customer/enable-promotion-comment")
//    public String enablePromotionComment(RedirectAttributes attributes, HttpSession session, Integer promotionCommentId, Integer customerId) {
//        if (session.getAttribute("adminLogin") == null) {
//            return "redirect:/admin/login.html";
//        }
//
//        PromotionComments promotionComment = customerDAO.getPromotionCommentById(promotionCommentId);
//
//        if (promotionComment == null) {
//            attributes.addFlashAttribute("error", "Mã bình luận chương trình khuyến mãi không tồn tại!");
//            return "redirect:detail.html?customerId=" + customerId;
//        }
//
//        boolean check = customerDAO.updatePromotionCommentStatus(promotionCommentId, 1);
//
//        if (!check) {
//            attributes.addFlashAttribute("error", "Cập nhật bình luận sản phẩm không thành công!");
//            return "redirect:detail.html?customerId=" + customerId;
//        } else {
//            attributes.addFlashAttribute("success", "Cập nhật bình luận sản phẩm thành công!");
//            return "redirect:detail.html?customerId=" + customerId;
//        }
//    }
    @RequestMapping(value = "/feedback")
    public String feedback(RedirectAttributes attributes, HttpSession session, Model model, Integer page, Integer feedbackCatalogId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        int totalRecords;
        String firstLink = "/ProjectSem4/admin/feedback.htm";
        String currentLink = "/ProjectSem4/admin/feedback.htm{p}";
        paging paging;
        String pagingHtml = "";
        List<Feedbacks> feedbacks;
        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        String iconImage = "";

        if (page == null || page <= 0) {
            page = 1;
        }

        if (feedbackCatalogId == null) {
            totalRecords = feedbackDAO.countAllFeedback(null);

            if (totalRecords > 12) {
                paging = new paging(page, totalRecords, 12, currentLink, firstLink);
                feedbacks = feedbackDAO.getAllFeedbacks(paging.startRecord, 12, null);
                pagingHtml = paging.generateHtml();
            } else {
                feedbacks = feedbackDAO.getAllFeedbacks(0, totalRecords, null);
            }
        } else {
            FeedbackCatalogs feedbackCatalog = feedbackDAO.getFeedbackCatalogById(feedbackCatalogId);

            if (feedbackCatalog == null) {
                attributes.addFlashAttribute("error", "Mã danh mục phản hồi không tồn tại!");
                return "redirect:/admin/feedback.htm";
            }

            totalRecords = feedbackDAO.countAllFeedback(feedbackCatalog);
            firstLink = "/ProjectSem4/admin/feedback.htm?feedbackCatalogId" + feedbackCatalogId;
            currentLink = "/ProjectSem4/admin/feedback.htm{p}&feedbackCatalogId" + feedbackCatalogId;

            if (totalRecords > 12) {
                paging = new paging(page, totalRecords, 12, currentLink, firstLink);
                feedbacks = feedbackDAO.getAllFeedbacks(paging.startRecord, 12, feedbackCatalog);
                pagingHtml = paging.generateHtml();
            } else {
                feedbacks = feedbackDAO.getAllFeedbacks(0, totalRecords, feedbackCatalog);
            }
        }

        if (logo != null) {
            logoImage = logo.getLogoImage();
        }

        if (logoImage.length() > 0) {
            model.addAttribute("logo", logoImage);
        }

        if (iconImage.length() > 0) {
            model.addAttribute("icon", iconImage);
        }

        if (feedbacks.size() > 0) {
            model.addAttribute("feedbacks", feedbacks);
        }

        if (pagingHtml.length() > 0) {
            model.addAttribute("pagingHtml", pagingHtml);
        }

        model.addAttribute("title", "Phản hồi");
        return "Admin/feedback-list";
    }

    @RequestMapping(value = "/feedback/detail")
    public String detailFeedback(RedirectAttributes attributes, HttpSession session, Model model, Integer feedbackId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Feedbacks feedback = feedbackDAO.getFeedbackById(feedbackId);
        List<FeedbackCatalogs> feedbackCatalogs = feedbackDAO.getAllFeedbackCatalogs();

        if (feedback == null) {
            attributes.addFlashAttribute("error", "Mã phản hồi không tồn tại!");
            return "redirect:/admin/feedback.htm";
        }

        if (feedbackCatalogs.size() > 0) {
            model.addAttribute("feedbackCatalogs", feedbackCatalogs);
        }

        model.addAttribute("feedback", feedback);
        model.addAttribute("title", "Chi tiết phản hồi");
        return "Admin/feedback-detail";
    }

    @RequestMapping(value = "/feedback/delete")
    public String deleteFeedback(RedirectAttributes attributes, HttpSession session, Integer feedbackId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Feedbacks feedback = feedbackDAO.getFeedbackById(feedbackId);

        if (feedback == null) {
            attributes.addFlashAttribute("error", "Mã phản hồi không tồn tại!");
            return "redirect:/admin/feedback.htm";
        }

        boolean check = feedbackDAO.deleteFeedback(feedbackId);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể xoá phản hồi vào lúc này!");
            return "redirect:/admin/feedback.htm";
        } else {
            attributes.addFlashAttribute("success", "Xoá phản hồi thành công!");
            return "redirect:/admin/feedback.htm";
        }
    }

    @RequestMapping(value = "/feedback/catalog")
    public String catalogFeedback(Model model) {
        List<FeedbackCatalogs> feedbackCatalogs = feedbackDAO.getAllFeedbackCatalogs();

        if (feedbackCatalogs.size() > 0) {
            model.addAttribute("feedbackCatalogs", feedbackCatalogs);
        }

        model.addAttribute("title", "Danh mục phản hồi");
        return "Admin/feedback-catalog";
    }

    @RequestMapping(value = "/feedback/insert-catalog")
    public String insertCatalog(RedirectAttributes attributes, HttpSession session, String feedbackCatalogName, Integer feedbackCatalogStatus) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        if (validate.isEmpty(feedbackCatalogName)) {
            attributes.addFlashAttribute("error", "Tên danh mục phản hồi không được để trống!");
            return "redirect:/admin/feedback/catalog.htm";
        }

        if (!validate.checkMaxLenght(feedbackCatalogName, 250)) {
            attributes.addFlashAttribute("error", "Độ dài tên danh mục phản hồi không được vượt quá 250 ký tự!");
            return "redirect:/admin/feedback/catalog.htm";
        }

        FeedbackCatalogs feedbackCatalog = new FeedbackCatalogs();
        feedbackCatalog.setFeedbackCatalogName(feedbackCatalogName);
        feedbackCatalog.setCreatedDate(new Date());
        feedbackCatalog.setUpdatedDate(new Date());
        feedbackCatalog.setFeedbackCatalogStatus(1);

        boolean check = feedbackDAO.insertFeedbackCatalog(feedbackCatalog);

        if (!check) {
            attributes.addFlashAttribute("error", "Thêm mới danh mục phản hồi không thành công!");
            return "redirect:/admin/feedback/catalog.htm";
        } else {
            attributes.addFlashAttribute("success", "Thêm mới danh mục phản hồi thành công!");
            return "redirect:/admin/feedback/catalog.htm";
        }
    }

    @RequestMapping(value = "/feedback/disable-catalog")
    public String disableCatalog(RedirectAttributes attributes, HttpSession session, Integer feedbackCatalogId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        FeedbackCatalogs feedbackCatalog = feedbackDAO.getFeedbackCatalogById(feedbackCatalogId);

        if (feedbackCatalog == null) {
            attributes.addFlashAttribute("error", "Mã danh mục phản hồi không tồn tại!");
            return "redirect:/admin/feedback/catalog.htm";
        }

        boolean check = feedbackDAO.disableFeedbackCatalog(feedbackCatalogId);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật danh mục phản hồi không thành công!");
            return "redirect:/admin/feedback/catalog.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật danh mục phản hồi thành công!");
            return "redirect:/admin/feedback/catalog.htm";
        }
    }

    @RequestMapping(value = "/feedback/enable-catalog")
    public String enableCatalog(RedirectAttributes attributes, HttpSession session, Integer feedbackCatalogId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        FeedbackCatalogs feedbackCatalog = feedbackDAO.getFeedbackCatalogById(feedbackCatalogId);

        if (feedbackCatalog == null) {
            attributes.addFlashAttribute("error", "Mã danh mục phản hồi không tồn tại!");
            return "redirect:/admin/feedback/catalog.htm";
        }

        boolean check = feedbackDAO.enableFeedbackCatalog(feedbackCatalogId);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật danh mục phản hồi không thành công!");
            return "redirect:/admin/feedback/catalog.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật danh mục phản hồi thành công!");
            return "redirect:/admin/feedback/catalog.htm";
        }
    }
}
