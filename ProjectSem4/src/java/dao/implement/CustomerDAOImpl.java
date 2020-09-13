/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.CustomerDAO;
import entities.Customers;
import entities.Wishlists;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Acer Nitro 5
 */
public class CustomerDAOImpl implements CustomerDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Customers checkCustomerLogin(String customerEmail, String customerPassword) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Customers customer = new Customers();
        try {
            customer = (Customers) session.createQuery("from Customers where customerEmail = :customerEmail").setParameter("customerEmail", customerEmail).uniqueResult();
            if (customer != null && customer.getCustomerPassword().equals(customerPassword)) {
                session.getTransaction().commit();
                return customer;
            }
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.getMessage();
            return null;
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Customers getCustomerById(Integer customerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Customers customer = new Customers();

        try {
            Query query = session.createQuery("from Customers where customerId = :customerId");
            query.setParameter("customerId", customerId);
            customer = (Customers) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return customer;
    }

    @Override
    public List<Wishlists> getWishlistsByCustomerId(Integer customerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Wishlists> wishlists = new ArrayList<>();
        try {
            Query query = session.createQuery("from Wishlists where customerId = :customerId order by wishlistId desc");
            Customers customer = getCustomerById(customerId);
            query.setParameter("customerId", customer);
            wishlists = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return wishlists;
    }

}
