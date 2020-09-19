/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.BannerDAO;
import entities.Banners;
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
public class BannerDAOImpl implements BannerDAO {

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
    public List<Banners> getAllBanners(Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Banners> banners = new ArrayList<>();
        
        try {
            banners = session.createQuery("from Banners order by bannerId desc").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.BannerDAOImpl.getAllBanners()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return banners;
    }
    
    @Override
    public Integer countAllBanners() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;
        
        try {
            List list = session.createQuery("from Banners").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.BannerDAOImpl.countAllBanners()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return count;
    }
    
    @Override
    public Integer getMaxBannerPiority() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer max = 0;
        
        try {
            max = (Integer) session.createQuery("select max(bannerPiority) from Banners").uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.BannerDAOImpl.getMaxBannerPiority()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return max;
    }

    @Override
    public List<Banners> getAllBannersFrontEnd() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Banners> banners = new ArrayList<>();
        
        try {
            banners = session.createQuery("from Banners where bannerStatus = 1 order by bannerPiority").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.BannerDAOImpl.getAllBannersFrontEnd()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return banners;
    }

    @Override
    public Banners getBannerById(Integer bannerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Banners banner = new Banners();
        
        try {
            Query query = session.createQuery("from Banners where bannerId = :bannerId");
            query.setParameter("bannerId", bannerId);
            banner = (Banners) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.BannerDAOImpl.getBannerById()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return banner;
    }

    @Override
    public Boolean insertBanner(Banners banner) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            session.save(banner);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.BannerDAOImpl.insertBanner()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean updateBanner(Banners banner) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            session.update(banner);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.BannerDAOImpl.updateBanner()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean disableBanner(Integer bannerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            Banners banner = getBannerById(bannerId);
            banner.setBannerStatus(0);
            banner.setUpdatedDate(new Date());
            result = updateBanner(banner);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.BannerDAOImpl.disableBanner()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean enableBanner(Integer bannerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            Banners banner = getBannerById(bannerId);
            banner.setBannerStatus(1);
            banner.setUpdatedDate(new Date());
            result = updateBanner(banner);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.BannerDAOImpl.enableBanner()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean checkBannerImageExists(String bannerImage) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            Query query = session.createQuery("from Banners where bannerImage = :bannerImage");
            query.setParameter("bannerImage", bannerImage);
            Banners banner = (Banners) query.uniqueResult();
            session.getTransaction().commit();
            
            if (banner != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.BannerDAOImpl.checkBannerImageExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }
}
