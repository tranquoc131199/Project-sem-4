/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.LogoDAO;
import entities.Logoes;
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
 * @author QuanKoiNA
 */
public class LogoDAOImpl implements LogoDAO {

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
    public List<Logoes> getAllLogoes(Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Logoes> logoes = new ArrayList<>();
        
        try {
            logoes = session.createQuery("from Logoes order by logoId desc").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.LogoDAOImpl.getAllLogoes()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return logoes;
    }
    
    @Override
    public Integer countAllLogoes() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;
        
        try {
            List list = session.createQuery("from Logoes").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.LogoDAOImpl.countAllLogoes()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return count;
    }

    @Override
    public Logoes getLogoToDisplay() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Logoes logo = new Logoes();
        
        try {
            logo = (Logoes) session.createQuery("from Logoes where logoStatus = 1").uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.LogoDAOImpl.getLogoToDisplay()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return logo;
    }

    @Override
    public Boolean insertLogo(Logoes logo) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            disableAllLogo();
            session.save(logo);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.LogoDAOImpl.insertLogo()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean updateLogo(Logoes logo) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            session.update(logo);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.LogoDAOImpl.updateLogo()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Logoes getLogoById(Integer logoId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Logoes logo = new Logoes();
        
        try {
            Query query = session.createQuery("from Logoes where logoId = :logoId");
            query.setParameter("logoId", logoId);
            logo = (Logoes) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.LogoDAOImpl.getLogoById()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return logo;
    }

    @Override
    public Boolean disableLogo(Integer logoId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            Logoes logo = getLogoById(logoId);
            logo.setLogoStatus(0);
            logo.setUpdatedDate(new Date());
            updateLogo(logo);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.LogoDAOImpl.disableLogo()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean disableAllLogo() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            List<Logoes> logoes = session.createQuery("from Logoes").list();
            
            logoes.stream().map((logo) -> {
                logo.setLogoStatus(0);
                logo.setUpdatedDate(new Date());
                return logo;
            }).forEachOrdered((logo) -> {
                updateLogo(logo);
            });
            
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.LogoDAOImpl.disableAllLogo()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean enableLogo(Integer logoId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            disableAllLogo();
            Logoes logo = getLogoById(logoId);
            logo.setLogoStatus(1);
            logo.setUpdatedDate(new Date());
            updateLogo(logo);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.LogoDAOImpl.enableLogo()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }

    @Override
    public Boolean checkLogoImageExists(String logoImage) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        
        try {
            Query query = session.createQuery("from Logoes logoImage = :logoImage");
            query.setParameter("logoImage", logoImage);
            Logoes logo = (Logoes) query.uniqueResult();
            session.getTransaction().commit();
            
            if (logo != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.LogoDAOImpl.checkLogoImageExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return result;
    }
}
