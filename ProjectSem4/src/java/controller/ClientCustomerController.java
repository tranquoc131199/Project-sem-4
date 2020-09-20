/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CatalogDAO;
import dao.CategoryDAO;
import dao.CustomerDAO;
import dao.NewDAO;
import dao.ProductDAO;
import entities.Catalogs;
import entities.Customers;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RespectBinding;
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
@RequestMapping(value = "customer")
public class ClientCustomerController {

    private CustomerDAO customerDAO;
    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;
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
    public void setCustomerDAO(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @Autowired
    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(RedirectAttributes attributes, HttpSession session, Model model) {

        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }
        Customers customer = (Customers) session.getAttribute("customerLogin");
        String navbarHtm = categoryDAO.generateNavbar();
        if (navbarHtm.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtm);
        }

        model.addAttribute("customer", customer);
        model.addAttribute("title", "Trang cá nhân người dùng");
        return "Customer/user-info";

    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(HttpSession session, Model model) {
        if (session.getAttribute("customerLogin") != null) {
            return "redirect:index.htm";
        }
        String navbarHtm = categoryDAO.generateNavbar();
        if (navbarHtm.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtm);
        }
        String newHtml = generateNewsHtml();
        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }

        return "Customer/login";

    }

    @RequestMapping(value = "do-login", method = RequestMethod.POST)
    public String doLogin(Customers customer, HttpSession session, RedirectAttributes attributes) {

        Customers check = customerDAO.checkCustomerLogin(customer.getCustomerEmail(), customer.getCustomerPassword());
        if (check != null) {
            switch (check.getCustomerStatus()) {
                case 0:
                    attributes.addFlashAttribute("error", "Tài khoản của bạn đã bị khóa !!");
                    return "redirect:/customer/login.htm";
                case 1:
                    session.setAttribute("customerLogin", check);
                    attributes.addFlashAttribute("success", "Đăng nhập thành công!");
                    return "redirect:index.htm";
                default:
                    attributes.addFlashAttribute("error", "Tài khoản hoặc mật khẩu không chính xác !!");
                    return "redirect:/customer/login.htm";
            }
        } else {
            attributes.addFlashAttribute("error", "Tài khoản hoặc mật khẩu không chính xác !!");
            return "redirect:/customer/login.htm";
        }
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session, RedirectAttributes attributes) {

        session.removeAttribute("customerLogin");
        return "redirect:login.htm";
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
