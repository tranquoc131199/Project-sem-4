/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.FeedbackDAO;
import entities.FeedbackCatalogs;
import entities.Feedbacks;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 *
 * @author Thang Pham
 */
public class FeedbackDAOImpl implements FeedbackDAO {

    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<FeedbackCatalogs> getAllFeedbackCatalogs() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<FeedbackCatalogs> feedbackCatalogs = new ArrayList<>();
        
        try {
            feedbackCatalogs = session.createQuery("from FeedbackCatalogs").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.getAllFeedbackCatalogs()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return feedbackCatalogs;
    }

    @Override
    public List<FeedbackCatalogs> getAllFeedbackCatalogsFrontEnd() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<FeedbackCatalogs> feedbackCatalogs = new ArrayList<>();
        
        try {
            feedbackCatalogs = session.createQuery("from FeedbackCatalogs where feedbackCatalogStatus = 1").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.getAllFeedbackCatalogsFrontEnd()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return feedbackCatalogs;
    }

    @Override
    public Boolean insertFeedbackCatalog(FeedbackCatalogs feedbackCatalog) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            session.save(feedbackCatalog);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.insertFeedbackCatalog()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }
    
    @Override
    public Boolean updateFeedbackCatalog(FeedbackCatalogs feedbackCatalog) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            session.update(feedbackCatalog);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.updateFeedbackCatalog()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }
    
    @Override
    public FeedbackCatalogs getFeedbackCatalogById(Integer feedbackCatalogId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        FeedbackCatalogs feedbackCatalog = new FeedbackCatalogs();
        
        try {
            Query query = session.createQuery("from FeedbackCatalogs where feedbackCatalogId = :feedbackCatalogId");
            query.setParameter("feedbackCatalogId", feedbackCatalogId);
            feedbackCatalog = (FeedbackCatalogs) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.getFeedbackCatalogById()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return feedbackCatalog;
    }

    @Override
    public Boolean disableFeedbackCatalog(Integer feedbackCatalogId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            FeedbackCatalogs feedbackCatalog = getFeedbackCatalogById(feedbackCatalogId);
            feedbackCatalog.setFeedbackCatalogStatus(0);
            feedbackCatalog.setUpdatedDate(new Date());
            result = updateFeedbackCatalog(feedbackCatalog);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.disableFeedbackCatalog()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean enableFeedbackCatalog(Integer feedbackCatalogId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            FeedbackCatalogs feedbackCatalog = getFeedbackCatalogById(feedbackCatalogId);
            feedbackCatalog.setFeedbackCatalogStatus(1);
            feedbackCatalog.setUpdatedDate(new Date());
            result = updateFeedbackCatalog(feedbackCatalog);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.enableFeedbackCatalog()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean insertFeedback(Feedbacks feedback) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            session.save(feedback);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.insertFeedback()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }
    
    @Override
    public Boolean updateFeedback(Feedbacks feedback) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            session.update(feedback);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.updateFeedback()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public List<Feedbacks> getAllFeedbacks(Integer start, Integer limit, FeedbackCatalogs feedbackCatalog) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Query query;
        List<Feedbacks> feedbacks = new ArrayList<>();
        
        try {
            if (feedbackCatalog == null) {
                query = session.createQuery("from Feedbacks");
            } else {
                query = session.createQuery("from Feedbacks where feedbackCatalogId = :feedbackCatalog");
                query.setParameter("feedbackCatalog", feedbackCatalog);
            }
            
            feedbacks = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.getAllFeedbacks()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return feedbacks;
    }
    
    @Override
    public Integer countAllFeedback(FeedbackCatalogs feedbackCatalog) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;
        
        try {
            if (feedbackCatalog == null) {
                List list = session.createQuery("from Feedbacks").list();
                count = list.size();
            } else {
                List list = session.createQuery("from Feedbacks where feedbackCatalogId = :feedbackCatalog").setParameter("feedbackCatalog", feedbackCatalog).list();
                count = list.size();
            }
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.countAllFeedback()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return count;
    }

    @Override
    public Feedbacks getFeedbackById(Integer feedbackId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Feedbacks feedback = new Feedbacks();
        
        try {
            Query query = session.createQuery("from Feedbacks where feedbackId = :feedbackId");
            query.setParameter("feedbackId", feedbackId);
            feedback = (Feedbacks) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.getFeedbackById()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return feedback;
    }

    @Override
    public Boolean setReadFeedback(Integer feedbackId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            Feedbacks feedback = getFeedbackById(feedbackId);
            feedback.setFeedbackStatus(1);
            result = updateFeedback(feedback);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.setReadFeedback()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean deleteFeedback(Integer feedbackId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            Query query = session.createQuery("delete from Feedbacks where feedbackId = :feedbackId");
            query.setParameter("feedbackId", feedbackId);
            int i = query.executeUpdate();
            session.getTransaction().commit();
            
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.deleteFeedback()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Integer countFeedbackForDisplayOnDashboard() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;
        
        try {
            Query query = session.createQuery("select count(feedbackId) from Feedbacks where feedbackStatus = 0");
            count = (Integer) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.countFeedbackForDisplayOnDashboard()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return count;
    }

    @Override
    public Boolean checkFeedbackCatalogNameExists(String feedbackCatalogName) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            Query query = session.createQuery("from Feedbacks where feedbackCatalogName = :feedbackCatalogName");
            query.setParameter("feedbackCatalogName", feedbackCatalogName);
            FeedbackCatalogs feedbackCatalog = (FeedbackCatalogs) query.uniqueResult();
            session.getTransaction().commit();
            
            if (feedbackCatalog != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.FeedbackDAOImpl.checkFeedbackCatalogNameExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }
}
