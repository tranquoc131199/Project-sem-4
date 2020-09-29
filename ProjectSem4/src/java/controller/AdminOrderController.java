/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.paging;
import dao.OrderDAO;
import dao.PaymentMethodDAO;
import dao.TransportDAO;
import entities.Admins;
import entities.Logoes;
import entities.OrderDetails;
import entities.Orders;
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
@RequestMapping(value = "/admin")
public class AdminOrderController {

    private OrderDAO orderDAO;

    private PaymentMethodDAO paymentMethodDAO;

    private TransportDAO transportDAO;

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
            model.addAttribute("pagingHtml", pagingHtml);
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

}
