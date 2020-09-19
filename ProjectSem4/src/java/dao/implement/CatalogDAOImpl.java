/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.CatalogDAO;
import entities.Catalogs;
import entities.News;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Acer Nitro 5
 */
public class CatalogDAOImpl implements CatalogDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Catalogs> getAllCatalogs() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Catalogs> catalogs = new ArrayList<>();

        try {
            Query query = session.createQuery("from Catalogs");
            catalogs = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return catalogs;
    }

    @Override
    public Boolean insertCatalog(Catalogs catalog) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.save(catalog);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean updateCatalog(Catalogs catalog) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.update(catalog);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Catalogs getCatalogById(Integer catalogId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Catalogs catalog = new Catalogs();

        try {
            Query query = session.createQuery("from Catalogs where catalogId = :catalogId");
            query.setParameter("catalogId", catalogId);
            catalog = (Catalogs) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return catalog;
    }

    @Override
    public Boolean disableCatalog(Integer catalogId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Catalogs catalog = getCatalogById(catalogId);
            catalog.setCatalogStatus(0);
            catalog.setUpdatedDate(new Date());
            result = updateCatalog(catalog);
            disableChildCatalogByParentId(catalogId);
            disableAllNewByCatalogId(catalogId);
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
    public Integer getMaxCatalogPiority() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer max = 0;

        try {
            Query query = session.createQuery("select max(catalogPiority) from Catalogs");
            max = (Integer) query.uniqueResult();
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
    public Boolean disableChildCatalogByParentId(Integer parentId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Catalogs where parentId = :parentId");
            query.setParameter("parentId", parentId);
            List<Catalogs> childCatalogs = query.list();

            childCatalogs.forEach((c) -> {
                c.setCatalogStatus(0);
                c.setUpdatedDate(new Date());
                session.update(c);
            });

            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean disableAllNewByCatalogId(Integer catalogId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<News> news = new ArrayList<>();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Catalogs where catalogId = :catalogId");
            query.setParameter("catalogId", catalogId);
            List<Catalogs> childCatalogs = query.list();

            for (Catalogs c : childCatalogs) {
                query = session.createQuery("from News where catalogId = :catalogId");
                query.setParameter("catalogId", c.getCatalogId());
                List<News> newsFirst = query.list();
                news.addAll(newsFirst);
            }

            news.forEach((n) -> {
                n.setNewStatus(0);
                n.setUpdatedDate(new Date());
                session.update(n);
            });

            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }
}
