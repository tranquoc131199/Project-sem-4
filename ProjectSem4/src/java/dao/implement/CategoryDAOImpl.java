/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.CategoryDAO;
import entities.Categories;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Acer Nitro 5
 */
public class CategoryDAOImpl implements CategoryDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Categories> getAllCategory() {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            List listCategory = session.createQuery("from Categories").list();
            session.getTransaction().commit();
            return listCategory;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Boolean insertCategory(Categories category) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        try {
            session.save(category);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public Integer getMaxCategoryPiority() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer max = 0;
        try {
            Query query = session.createQuery("select max(categoryPiority) from Categories");
            max = (Integer) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return max;
    }

    @Override
    public Boolean checkCategoryNameExists(String categoryName) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            Query query = session.createQuery("from Categories where categoryName = :categoryName");
            query.setParameter("categoryName", categoryName);
            Categories categories = (Categories) query.uniqueResult();
            session.getTransaction().commit();
            if (categories != null) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public Categories getCategoryById(Integer categoryId) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        Categories categories = new Categories();
        try {
            Query query = session.createQuery("from Categories where categoryId = :categoryId");
            query.setParameter("categoryId", categoryId);
            categories = (Categories) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return categories;
    }

}
