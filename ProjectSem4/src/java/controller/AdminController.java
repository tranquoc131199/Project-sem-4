/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.validate;
import common.paging;
import dao.AdminDAO;
import dao.FeedbackDAO;
import dao.LogoDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import entities.Admins;
import entities.Logoes;
import entities.Orders;
import entities.Products;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
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
public class AdminController {

    private ProductDAO productDAO;

    private OrderDAO orderDAO;

    private FeedbackDAO feedbackDAO;

    private AdminDAO adminDAO;
   
    
    private LogoDAO logoDAO;

    @Autowired
    public void setLogoDAO(LogoDAO logoDAO) {
        this.logoDAO = logoDAO;
    }

    @Autowired
    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @Autowired
    public void setAdminDAO(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    @Autowired
    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    @Autowired
    public void setFeedbackDAO(FeedbackDAO feedbackDAO) {
        this.feedbackDAO = feedbackDAO;
    }

    @RequestMapping(value = "/login")
    public String initLogin(HttpSession session, Model model) {
        if (session.getAttribute("adminLogin") != null) {
            return "redirect:dashboard.htm";
        }
        
        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";

        if (logo != null) {
            logoImage = logo.getLogoImage();
        }

        if (logoImage.length() > 0) {
            model.addAttribute("logo", logoImage);
        }
        
        return "Admin/login";
    }

    @RequestMapping(value = "/do-login", method = RequestMethod.POST)
    public String login(Admins admin, Model model, HttpSession session, RedirectAttributes attributes) {
        if (session.getAttribute("adminLogin") != null) {
            return "redirect:dashboard.htm";
        }
        
        Admins admins = adminDAO.checkAdminLogin(admin.getAdminEmail());
        String password = validate.encryptPassword(admin.getAdminPassword());

        if (admins == null) {
            attributes.addFlashAttribute("error", "Email đăng nhập không đúng!");
            return "redirect:login.htm";
        } else {
            if (admins.getAdminPassword().equals(password)) {
                session.setAttribute("adminLogin", admins);
                attributes.addFlashAttribute("success", "Đăng nhập thành công!");
                return "redirect:dashboard.htm";
            } else {
                attributes.addFlashAttribute("error", "Mật khẩu không đúng!");
                return "redirect:login.htm";
            }
        }
    }

    @RequestMapping(value = "/logout")
    public String logout(Model model, HttpSession session, RedirectAttributes attributes) {
        Admins admin = (Admins) session.getAttribute("adminLogin");

        if (admin != null) {
            session.removeAttribute("adminLogin");
            attributes.addFlashAttribute("success", "Đăng xuất thành công!");
        }

        return "redirect:login.htm";
    }

    @RequestMapping(value = "/dashboard")
    public String home(Model model, HttpSession session) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }
        
        int countFeedback = feedbackDAO.countFeedbackForDisplayOnDashboard();
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
        
        if (countFeedback >= 0) {
            model.addAttribute("countFeedback", countFeedback);
        }
        
        model.addAttribute("title", "Bảng điều khiển");
        return "Admin/index";
    }

    @RequestMapping(value = "/index")
    public String index(Model model, HttpSession session, Integer page) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }
        
        String adminEmail = "";
        
        if (session.getAttribute("adminEmail") != null) {
            adminEmail = (String) session.getAttribute("adminEmail");
        }

        if (page == null || page <= 0) {
            page = 1;
        }

        int totalRecords;
        String firstLink = "/ProjectSem4/admin/index.htm";
        String currentLink = "/ProjectSem4/admin/index.htm{p}";
        List<Admins> admins;
        paging paging;
        String pagingHtml = "";
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

        if (adminEmail == null || adminEmail.equals("")) {
            totalRecords = adminDAO.countAllAdmins();
            
            if (totalRecords > 12) {
                paging = new paging(page, totalRecords, 12, currentLink, firstLink);
                admins = adminDAO.getAllAdminsForPaging(paging.startRecord, 12);
                pagingHtml = paging.generateHtml();
            } else {
                admins = adminDAO.getAllAdminsForPaging(0, totalRecords);
            }
            
            session.removeAttribute("adminEmail");
        } else {
            totalRecords = adminDAO.countAllAdminByAdminEmail(adminEmail);
                
            if (totalRecords > 12) {
                paging = new paging(page, totalRecords, 12, currentLink, firstLink);
                admins = adminDAO.searchAdminByEmail(adminEmail, paging.startRecord, 12);
                pagingHtml = paging.generateHtml();
            } else {
                admins = adminDAO.searchAdminByEmail(adminEmail, 0, totalRecords);
            }
        }

        if (admins.size() > 0) {
            model.addAttribute("admins", admins);
        }
        
        if (pagingHtml.length() > 0) {
            model.addAttribute("pagingHtml", pagingHtml);
        }

        model.addAttribute("title", "Danh sách quản trị viên");
        return "Admin/admin-list";
    }

    @RequestMapping(value = "/admin-search", method = RequestMethod.POST)
    public String searchAdmin(RedirectAttributes attributes, Model model, HttpSession session, String adminEmail) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:login";
        }

        session.setAttribute("adminEmail", adminEmail);
        return "redirect:index.htm";
    }

    @RequestMapping(value = "/admin-info")
    public String detailAdmin(RedirectAttributes attributes, Model model, HttpSession session, Integer adminId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }
        
        Admins admin = adminDAO.getAdminById(adminId);
        
        if (admin == null) {
            attributes.addFlashAttribute("error", "Mã quản trị viên không tồn tại!");
            return "redirect:/admin/index.htm";
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
        
        model.addAttribute("admin", admin);
        model.addAttribute("title", "Thông tin quản trị viên");
        return "Admin/admin-detail";
    }

    @RequestMapping(value = "/admin-insert")
    public String insertAdmin(Model model, HttpSession session) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:login.htm";
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
        
        model.addAttribute("title", "Thêm mới quản trị viên");
        return "Admin/admin-insert";
    }

    @RequestMapping(value = "/admin-do-insert", method = RequestMethod.POST)
    public String doInsert(@RequestParam(value = "adminAvatar") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, RedirectAttributes attributes, HttpSession session, String adminFullname, String adminBirthday, String adminGender, String adminEmail, String adminPhone, String adminPassword, String adminIdCard, String adminAddress, String adminHomeLand, String adminStatus) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:login.htm";
        }
        
        if (adminFullname == null || adminFullname.equals("")) {
            attributes.addFlashAttribute("error", "Họ tên quản trị viên không được để trống!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminFullname.length() > 250) {
            attributes.addFlashAttribute("error", "Độ dài họ tên quản trị viên không được vượt quá 250 ký tự!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminBirthday == null || adminBirthday.equals("")) {
            attributes.addFlashAttribute("error", "Ngày sinh của quản trị viên không được để trống!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminGender == null || adminGender.equals("")) {
            attributes.addFlashAttribute("error", "Giới tính của quản trị viên không được để trống!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminEmail == null || adminEmail.equals("")) {
            attributes.addFlashAttribute("error", "Email của quản trị viên không được để trống!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (!validate.isMail(adminEmail)) {
            attributes.addFlashAttribute("error", "Email của quản trị viên không đúng định dạng!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminEmail.length() > 250) {
            attributes.addFlashAttribute("error", "Độ dài email của quản trị viên không được vượt quá 250 ký tự!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminDAO.checkAdminEmailExists(adminEmail)) {
            attributes.addFlashAttribute("error", "Email của quản trị viên đã được sử dụng!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminPhone == null || adminPhone.equals("")) {
            attributes.addFlashAttribute("error", "Số điện thoại của quản trị viên không được để trống!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (!validate.isPhoneNumber(adminPhone)) {
            attributes.addFlashAttribute("error", "Số điện thoại của quản trị viên không đúng định dạng!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminPhone.length() > 20) {
            attributes.addFlashAttribute("error", "Độ dài số điện thoại của quản trị viên không được vượt quá 20 ký tự!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminDAO.checkAdminPhoneExists(adminPhone)) {
            attributes.addFlashAttribute("error", "Số điện thoại của quản trị viên đã được sử dụng!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminPassword == null || adminPassword.equals("")) {
            attributes.addFlashAttribute("error", "Mật khẩu của quản trị viên không được để trống!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminIdCard == null || adminIdCard.equals("")) {
            attributes.addFlashAttribute("error", "Số cmnd của quản trị viên không được để trống!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminIdCard.length() > 20) {
            attributes.addFlashAttribute("error", "Độ dài số cmnd của quản trị viên không được vượt quá 20 ký tự!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminDAO.checkAdminIdCardExists(adminIdCard)) {
            attributes.addFlashAttribute("error", "Số cmnd của quản trị viên đã được sử dụng!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminAddress == null || adminAddress.equals("")) {
            attributes.addFlashAttribute("error", "Địa chỉ của quản trị viên không được để trống!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminHomeLand == null || adminHomeLand.equals("")) {
            attributes.addFlashAttribute("error", "Quê quán của quản trị viên không được để trống!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        if (adminStatus == null || adminStatus.equals("")) {
            attributes.addFlashAttribute("error", "Quyền của quản trị viên không được để trống!");
            return "redirect:/admin/admin-insert.htm";
        }
        
        Date birthday = validate.convertStringToDate(adminBirthday, "yyyy-MM-dd");
        int status = validate.convertStringToInt(adminStatus, 0);
        int gender = validate.convertStringToInt(adminGender, 1);
        
        String file = commonsMultipartFiles.getOriginalFilename();
        String extension = FilenameUtils.getExtension(file);

        if (!validate.isValidImage(extension)) {
            attributes.addFlashAttribute("error", "Định dạng tệp tin không được hỗ trợ!");
            return "redirect:/admin/admin-insert.htm";
        }

        String newFileName = validate.generateNameTypeB("bannerImage");
        newFileName += "." + extension;
        boolean check = adminDAO.checkAdminAvatarExists(newFileName);

        if (check) {
            attributes.addFlashAttribute("error", "File đã tồn tại trong hệ thống!");
            return "redirect:/admin/admin-insert.htm";
        }
        if (!"".equals(file)) {
            String path = request.getServletContext().getRealPath("jsp/Admin/uploads/images/Admins");
            path = path.substring(0, path.indexOf("\\build"));
            path = path + "\\web\\jsp\\Admin\\uploads\\images\\Admins";
            File fileDir = new File(path);

            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            try {
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + newFileName));
                Admins admin = new Admins();
                admin.setAdminAddress(adminAddress);
                admin.setAdminAvatar(newFileName);
                admin.setAdminBirthday(birthday);
                admin.setAdminEmail(adminEmail);
                admin.setAdminFullName(adminFullname);
                admin.setAdminGender(gender);
                admin.setAdminHomeLand(adminHomeLand);
                admin.setAdminIdCard(adminIdCard);
                admin.setAdminPassword(validate.encryptPassword(adminPassword));
                admin.setAdminPhone(adminPhone);
                admin.setAdminStatus(status);
                
                check = adminDAO.insertAdmin(admin);

                if (!check) {
                    attributes.addFlashAttribute("error", "Thêm mới quản trị viên thất bại!");
                    return "redirect:/admin/banner/insert.htm";
                }
            } catch (IOException | IllegalStateException e) {
                attributes.addFlashAttribute("error", "Tải file thất bại! \n" + e.getMessage());
                return "redirect:/admin/banner/insert.htm";
            }
        }

        attributes.addFlashAttribute("success", "Thêm mới quản trị viên thành công!");
        return "redirect:/admin/index.htm";
    }
}
