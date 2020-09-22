/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.BrandDAO;
import entities.Brands;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUpgradeHandler;
import javax.servlet.http.Part;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Thang Pham
 */
public class BrandDAOImpl implements BrandDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Brands> getAllBrand() {
        Session session = sessionFactory.openSession();
        List<Brands> listBrand = new ArrayList<>();
        try {
            session.beginTransaction();
            listBrand = session.createQuery("from Brands").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return listBrand;
    }

    @Override
    public boolean deleteBrand(int id) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        boolean result = false;
        try {
            Brands brand = (Brands) session.load(Brands.class, new Integer(id));
            if (brand != null) {
                session.delete(brand);
                session.getTransaction().commit();
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            result = false;
        }
        return result;
    }

    @Override
    public boolean insertBrand(Brands brand) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        boolean result = false;
        try {
            session.save(brand);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            result = false;
        }
        return result;
    }

    @Override
    public boolean updateBrand(Brands brand) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            Date date = new Date();
            brand.setUpdatedDate(date);
            session.update(brand);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public Brands getBrandById(int brandId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Brands brand = new Brands();

        try {
            Query query = session.createQuery("from Brands where brandId = :brandId");
            query.setParameter("brandId", brandId);
            brand = (Brands) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return brand;
    }

    @Override
    public Boolean checkBrandNameExists(String brandName) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Banners where brandName = :brandName");
            query.setParameter("brandName", brandName);
            Brands brand = (Brands) query.uniqueResult();
            session.getTransaction().commit();

            if (brand != null) {
                result = true;
            }
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Integer getMaxPiority() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer max = 0;

        try {
            max = (Integer) session.createQuery("select max(brandPiority) from Brands").uniqueResult();

            if (max == null || max <= 0) {
                max = 0;
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return max;
    }

    @Override
    public Boolean disableBrand(Integer brandId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            Brands brand = getBrandById(brandId);
            brand.setBrandStatus(0);
            brand.setUpdatedDate(new Date());
            result = updateBrand(brand);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean enableBrand(Integer brandId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            Brands brand = getBrandById(brandId);
            brand.setBrandStatus(1);
            brand.setUpdatedDate(new Date());
            result = updateBrand(brand);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }
    
}
