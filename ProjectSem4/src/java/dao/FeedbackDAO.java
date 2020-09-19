/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.FeedbackCatalogs;
import entities.Feedbacks;
import java.util.List;

/**
 *
 * @author QuanKoiNA
 */
public interface FeedbackDAO {
    
    /**
     * Lấy tất cả các danh mục phản hồi (trang quản trị)
     * @return 
     */
    public List<FeedbackCatalogs> getAllFeedbackCatalogs();
    
    /**
     * Lấy tất cả các danh mục phản hồi có FeedbackCatalogStatus = 1 (front-end) để người dùng lựa chọn khi gửi phản hồi
     * @return 
     */
    public List<FeedbackCatalogs> getAllFeedbackCatalogsFrontEnd();
    
    /**
     * Thêm mới danh mục phản hồi
     * @param feedbackCatalog
     * @return 
     */
    public Boolean insertFeedbackCatalog(FeedbackCatalogs feedbackCatalog);
    
    /**
     * Cập nhật danh mục phản hồi
     * @param feedbackCatalog
     * @return 
     */
    public Boolean updateFeedbackCatalog(FeedbackCatalogs feedbackCatalog);
    
    /**
     * Lấy danh mục phản hồi theo mã
     * @param feedbackCatalogId
     * @return 
     */
    public FeedbackCatalogs getFeedbackCatalogById(Integer feedbackCatalogId);
    
    /**
     * Khoá danh mục phản hồi theo mã
     * @param feedbackCatalogId
     * @return 
     */
    public Boolean disableFeedbackCatalog(Integer feedbackCatalogId);
    
    /**
     * Mở khoá danh mục phản hồi theo mã
     * @param feedbackCatalogId
     * @return 
     */
    public Boolean enableFeedbackCatalog(Integer feedbackCatalogId);
    
    /**
     * Thêm mới (viết) Feedback
     * Cái này là do người dùng viết (front-end)
     * @param feedback
     * @return 
     */
    public Boolean insertFeedback(Feedbacks feedback);
    
    /**
     * Cập nhật phản hồi
     * @param feedback
     * @return 
     */
    public Boolean updateFeedback(Feedbacks feedback);
    
    /**
     * Lấy ra danh sách tất cả các Feedbacks (trang quản trị)
     * @param start
     * @param limit
     * @param feedbackCatalog
     * @return 
     */
    public List<Feedbacks> getAllFeedbacks(Integer start, Integer limit, FeedbackCatalogs feedbackCatalog);
    
    /**
     * Đếm số lượng bản ghi Feedbacks để phân trang
     * @param feedbackCatalog
     * @return 
     */
    public Integer countAllFeedback(FeedbackCatalogs feedbackCatalog);
    
    /**
     * Lấy ra 1 bản ghi Feedback để đọc (trang quản trị)
     * @param feedbackId
     * @return 
     */
    public Feedbacks getFeedbackById(Integer feedbackId);
    
    /**
     * Đặt trạng thái cho Feedback là đã đọc sau khi click vào xem Feedback
     * @param feedbackId
     * @return 
     */
    public Boolean setReadFeedback(Integer feedbackId);
    
    /**
     * Xoá Feedback
     * Cái này có thể làm xoá cứng
     * @param feedbackId
     * @return 
     */
    public Boolean deleteFeedback(Integer feedbackId);
    
    /**
     * Đếm số lượng phản hồi có FeedbackStatus = 0 (số phản hồi chưa đọc) để hiển thị ngoài bảng điều khiển
     * @return 
     */
    public Integer countFeedbackForDisplayOnDashboard();
    
    /**
     * Kiểm tra tên danh mục phản hồi đã tồn tại trong hệ thống hay chưa
     * @param feedbackCatalogName
     * @return 
     */
    public Boolean checkFeedbackCatalogNameExists(String feedbackCatalogName);
}
