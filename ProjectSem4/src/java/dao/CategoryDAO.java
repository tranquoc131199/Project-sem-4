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
     *
     * @param categoryId
     * @return
     */
    public Categories getCategoryById(Integer categoryId);

    /**
     * update danh mục sản phẩm theo
     *
     * @param category
     * @return
     */
    public Boolean updateCategory(Categories category);

    /**
     * disable Category theo categoryId sau khi disable Category sẽ khóa luôn
     * danh mục con của nó(nếu có) disableChildCategory. và khóa luôn sản phẩm
     * có liên quan đến danh mục con hoặc danh mục cha disableProductByCategory.
     *
     * @param categoryId
     * @return
     */
    public Boolean disableCategory(Integer categoryId);

    /**
     * disable danh mục con theo parentId
     *
     * @param categoryId
     * @return
     */
    public Boolean disableChildCategory(Integer parentId);

    /**
     * disable sản phẩm thêm danh mục sản phẩm
     *
     * @param categoryId
     * @return
     */
    public Boolean disableProductByCategory(Integer categoryId);

    /**
     * Mở khoá danh mục sản phẩm theo categoryId
     *
     * @param categoryId
     * @return
     */
    public Boolean enableCategory(Integer categoryId);

    /**
     * Mở khoá tất cả các danh mục theo danh mục cha
     *
     * @param parentId
     * @return
     */
    public Boolean enableAllCategory(Integer parentId);

    /**
     * Mở khoá tất cả các sản phẩm thuộc danh mục nào đó
     *
     * @param categoryId
     * @return
     */
    public Boolean enableAllProducty(Integer categoryId);

    /**
     * Lấy tất cả các danh mục cha có CategoryStatus = 1 Sắp xếp CategoryPiority
     * theo thứ tự tăng dần để hiển thị ngoài front-end
     *
     * @return
     */
    public List<Categories> getParentCategories();

    /**
     * Kiểm tra có phải danh mục cha không
     *
     * @param categoryId
     * @return
     */
    public Boolean isParentCategory(Integer categoryId);

    /**
     * lấy danh sách danh mục con theo danh mục cha
     *
     * @param parentId
     * @return
     */
    public List<Categories> getChildrenCategoriesByParentId(Integer parentId);

    /**
     * lấy thông tin của category partern để hiển thị lên thanh Navbar
     *
     * @param parentId
     * @return
     */
    public String generateNavbar();

}
