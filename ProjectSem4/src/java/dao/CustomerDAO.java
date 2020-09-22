/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Customers;
import entities.ProductComments;
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
     * Lấy thông tin của tất cả người dùng (trang quản trị)
     *
     * @param start
     * @param limit
     * @return
     */
    public List<Customers> getAllCustomers(Integer start, Integer limit);

    /**
     * Đếm tất cả Customers để phân trang
     *
     * @return
     */
    public Integer countAllCustomers();

    /**
     * Tìm kiếm người dùng theo tên
     *
     * @param customerFullname
     * @param start
     * @param limit
     * @return
     */
    public List<Customers> searchCustomersByName(String customerFullname, Integer start, Integer limit);

    /**
     * Đếm tất cả Customers để phân trang
     *
     * @param customerFullname
     * @return
     */
    public Integer countAllCustomersByName(String customerFullname);

    /**
     * Lấy thông tin người dùng theo CustomerId (trang quản trị)
     *
     * @param customerEmail
     * @return
     */
    public Customers getCustomerByEmail(String customerEmail);

    /**
     * Khoá tài khoản người dùng theo mã người dùng (khi người dùng có hành vi
     * phá rối website)
     *
     * @param customerId
     * @return
     */
    public Boolean disableCustomer(Integer customerId);

    /**
     * Cập nhật người dùng Sử dụng cho các hàm cập nhật phía dưới
     *
     * @param customer
     * @return
     */
    public Boolean updateCustomer(Customers customer);

    /**
     * Mở khoá tài khoản người dùng
     *
     * @param customerId
     * @return
     */
    public Boolean enableCustomer(Integer customerId);

    /**
     * Đăng ký mới tài khoản người dùng
     *
     * @param customer
     * @return
     */
    public Boolean insertCustomer(Customers customer);

    /**
     * Kiểm tra thông tin đăng nhập người dùng Chỉ cần kiểm tra email có chính
     * xác hay không, sau đó so sánh mật khẩu sau
     *
     * @param customerEmail
     * @return
     */
    public Customers checkCustomerLogin(String customerEmail);

    /**
     * Thay đổi mật khẩu người dùng, sau khi thay đổi phải yêu cầu đăng nhập lại
     * Thay đổi dữ liệu trường CustomerPassword của bản ghi tương ứng
     *
     * @param customerId
     * @param customerPassword
     * @return
     */
    public Boolean changeCustomerPassword(Integer customerId, String customerPassword);

    /**
     * Thay đổi ảnh đại diện của người dùng, sau khi thay đổi yêu cầu đăng nhập
     * lại Thay đổi dữ liệu trường CustomerAvatar của bản ghi tương ứng
     *
     * @param customerId
     * @param customerAvatar
     * @return
     */
    public Boolean changeCustomerAvatar(Integer customerId, String customerAvatar);

    /**
     * Thay đổi thông tin người dùng
     *
     * @param customerId
     * @param customerFullname
     * @param customerPhone
     * @param customerBirthday
     * @param customerAddress
     * @return
     */
    public Boolean changeCustomerInformation(Integer customerId, String customerFullname, String customerPhone, Date customerBirthday, String customerAddress);

    /**
     * Cập nhật trạng thái người dùng 0 = đã khoá 1 = đã kích hoạt (hoạt động
     * bình thường) 2 = cấm bình luận 3 = chưa kích hoạt (lúc mới tạo tài khoản)
     *
     * @param customerStatus
     * @param customerId
     * @return
     */
    public Boolean updateCustomerStatus(Integer customerId, Integer customerStatus);

    /**
     * Kiểm tra email người dùng nhập vào đã tồn tại hay chưa
     *
     * @param customerEmail
     * @return
     */
    public Boolean checkCustomerEmailExists(String customerEmail);

    /**
     * Kiểm tra số điện thoại người dùng nhập vào đã tồn tại hay chưa
     *
     * @param customerPhone
     * @return
     */
    public Boolean checkCustomerPhoneExists(String customerPhone);

    /**
     * Kiểm tra ảnh đại diện người dùng nhập vào đã tồn tại hay chưa
     *
     * @param customerAvatar
     * @return
     */
    public Boolean checkCustomerAvatarExists(String customerAvatar);

    /**
     * Lấy bình luận sản phẩm
     *
     * @param productCommentId
     * @return
     */
    public ProductComments getProductCommentById(Integer productCommentId);


    /**
     * Lấy danh sách các bình luận sản phẩm của người dùng
     *
     * @param customerId
     * @return
     */
    public List<ProductComments> getProductCommentsByCustomerId(Integer customerId);

    /**
     * Cập nhật trạng thái cho bình luận sản phẩm
     *
     * @param productCommentId
     * @param status
     * @return
     */
    public Boolean updateProductCommentStatus(Integer productCommentId, Integer status);

    /**
     * Cập nhật trạng thái cho bình luận bài viết
     *
     * @param newCommentId
     * @param status
     * @return
     */

    /**
     * Cập nhật trạng thái cho bình luận chương trình khuyến mãi
     *
     * @param promotionCommentId
     * @param status
     * @return
     */

    /**
     * Đếm số lượng sản phẩm đã mua theo mã khách hàng
     *
     * @param customerId
     * @return
     */
    public Integer countBoughtProductsByCustomerId(Integer customerId);

    /**
     * Xóa tài khoản người dùng
     *
     * @param customerId
     * @return
     */
    public Boolean deleteCustomer(Integer customerId);

    /**
     *
     * @param customer
     * @param product
     * @return
     */
    public Boolean removeWishlist(Customers customer, Products product);

    /**
     *
     * @param wishlist
     * @return
     */
    public Boolean addToWishlist(Wishlists wishlist);
}
