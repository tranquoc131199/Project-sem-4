/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Banners;
import java.util.List;

/**
 *
 * @author Thang Pham
 */
public interface BannerDAO {
    
    /**
     * Lấy ra danh sách tất cả các Banners (trang quản trị)
     * @param start
     * @param limit
     * @return 
     */
    public List<Banners> getAllBanners(Integer start, Integer limit);
    
    /**
     * Đếm tổng số bản ghi Banners
     * @return 
     */
    public Integer countAllBanners();
    
    /**
     * Lấy giá trị bannerPiority lớn nhất
     * @return 
     */
    public Integer getMaxBannerPiority();
    
    /**
     * Lấy ra danh sách tất cả các Banners được sắp xếp theo thứ tự tăng dần BannerPiority để hiển thị ngoài front-end
     * @return 
     */
    public List<Banners> getAllBannersFrontEnd();
    
    /**
     * Lấy banner theo mã
     * @param bannerId
     * @return 
     */
    public Banners getBannerById(Integer bannerId);
    
    /**
     * Thêm mới Banner
     * @param banner
     * @return 
     */
    public Boolean insertBanner(Banners banner);
    
    /**
     * Cập nhật Banner
     * @param banner
     * @return 
     */
    public Boolean updateBanner(Banners banner);
    
    /**
     * Khoá Banner theo mã
     * @param bannerId
     * @return 
     */
    public Boolean disableBanner(Integer bannerId);
    
    /**
     * Mở khoá Banner theo mã
     * @param bannerId
     * @return 
     */
    public Boolean enableBanner(Integer bannerId);
    
    /**
     * Kiểm tra hình ảnh banner đã tồn tại hay chưa
     * @param bannerImage
     * @return 
     */
    public Boolean checkBannerImageExists(String bannerImage);
}
