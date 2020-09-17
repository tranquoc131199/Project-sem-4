/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.OrderDetails;
import entities.Orders;

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

    /**thêm data vào bảng orderDetail
     *
     * @param orderDetail
     * @return
     */
    public Boolean insertOrderDetail(OrderDetails orderDetail);

}
