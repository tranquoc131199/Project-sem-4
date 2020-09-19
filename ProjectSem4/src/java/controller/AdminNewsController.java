/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CatalogDAO;
import entities.Catalogs;
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
@RequestMapping(value = "admin")
public class AdminNewsController {

    private CatalogDAO catalogDAO;

    @Autowired
    public void setCatalogDAO(CatalogDAO catalogDAO) {
        this.catalogDAO = catalogDAO;
    }

    @RequestMapping(value = "catalog")
    public String index(RedirectAttributes attributes, HttpSession session, Model model) {
        List<Catalogs> catalogs = catalogDAO.getAllCatalogs();
        if (catalogs.size() > 0) {
            model.addAttribute("catalogs", catalogs);
        }

        model.addAttribute("title", "Quản lý danh mục tin tức");
        return "Admin/catalog-list";
    }

}
