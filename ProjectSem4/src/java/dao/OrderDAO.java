/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.OrderDetails;
import entities.Orders;
import java.util.Date;
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
    public List<OrderDetails> getOrderDetailByOrderId(Integer orderId);

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

    /**
     * Đếm số lượng đơn hàng để hiển thị ngoài bảng điều khiển Điều kiện tính:
     * các đơn hàng phải có trạng thái thành công (OrderStatus = 1)
     *
     * @return
     */
    public long countOrderForDisplayOnDashboard();
    
       /**
     * Tính tổng doanh thu để hiển thị ngoài bảng điều khiển Điều kiện tính: các
     * đơn hàng phải có trạng thái thành công (OrderStatus = 1)
     *
     * @return
     */
    public Double sumRevenueForDisplayOnDashboard();
    
        /**
     * Lấy ra 10 bản ghi đơn hàng mới nhất để hiển thị lên bảng điều khiển
     *
     * @return
     */
    public List<Orders> getTopTenOrderToDisplayOnDashboard();
    
    /**
     * Tính tổng doanh thu theo tuần
     *
     * @return
     */
    public List<OrderDetails> weekOrder();

    /**
     * Tính tổng doanh thu theo tháng
     *
     * @return
     */
    public List<OrderDetails> monthOrder();

    /**
     * Tính tổng doanh thu theo quý
     *
     * @return
     */
    public List<OrderDetails> quarterOrder();

    /**
     * Tính tổng doanh thu theo năm
     *
     * @return
     */
    public List<OrderDetails> yearOrder();

    /**
     * Tính tổng doanh thu theo tuỳ biến (ngày bắt đầu và ngày kết thúc)
     *
     * @param startDate
     * @param endDate
     * @return
     */
    public List<OrderDetails> customOrder(Date startDate, Date endDate);

}
