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
    
    public Brands getBrandById(int id);
}
