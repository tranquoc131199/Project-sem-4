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
     * hiển thị tất cả danh mục sản phẩm
     *
     * @param category
     * @return
     */
    public List<Categories> getAllCategory();

    /**
     * Lấy giá trị lớn nhất của độ ưu tiên
     *
     * @return
     */
    public Integer getMaxCategoryPiority();

    /**
     * Thêm mới danh mục sản phẩm
     *
     * @param category
     * @return
     */
    public Boolean insertCategory(Categories category);

    /**
     * kiểm tra tên danh mục đã tồn tại hay chưa
     *
     * @param categoryName
     * @return
     */
    public Boolean checkCategoryNameExists(String categoryName);
    
        /**
     * lấy danh mục sản phẩm theo categoryId
     * @param categoryId
     * @return 
     */
    public Categories getCategoryById(Integer categoryId);

}
