/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.paging;
import common.validate;
import dao.CatalogDAO;
import dao.CategoryDAO;
import dao.NewDAO;
import entities.Catalogs;
import entities.Categories;
import entities.Customers;
import entities.Logoes;
import entities.News;
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
@RequestMapping(value = "new")
public class ClientNewController {

    private NewDAO newDAO;

    private CategoryDAO categoryDAO;

    private CatalogDAO catalogDAO;

    @Autowired
    public void setNewDAO(NewDAO newDAO) {
        this.newDAO = newDAO;
    }

    @Autowired
    public void setCatalogDAO(CatalogDAO catalogDAO) {
        this.catalogDAO = catalogDAO;
    }

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }
    
 @RequestMapping(value = "index")
    public String index(RedirectAttributes attributes, HttpSession session, Model model, String catalogId, Integer page, Integer pageSize) {
        Customers customer = (Customers) session.getAttribute("customerLogin");
        String firstLink = "/ProjectSem4/new/index.htm";
        String currentLink = "/ProjectSem4/new/index.htm";
        int totalRecords;
        List<News> news;
        paging paging;
        String pagingHtml = "";
        List<Catalogs> catalogs = catalogDAO.getAllParentCatalogsFrontEnd();
        String navbarHtml = categoryDAO.generateNavbar();
        String newHtml = generateNewsHtml();
        
      

        if (page == null || page <= 0) {
            page = 1;
        }

        if (pageSize == null || (pageSize != 10 && pageSize != 20 && pageSize != 50)) {
            pageSize = 10;
        }

        if (catalogId == null || catalogId.equals("")) {
            totalRecords = newDAO.countAllNewsFrontEnd();

            if (totalRecords > pageSize) {
                firstLink += "?pageSize=" + pageSize;
                currentLink += "{p}&pageSize=" + pageSize;
                paging = new paging(page, totalRecords, pageSize, currentLink, firstLink);
                news = newDAO.getAllNewsFrontEnd(paging.startRecord, pageSize);
                pagingHtml = paging.generateHtmlFrontend();
            } else {
                news = newDAO.getAllNewsFrontEnd(0, totalRecords);
            }
        } else {
            Catalogs catalog = catalogDAO.getCatalogById(validate.convertStringToInt(catalogId, 0));

            if (catalog == null) {
                attributes.addFlashAttribute("error", "Mã danh mục tin tức không tồn tại!");
                return "redirect:index.html";
            } else {
                totalRecords = newDAO.countAllNewsByCatalogIdFrontEnd(catalog.getCatalogId());

                if (totalRecords > pageSize) {
                    firstLink += "?categoryId=" + catalogId + "&pageSize=" + pageSize;
                    currentLink += "{p}&categoryId=" + catalogId + "&pageSize=" + pageSize;
                    paging = new paging(page, totalRecords, pageSize, currentLink, firstLink);
                    news = newDAO.getAllNewsByCatalogIdFrontEnd(catalog.getCatalogId(), paging.startRecord, pageSize);
                    pagingHtml = paging.generateHtmlFrontend();
                } else {
                    news = newDAO.getAllNewsByCatalogIdFrontEnd(catalog.getCatalogId(), 0, totalRecords);
                }

                model.addAttribute("catalog", catalog);
                model.addAttribute("catalogId", catalogId);
            }
        }

        if (catalogs.size() > 0) {
            model.addAttribute("catalogs", catalogs);
        }

        if (news.size() > 0) {
            model.addAttribute("news", news);
        }

        if (pagingHtml.length() > 0) {
            model.addAttribute("paging", pagingHtml);
        }

        if (customer != null) {
            model.addAttribute("customer", customer);
        }

        if (navbarHtml.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtml);
        }

        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }

        model.addAttribute("pageSize", pageSize);
        return "Customer/new-list";
    }

 
    @RequestMapping(value = "/detail")
    public String detail(RedirectAttributes attributes, HttpSession session, Model model, String newId) {
        Customers customer = (Customers) session.getAttribute("customerLogin");
        News news = newDAO.getNewById(validate.convertStringToInt(newId, 0));

        if (news == null) {
            attributes.addFlashAttribute("error", "Mã tin tức không tồn tại!");
            return "redirect:index.htm";
        }
        
        String navbarHtml = categoryDAO.generateNavbar();
        String newHtml = generateNewsHtml();

        List<News> relatedNews = newDAO.getFiveRelatedNew(news.getNewId());
        
        if (navbarHtml.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtml);
        }

        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }       

        if (relatedNews.size() > 0) {
            model.addAttribute("relatedNews", relatedNews);
        }


        if (customer != null) {
            model.addAttribute("customer", customer);
        }

        model.addAttribute("news", news);
        model.addAttribute("title", news.getNewTitle());
        return "Customer/new-detail";
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
