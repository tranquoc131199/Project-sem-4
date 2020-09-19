/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CatalogDAO;
import common.validate;
import entities.Admins;
import entities.Catalogs;
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

    @RequestMapping(value = "catalog/initInsertCatalog")
    public String doInsertCatalog(HttpSession session, Model model) {

        //khai bao list catalog
        List<Catalogs> catalogs = catalogDAO.getAllCatalogs();

        if (catalogs.size() > 0) {
            model.addAttribute("catalogs", catalogs);
        }

        model.addAttribute("maxPiority", catalogDAO.getMaxCatalogPiority() + 1);
        model.addAttribute("title", "Thêm mới danh mục tin tức");
        return "Admin/catalog-insert";
    }

    @RequestMapping(value = "/catalog/do-insert", method = RequestMethod.POST)
    public String doInsertCatalog(RedirectAttributes attributes, HttpSession session, String catalogName, Integer catalogPiority, Integer parentId, Integer catalogStatus) {
        if (validate.isEmpty(catalogName)) {
            attributes.addFlashAttribute("error", "Tên danh mục không được để trống!");
            return "redirect:/admin/catalog/initInsertCatalog.htm";
        }

        String parentName;

        if (parentId <= 0) {
            parentName = "Không có";
        } else {
            Catalogs catalogCheck = catalogDAO.getCatalogById(parentId);

            if (catalogCheck == null) {
                attributes.addFlashAttribute("error", "Mã danh mục cha không tồn tại!");
                return "redirect:/admin/catalog/insert.html";
            } else {
                parentName = catalogCheck.getCatalogName();
            }
        }
        Catalogs catalog = new Catalogs();
        catalog.setAdminId((Admins) session.getAttribute("adminLogin"));
        catalog.setCatalogName(catalogName);
        catalog.setCatalogPiority(catalogPiority);
        catalog.setCatalogStatus(catalogStatus);
        catalog.setParentId(parentId);
        catalog.setParentName(parentName);
        catalog.setCreatedDate(new Date());
        catalog.setUpdatedDate(new Date());

        boolean check = catalogDAO.insertCatalog(catalog);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể thêm mới danh mục tin tức vào lúc này!");
            return "redirect:/admin/catalog/insert.html";
        } else {
            attributes.addFlashAttribute("success", "Thêm mới danh mục tin tức thành công!");
            return "redirect:/admin/catalog.html";
        }
    }
}
