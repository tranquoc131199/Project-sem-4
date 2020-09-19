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
    
    public List<Banners> getAllBanners(Integer start, Integer limit);
    
    public Integer countAllBanners();
    
    public Integer getMaxBannerPiority();
    
    public List<Banners> getAllBannersFrontEnd();
    
    public Banners getBannerById(Integer bannerId);
    
    public Boolean insertBanner(Banners banner);
    
    public Boolean updateBanner(Banners banner);
    
    public Boolean disableBanner(Integer bannerId);
    
    public Boolean enableBanner(Integer bannerId);
    
    public Boolean checkBannerImageExists(String bannerImage);
}
