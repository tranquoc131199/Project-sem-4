/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Admins;
import java.util.List;

/**
 *
 * @author QuanKoiNA
 */
public interface AdminDAO {
    
    /**
     * Lấy danh sách tất cả các bản ghi trong bảng Admins.
     * @return 
     */
    public List<Admins> getAllAdmins();
    
    /**
     * Đếm tổng số bản ghi Admins để phân trang
     * @return 
     */
    public Integer countAllAdmins();
    
    /**
     * Lấy danh sách Admins để phân trang
     * @param start
     * @param limit
     * @return 
     */
    public List<Admins> getAllAdminsForPaging(Integer start, Integer limit);
    
    /**
     * Đếm tổng số bản ghi Admins có AdminEmail đang tìm kiếm để phân trang
     * @param adminEmail
     * @return 
     */
    public Integer countAllAdminByAdminEmail(String adminEmail);
    
    /**
     * Tìm kiếm quản trị viên theo email.
     * @param adminEmail
     * @param start
     * @param limit
     * @return 
     */
    public List<Admins> searchAdminByEmail(String adminEmail, Integer start, Integer limit);
    
    /**
     * Lấy thông tin quản trị viên theo AdminId (dùng khi xem chi tiết quản trị viên)
     * @param adminId
     * @return 
     */
    public Admins getAdminById(Integer adminId);
    
    /**
     * Thêm mới quản trị viên
     * @param admin
     * @return 
     */
    public Boolean insertAdmin(Admins admin);
    
    /**
     * Cập nhật quản trị viên
     * Cái này chỉ sử dụng cho việc cập nhật ảnh đại diện và thay đổi mật khẩu
     * @param admin
     * @return 
     */
    public Boolean updateAdmin(Admins admin);
    
    /**
     * Kiểm tra thông tin đăng nhập quản trị viên
     * Chỉ cần kiểm tra email có chính xác hay không để trả về object Admins, sau đó sẽ so sánh mật khẩu
     * @param adminEmail
     * @return 
     */
    public Admins checkAdminLogin(String adminEmail);
    
    /**
     * Thay đổi mật khẩu quản trị viên (sau khi thay đổi thì đăng xuất và yêu cầu đăng nhập lại)
     * @param adminId
     * @param adminPassword
     * @return 
     */
    public Boolean changeAdminPassword(Integer adminId, String adminPassword);
    
    /**
     * Thay đổi ảnh đại diện quản trị viên (sau khi thay đổi thì đăng xuất và yêu cầu đăng nhập lại)
     * @param adminId
     * @param adminAvatar
     * @return 
     */
    public Boolean changeAdminAvatar(Integer adminId, String adminAvatar);
    
    /**
     * Kiểm tra adminEmail nhập vào đã tồn tại hay chưa
     * @param adminEmail
     * @return 
     */
    public Boolean checkAdminEmailExists(String adminEmail);
    
    /**
     * Kiểm tra adminIdCard nhập vào đã tồn tại hay chưa
     * @param adminIdCard
     * @return 
     */
    public Boolean checkAdminIdCardExists(String adminIdCard);
    
    /**
     * Kiểm tra adminPhone nhập vào đã tồn tại hay chưa
     * @param adminPhone
     * @return 
     */
    public Boolean checkAdminPhoneExists(String adminPhone);
    
    /**
     * Kiểm tra adminAvatar nhập vào đã tồn tại hay chưa
     * @param adminAvatar
     * @return 
     */
    public Boolean checkAdminAvatarExists(String adminAvatar);
}
