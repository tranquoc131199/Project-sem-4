/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.CartSingle;
import common.Message;
import common.SendEmail;
import common.validate;
import common.ShoppingCart;
import dao.CategoryDAO;
import dao.OrderDAO;
import dao.PaymentMethodDAO;
import dao.ProductDAO;
import dao.TransportDAO;
import entities.Customers;
import entities.OrderDetails;
import entities.Orders;
import entities.PaymentMethods;
import entities.Products;
import entities.Transports;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Acer Nitro 5
 */
@Controller
@RequestMapping(value = "/order")
public class ClientOrderController {

    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;
    private OrderDAO orderDAO;
    private TransportDAO transportDAO;

    @Autowired
    public void setTransportDAO(TransportDAO transportDAO) {
        this.transportDAO = transportDAO;
    }

    @Autowired
    public void setPaymentMethodDAO(PaymentMethodDAO paymentMethodDAO) {
        this.paymentMethodDAO = paymentMethodDAO;
    }
    private PaymentMethodDAO paymentMethodDAO;

    @Autowired
    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @Autowired
    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    @RequestMapping(value = "/index")
    public String index(HttpSession session, Model model) {
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
        String navbarHtm = categoryDAO.generateNavbar();

        if (shoppingCart != null) {
            model.addAttribute("shoppingCart", shoppingCart);
            model.addAttribute("carts", shoppingCart.carts);
        }
        if (navbarHtm.length() > 0) {
            model.addAttribute("navbarHtml", navbarHtm);
        }

        return "Customer/shopping-cart";
    }

    @RequestMapping(value = "add-to-cart")
    public @ResponseBody
    String addProductToCart(HttpSession session, Integer productId, Integer productQuantity) {
        Products product = productDAO.getProductById(productId);
        Message message = new Message();

        //kiểm tra sản ohaamr có tồn tại không
        if (product == null) {
            message.setResult(false);
            message.setMessage("Mã sản phẩm không tồn tại!");
            message.setMessageCode("product-null");
        }

        //kiểm tra trạng thá i cảu sản phẩm 1-còn hàng
        if (product.getProductStatus() != 1) {
            message.setResult(false);
            message.setMessage("Sản phẩm không khả dụng!");
            message.setMessageCode("product-unavailable");
        }

        //validate số lượng sản phẩm không được để trống
        if (productQuantity == null) {
            message.setResult(false);
            message.setMessage("Số lượng sản phẩm không tồn tại!");
            message.setMessageCode("quantity-invalid");
        }

        //validate số lượng sản phẩm không được để âm
        if (productQuantity <= 0) {
            message.setResult(false);
            message.setMessage("Số lượng sản phẩm không khả dụng!");
            message.setMessageCode("quantity-invalid");
        }

        //lấy  sesion cho giỏ hàng để so sánh 
        Object cart = session.getAttribute("shoppingCart");
        ShoppingCart shoppingCarts;

        if (cart == null) {
            shoppingCarts = new ShoppingCart();
        } else {
            shoppingCarts = (ShoppingCart) cart;
        }

        boolean insertCart = shoppingCarts.insertCart(product, productQuantity);

        if (!insertCart) {
            message.setResult(false);
            message.setMessage("Thêm sản phẩm vào giỏ hàng thất bại!");
            message.setMessageCode("add-failed");
        } else {
            message.setResult(true);
            message.setMessage("Thêm sản phẩm vào giỏ hàng thành công!");
            message.setMessageCode("add-success");
        }

        session.setAttribute("shoppingCart", shoppingCarts);
        return message.toString();
    }

    @RequestMapping(value = "/delete-one-of-cart")
    public @ResponseBody
    String deleteOneOfCart(HttpSession session, Integer productId) {

        //lay id cua san pham
        Products product = productDAO.getProductById(productId);
        Message message = new Message();

        if (product == null) {
            message.setResult(false);
            message.setMessage("Mã sản phẩm không tồn tại!");
            message.setMessageCode("product-null");
            return message.toString();
        }

        //st
        if (product.getProductStatus() != 1) {
            message.setResult(false);
            message.setMessage("Sản phẩm không khả dụng!");
            message.setMessageCode("product-unavailable");
            return message.toString();
        }

        //lay session cho cart
        Object cart = session.getAttribute("shoppingCart");

        if (cart == null) {
            message.setResult(false);
            message.setMessage("Giỏ hàng không tồn tại!");
            message.setMessageCode("cart-unexists");
            return message.toString();
        } else {
            ShoppingCart shoppingCart = (ShoppingCart) cart;
            //Tien hanh xoa san pham
            boolean deleteOneOfCard = shoppingCart.deleteOneOfCard(product);

            if (!deleteOneOfCard) {
                //thong bao loi cua gio hang
                message.setResult(false);
                message.setMessage("Cập nhật giỏ hàng thất bại!");
                message.setMessageCode("update-failed");
                return message.toString();
            } else {
                //xoa thanh cong vao thong bao ra man hinh
                message.setResult(true);
                message.setMessage("Xoá sản phẩm trong giỏ hàng thành công!");
                message.setMessageCode("update-success");
                session.setAttribute("shoppingCart", shoppingCart);
                return message.toString();
            }
        }
    }

    @RequestMapping(value = "/delete-all-cart")
    public @ResponseBody
    String deleteAllCart(HttpSession session) {

        //lấy sesion cảu giỏ hàng
        Object cart = session.getAttribute("shoppingCart");
        Message message = new Message();

        if (cart == null) {
            message.setResult(false);
            message.setMessage("Giỏ hàng không tồn tại!");
            message.setMessageCode("cart-unexists");
        } else {
            ShoppingCart shoppingCart = (ShoppingCart) cart;

            //tiến hàng xóa toàn bộ session giỏ hàng
            boolean deleteAllCart = shoppingCart.deleteAllCart();

            if (!deleteAllCart) {
                message.setResult(false);
                message.setMessage("Xoá giỏ hàng thất bại!");
                message.setMessageCode("remove-failed");
            } else {
                message.setResult(true);
                message.setMessage("Xoá giỏ hàng thành công!");
                message.setMessageCode("remove-success");
                session.removeAttribute("shoppingCart");
            }
        }

        return message.toString();
    }

    @RequestMapping(value = "/update-cart")
    public @ResponseBody
    String updateCart(HttpSession session, Integer productId, Integer productQuantity) {
        Products product = productDAO.getProductById(productId);
        Message message = new Message();

        if (product == null) {
            message.setResult(false);
            message.setMessage("Mã sản phẩm không tồn tại!");
            message.setMessageCode("product-null");
            return message.toString();
        }

        if (product.getProductStatus() != 1) {
            message.setResult(false);
            message.setMessage("Sản phẩm không khả dụng!");
            message.setMessageCode("product-unavailable");
            return message.toString();
        }

        if (productQuantity == null) {
            message.setResult(false);
            message.setMessage("Số lượng sản phẩm không tồn tại!");
            message.setMessageCode("quantity-invalid");
            return message.toString();
        }

        if (productQuantity <= 0 ) {
            message.setResult(false);
            message.setMessage("Số lượng sản phẩm không khả dụng!");
            message.setMessageCode("quantity-invalid");
            return message.toString();
        }

        //lấy  sesion cho giỏ hàng để so sánh 
        Object cart = session.getAttribute("shoppingCart");
        ShoppingCart shoppingCarts;

        if (cart == null) {
            message.setResult(false);
            message.setMessage("Giỏ hàng không tồn tại!");
            message.setMessageCode("cart-unexists");
            return message.toString();
        } else {
            shoppingCarts = (ShoppingCart) cart;

            boolean updateCart = shoppingCarts.updateCart(product, productQuantity);

            if (!updateCart) {
                message.setResult(false);
                message.setMessage("Cập nhật giỏ hàng thất bại!");
                message.setMessageCode("update-failed");
                return message.toString();
            } else {
                message.setResult(true);
                message.setMessage("Cập nhật giỏ hàng thành công!");
                message.setMessageCode("update-success");
                session.setAttribute("shoppingCart", shoppingCarts);
                return message.toString();
            }
        }
    }

    @RequestMapping(value = "checkout")
    public String checkout(HttpSession session, Model model) {
        if (session.getAttribute("shoppingCart") == null) {
            return "redirect:index.htm";
        }
        List<Transports> transports = transportDAO.getAllTransportsClient();
        List<PaymentMethods> paymentMethods = paymentMethodDAO.getAllPaymentMethodsClient();
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
        Customers customer = (Customers) session.getAttribute("customerLogin");
        String navbarHtm = categoryDAO.generateNavbar();

        if (shoppingCart.getTransport().getTransportPrice() == 0) {
            Transports transport = transportDAO.getTransportById(1);
            shoppingCart.setTransport(transport);
            session.setAttribute("shoppingCart", shoppingCart);
        }

        if ("".equals(shoppingCart.getPayment().getPaymentMethodName())) {
            PaymentMethods payment = paymentMethodDAO.getPaymentMethodById(1);
            shoppingCart.setPayment(payment);
            session.setAttribute("shoppingCart", shoppingCart);
        }

        if (transports.size() > 0) {
            model.addAttribute("transports", transports);
        }

        if (paymentMethods.size() > 0) {
            model.addAttribute("paymentMethods", paymentMethods);
        }

        if (customer != null) {
            model.addAttribute("customer", customer);
        }

        if (shoppingCart != null) {
            model.addAttribute("shoppingCart", shoppingCart);
            model.addAttribute("carts", shoppingCart.carts);
        }

        if (navbarHtm.length() > 0) {
            model.addAttribute("navbarHtm", navbarHtm);
        }
        return "Customer/check-out";
    }

    @RequestMapping(value = "/price")
    public @ResponseBody
    String updatePrice(HttpSession session, Integer transportId) {
        Transports transport = transportDAO.getTransportById(transportId);

        if (transport == null) {
            return "transport-null";
        }

        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
        shoppingCart.setTransport(transport);
        session.setAttribute("shoppingCart", shoppingCart);
        return "";
    }

    @RequestMapping(value = "/check-out-next", method = RequestMethod.POST)
    public String preCheckOut(RedirectAttributes attributes, HttpSession session, String customerFullname, String customerBirthday, String customerGender, String customerEmail, String customerPhone, String customerAddress, String orderNotes) throws MessagingException {
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
        Customers customer = (Customers) session.getAttribute("customerLogin");

        //không nhập ghi chú
        if (orderNotes == null) {
            orderNotes = "";
        }
        //kiểm tra sgior hàng có trống không
        if (shoppingCart == null) {
            attributes.addFlashAttribute("error", "Giỏ hàng đang trống!");
            return "redirect:/order/index.htm";
        }
        //đăng nhập để tiếp tục mua hàng
        if (customer == null) {
            attributes.addFlashAttribute("error", "Vui lòng đăng nhập để tiếp tục!");
            return "redirect:/customer/login.htm";
        }
        //họ và tên không được để trống
        if (validate.isEmpty(customerFullname)) {
            attributes.addFlashAttribute("error", "Họ tên của người đặt hàng không được để trống!");
            return "redirect:/order/checkout.htm";
        }
        //ngày sinh không được đẻ trống
        if (validate.isEmpty(customerBirthday)) {
            attributes.addFlashAttribute("error", "Ngày sinh của người đặt hàng không được để trống!");
            return "redirect:/order/checkout.htm";
        }

        if (validate.isEmpty(customerGender)) {
            attributes.addFlashAttribute("error", "Giới tính của người đặt hàng không được để trống!");
            return "redirect:/order/checkout.htm";
        }

        if (validate.isEmpty(customerEmail)) {
            attributes.addFlashAttribute("error", "Email của người đặt hàng không được để trống!");
            return "redirect:/order/checkout.htm";
        }

        if (!validate.isMail(customerEmail)) {
            attributes.addFlashAttribute("error", "Email của người đặt hàng không đúng định dạng!");
            return "redirect:/order/checkout.htm";
        }

        if (!validate.checkMaxLenght(customerEmail, 250)) {
            attributes.addFlashAttribute("error", "Độ dài email của người đặt hàng không được vượt quá 250 ký tự!");
            return "redirect:/order/checkout.htm";
        }

        if (validate.isEmpty(customerPhone)) {
            attributes.addFlashAttribute("error", "Số điện thoại của người đặt hàng không được để trống!");
            return "redirect:/order/checkout.htm";
        }

        if (!validate.isPhoneNumber(customerPhone)) {
            attributes.addFlashAttribute("error", "Số điện thoại của người đặt hàng không đúng định dạng!");
            return "redirect:/order/checkout.htm";
        }

        if (!validate.checkMaxLenght(customerPhone, 20)) {
            attributes.addFlashAttribute("error", "Độ dài số điện thoại của người đặt hàng không được vượt quá 20 ký tự!");
            return "redirect:/order/checkout.htm";
        }

        if (validate.isEmpty(customerAddress)) {
            attributes.addFlashAttribute("error", "Địa chỉ của người đặt hàng không được để trống!");
            return "redirect:/order/checkout.htm";
        }

        Orders order = new Orders();
        order.setCreatedDate(new Date());
        order.setCustomerId(customer);
        order.setOrderAddress(customerAddress);
        order.setOrderNote(orderNotes);
        order.setOrderStatus(4);
        order.setOrderTotalAmount(shoppingCart.lastAmount);
        order.setPaymentMethodId(shoppingCart.payment);
        order.setTransportId(shoppingCart.transport);
        order.setUpdatedDate(new Date());

        boolean check = orderDAO.insertOrder(order);

        //đếm số order detail 
        int countOrderDetailInserted = 0;

        if (!check) {
            attributes.addFlashAttribute("error", "Đặt hàng không thành công!");
            return "redirect:/order/checkout.htm";
        } else {
            List<CartSingle> carts = shoppingCart.carts;
            List<OrderDetails> orderDetails = new ArrayList<>();

            for (CartSingle c : carts) {
                OrderDetails od = new OrderDetails();
                od.setCreatedDate(new Date());
                od.setOrderDetailPrice(c.getProduct().getProductPrice());
                od.setOrderDetailQuantity(c.getProductQuantity());
                od.setOrderDetailSale(c.getProduct().getProductSale());
                od.setOrderId(order);
                od.setProductId(c.getProduct());
                od.setUpdatedDate(new Date());

                check = orderDAO.insertOrderDetail(od);

                if (!check) {
                    attributes.addFlashAttribute("error", "Đặt hàng không thành công!");
                    return "redirect:/order/checkout.htm";
                } else {
                    countOrderDetailInserted++;
                    orderDetails.add(od);
                }
            }

            //hiển thị tiêu để mail
            String emailTitle = "[QTB-STORE: XÁC NHẬN ĐẶT HÀNG THÀNH CÔNG]";
            //hiển thị nội dung email
            String emailBody = generateOrderEmailBody(orderDetails);
            //dùng mail mặc định để gửi tới mail của khác hàng
            SendEmail.sendMail(customerEmail, emailTitle, emailBody);

        }
        
//         if (countOrderDetailInserted > 0) {
//            orderDAO.revertOrderDetail(countOrderDetailInserted);
//            attributes.addFlashAttribute("error", "Đặt hàng không thành công!");
//            return "redirect:/order/checkout.htm";
//        }


        return "redirect:/order/index.htm";
    }

    private String generateOrderEmailBody(List<OrderDetails> orderDetails) {
        String emailBody = "";
        emailBody += "<div>Cám ơn bạn đã đặt hàng tại hệ thống thương mại điện tử QTB-Store. Dưới đây là chi tiết đơn hàng của bạn:</div>\n";
        emailBody += "<table border='1'>\n";
        emailBody += "<thead>\n";
        emailBody += "<tr>\n";
        emailBody += "<th>Tên sản phẩm</th>\n";
        emailBody += "<th>Hình ảnh</th>\n";
        emailBody += "<th>Số lượng</th>\n";
        emailBody += "<th>Đơn giá</th>\n";
        emailBody += "<th>Giảm giá</th>\n";
        emailBody += "<th>Thành tiền</th>\n";
        emailBody += "</tr>\n";
        emailBody += "</thead>\n";
        emailBody += "<tbody>\n";
        for (OrderDetails od : orderDetails) {
            emailBody += "<tr>\n";
            emailBody += "<td>" + od.getProductId().getProductName() + "</td>\n";
            emailBody += "<td><img style='height: 80px;' src='" + od.getProductId().getProductFeatureImage() + "' /></td>\n";
            emailBody += "<td>" + od.getOrderDetailQuantity() + "</td>\n";
            emailBody += "<td>" + String.format("%,.0f", od.getOrderDetailPrice()) + "</td>\n";
            emailBody += "<td>" + od.getOrderDetailSale() + "%</td>\n";
            emailBody += "<td>" + String.format("%,.0f", od.getOrderDetailPrice() * (100 - od.getOrderDetailSale()) / 100 * od.getOrderDetailQuantity()) + "</td>\n";
            emailBody += "</tr>\n";
        }

        emailBody += "</tbody>\n";
        emailBody += "<tfoot>\n";
        emailBody += "<tr>\n";
        emailBody += "<td colspan='6' style='text-align: right;'><b>Thành tiền:</b> " + String.format("%,.0f", orderDetails.get(0).getOrderId().getOrderTotalAmount()) + " VNĐ</td>\n";
        emailBody += "</tr>\n";
        emailBody += "</tfoot>\n";
        emailBody += "</table>\n";
        emailBody += "\n";
        emailBody += "<div>\n";
        emailBody += "Vui lòng theo dõi chi tiết trong mục đơn hàng của tài khoản cá nhân. Chúng tôi sẽ sớm phản hồi đến bạn!\n";
        emailBody += "</div>";

        return emailBody;
    }

}
