/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BrandDAO;
import common.validate;
import entities.Admins;
import entities.Brands;
import entities.Logoes;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
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

    @RequestMapping(value = "brand", method = RequestMethod.GET)
    public String loadBrand(HttpSession session, Model model) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        List<Brands> listBrand = brandDAO.getAllBrand();
        model.addAttribute("listBrand", listBrand);
        return "Admin/brand-list";
    }

    @RequestMapping(value = "brand/initinsertbrand", method = RequestMethod.GET)
    public String initInsertBrand(HttpSession session, Model model) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }
        int piority = brandDAO.getMaxPiority();

        if (piority >= 0) {
            model.addAttribute("piority", piority + 1);
        }

        return "Admin/brand-insert";
    }

    @RequestMapping(value = "brand/insertbrand", method = RequestMethod.POST)
    public String insertBrand(@RequestParam(value = "brandLogo") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, RedirectAttributes attributes, HttpSession session, String brandName, Integer brandPiority, Integer brandStatus) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        if (brandName == null || brandName.equals("")) {
            attributes.addFlashAttribute("error", "Tên hãng không được để trống!");
            return "redirect:/admin/brand/initinsertbrand.htm";
        }

        if (brandPiority == null) {
            attributes.addFlashAttribute("error", "Độ ưu tiên của hãng không được để trống!");
            return "redirect:/admin/brand/initinsertbrand.htm";
        }

        if (brandStatus == null) {
            attributes.addFlashAttribute("error", "Trạng thái của hãng không được để trống!");
            return "redirect:/admin/brand/initinsertbrand.htm";
        }

        if (!validate.checkMaxLenght(brandName, 250)) {
            attributes.addFlashAttribute("error", "Độ dài tên hãng không được vượt quá 250 ký tự!");
            return "redirect:/admin/brand/initinsertbrand.htm";
        }

        boolean check = brandDAO.checkBrandNameExists(brandName);

        if (check) {
            attributes.addFlashAttribute("error", "Tên hãng đã tồn tại!");
            return "redirect:/admin/brand/initinsertbrand.htm";
        }

        String file = commonsMultipartFiles.getOriginalFilename();
        String extension = FilenameUtils.getExtension(file);

        if (!validate.isValidImage(extension)) {
            attributes.addFlashAttribute("error", "Định dạng tệp tin không được hỗ trợ!");
            return "redirect:/admin/brand/initinsertbrand.htm";
        }

        String newFileName = validate.generateNameTypeB("brandLogo");
        newFileName += "." + extension;

        if (!"".equals(file)) {
            String path = request.getServletContext().getRealPath("jsp/Admin/uploads/images/Brands");
            path = path.substring(0, path.indexOf("\\build"));
            path = path + "\\web\\jsp\\Admin\\uploads\\images\\Brands";
            File fileDir = new File(path);

            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            try {
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + newFileName));
                Brands brand = new Brands();
                brand.setBrandLogo(newFileName);
                brand.setBrandName(brandName);
                brand.setBrandPiority(brandPiority);
                brand.setBrandStatus(brandStatus);
                brand.setCreatedDate(new Date());
                brand.setUpdatedDate(new Date());

                check = brandDAO.insertBrand(brand);

                if (!check) {
                    attributes.addFlashAttribute("error", "Thêm mới hãng sản xuất thất bại!");
                    return "redirect:/admin/brand/initinsertbrand.htm";
                }
            } catch (IOException | IllegalStateException e) {
                attributes.addFlashAttribute("error", "Tải file thất bại! \n" + e.getMessage());
                return "redirect:/admin/brand/initinsertbrand.htm";
            }
        }

        attributes.addFlashAttribute("success", "Thêm mới hãng sản xuất thành công!");
        return "redirect:/admin/brand.htm";

    }

    @RequestMapping(value = "/deletebrand", method = RequestMethod.GET)
    public String deleteBrand(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }
        int id = Integer.parseInt(request.getParameter("id"));
        brandDAO.deleteBrand(id);
        return "redirect:/admin/brand.htm";
    }

    @RequestMapping(value = "brand/initUpdateBrand", method = RequestMethod.GET)
    public String initUpdateBrand(RedirectAttributes attributes, HttpSession session, Model model, Integer brandId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }
        Brands brand = brandDAO.getBrandById(brandId);

        if (brand == null) {
            attributes.addFlashAttribute("error", "Mã hãng sản xuất không tồn tại!");
            return "redirect:/admin/brand.htm";
        }

        model.addAttribute("brand", brand);
        return "Admin/brand-update";
    }
    
    @RequestMapping(value = "/brand/disable")
    public String disableBrand(RedirectAttributes attributes, HttpSession session, Integer brandId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.html";
        }

        Brands brand = brandDAO.getBrandById(brandId);

        if (brand == null) {
            attributes.addFlashAttribute("error", "Mã hãng sản xuất không tồn tại!");
            return "redirect:/admin/brand.html";
        }

        boolean check = brandDAO.disableBrand(brandId);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể cập nhật hãng sản xuất vào lúc này!");
            return "redirect:/admin/brand.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật hãng sản xuất thành công!");
            return "redirect:/admin/brand.htm";
        }
    }

    @RequestMapping(value = "/brand/enable")
    public String enableBrand(RedirectAttributes attributes, HttpSession session, Integer brandId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Brands brand = brandDAO.getBrandById(brandId);

        if (brand == null) {
            attributes.addFlashAttribute("error", "Mã hãng sản xuất không tồn tại!");
            return "redirect:/admin/brand.htm";
        }

        boolean check = brandDAO.enableBrand(brandId);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể cập nhật hãng sản xuất vào lúc này!");
            return "redirect:/admin/brand.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật hãng sản xuất thành công!");
            return "redirect:/admin/brand.htm";
        }
    }

    @RequestMapping(value = "brand/brandUpdate", method = RequestMethod.POST)
    public String updateBrand(@RequestParam(value = "brandLogo") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, RedirectAttributes attributes, HttpSession session, Integer brandId, String brandName, Integer brandPiority, Integer brandStatus) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Brands brand = brandDAO.getBrandById(brandId);
        String brandOldLogo = "";

        if (brand == null) {
            attributes.addFlashAttribute("error", "Mã hãng sản xuất không tồn tại!");
            return "redirect:/admin/brand.htm";
        }

        if (brandName == null || brandName.equals("")) {
            attributes.addFlashAttribute("error", "Tên hãng không được để trống!");
            return "redirect:/admin/brand/initUpdateBrand.htm?brandId=" + brandId;
        }

        if (brandPiority == null) {
            attributes.addFlashAttribute("error", "Độ ưu tiên của hãng không được để trống!");
            return "redirect:/admin/brand/initUpdateBrand.htm?brandId=" + brandId;
        }

        if (brandStatus == null) {
            attributes.addFlashAttribute("error", "Trạng thái của hãng không được để trống!");
            return "redirect:/admin/brand/initUpdateBrand.htm?brandId=" + brandId;
        }

        if (!validate.checkMaxLenght(brandName, 250)) {
            attributes.addFlashAttribute("error", "Độ dài tên hãng không được vượt quá 250 ký tự!");
            return "redirect:/admin/brand/initUpdateBrand.htm?brandId=" + brandId;
        }

        boolean check = brandDAO.checkBrandNameExists(brandName);

        if (check && !brandName.equals(brand.getBrandName())) {
            attributes.addFlashAttribute("error", "Tên hãng đã tồn tại!");
            return "redirect:/admin/brand/initUpdateBrand.htm?brandId=" + brandId;
        }

        String file = commonsMultipartFiles.getOriginalFilename();

        if (!"".equals(file)) {
            String extension = FilenameUtils.getExtension(file);

            if (!validate.isValidImage(extension)) {
                attributes.addFlashAttribute("error", "Định dạng tệp tin không được hỗ trợ!");
                return "redirect:/admin/brand/initUpdateBrand.htm?brandId=" + brandId;
            }

            String newFileName = validate.generateNameTypeB("brandLogo");
            newFileName += "." + extension;
            String path = request.getServletContext().getRealPath("jsp/Admin/uploads/images/Brands");
            path = path.substring(0, path.indexOf("\\build"));
            path = path + "\\web\\jsp\\Admin\\uploads\\images\\Brands";
            File fileDir = new File(path);
            brandOldLogo = path + "\\" + brand.getBrandLogo();

            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            try {
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + newFileName));
                brand.setBrandLogo(newFileName);
                brand.setBrandName(brandName);
                brand.setBrandStatus(brandStatus);
                brand.setUpdatedDate(new Date());
                brand.setBrandPiority(brandPiority);

                check = brandDAO.updateBrand(brand);

                if (brandOldLogo.length() > 0) {
                    Path oldPath = Paths.get(brandOldLogo);

                    if (Files.exists(oldPath)) {
                        try {
                            Files.delete(oldPath);
                        } catch (IOException ex) {
                            Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }

                if (!check) {
                    attributes.addFlashAttribute("error", "Cập nhật hãng sản xuất thất bại!");
                    return "redirect:/admin/brand/initUpdateBrand.htm?brandId=" + brandId;
                }
            } catch (IOException | IllegalStateException e) {
                attributes.addFlashAttribute("error", "Tải file thất bại! \n" + e.getMessage());
                return "redirect:/admin/brand/initUpdateBrand.htm?brandId=" + brandId;
            }
        } else {
            brand.setBrandName(brandName);
            brand.setBrandStatus(brandStatus);
            brand.setUpdatedDate(new Date());
            brand.setBrandPiority(brandPiority);

            check = brandDAO.updateBrand(brand);

            if (!check) {
                attributes.addFlashAttribute("error", "Cập nhật hãng sản xuất thất bại!");
                return "redirect:/admin/brand/initUpdateBrand.htm?brandId=" + brandId;
            }
        }

        attributes.addFlashAttribute("success", "Cập nhật hãng sản xuất thành công!");

        attributes.addFlashAttribute("success", "Cập nhật sản phẩm thành công!");
        return "redirect:/admin/brand.htm";

    }
}
