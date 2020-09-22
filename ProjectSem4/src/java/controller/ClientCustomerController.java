/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.Message;
import common.SendEmail;
import common.validate;
import dao.CatalogDAO;
import dao.CategoryDAO;
import dao.CustomerDAO;
import dao.NewDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import entities.Catalogs;
import entities.Customers;
import entities.Logoes;
import entities.OrderDetails;
import entities.Orders;
import entities.Products;
import entities.Wishlists;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RespectBinding;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Acer Nitro 5
 */
@Controller
@RequestMapping(value = "customer")
public class ClientCustomerController {

    private OrderDAO orderDAO;
    private CustomerDAO customerDAO;
    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;
    private NewDAO newDAO;
    private CatalogDAO catalogDAO;

    @Autowired
    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

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
        String newHtml = generateNewsHtml();
        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
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

    @RequestMapping(value = "add-wishlist")
    public @ResponseBody
    String addWishlist(HttpSession session, Integer productId) {
        Message message = new Message();

        if (session.getAttribute("customerLogin") == null) {
            message.setResult(false);
            message.setMessageCode("not-login");
            return message.toString();
        }

        Products product = productDAO.getProductById(productId);
        Customers customer = (Customers) session.getAttribute("customerLogin");
        boolean check;

        if (product == null || product.getProductStatus() != 1) {
            message.setResult(false);
            message.setMessageCode("product-invalid");
            return message.toString();
        } else {
            List<Wishlists> wishlistsByCustomerId = customerDAO.getWishlistsByCustomerId(customer.getCustomerId());

            for (Wishlists w : wishlistsByCustomerId) {
                if (Objects.equals(w.getProductId().getProductId(), product.getProductId())) {
                    check = customerDAO.removeWishlist(customer, product);

                    if (!check) {
                        message.setResult(false);
                        message.setMessageCode("remove-failed");
                        return message.toString();
                    } else {
                        message.setResult(true);
                        message.setMessageCode("remove-success");
                        return message.toString();
                    }
                }
            }

            Wishlists wl = new Wishlists();

            wl.setCreatedDate(new Date());
            wl.setUpdatedDate(new Date());
            wl.setCustomerId(customer);
            wl.setProductId(product);
            wl.setWishlistStatus(1);

            check = customerDAO.addToWishlist(wl);

            if (!check) {
                message.setResult(false);
                message.setMessageCode("add-failed");
                return message.toString();
            } else {
                message.setResult(true);
                message.setMessageCode("add-success");
                return message.toString();
            }
        }
    }

    @RequestMapping(value = "wishlist")
    public String wishlist(RedirectAttributes attributes, HttpSession session, Model model) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }

        Customers customer = (Customers) session.getAttribute("customerLogin");
        List<Wishlists> wishlists = customerDAO.getWishlistsByCustomerId(customer.getCustomerId());
        String navbarHtml = categoryDAO.generateNavbar();
        String newHtml = generateNewsHtml();

        if (navbarHtml.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtml);
        }

        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }

        if (wishlists.size() > 0) {
            model.addAttribute("wishlists", wishlists);
        }

        model.addAttribute("customer", customer);
        return "Customer/user-wishlist";
    }

    @RequestMapping(value = "/change-information")
    public String changeInformation(RedirectAttributes attributes, HttpSession session, Model model) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }
        Customers customer = (Customers) session.getAttribute("customerLogin");
        String navbarHtml = categoryDAO.generateNavbar();
        String newHtml = generateNewsHtml();

        if (navbarHtml.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtml);
        }

        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }

        model.addAttribute("customer", customer);
        return "Customer/user-change-info";
    }

    @RequestMapping(value = "/do-change-information", method = RequestMethod.POST)
    public String doChangeInformation(RedirectAttributes attributes, HttpSession session, Model model, String customerFullName, String customerPhone, String customerBirthday, String customerAddress) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }

        Customers customer = (Customers) session.getAttribute("customerLogin");

        if (validate.isEmpty(customerFullName)) {
            attributes.addFlashAttribute("error", "Họ tên không được để trống!");
            return "redirect:change-information.htm";
        }

        if (validate.isEmpty(customerPhone)) {
            attributes.addFlashAttribute("error", "Số điện thoại không được để trống!");
            return "redirect:change-information.htm";
        }

        if (validate.isEmpty(customerAddress)) {
            attributes.addFlashAttribute("error", "Địa chỉ không được để trống!");
            return "redirect:change-information.htm";
        }

        if (!validate.isPhoneNumber(customerPhone)) {
            attributes.addFlashAttribute("error", "Số điện thoại không đúng định dạng!");
            return "redirect:change-information.htm";
        }

        if (!validate.checkMaxLenght(customerFullName, 250)) {
            attributes.addFlashAttribute("error", "Tên người dùng không được vượt quá 250 ký tự!");
            return "redirect:change-information.htm";
        }

        if (!validate.checkMaxLenght(customerPhone, 20)) {
            attributes.addFlashAttribute("error", "Số điện thoại không được vượt quá 20 ký tự!");
            return "redirect:change-information.htm";
        }

        if (customerDAO.checkCustomerPhoneExists(customerPhone) && !customerPhone.equals(customer.getCustomerPhone())) {
            attributes.addFlashAttribute("error", "Số điện thoại đã được sử dụng!");
            return "redirect:change-information.htm";
        }

        boolean check = customerDAO.changeCustomerInformation(customer.getCustomerId(), customerFullName, customerPhone, validate.convertStringToDate(customerBirthday, "yyyy-MM-dd"), customerAddress);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể thay đổi thông tin cá nhân vào lúc này!");
            return "redirect:change-information.htm";
        } else {
            attributes.addFlashAttribute("success", "Thay đổi thông tin cá nhân thành công! Vui lòng đăng nhập lại!");
            session.removeAttribute("customerLogin");
            return "redirect:login.htm";
        }
    }

    @RequestMapping(value = "/change-password")
    public String changePassword(RedirectAttributes attributes, HttpSession session, Model model) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }

        Customers customer = (Customers) session.getAttribute("customerLogin");
        String navbarHtml = categoryDAO.generateNavbar();
        String newHtml = generateNewsHtml();

        if (navbarHtml.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtml);
        }

        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }

        model.addAttribute("customer", customer);
        return "Customer/user-change-password";
    }

    @RequestMapping(value = "/do-change-password", method = RequestMethod.POST)
    public String doChangePassword(RedirectAttributes attributes, HttpSession session, Model model, String customerOldPassword, String customerNewPassword, String reCustomerNewPassword) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }

        Customers customer = (Customers) session.getAttribute("customerLogin");
        String oldPassword = customerOldPassword;
        String password = customerNewPassword;

        if (validate.isEmpty(oldPassword)) {
            attributes.addFlashAttribute("error", "Mật khẩu cũ không được để trống!");
            return "redirect:change-password.htm";
        }

        if (validate.isEmpty(customerNewPassword)) {
            attributes.addFlashAttribute("error", "Mật khẩu mới không được để trống!");
            return "redirect:change-password.htm";
        }

        if (!oldPassword.equals(customer.getCustomerPassword())) {
            attributes.addFlashAttribute("error", "Mật khẩu cũ không đúng!");
            return "redirect:change-password.htm";
        }

        if (!customerNewPassword.equals(reCustomerNewPassword)) {
            attributes.addFlashAttribute("error", "Mật khẩu nhập lại không khớp!");
            return "redirect:change-password.htm";
        }

        if (password.equals(customer.getCustomerPassword())) {
            attributes.addFlashAttribute("error", "Mật khẩu mới không được giống mật khẩu cũ!");
            return "redirect:change-password.htm";
        }

        boolean check = customerDAO.changeCustomerPassword(customer.getCustomerId(), password);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể thay đổi mật khẩu ngay lúc này!");
            return "redirect:change-password.htm";
        } else {
            attributes.addFlashAttribute("success", "Đổi mật khẩu thành công! Vui lòng đăng nhập lại");
            session.removeAttribute("customerLogin");
            return "redirect:login.htm";
        }
    }

    @RequestMapping(value = "/change-avatar")
    public String changeAvatar(RedirectAttributes attributes, HttpSession session, Model model) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }

        Customers customer = (Customers) session.getAttribute("customerLogin");
        String navbarHtml = categoryDAO.generateNavbar();
        String newHtml = generateNewsHtml();

        if (navbarHtml.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtml);
        }

        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }

        model.addAttribute("customer", customer);
        return "Customer/user-change-avatar";
    }

    @RequestMapping(value = "/do-change-avatar", method = RequestMethod.POST)
    public String doChangeAvatar(@RequestParam(value = "customerAvatar") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, RedirectAttributes attributes, HttpSession session, Model model) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }

        Customers customer = (Customers) session.getAttribute("customerLogin");
        String file = commonsMultipartFiles.getOriginalFilename();
        String extension = FilenameUtils.getExtension(file);
        String oldFileName;

        if (!validate.isValidImage(extension)) {
            attributes.addFlashAttribute("error", "Định dạng tệp tin không được hỗ trợ!");
            return "redirect:change-avatar.htm";
        }

        String newFileName = validate.generateNameTypeB("customerAvatar");
        newFileName += "." + extension;

        if (!"".equals(file)) {
            String path = request.getServletContext().getRealPath("jsp/Admin/uploads/images/Customers");
            path = path.substring(0, path.indexOf("\\build"));
            path = path + "\\web\\jsp\\Admin\\uploads\\images\\Customers";
            File fileDir = new File(path);
            oldFileName = path + "\\" + customer.getCustomerAvatar();

            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            try {
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + newFileName));

                boolean check = customerDAO.changeCustomerAvatar(customer.getCustomerId(), newFileName);

                if (!check) {
                    attributes.addFlashAttribute("error", "Thay đổi avatar thất bại!");
                    return "redirect:change-avatar.htm";
                }
            } catch (IOException | IllegalStateException e) {
                attributes.addFlashAttribute("error", "Tải file thất bại! \n" + e.getMessage());
                return "redirect:change-avatar.htm";
            }
        } else {
            attributes.addFlashAttribute("error", "Vui lòng chọn file!");
            return "redirect:change-avatar.htm";
        }

        if (oldFileName.length() > 0) {
            Path oldPath = Paths.get(oldFileName);

            if (Files.exists(oldPath)) {
                try {
                    Files.delete(oldPath);
                } catch (IOException ex) {
                    Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        attributes.addFlashAttribute("success", "Thay đổi avatar thành công! Vui lòng đăng nhập lại!");
        session.removeAttribute("customerLogin");
        return "redirect:login.htm";
    }

    @RequestMapping(value = "/order")
    public String order(RedirectAttributes attributes, HttpSession session, Model model) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }

        Customers customer = (Customers) session.getAttribute("customerLogin");
        List<Orders> orders = orderDAO.getAllOrdersByCustomerId(customer.getCustomerId());
        String navbarHtml = categoryDAO.generateNavbar();
        String newHtml = generateNewsHtml();

        if (navbarHtml.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtml);
        }

        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }

        if (orders.size() > 0) {
            model.addAttribute("orders", orders);
        }

        model.addAttribute("customer", customer);
        return "Customer/user-order";
    }

    @RequestMapping(value = "/cancel-order")
    public String cancelOrder(RedirectAttributes attributes, HttpSession session, String orderId) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }

        Customers customer = (Customers) session.getAttribute("customerLogin");
        Orders order = orderDAO.getOrderById(validate.convertStringToInt(orderId, 0));

//        if (order == null || order.getCustomerId() != customer) {
//            attributes.addFlashAttribute("error", "Mã đơn hàng không tồn tại!");
//            return "redirect:order.htm";
//        }
        boolean check = orderDAO.updateOrder(order.getOrderId(), 0);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể cập nhật đơn hàng lúc này!");
            return "redirect:order.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật đơn hàng thành công!");
            return "redirect:order.htm";
        }
    }

    @RequestMapping(value = "/detail-order")
    public String detailOrder(RedirectAttributes attributes, HttpSession session, Model model, Integer orderId) {
        if (session.getAttribute("customerLogin") == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:login.htm";
        }

        Customers customer = (Customers) session.getAttribute("customerLogin");
        Orders order = orderDAO.getOrderById(orderId);

        List<OrderDetails> detail = orderDAO.getOrderDetailByOrderId(orderId);
//        if (order == null || order.getCustomerId() != customer) {
//            attributes.addFlashAttribute("error", "Mã đơn hàng không tồn tại!");
//            return "redirect:order.htm";
//        }  
        model.addAttribute("order", order);
        model.addAttribute("detail", detail);
        return "Customer/user-order-detail";
    }

    @RequestMapping(value = "/register")
    public String register(Model model, HttpSession session) {
        if (session.getAttribute("customerLogin") != null) {
            return "redirect:index.htm";
        }

        String navbarHtml = categoryDAO.generateNavbar();
        String newHtml = generateNewsHtml();

        if (navbarHtml.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtml);
        }

        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }

        return "Customer/register";
    }

    @RequestMapping(value = "/do-register", method = RequestMethod.POST)
    public String doRegister(String customerFullName, String customerBirthday, String customerPassword, String reCustomerPassword, String customerGender, String customerEmail, String customerPhone, String customerAddress, HttpSession session, RedirectAttributes attributes) throws MessagingException {
        if (session.getAttribute("customerLogin") != null) {
            return "redirect:index.htm";
        }

        boolean check = validate.isEmpty(customerFullName);

        if (check) {
            attributes.addFlashAttribute("error", "Họ tên không được để trống!");
            return "redirect:register.htm";
        }

        check = validate.isEmpty(customerPassword);

        if (check) {
            attributes.addFlashAttribute("error", "Mật khẩu không được để trống!");
            return "redirect:register.htm";
        }

        check = validate.isEmpty(customerEmail);

        if (check) {
            attributes.addFlashAttribute("error", "Email không được để trống!");
            return "redirect:register.htm";
        }

        check = validate.isEmpty(customerPhone);

        if (check) {
            attributes.addFlashAttribute("error", "Số điện thoại không được để trống!");
            return "redirect:register.htm";
        }

        check = validate.isEmpty(customerAddress);

        if (check) {
            attributes.addFlashAttribute("error", "Địa chỉ không được để trống!");
            return "redirect:register.htm";
        }

        check = validate.isEmpty(customerBirthday);

        if (check) {
            attributes.addFlashAttribute("error", "Ngày sinh không được để trống!");
            return "redirect:register.htm";
        }

        check = validate.isMail(customerEmail);

        if (!check) {
            attributes.addFlashAttribute("error", "Email không đúng định dạng!");
            return "redirect:register.htm";
        }

        check = validate.isPhoneNumber(customerPhone);

        if (!check) {
            attributes.addFlashAttribute("error", "Số điện thoại không đúng định dạng!");
            return "redirect:register.htm";
        }

        check = validate.checkMaxLenght(customerFullName, 250);

        if (!check) {
            attributes.addFlashAttribute("error", "Tên người dùng không được vượt quá 250 ký tự!");
            return "redirect:register.htm";
        }

        check = validate.checkMaxLenght(customerEmail, 250);

        if (!check) {
            attributes.addFlashAttribute("error", "Email không được vượt quá 250 ký tự!");
            return "redirect:register.htm";
        }

        check = validate.checkMaxLenght(customerPhone, 20);

        if (!check) {
            attributes.addFlashAttribute("error", "Số điện thoại không được vượt quá 20 ký tự!");
            return "redirect:register.htm";
        }

        check = customerDAO.checkCustomerEmailExists(customerEmail);

        if (check) {
            attributes.addFlashAttribute("error", "Email đã được sử dụng!");
            return "redirect:register.htm";
        }

        check = customerDAO.checkCustomerPhoneExists(customerPhone);

        if (check) {
            attributes.addFlashAttribute("error", "Số điện thoại đã được sử dụng!");
            return "redirect:register.htm";
        }

        check = customerPassword.equals(reCustomerPassword);

        if (!check) {
            attributes.addFlashAttribute("error", "Mật khẩu nhập lại không đúng!");
            return "redirect:register.htm";
        }

        customerPassword = customerPassword;

        Customers customer = new Customers();

        Date registerCustomerBirthday = validate.convertStringToDate(customerBirthday, "yyyy-MM-dd");
        int registerCustomerGender = validate.convertStringToInt(customerGender, 1);

        customer.setCustomerFullName(customerFullName);
        customer.setCustomerBirthday(registerCustomerBirthday);
        customer.setCustomerPassword(customerPassword);
        customer.setCustomerGender(registerCustomerGender);
        customer.setCustomerEmail(customerEmail);
        customer.setCustomerPhone(customerPhone);
        customer.setCustomerAddress(customerAddress);
        customer.setCustomerCheckCode(validate.generateRandomString());
        customer.setCustomerStatus(0);

        if (registerCustomerGender == 1) {
            customer.setCustomerAvatar("male.png");
        } else {
            customer.setCustomerAvatar("female.png");
        }

        check = customerDAO.insertCustomer(customer);

        if (!check) {
            attributes.addFlashAttribute("error", "Đăng ký tài khoản thất bại! Vui lòng thử lại sau!");
            return "redirect:register.htm";
        } else {
            String emailTitle = "[QTB-STORE: XÁC NHẬN ĐĂNG KÝ THÀNH VIÊN]";
            String emailBody = "Đăng ký tài khoản thành công! Click <a href='http://localhost:8080/ProjectSem4/customer/confirm.htm?customerEmail=" + customerEmail + "&customerCheckCode=" + customer.getCustomerCheckCode() + "'>vào đây</a> để xác thực tài khoản!";
            SendEmail.sendMail(customerEmail, emailTitle, emailBody);

            attributes.addFlashAttribute("success", "Đăng ký tài khoản thành công! Vui lòng kiểm tra email đăng ký để xác thực tài khoản!");
            return "redirect:login.htm";
        }
    }

    @RequestMapping(value = "/confirm")
    public String confirmCustomer(RedirectAttributes attributes, String customerEmail, String customerCheckCode) {
        Customers customer = customerDAO.getCustomerByEmail(customerEmail);

        if (customer == null) {
            attributes.addFlashAttribute("error", "Email không tồn tại!");
            return "redirect:login.htm";
        }

        if (!customerCheckCode.equals(customer.getCustomerCheckCode())) {
            attributes.addFlashAttribute("error", "Mã xác thực không đúng!");
            return "redirect:login.htm";
        }

        boolean check = customerDAO.enableCustomer(customer.getCustomerId());

        if (!check) {
            attributes.addFlashAttribute("error", "Xác thực tài khoản thất bại! Vui lòng thử lại sau!");
            return "redirect:register.htm";
        } else {
            attributes.addFlashAttribute("success", "Xác thực tài khoản thành công! Vui lòng đăng nhập!");
            return "redirect:login.htm";
        }
    }

    @RequestMapping(value = "/forgot")
    public String forgot(Model model, HttpSession session) {

        String navbarHtml = categoryDAO.generateNavbar();
        String newHtml = generateNewsHtml();

        if (navbarHtml.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtml);
        }

        if (newHtml.length() > 0) {
            model.addAttribute("newHtml", newHtml);
        }

        return "Customer/forgot";
    }

    @RequestMapping(value = "/do-forgot", method = RequestMethod.POST)
    public String doForgot(HttpSession session, RedirectAttributes attributes, Model model, String customerEmail) throws MessagingException {

        boolean check = customerDAO.checkCustomerEmailExists(customerEmail);

        if (!check) {
            attributes.addFlashAttribute("error", "Email không tồn tại!");
            return "redirect:forgot.htm";
        }

        Customers customer = customerDAO.getCustomerByEmail(customerEmail);
        customer.setCustomerCheckCode(validate.generateRandomString());

        check = customerDAO.updateCustomer(customer);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể đặt lại mật khẩu vào lúc này!");
            return "redirect:forgot.htm";
        } else {
            attributes.addFlashAttribute("success", "Yêu cầu đặt lại mật khẩu thành công! Một email xác nhận đã được gửi tới email đăng ký của bạn! Vui lòng kiểm tra và xác nhận lại!");
            String emailTitle = "[QTB-STORE: YÊU CẦU ĐẶT LẠI MẬT KHẨU]";
            String emailBody = "Đã có yêu cầu đặt lại mật khẩu cho tài khoản của bạn! Click <a href='http://localhost:8080/ProjectSem4/customer/confirm-fogot.htm?customerEmail=" + customerEmail + "&customerCheckCode=" + customer.getCustomerCheckCode() + "'>vào đây</a> để xác nhận và đổi mật khẩu! Nếu bạn không làm điều này, vui lòng bỏ qua email này!";
            SendEmail.sendMail(customer.getCustomerEmail(), emailTitle, emailBody);
            return "redirect:forgot.htm";
        }
    }

    @RequestMapping(value = "/confirm-fogot")
    public String confirmForgot(RedirectAttributes attributes, HttpSession session, String customerEmail, String customerCheckCode) {
        Customers customer = customerDAO.getCustomerByEmail(customerEmail);

        if (customer == null) {
            attributes.addFlashAttribute("error", "Email không tồn tại!");
            return "redirect:login.htm";
        }

        if (!customerCheckCode.equals(customer.getCustomerCheckCode())) {
            attributes.addFlashAttribute("error", "Mã xác thực không đúng!");
            return "redirect:login.htm";
        }

        session.setAttribute("confirmChange", customerEmail);
        return "redirect:confirm-change.htm";
    }

    @RequestMapping(value = "/confirm-change")
    public String doConfirmChange(RedirectAttributes attributes, HttpSession session, Model model) {
        if (session.getAttribute("confirmChange") == null) {
            attributes.addFlashAttribute("error", "Mã xác thực không tồn tại!");
            return "redirect:login.htm";
        }

        Customers customer = customerDAO.getCustomerByEmail((String) session.getAttribute("confirmChange"));

        if (customer == null) {
            attributes.addFlashAttribute("error", "Mã xác thực không tồn tại!");
            return "redirect:login.htm";
        }
        return "Customer/confirm-forgot";
    }

    @RequestMapping(value = "/do-confirm-forgot")
    public String doConfirmForgot(RedirectAttributes attributes, HttpSession session, String customerPassword, String reCustomerPassword) {
        if (session.getAttribute("confirmChange") == null) {
            attributes.addFlashAttribute("error", "Mã xác thực không tồn tại!");
            return "redirect:login.htm";
        }

        Customers customer = customerDAO.getCustomerByEmail((String) session.getAttribute("confirmChange"));

        if (customer == null) {
            attributes.addFlashAttribute("error", "Mã xác thực không tồn tại!");
            return "redirect:login.htm";
        }

        if (!customerPassword.equals(reCustomerPassword)) {
            attributes.addFlashAttribute("error", "Mật khẩu nhập lại không khớp!");
            return "redirect:login.htm";
        }

        customerPassword = customerPassword;

        boolean check = customerDAO.changeCustomerPassword(customer.getCustomerId(), customerPassword);

        if (!check) {
            attributes.addFlashAttribute("error", "Đặt lại mật khẩu thành công! Vui lòng đăng nhập lại!");
            return "redirect:login.htm";

        } else {
            attributes.addFlashAttribute("error", "Đặt lại mật khẩu thất bại! Không thể đặt lại mật khẩu vào lúc này! Vui lòng thử lại sau!");
            return "redirect:confirm-change.htm";
        }
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
