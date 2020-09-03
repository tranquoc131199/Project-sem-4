/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.validate;
import dao.CategoryDAO;
import entities.Categories;
import java.util.Date;
import java.util.List;
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
public class AdminProductController {

    private CategoryDAO categoryDAO;

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @RequestMapping(value = "category", method = RequestMethod.GET)
    public String loadCategory(Model model) {
        List<Categories> allCategory = categoryDAO.getAllCategory();
        model.addAttribute("allCategory", allCategory);
        return "Admin/category-list";
    }

    @RequestMapping(value = "category/initInsertCategory")
    public String initInsertCategory(Model model) {
        int maxPiority = categoryDAO.getMaxCategoryPiority();
        if (maxPiority >= 0) {
            model.addAttribute("maxPiority", maxPiority + 1);
        }
        List<Categories> categories = categoryDAO.getAllCategory();
        model.addAttribute("categories", categories);
        return "Admin/category-insert";
    }

    @RequestMapping(value = "category/insertCategory")
    public String insertCategory(RedirectAttributes attributes, String categoryName, String parentId, String categoryPiority, String categoryStatus) {
        if (validate.isEmpty(categoryName)) {
            attributes.addFlashAttribute("error", "Tên danh mục không được để trống");
            return "redirect:/admin/category/initInsertCategory.htm";
        }
        if (!validate.checkMaxLenght(categoryName, 250)) {
            attributes.addFlashAttribute("error", "Độ dài tên danh mục không được quá 250 kí tự");
            return "redirect:/admin/category/initInsertCategory.htm";
        }

        boolean check = categoryDAO.checkCategoryNameExists(categoryName);
        if (check) {
            attributes.addFlashAttribute("error", "Tên danh mục đã tồn tại");
            return "redirect:/admin/category/initInsertCategory.htm";
        }
        int parentIdInsert = validate.convertStringToInt(parentId, 0);
        String parentName;
        if (parentIdInsert <= 0) {
            parentName = "Không có";
        } else {
            Categories categories = categoryDAO.getCategoryById(parentIdInsert);
            if (categories == null) {
                attributes.addFlashAttribute("error", "Danh mục cha không tồn tại!");
                return "redirect:/admin/category/initInsertCategory.htm";
            } else {
                parentName = categories.getCategoryName();
            }
        }

        int categoryStatusInsert = validate.convertStringToInt(categoryStatus, 0);
        int categoryPiorityInsert = validate.convertStringToInt(categoryPiority, 0);

        Categories category = new Categories();
        category.setCategoryName(categoryName);
        category.setCategoryPiority(categoryPiorityInsert);
        category.setCategoryStatus(categoryStatusInsert);
        category.setParentId(parentIdInsert);
        category.setParentName(parentName);
        category.setCreatedDate(new Date());
        category.setUpdatedDate(new Date());

        check = categoryDAO.insertCategory(category);
        if (check) {
            attributes.addFlashAttribute("success", "Thêm mới danh mục sản phẩm thành công");
            return "redirect:/admin/category.htm";

        } else {
            attributes.addFlashAttribute("error", "Thêm mới danh mục không thành công!");
            return "redirect:/admin/category/initInsertCategory.htm";
        }
    }

    @RequestMapping(value = "category/disable")
    public String disableCategory(RedirectAttributes attributes, Integer categoryId) {

        boolean check = categoryDAO.disableCategory(categoryId);
        if (check) {
            attributes.addFlashAttribute("success", "Cập nhật danh mục sản phẩm thành công");
            attributes.addFlashAttribute("categoryId", categoryId);
            return "redirect:/admin/category.htm";
        } else {
            attributes.addFlashAttribute("error", "Cập nhật danh mục sản phẩm không thành công!");
            attributes.addFlashAttribute("categoryId", categoryId);
            return "redirect:/admin/category.htm";
        }
    }

    @RequestMapping(value = "category/enable")
    public String enableCategory(RedirectAttributes attributes, Integer categoryId) {

        boolean check = categoryDAO.enableCategory(categoryId);
        if (check) {
            attributes.addFlashAttribute("success", "Cập nhật danh mục sản phẩm thành công");
            attributes.addFlashAttribute("categoryId", categoryId);
            return "redirect:/admin/category.htm";
        } else {
            attributes.addFlashAttribute("error", "Cập nhật danh mục sản phẩm không thành công!");
            attributes.addFlashAttribute("categoryId", categoryId);
            return "redirect:/admin/category.htm";
        }
    }

//    @RequestMapping(value = "category/preUpdate")
//    public String preUpdateCategory(RedirectAttributes attributes, Model model, Integer categoryId) {
//               
//        return null;
//
//    }
//
//    @RequestMapping(value = "category/preUpdate")
//    public String updateCategory(RedirectAttributes attributes, Integer categoryId) {
//        return null;
//
//    }

}
