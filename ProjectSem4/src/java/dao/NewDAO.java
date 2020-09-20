/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Catalogs;
import entities.Customers;
import entities.News;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public interface NewDAO {

    /**
     * Lấy danh sách tất cả các tin tức (trang quản trị)
     *
     * @param start
     * @param limit
     * @return
     */
    public List<News> getAllNews(Integer start, Integer limit);

    /**
     * Lấy tất cả các bản ghi danh mục tin tức con của danh mục cha có mã truyền
     * vào với CatalogStatus = 1 để hiển thị ngoài front-end
     *
     * @param parentId
     * @return
     */
    public List<Catalogs> getAllChildrenCatalogsByParentIdFrontEnd(Integer parentId);

    /**
     * Đếm tổng số bản ghi tin tức để phân trang trong backend
     *
     * @return
     */
    public Integer countAllNews();

    /**
     * Lấy catalog theo mã
     *
     * @param catalogId
     * @return
     */
    public Catalogs getCatalogById(Integer catalogId);

    /**
     * Lấy danh sách tất cả các tin tức theo mã danh mục tin tức (trang quản
     * trị)
     *
     * @param catalogId
     * @param start
     * @param limit
     * @return
     */
    public List<News> getAllNewsByCatalogId(Integer catalogId, Integer start, Integer limit);

    /**
     * Đếm tổng số bản ghi tin tức theo mã danh mục để hiển thị trong backend
     *
     * @param catalogId
     * @return
     */
    public Integer countAllNewsByCatalogId(Integer catalogId);

    /**
     * Lấy danh sách tất cả các tin tức để hiển thị ngoài front-end
     *
     * @param start
     * @param limit
     * @return
     */
    public List<News> getAllNewsFrontEnd(Integer start, Integer limit);

    /**
     * Lấy danh sách 5 bản ghi tin tức có liên quan
     *
     * @param newId
     * @return
     */
    public List<News> getFiveRelatedNew(Integer newId);

    /**
     * Đếm tất cả số bản ghi tin tức để hiển thị ngoài front-end
     *
     * @return
     */
    public Integer countAllNewsFrontEnd();

    /**
     * Lấy danh sách tất cả các tin tức để hiển thị ngoài front-end theo mã danh
     * mục tin tức
     *
     * @param catalogId
     * @param start
     * @param limit
     * @return
     */
    public List<News> getAllNewsByCatalogIdFrontEnd(Integer catalogId, Integer start, Integer limit);

    /**
     * Đếm tất cả số bản ghi theo danh mục để hiển thị ngoài front-end
     *
     * @param catalogId
     * @return
     */
    public Integer countAllNewsByCatalogIdFrontEnd(Integer catalogId);

    /**
     * Thêm mới tin tức
     *
     * @param news
     * @return
     */
    public Boolean insertNew(News news);

    /**
     * Cập nhật tin tức
     *
     * @param news
     * @return
     */
    public Boolean updateNew(News news);

    /**
     * Lấy tin tức theo mã
     *
     * @param newId
     * @return
     */
    public News getNewById(Integer newId);

    /**
     * Khoá tin tức theo mã
     *
     * @param newId
     * @return
     */
    public Boolean disableNew(Integer newId);

    /**
     * Mở khoá tin tức theo mã
     *
     * @param newId
     * @return
     */
    public Boolean enableNew(Integer newId);  

    /**
     * Kiểm tra tiêu đề bài viết đã tồn tại hay chưa
     *
     * @param newTitle
     * @return
     */
    public Boolean checkNewTitleExists(String newTitle);


    /**
     * Lấy danh sách 6 tin bài mới nhất
     *
     * @return
     */
    public List<News> getSixNewest();

    /**
     * Lấy tin bài mới nhất
     *
     * @return
     */
    public News getNewest();
    
    /**
     * tạo nvarbar tin tức
     *
     * @return
     */
    public String generateNewsHtml();
    
        /**
     * Lấy tất cả các bản ghi danh mục tin tức cha có CatalogStatus = 1 để hiển
     * thị ngoài front-end
     *
     * @return
     */
    public List<Catalogs> getAllParentCatalogsFrontEnd();



}
