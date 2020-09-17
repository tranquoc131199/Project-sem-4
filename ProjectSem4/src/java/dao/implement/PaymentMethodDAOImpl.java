/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.PaymentMethodDAO;
import entities.PaymentMethods;
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
public class PaymentMethodDAOImpl implements PaymentMethodDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<PaymentMethods> getAllPaymentMethodsClient() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<PaymentMethods> paymentMethods = new ArrayList<>();

        try {
            paymentMethods = session.createQuery("from PaymentMethods where paymentMethodStatus = 1").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return paymentMethods;
    }
    
    @Override
    public PaymentMethods getPaymentMethodById(Integer paymentMethodId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        PaymentMethods paymentMethod = new PaymentMethods();
        
        try {
            Query query = session.createQuery("from PaymentMethods where paymentMethodId = :paymentMethodId");
            query.setParameter("paymentMethodId", paymentMethodId);
            paymentMethod = (PaymentMethods) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return paymentMethod;
    }
}
