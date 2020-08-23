/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Categories;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public interface CategoryDAO {
    
    /**
     * Thêm mới danh mục sản phẩm
     * @param category
     * @return 
     */
    public Boolean insertCategory(Categories category);
    
     /**
     * hiển thị tất cả danh mục sản phẩm
     * @param category
     * @return 
     */
    public List<Categories> getAllCategory();
    
    
    
    
}
