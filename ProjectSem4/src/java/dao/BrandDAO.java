/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Brands;
import java.util.List;

/**
 *
 * @author Thang Pham
 */
public interface BrandDAO {

    public List<Brands> getAllBrand();

    public boolean insertBrand(Brands brand);

    public boolean updateBrand(Brands brand);

    public boolean deleteBrand(int id);

    public Brands getBrandById(int brandId);

    /**
     * Kiểm tra tên hãng đã tồn tại trong hệ thống hay chưa
     *
     * @param brandName
     * @return
     */
    public Boolean checkBrandNameExists(String brandName);
    
    /**lấy ra độ ưu tiên cao nhất
     * 
     * @return 
     */
    public Integer getMaxPiority();
    
    /**
     * Khoá thương hiệu theo mã
     * @param brandId
     * @return 
     */
    public Boolean disableBrand(Integer brandId);
    
    /**
     * Mở khoá thương hiệu theo mã
     * @param brandId
     * @return 
     */
    public Boolean enableBrand(Integer brandId);
}
