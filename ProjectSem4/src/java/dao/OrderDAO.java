/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.OrderDetails;
import entities.Orders;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public interface OrderDAO {

    /**
     * thêm data vào bảng order
     *
     * @param order
     * @return
     */
    public Boolean insertOrder(Orders order);

    /**
     * thêm data vào bảng orderDetail
     *
     * @param orderDetail
     * @return
     */
    public Boolean insertOrderDetail(OrderDetails orderDetail);

    /**
     * Đếm số lượng tất cả các bản ghi đơn hàng để phân trang
     *
     * @return
     */
    public Integer countAllOrders();

    /**
     * Lấy danh sách tất cả các đơn hàng (trang quản trị) để phân trang
     *
     * @param start
     * @param limit
     * @return
     */
    public List<Orders> getAllOrdersForPaging(Integer start, Integer limit);

    /**
     * Đếm tổng số bản ghi đơn hàng theo mã đơn hàng
     *
     * @param orderCode
     * @return
     */
    public Integer countAllOrdersSearch(String orderCode);

    /**
     *
     * @param orderCode
     * @param start
     * @param limit
     * @return
     */
    public List<Orders> searchOrders(String orderCode, Integer start, Integer limit);

    /**
     * Lấy thông tin đơn hàng theo mã đơn hàng
     *
     * @param orderId
     * @return
     */
    public Orders getOrderById(Integer orderId);

    /**
     * lấy ra đơn hàng chi tiết theo đơn hàng
     *
     * @param orderId
     * @return
     */
    public List<OrderDetails> getOrderDetailByOrderId(int orderId);

    /**
     * Cập nhật trạng thái đơn hàng
     *
     * @param orderId
     * @param orderStatus
     * @return
     */
    public Boolean updateOrder(Integer orderId, Integer orderStatus);

    /**
     * Lấy danh sách tất cả các đơn hàng theo mã người dùng
     *
     * @param customerId
     * @return
     */
    public List<Orders> getAllOrdersByCustomerId(Integer customerId);

}
