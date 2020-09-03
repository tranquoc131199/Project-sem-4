/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.ProductImages;
import entities.Products;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public interface ProductDAO {

    /**
     * hiển thị tất cả sản phẩm
     *
     * @param product
     * @return
     */
    public List<Products> getAllProducts();

    /**
     * Thêm mới sản phẩm, 
     *
     * @param product
     * @return
     */
    public Boolean insertProduct(Products product);
    
    /**
     * Thêm mới hình ảnh sản phẩm 
     *
     * @param ProductImages
     * @return
     */
    public Boolean insertProductImage(ProductImages productImage);
    
//    /**
//     * Thêm mới 
//     *
//     * @param ProductImages
//     * @return
//     */
//    public Boolean insertProductImage(ProductImages productImage);

}
