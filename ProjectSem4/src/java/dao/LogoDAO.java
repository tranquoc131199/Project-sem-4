/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Logoes;
import java.util.List;

/**
 *
 * @author QuanKoiNA
 */
public interface LogoDAO {
    
    /**
     * Lấy danh sách tất cả các Logoes
     * @param start
     * @param limit
     * @return 
     */
    public List<Logoes> getAllLogoes(Integer start, Integer limit);
    
    /**
     * Đếm tổng số bản ghi Logo
     * @return 
     */
    public Integer countAllLogoes();
    
    /**
     * Lấy 1 bản ghi Logo duy nhất có LogoStatus = 1 để hiển thị cho toàn trang
     * @return 
     */
    public Logoes getLogoToDisplay();
    
    /**
     * Thêm mới 1 logo
     * @param logo
     * @return 
     */
    public Boolean insertLogo(Logoes logo);
    
    /**
     * Cập nhật logo
     * @param logo
     * @return 
     */
    public Boolean updateLogo(Logoes logo);
    
    /**
     * Lấy logo theo mã
     * @param logoId
     * @return 
     */
    public Logoes getLogoById(Integer logoId);
    
    /**
     * Khoá logo
     * @param logoId
     * @return 
     */
    public Boolean disableLogo(Integer logoId);
    
    /**
     * Khoá toàn bộ logo
     * Sử dụng khi chọn kích hoạt (sử dụng) 1 logo trong danh sách
     * Khi đó, sẽ khoá toàn bộ trước và kích hoạt logo cần hiển thị sau để đảm bảo luôn luôn có duy nhất 1 logo có LogoStatus = 1
     * Tương tự trường hợp thêm mới
     * @return 
     */
    public Boolean disableAllLogo();
    
    /**
     * Mở khoá (sử dụng) logo
     * @param logoId
     * @return 
     */
    public Boolean enableLogo(Integer logoId);
    
    /**
     * Kiểm tra hình ảnh logo đã tồn tại trong hệ thống hay chưa
     * @param logoImage
     * @return 
     */
    public Boolean checkLogoImageExists(String logoImage);
}
