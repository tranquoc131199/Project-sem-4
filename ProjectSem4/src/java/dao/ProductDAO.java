/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Brands;
import entities.ProductImages;
import entities.Products;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public interface ProductDAO {

    /**
     * hiển thị tất cả brand để tạm trong này sẽ phải xóa đi vì thắng đang làm
     *
     * @param Brands
     * @return
     */
    public List<Brands> getAllBrands();

    /**
     * Lấy brand theo ID
     *
     * @param BrandId
     * @return
     */
    public Brands getBrandById(Integer brandId);

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
     * check tên sản phẩm đã tồn tại chưa,
     *
     * @param productName
     * @return
     */
    public Boolean checkProductNameExists(String productName);

    /**
     * Update sản phẩm theo ID
     *
     * @param product
     * @return
     */
    public Boolean updateProduct(Products product);

    /**
     * get sản phẩm theo ID
     *
     * @param productId
     * @return
     */
    public Products getProductById(Integer productId);

    /**
     * Thêm mới hình ảnh sản phẩm
     *
     * @param productImage
     * @return
     */
    public Boolean insertProductImage(ProductImages productImage);

    /**
     * Khoá sản phẩm theo mã
     *
     * @param productId
     * @return
     */
    public Boolean disableProduct(Integer productId);

    /**
     * Mở khoá sản phẩm theo mã
     *
     * @param productId
     * @return
     */
    public Boolean enableProduct(Integer productId);

    /**
     * Lấy list hình ảnh của sản phẩm
     *
     * @param productId
     * @return
     */
    public List<ProductImages> getAllImagesByProductId(Integer productId);

    /**
     * Lấy 1 sản phẩm bán chạy nhất
     *
     * @return
     */
    public Products getBestSellProduct();

    /**
     * Lấy danh sách 12 sản phẩm bán nhiều nhất
     *
     * @return
     */
    public List<Products> getTopTwelveBestSellForProducts();

    /**
     * Lấy 1 sản phẩm giảm giá nhiều nhất
     *
     * @return
     */
    public Products getBestSaleProduct();

    /**
     * Lấy danh sách 12 sản phẩm giảm giá nhiều nhất
     *
     * @return
     */
    public List<Products> getTopTwelveBestSaleForProducts();

    /**
     * kiểm tra sản phẩm có phải là sản phẩm mới không
     *
     * @return
     */
    public Boolean checkNewProduct(Integer productId);

}
