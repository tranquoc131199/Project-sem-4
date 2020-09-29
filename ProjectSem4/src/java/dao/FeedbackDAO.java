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
 * @author Thang Pham
 */
public interface FeedbackDAO {
    
    public List<FeedbackCatalogs> getAllFeedbackCatalogs();
    
    public List<FeedbackCatalogs> getAllFeedbackCatalogsFrontEnd();
    
    public Boolean insertFeedbackCatalog(FeedbackCatalogs feedbackCatalog);
    
    public Boolean updateFeedbackCatalog(FeedbackCatalogs feedbackCatalog);
    
    public FeedbackCatalogs getFeedbackCatalogById(Integer feedbackCatalogId);
    
    public Boolean disableFeedbackCatalog(Integer feedbackCatalogId);
    
    public Boolean enableFeedbackCatalog(Integer feedbackCatalogId);
    
    public Boolean insertFeedback(Feedbacks feedback);
    
    public Boolean updateFeedback(Feedbacks feedback);
    
    public List<Feedbacks> getAllFeedbacks(Integer start, Integer limit, FeedbackCatalogs feedbackCatalog);
    
    public Integer countAllFeedback(FeedbackCatalogs feedbackCatalog);

    public Feedbacks getFeedbackById(Integer feedbackId);
    
    public Boolean setReadFeedback(Integer feedbackId);
    
    public Boolean deleteFeedback(Integer feedbackId);
    
    public long countFeedbackForDisplayOnDashboard();
    
    public Boolean checkFeedbackCatalogNameExists(String feedbackCatalogName);
}
