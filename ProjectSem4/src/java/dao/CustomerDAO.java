/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Customers;
import entities.Products;
import entities.Wishlists;
import java.util.Date;
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

    /**
     *xóa danh sách yêu thích
     * @param customer
     * @param product
     * @return
     */
    public Boolean removeWishlist(Customers customer, Products product);
    
    /**
     * add to danh sách yeu thích
     * @param wishlist
     * @return 
     */
    public Boolean addToWishlist(Wishlists wishlist);
    
        /**
     * Kiểm tra số điện thoại người dùng nhập vào đã tồn tại hay chưa
     * @param customerPhone
     * @return 
     */
    public Boolean checkCustomerPhoneExists(String customerPhone);
    
        /**
     * Thay đổi thông tin người dùng
     * @param customerId
     * @param customerFullname
     * @param customerPhone
     * @param customerBirthday
     * @param customerAddress
     * @return 
     */
    public Boolean changeCustomerInformation(Integer customerId, String customerFullname, String customerPhone, Date customerBirthday, String customerAddress);
    
        /**
     * Cập nhật người dùng
     * Sử dụng cho các hàm cập nhật phía dưới
     * @param customer
     * @return 
     */
    public Boolean updateCustomer(Customers customer);
    
        /**
     * Thay đổi mật khẩu người dùng, sau khi thay đổi phải yêu cầu đăng nhập lại
     * Thay đổi dữ liệu trường CustomerPassword của bản ghi tương ứng
     * @param customerId
     * @param customerPassword
     * @return 
     */
    public Boolean changeCustomerPassword(Integer customerId, String customerPassword);
    
        /**
     * Thay đổi ảnh đại diện của người dùng, sau khi thay đổi yêu cầu đăng nhập lại
     * Thay đổi dữ liệu trường CustomerAvatar của bản ghi tương ứng
     * @param customerId
     * @param customerAvatar
     * @return 
     */
    public Boolean changeCustomerAvatar(Integer customerId, String customerAvatar);
    
    /**
     * Kiểm tra email người dùng nhập vào đã tồn tại hay chưa
     * @param customerEmail
     * @return 
     */
    public Boolean checkCustomerEmailExists(String customerEmail);
    
    /**
     * Đăng ký mới tài khoản người dùng
     * @param customer
     * @return 
     */
    public Boolean insertCustomer(Customers customer);
    
       /**
     * Lấy thông tin người dùng theo CustomerId (trang quản trị)
     * @param customerEmail
     * @return 
     */
    public Customers getCustomerByEmail(String customerEmail);
    
        /**
     * Mở khoá tài khoản người dùng
     * @param customerId
     * @return 
     */
    public Boolean enableCustomer(Integer customerId);

}
