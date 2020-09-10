/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Customers;
import entities.Wishlists;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public interface CustomerDAO {

    /**
     * Kiểm tra thông tin đăng nhập người dùng có chính xsac không
     *
     *
     * @param customerEmail,customerPassword
     * @return
     */
    public Customers checkCustomerLogin(String customerEmail, String customerPassword);

    /**
     * lấy sản phẩm yêu thích của người dùng
     *
     * @param customerId
     * @return
     */
    public List<Wishlists> getWishlistsByCustomerId(Integer customerId);

    /**
     * Lấy thông tin người dùng theo CustomerId =
     *
     * @param customerId
     * @return
     */
    public Customers getCustomerById(Integer customerId);

}
