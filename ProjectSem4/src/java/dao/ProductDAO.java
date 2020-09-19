/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import common.FilterProduct;
import entities.Brands;
import entities.Categories;
import entities.ProductComments;
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

    /**
     * Lấy ra 4 sản phẩm có ngày tạo mới nhất để hiển thị lên màn hình
     *
     * @return
     */
    public List<Products> getFourNewProduct();

    /**
     * Đếm số lượng bản ghi để phân trang
     *
     * @param brandId
     * @param categoryId
     * @param productName
     * @return
     */
    public Integer countProductFilterForPaging(Brands brandId, Categories categoryId, String productName);

    /**
     * Lọc sản phẩm theo các thông số Thông số nào không có thì null hoặc empty
     * tương ứng (phương thức này cần xem xét lại xem có thực sự cần thiết hay
     * không? Vì sản phẩm khi ngừng kinh doanh vẫn có thể được tìm kiếm) (cần
     * trao đổi lại đoạn này)
     *
     * @param start
     * @param limit
     * @param brand
     * @param category
     * @param productName
     * @param sort
     * @return
     */
    public FilterProduct filterProductsForClient(Integer start, Integer limit, Brands brandId, Categories categoryId, String productName, Integer sort);

    /**
     * Lọc sản phẩm theo các thông số Thông số nào không có thì null hoặc empty
     * tương ứng
     *
     * @param start
     * @param limit
     * @param productName
     * @param brand
     * @param category
     * @return
     */
    public FilterProduct filterProductsForAdmin(Integer start, Integer limit, String productName, Brands brand, Categories category);

    /**
     * Lấy danh sách tất cả các hãng sản xuất - Brands
     *
     * @return
     */
    public List<Brands> getAllBrandsForClient();

    /**
     * Lấy tất cả các danh mục cha có CategoryStatus = 1 Sắp xếp theo
     * CategoryPiority tăng dần để hiển thị ngoài front-end
     *
     * @return
     */
    public List<Categories> getAllParentCategoriesForClient();

    /**
     * Lấy danh sách tất cả các Categories con có CategoryStatus = 1 Sắp xếp
     * theo CategoryPiority tăng dần để hiển thị ngoài front-end
     *
     * @param parentId
     * @return
     */
    public List<Categories> getChildrenCategoriesByParentIdForClient(Integer parentId);

    /**
     * Lấy ra danh sách 4 sản phẩm có liên quan để hiển thị phía dưới trang chi
     * tiết sản phẩm ở bên ngoài
     *
     * @param productId
     * @return
     */
    public List<Products> getFourProductRelated(Integer productId);

    /**
     * Lấy tất cả bình luận của 1 sản phẩm
     *
     * @param productId
     * @return
     */
    public List<ProductComments> getAllCommentsOfProductById(Integer productId);

    /**
     * them binh luan cho san pham
     *
     *
     * @param productComment
     * @return
     */
    public Boolean commentProduct(ProductComments productComment);

}
