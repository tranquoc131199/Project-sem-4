/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.CategoryDAO;
import entities.Categories;
import java.util.List;
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
        }finally{
            session.close();
        }
        return null;       
    }
    
    @Override
    public Boolean insertCategory(Categories category) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            session.save(category);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }finally{
            session.close();
        }
        return false;

    }

    

}
