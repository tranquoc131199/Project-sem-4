/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.paging;
import common.validate;
import dao.LogoDAO;
import dao.OrderDAO;
import dao.PaymentMethodDAO;
import dao.TransportDAO;
import entities.Admins;
import entities.Logoes;
import entities.OrderDetails;
import entities.Orders;
import entities.Transports;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
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
@RequestMapping(value = "/admin")
public class AdminOrderController {

    private OrderDAO orderDAO;

    private PaymentMethodDAO paymentMethodDAO;

    private TransportDAO transportDAO;

    private LogoDAO logoDAO;

    private validate validate;

    @Autowired
    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    @Autowired
    public void setPaymentMethodDAO(PaymentMethodDAO paymentMethodDAO) {
        this.paymentMethodDAO = paymentMethodDAO;
    }

    @Autowired
    public void setTransportDAO(TransportDAO transportDAO) {
        this.transportDAO = transportDAO;
    }

    @RequestMapping(value = "order/index")
    public String index(HttpSession session, Model model, Integer page, String orderId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        if (page == null || page <= 0) {
            page = 1;
        }

        paging paging;
        List<Orders> orders;
        String pagingHtml = "";
        int totalRecords;
        String firstLink = "/ProjectSem4/admin/order/index.htm";
        String currentLink = "/ProjectSem4/admin/order/index.htm{p}";

        if (orderId == null || orderId.equals("")) {
            totalRecords = orderDAO.countAllOrders();

            if (totalRecords > 12) {
                paging = new paging(page, totalRecords, 12, currentLink, firstLink);
                orders = orderDAO.getAllOrdersForPaging(paging.startRecord, 12);
                pagingHtml = paging.generateHtml();
            } else {
                orders = orderDAO.getAllOrdersForPaging(0, totalRecords);
            }
        } else {
            totalRecords = orderDAO.countAllOrdersSearch(orderId);

            if (totalRecords > 12) {
                paging = new paging(page, totalRecords, 12, currentLink, firstLink);
                orders = orderDAO.searchOrders(orderId, paging.startRecord, 12);
                pagingHtml = paging.generateHtml();
            } else {
                orders = orderDAO.getAllOrdersForPaging(0, totalRecords);
            }

            model.addAttribute("orderId", orderId);
        }

        if (orders.size() > 0) {
            model.addAttribute("orders", orders);
        }

        if (pagingHtml.length() > 0) {
            model.addAttribute("paging", pagingHtml);
        }

        model.addAttribute("title", "Quản lý đơn hàng");
        return "Admin/order-list";
    }

    @RequestMapping(value = "order/search")
    public String searchOrder(String orderId) {
        return "redirect:/admin/order/index.htm?orderCode=" + orderId;
    }

    @RequestMapping(value = "order/detail")
    public String detailOrder(RedirectAttributes attributes, HttpSession session, Model model, Integer orderId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        if (orderId == null) {
            attributes.addFlashAttribute("error", "Mã đơn hàng không tồn tại!");
            return "redirect:/admin/order/index.htm";
        }

        List<OrderDetails> listOrderDetails = orderDAO.getOrderDetailByOrderId(orderId);
        Orders order = orderDAO.getOrderById(orderId);

        if (order == null) {
            attributes.addFlashAttribute("error", "Mã đơn hàng không tồn tại!");
            return "redirect:/admin/order.htm";
        }
        model.addAttribute("listOrderDetails", listOrderDetails);
        model.addAttribute("order", order);
        model.addAttribute("title", "Chi tiết đơn hàng");
        return "Admin/order-detail";
    }

    @RequestMapping(value = "order/success")
    public String successOrder(RedirectAttributes attributes, HttpSession session, Model model, Integer orderId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        Orders order = orderDAO.getOrderById(orderId);

        if (order == null) {
            attributes.addFlashAttribute("error", "Mã đơn hàng không tồn tại!");
            return "redirect:index.htm";
        }

        boolean check = orderDAO.updateOrder(orderId, 1);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật đơn hàng không thành công!");
            return "redirect:index.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật đơn hàng thành công!");
            return "redirect:index.htm";
        }
    }

    @RequestMapping(value = "order/accept")
    public String acceptOrder(RedirectAttributes attributes, HttpSession session, Model model, Integer orderId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        Orders order = orderDAO.getOrderById(orderId);

        if (order == null) {
            attributes.addFlashAttribute("error", "Mã đơn hàng không tồn tại!");
            return "redirect:index.htm";
        }

        boolean check = orderDAO.updateOrder(orderId, 3);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật đơn hàng không thành công!");
            return "redirect:index.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật đơn hàng thành công!");
            return "redirect:index.htm";
        }
    }

    @RequestMapping(value = "order/transport")
    public String transportOrder(RedirectAttributes attributes, HttpSession session, Model model, Integer orderId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        Orders order = orderDAO.getOrderById(orderId);

        if (order == null) {
            attributes.addFlashAttribute("error", "Mã đơn hàng không tồn tại!");
            return "redirect:index.htm";
        }

        boolean check = orderDAO.updateOrder(orderId, 2);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật đơn hàng không thành công!");
            return "redirect:index.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật đơn hàng thành công!");
            return "redirect:index.htm";
        }
    }

    @RequestMapping(value = "order/denied")
    public String deniedOrder(RedirectAttributes attributes, HttpSession session, Model model, Integer orderId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        Orders order = orderDAO.getOrderById(orderId);

        if (order == null) {
            attributes.addFlashAttribute("error", "Mã đơn hàng không tồn tại!");
            return "redirect:order.htm";
        }

        boolean check = orderDAO.updateOrder(orderId, 0);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật đơn hàng không thành công!");
            return "redirect:index.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật đơn hàng thành công!");
            return "redirect:index.htm";
        }
    }

    @RequestMapping(value = "/transport")
    public String transport(HttpSession session, Model model, Integer page) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        if (page == null || page <= 0) {
            page = 1;
        }

        int totalRecords = transportDAO.countAllTransport();
        paging paging;
        String pagingHtml = "";
        List<Transports> transports;
//        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        String iconImage = "";

//        if (logo != null) {
//            logoImage = logo.getLogoImage();
//        }

        if (logoImage.length() > 0) {
            model.addAttribute("logo", logoImage);
        }

        if (iconImage.length() > 0) {
            model.addAttribute("icon", iconImage);
        }

        if (totalRecords > 12) {
            String firstLink = "/QTCStore/admin/transport/index.htm";
            String currentLink = "/QTCStore/admin/transport/index.htm{p}";
            paging = new paging(page, totalRecords, 12, currentLink, firstLink);
            transports = transportDAO.getAllTransportsForPaging(paging.startRecord, 12);
            pagingHtml = paging.generateHtml();
        } else {
            transports = transportDAO.getAllTransportsForPaging(0, totalRecords);
        }

        if (transports.size() > 0) {
            model.addAttribute("transports", transports);
        }

        if (pagingHtml.length() > 0) {
            model.addAttribute("paging", pagingHtml);
        }

        model.addAttribute("title", "Quản lý phương thức vận chuyển");
        return "Admin/transport-list";
    }

    @RequestMapping(value = "/transport/insert")
    public String insertTransport(HttpSession session, Model model) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

//        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        String iconImage = "";

//        if (logo != null) {
//            logoImage = logo.getLogoImage();
//        }

        if (logoImage.length() > 0) {
            model.addAttribute("logo", logoImage);
        }

        if (iconImage.length() > 0) {
            model.addAttribute("icon", iconImage);
        }

        model.addAttribute("title", "Thêm mới phương thức vận chuyển");
        return "Admin/transport-insert";
    }

    @RequestMapping(value = "/transport/do-insert")
    public String doInsertTransport(RedirectAttributes attributes, HttpSession session, String transportName, String transportDescription, String transportPrice, String transportStatus) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        if (validate.isEmpty(transportName)) {
            attributes.addFlashAttribute("error", "Tên phương thức vận chuyển không được để trống!");
            return "redirect:/admin/transport/insert.htm";
        }

        if (validate.isEmpty(transportDescription)) {
            attributes.addFlashAttribute("error", "Mô tả phương thức vận chuyển không được để trống!");
            return "redirect:/admin/transport/insert.htm";
        }

        double transportPriceForInsert = validate.convertStringToDouble(transportPrice, 0);

        if (transportPriceForInsert <= 0) {
            attributes.addFlashAttribute("error", "Giá của phương thức vận chuyển không nhận giá trị phù hợp!");
            return "redirect:/admin/transport/insert.htm";
        }

        int transportStatusForInsert = validate.convertStringToInt(transportStatus, 0);

        if (transportStatusForInsert != 0 && transportStatusForInsert != 1) {
            attributes.addFlashAttribute("error", "Trạng thái của phương thức vận chuyển không nhận giá trị phù hợp!");
            return "redirect:/admin/transport/insert.htm";
        }

        if (!validate.checkMaxLenght(transportName, 250)) {
            attributes.addFlashAttribute("error", "Độ dài tên phương thức vận chuyển không được vượt quá 250 ký tự!");
            return "redirect:/admin/transport/insert.htm";
        }

        boolean check = transportDAO.checkTransportNameExists(transportName);

        if (check) {
            attributes.addFlashAttribute("error", "Tên phương thức vận chuyển đã tồn tại!");
            return "redirect:/admin/transport/insert.htm";
        }

        Transports transport = new Transports();
//        transport.setAdminId((Admins) session.getAttribute("adminLogin"));
        transport.setTransportName(transportName);
        transport.setTransportDescription(transportDescription);
        transport.setTransportPrice(transportPriceForInsert);
        transport.setCreatedDate(new Date());
        transport.setUpdatedDate(new Date());
        transport.setTransportStatus(transportStatusForInsert);

        check = transportDAO.insertTransport(transport);

        if (!check) {
            attributes.addFlashAttribute("error", "Thêm mới phương thức vận chuyển không thành công!");
            return "redirect:/admin/transport/insert.htm";
        } else {
            attributes.addFlashAttribute("success", "Thêm mới phương thức vận chuyển thành công!");
            return "redirect:/admin/transport.htm";
        }
    }

    @RequestMapping(value = "/transport/update")
    public String updateTransport(RedirectAttributes attributes, HttpSession session, Model model, Integer transportId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        Transports transport = transportDAO.getTransportById(transportId);

        if (transport == null) {
            attributes.addFlashAttribute("error", "Mã phương thức vận chuyển không tồn tại!");
            return "redirect:/admin/transport.htm";
        }

//        Logoes logo = logoDAO.getLogoToDisplay();
        String logoImage = "";
        String iconImage = "";

//        if (logo != null) {
//            logoImage = logo.getLogoImage();
//        }

        if (logoImage.length() > 0) {
            model.addAttribute("logo", logoImage);
        }

        if (iconImage.length() > 0) {
            model.addAttribute("icon", iconImage);
        }

        model.addAttribute("title", "Cập nhật phương thức vận chuyển");
        model.addAttribute("transport", transport);
        return "Admin/transport-update";
    }

    @RequestMapping(value = "/transport/do-update")
    public String doUpdateTransport(RedirectAttributes attributes, HttpSession session, Integer transportId, String transportName, String transportDescription, String transportPrice, String transportStatus) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Transports transport = transportDAO.getTransportById(transportId);

        if (transport == null) {
            attributes.addFlashAttribute("error", "Mã phương thức vận chuyển không tồn tại!");
            return "redirect:/admin/transport/update.htm?transportId=" + transportId;
        }

        if (validate.isEmpty(transportName)) {
            attributes.addFlashAttribute("error", "Tên phương thức vận chuyển không được để trống!");
            return "redirect:/admin/transport/update.htm?transportId=" + transportId;
        }

        if (validate.isEmpty(transportDescription)) {
            attributes.addFlashAttribute("error", "Mô tả phương thức vận chuyển không được để trống!");
            return "redirect:/admin/transport/update.htm?transportId=" + transportId;
        }

        double transportPriceForInsert = validate.convertStringToDouble(transportPrice, 0);

        if (transportPriceForInsert <= 0) {
            attributes.addFlashAttribute("error", "Giá của phương thức vận chuyển không nhận giá trị phù hợp!");
            return "redirect:/admin/transport/update.htm?transportId=" + transportId;
        }

        int transportStatusForInsert = validate.convertStringToInt(transportStatus, 0);

        if (transportStatusForInsert != 0 && transportStatusForInsert != 1) {
            attributes.addFlashAttribute("error", "Trạng thái của phương thức vận chuyển không nhận giá trị phù hợp!");
            return "redirect:/admin/transport/update.htm?transportId=" + transportId;
        }

        if (!validate.checkMaxLenght(transportName, 250)) {
            attributes.addFlashAttribute("error", "Độ dài tên phương thức vận chuyển không được vượt quá 250 ký tự!");
            return "redirect:/admin/transport/update.htm?transportId=" + transportId;
        }

        boolean check = transportDAO.checkTransportNameExists(transportName);

        if (check && !transport.getTransportName().equals(transportName)) {
            attributes.addFlashAttribute("error", "Tên phương thức vận chuyển đã tồn tại!");
            return "redirect:/admin/transport/update.htm?transportId=" + transportId;
        }

//        transport.setAdminId((Admins) session.getAttribute("adminLogin"));
        transport.setTransportName(transportName);
        transport.setTransportDescription(transportDescription);
        transport.setTransportPrice(transportPriceForInsert);
        transport.setTransportStatus(transportStatusForInsert);
        transport.setUpdatedDate(new Date());

        check = transportDAO.updateTransport(transport);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật phương thức vận chuyển không thành công!");
            return "redirect:/admin/transport/update.htm?transportId=" + transportId;
        } else {
            attributes.addFlashAttribute("success", "Cập nhật phương thức vận chuyển thành công!");
            return "redirect:/admin/transport.htm";
        }
    }

    @RequestMapping(value = "/transport/disable")
    public String disableTransport(RedirectAttributes attributes, HttpSession session, Integer transportId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Transports transport = transportDAO.getTransportById(transportId);

        if (transport == null) {
            attributes.addFlashAttribute("error", "Mã phương thức vận chuyển không tồn tại!");
            return "redirect:/admin/transport.htm";
        }

        boolean check = transportDAO.disableTransport(transportId);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật phương thức vận chuyển không thành công!");
            return "redirect:/admin/transport.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật phương thức vận chuyển thành công!");
            return "redirect:/admin/transport.htm";
        }
    }

    @RequestMapping(value = "/transport/enable")
    public String enableTransport(RedirectAttributes attributes, HttpSession session, Integer transportId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Transports transport = transportDAO.getTransportById(transportId);

        if (transport == null) {
            attributes.addFlashAttribute("error", "Mã phương thức vận chuyển không tồn tại!");
            return "redirect:/admin/transport.htm";
        }

        boolean check = transportDAO.enableTransport(transportId);

        if (!check) {
            attributes.addFlashAttribute("error", "Cập nhật phương thức vận chuyển không thành công!");
            return "redirect:/admin/transport.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật phương thức vận chuyển thành công!");
            return "redirect:/admin/transport.htm";
        }
    }
}
