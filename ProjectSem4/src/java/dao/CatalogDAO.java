/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Catalogs;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public interface CatalogDAO {

    /**
     * Lấy tất cả các bản ghi danh mục tin tức (trang quản trị)
     *
     * @return
     */
    public List<Catalogs> getAllCatalogs();

    /**
     * Thêm mới danh mục tin tức
     *
     * @param catalog
     * @return
     */
    public Boolean insertCatalog(Catalogs catalog);

    /**
     * Cập nhật danh mục tin tức
     *
     * @param catalog
     * @return
     */
    public Boolean updateCatalog(Catalogs catalog);

    /**
     * Lấy catalog theo mã
     *
     * @param catalogId
     * @return
     */
    public Catalogs getCatalogById(Integer catalogId);

    /**
     * Khoá danh mục tin tức theo mã Sau khi khoá, khoá luôn tất cả các danh mục
     * con của nó
     *
     * @param catalogId
     * @return
     */
    public Boolean disableCatalog(Integer catalogId);

    /**
     * lấy ra độ ưu tiên lớn nhất để + 1 cho thêm mới
     *
     * @return
     */
    public Integer getMaxCatalogPiority();
    
    /**
     * Khoá tất cả các danh mục tin tức con của 1 danh mục tin tức cha
     * @param parentId
     * @return 
     */
    public Boolean disableChildCatalogByParentId(Integer parentId);
    
    /**
     * Khoá tất cả các bài viết thuộc 1 danh mục
     * @param catalogId
     * @return 
     */
    public Boolean disableAllNewByCatalogId(Integer catalogId);
}