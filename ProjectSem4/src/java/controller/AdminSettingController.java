/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.validate;
import common.paging;
import dao.BannerDAO;
import dao.LogoDAO;
import entities.Admins;
import entities.Banners;
import entities.Introductions;
import entities.Logoes;
import entities.News;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Thang Pham
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminSettingController {

    private BannerDAO bannerDAO;

    private LogoDAO logoDAO;

    @Autowired
    public void setBannerDAO(BannerDAO bannerDAO) {
        this.bannerDAO = bannerDAO;
    }

    @Autowired
    public void setLogoDAO(LogoDAO logoDAO) {
        this.logoDAO = logoDAO;
    }

    @RequestMapping(value = "/banner")
    public String banner(HttpSession session, Model model, Integer page) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        if (page == null || page <= 0) {
            page = 1;
        }

        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        String iconImage = "";
        int totalRecords = bannerDAO.countAllBanners();
        paging paging;
        String firstLink = "/QTCStore/admin/banner.htm";
        String currentLink = firstLink + "{p}";
        List<Banners> banners;
        String pagingHtml = "";

        if (totalRecords > 12) {
            paging = new paging(page, totalRecords, 12, currentLink, firstLink);
            banners = bannerDAO.getAllBanners(paging.startRecord, 12);
            pagingHtml = paging.generateHtml();
        } else {
            banners = bannerDAO.getAllBanners(0, totalRecords);
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

        if (banners.size() > 0) {
            model.addAttribute("banners", banners);
        }

        if (pagingHtml.length() > 0) {
            model.addAttribute("paging", pagingHtml);
        }

        try {
            Thread.sleep(1000);
        } catch (InterruptedException ex) {
            ex.printStackTrace();
        }

        model.addAttribute("title", "Quản lý banner");
        return "Admin/banner-list";
    }

    @RequestMapping(value = "/banner/insert")
    public String insertBanner(HttpSession session, Model model) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        String iconImage = "";
        int maxPiority = bannerDAO.getMaxBannerPiority();

        if (logo != null) {
            logoImage = logo.getLogoImage();
        }

        if (logoImage.length() > 0) {
            model.addAttribute("logo", logoImage);
        }

        if (iconImage.length() > 0) {
            model.addAttribute("icon", iconImage);
        }


        if (maxPiority >= 0) {
            model.addAttribute("maxPiority", maxPiority + 1);
        }

        model.addAttribute("title", "Thêm mới banner");
        return "Admin/banner-insert";
    }

    @RequestMapping(value = "/banner/do-insert")
    public String doInsertBanner(@RequestParam(value = "bannerImage") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, RedirectAttributes attributes, HttpSession session, Model model, String bannerDescription, String bannerPiority, String bannerStatus) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:admin/login.htm";
        }

        if (validate.isEmpty(bannerDescription)) {
            attributes.addFlashAttribute("error", "Tiêu đề không được để trống!");
            return "redirect:/admin/banner/insert.htm";
        }

        int bannerPiorityCheck = validate.convertStringToInt(bannerPiority, 0);

        String file = commonsMultipartFiles.getOriginalFilename();
        
        if (file.equals("")) {
            attributes.addFlashAttribute("error", "Vui lòng chọn hình ảnh cho banner!");
            return "redirect:/admin/banner/insert.htm";
        }
        
        String extension = FilenameUtils.getExtension(file);

        if (!validate.isValidImage(extension)) {
            attributes.addFlashAttribute("error", "Định dạng tệp tin không được hỗ trợ!");
            return "redirect:/admin/banner/insert.htm";
        }

        String newFileName = validate.generateNameTypeB("bannerImage");
        newFileName += "." + extension;
        boolean check = bannerDAO.checkBannerImageExists(newFileName);

        if (check) {
            attributes.addFlashAttribute("error", "File đã tồn tại trong hệ thống!");
            return "redirect:/admin/banner/insert.htm";
        }

        if (!"".equals(file)) {
            String path = request.getServletContext().getRealPath("jsp/Admin/uploads/images/Admins");
            path = path.substring(0, path.indexOf("\\build"));
            path = path + "\\web\\jsp\\Admin\\uploads\\images\\Banner";
            File fileDir = new File(path);

            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            try {
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + newFileName));
                Banners banner = new Banners();
//                banner.setAdminId((Admins) session.getAttribute("adminLogin"));
                banner.setBannerDescription(bannerDescription);
                banner.setBannerImage(newFileName);
                banner.setBannerPiority(bannerPiorityCheck + 1);
                banner.setBannerStatus(1);
                banner.setCreatedDate(new Date());
                banner.setUpdatedDate(new Date());

                check = bannerDAO.insertBanner(banner);

                if (!check) {
                    attributes.addFlashAttribute("error", "Thêm mới banner thất bại!");
                    return "redirect:/admin/banner/insert.htm";
                }
            } catch (IOException | IllegalStateException e) {
                attributes.addFlashAttribute("error", "Tải file thất bại! \n" + e.getMessage());
                return "redirect:/admin/banner/insert.htm";
            }
        }

        attributes.addFlashAttribute("success", "Thêm mới banner thành công!");
        return "redirect:/admin/banner.htm";
    }

    @RequestMapping(value = "/banner/update")
    public String updateBanner(RedirectAttributes attributes, HttpSession session, Model model, Integer bannerId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        Banners banner = bannerDAO.getBannerById(bannerId);

        if (banner == null) {
            attributes.addFlashAttribute("error", "Mã banner không tồn tại!");
            return "redirect:/admin/banner.htm";
        }

        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        if (logo != null) {
            logoImage = logo.getLogoImage();
        }
        
        if (logoImage.length() > 0) {
            model.addAttribute("logo", logoImage);
        }

        model.addAttribute("title", "Cập nhật banner");
        model.addAttribute("banner", banner);
        return "Admin/banner-update";
    }

    @RequestMapping(value = "/banner/do-update")
    public String doUpdateBanner(@RequestParam(value = "bannerImage") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, RedirectAttributes attributes, HttpSession session, Model model, String bannerDescription,String bannerPiority, String bannerStatus, Integer bannerId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:admin/login.htm";
        }

        Banners banner = bannerDAO.getBannerById(bannerId);
        String oldFileName = "";
        int bannerPiorityCheck = validate.convertStringToInt(bannerPiority, 0);

        if (banner == null) {
            attributes.addFlashAttribute("error", "Mã banner không tồn tại!");
            return "redirect:/admin/banner.htm";
        }

        if (validate.isEmpty(bannerDescription)) {
            attributes.addFlashAttribute("error", "Tiêu đề không được để trống!");
            return "redirect:/admin/banner/update.htm?bannerId=" + bannerId;
        }

        String file = commonsMultipartFiles.getOriginalFilename();

        if (!"".equals(file)) {
            String extension = FilenameUtils.getExtension(file);

            if (!validate.isValidImage(extension)) {
                attributes.addFlashAttribute("error", "Định dạng tệp tin không được hỗ trợ!");
                return "redirect:/admin/banner/update.htm?bannerId=" + bannerId;
            }

            String newFileName = validate.generateNameTypeB("bannerImage");
            newFileName += "." + extension;
            boolean check = bannerDAO.checkBannerImageExists(newFileName);

            if (check && !newFileName.equals(banner.getBannerImage())) {
                attributes.addFlashAttribute("error", "File đã tồn tại trong hệ thống!");
                return "redirect:/admin/banner/update.htm?bannerId=" + bannerId;
            }
            
            String path = request.getServletContext().getRealPath("jsp/Admin/uploads/images/Admins");
            path = path.substring(0, path.indexOf("\\build"));
            path = path + "\\web\\jsp\\Admin\\uploads\\images\\Banner";
            File fileDir = new File(path);
            oldFileName = path + "\\" + banner.getBannerImage();

            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            try {
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + newFileName));
                banner.setBannerDescription(bannerDescription);
                banner.setBannerImage(newFileName);
                banner.setBannerPiority(bannerPiorityCheck);
                banner.setBannerStatus(validate.convertStringToInt(bannerStatus, 1));
                banner.setCreatedDate(new Date());
                banner.setUpdatedDate(new Date());

                check = bannerDAO.updateBanner(banner);

                if (!check) {
                    attributes.addFlashAttribute("error", "Cập nhật banner thất bại!");
                    return "redirect:/admin/banner/update.htm?bannerId=" + bannerId;
                }

                if (oldFileName.length() > 0) {
                    Path oldPath = Paths.get(oldFileName);

                    if (Files.exists(oldPath)) {
                        try {
                            Files.delete(oldPath);
                        } catch (IOException ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            } catch (IOException | IllegalStateException e) {
                attributes.addFlashAttribute("error", "Tải file thất bại! \n" + e.getMessage());
                return "redirect:/admin/banner/update.htm?bannerId=" + bannerId;
            }
        } else {
            banner.setBannerDescription(bannerDescription);
            banner.setBannerPiority(bannerPiorityCheck);
            banner.setBannerStatus(validate.convertStringToInt(bannerStatus, 1));
            banner.setCreatedDate(new Date());
            banner.setUpdatedDate(new Date());

            boolean check = bannerDAO.updateBanner(banner);

            if (!check) {
                attributes.addFlashAttribute("error", "Cập nhật banner thất bại!");
                return "redirect:/admin/banner/update.htm?bannerId=" + bannerId;
            }
        }

        attributes.addFlashAttribute("success", "Cập nhật banner thành công!");
        return "redirect:/admin/banner.htm";
    }

    @RequestMapping(value = "/banner/disable")
    public String disableBanner(RedirectAttributes attributes, HttpSession session, String bannerId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Banners banner = bannerDAO.getBannerById(validate.convertStringToInt(bannerId, 0));

        if (banner == null) {
            attributes.addFlashAttribute("error", "Mã banner không tồn tại!");
            return "redirect:/admin/banner.htm";
        }

        Boolean check = bannerDAO.disableBanner(banner.getBannerId());

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật banner không thành công!");
            return "redirect:/admin/banner.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật banner thành công!");
            return "redirect:/admin/banner.htm";
        }
    }

    @RequestMapping(value = "/banner/enable")
    public String enableBanner(RedirectAttributes attributes, HttpSession session, String bannerId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Banners banner = bannerDAO.getBannerById(validate.convertStringToInt(bannerId, 0));

        if (banner == null) {
            attributes.addFlashAttribute("error", "Mã banner không tồn tại!");
            return "redirect:/admin/banner.htm";
        }

        Boolean check = bannerDAO.enableBanner(banner.getBannerId());

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật banner không thành công!");
            return "redirect:/admin/banner.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật banner thành công!");
            return "redirect:/admin/banner.htm";
        }
    }

    @RequestMapping(value = "/logo")
    public String logo(HttpSession session, Model model, Integer page) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        if (page == null || page <= 0) {
            page = 1;
        }

        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        String iconImage = "";
        int totalRecords = logoDAO.countAllLogoes();
        paging paging;
        String firstLink = "/QTCStore/admin/banner.htm";
        String currentLink = firstLink + "{p}";
        List<Logoes> logoes;
        String pagingHtml = "";

        if (totalRecords > 12) {
            paging = new paging(page, totalRecords, 12, currentLink, firstLink);
            logoes = logoDAO.getAllLogoes(paging.startRecord, 12);
            pagingHtml = paging.generateHtml();
        } else {
            logoes = logoDAO.getAllLogoes(0, totalRecords);
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

        if (logoes.size() > 0) {
            model.addAttribute("logoes", logoes);
        }

        if (pagingHtml.length() > 0) {
            model.addAttribute("pagingHtml", pagingHtml);
        }

        try {
            Thread.sleep(2000);
        } catch (InterruptedException ex) {
            ex.printStackTrace();
        }

        model.addAttribute("title", "Quản lý logo");
        return "Admin/logo-list";
    }

    @RequestMapping(value = "/logo/insert")
    public String insertLogo(HttpSession session, Model model) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        String iconImage = "";

        if (logo != null) {
            logoImage = logo.getLogoImage();
        }

        if (logoImage.length() > 0) {
            model.addAttribute("logo", logoImage);
        }

        if (iconImage.length() > 0) {
            model.addAttribute("icon", iconImage);
        }

        model.addAttribute("title", "Thêm mới logo");
        return "Admin/logo-insert";
    }

    @RequestMapping(value = "/logo/do-insert")
    public String doInsertLogo(@RequestParam(value = "logoImage") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, RedirectAttributes attributes, HttpSession session) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        String file = commonsMultipartFiles.getOriginalFilename();
        String extension = FilenameUtils.getExtension(file);

        if (!validate.isValidImage(extension)) {
            attributes.addFlashAttribute("error", "Định dạng tệp tin không được hỗ trợ!");
            return "redirect:/admin/logo/insert.htm";
        }

        String newFileName = validate.generateNameTypeB("logoImage");
        newFileName += "." + extension;

        if (!"".equals(file)) {
            String path = request.getServletContext().getRealPath("views/backend/uploads/images/Logoes");
            path = path.substring(0, path.indexOf("\\build"));
            path = path + "\\web\\views\\backend\\uploads\\images\\Logoes";
            File fileDir = new File(path);

            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            try {
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + newFileName));
                Logoes logo = new Logoes();
                logo.setCreatedDate(new Date());
                logo.setUpdatedDate(new Date());
                logo.setLogoImage(newFileName);
                logo.setLogoStatus(1);

                boolean check = logoDAO.insertLogo(logo);

                if (!check) {
                    attributes.addFlashAttribute("error", "Thêm mới logo thất bại!");
                    return "redirect:/admin/logo/insert.htm";
                }
            } catch (IOException | IllegalStateException e) {
                attributes.addFlashAttribute("error", "Tải file thất bại! \n" + e.getMessage());
                return "redirect:/admin/logo/insert.htm";
            }
        }

        attributes.addFlashAttribute("success", "Thêm mới logo thành công!");
        return "redirect:/admin/logo.htm";
    }

    @RequestMapping(value = "/logo/disable")
    public String disableLogo(RedirectAttributes attributes, HttpSession session, String logoId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Logoes logo = logoDAO.getLogoById(validate.convertStringToInt(logoId, 0));

        if (logo == null) {
            attributes.addFlashAttribute("error", "Mã logo không tồn tại!");
            return "redirect:/admin/logo.htm";
        }

        boolean check = logoDAO.disableLogo(logo.getLogoId());

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật logo không thành công!");
            return "redirect:/admin/logo.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật logo thành công!");
            return "redirect:/admin/logo.htm";
        }
    }

    @RequestMapping(value = "/logo/enable")
    public String enableLogo(RedirectAttributes attributes, HttpSession session, String logoId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Logoes logo = logoDAO.getLogoById(validate.convertStringToInt(logoId, 0));

        if (logo == null) {
            attributes.addFlashAttribute("error", "Mã logo không tồn tại!");
            return "redirect:/admin/logo.htm";
        }

        boolean check = logoDAO.enableLogo(logo.getLogoId());

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật logo không thành công!");
            return "redirect:/admin/logo.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật logo thành công!");
            return "redirect:/admin/logo.htm";
        }
    }
}
