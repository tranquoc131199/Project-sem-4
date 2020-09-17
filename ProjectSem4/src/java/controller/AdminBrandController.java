/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BrandDAO;
import entities.Brands;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Thang Pham
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminBrandController {

    @Autowired
    private BrandDAO brandDAO;

    @RequestMapping(value = "/brand", method = RequestMethod.GET)
    public String loadBrand(Model model) {
        List<Brands> listBrand = brandDAO.getAllBrand();
        model.addAttribute("listBrand", listBrand);
        return "Admin/brand-list";
    }

    @RequestMapping(value = "/insertbrand", method = RequestMethod.POST)
    public String insertBrand(Brands brand, Model model) {
        boolean insert = brandDAO.insertBrand(brand);
        if (insert) {
            return "redirect:/admin/brand.htm";
        } else {
            return "redirect:/admin/initinsertbrand.htm";
        }
    }

    @RequestMapping(value = "/initinsertbrand", method = RequestMethod.GET)
    public String initInsertBrand(Model model) {
        model.addAttribute("brand", new Brands());
        return "Admin/brand-insert";
    }

    @RequestMapping(value = "/deletebrand", method = RequestMethod.GET)
    public String deleteBrand(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        brandDAO.deleteBrand(id);
        return "redirect:/admin/brand.htm";
    }

    @RequestMapping(value = "/initUpdateBrand", method = RequestMethod.GET)
    public String initUpdateBrand(Model model, int id) {
        Brands brand = brandDAO.getBrandById(id);
        model.addAttribute("brand", brand);
        return "Admin/brand-update";
    }

    @RequestMapping(value = "/brandUpdate", method = RequestMethod.POST)
    public String updateBrand(RedirectAttributes attributes, int brandId, Brands brand, Model model) {
        boolean check = brandDAO.updateBrand(brand);
        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật sản phẩm thất bại!");
            return "redirect:/admin/initUpdateBrand.htm?id=" + brandId;
        } else {
            attributes.addFlashAttribute("success", "Cập nhật sản phẩm thành công!");
            return "redirect:/admin/brand.htm";
        }
    }
}
