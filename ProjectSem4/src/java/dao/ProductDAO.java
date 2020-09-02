/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Products;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public interface ProductDAO {

    /**
     * hiển thị tất cả danh mục sản phẩm
     *
     * @param product
     * @return
     */
    public List<Products> getAllProducts();

}
