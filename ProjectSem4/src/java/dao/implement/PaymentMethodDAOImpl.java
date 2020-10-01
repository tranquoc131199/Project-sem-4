/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.PaymentMethodDAO;
import entities.PaymentMethods;
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

    @Override
    public Integer countAllPaymentMethods() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            List list = session.createQuery("from PaymentMethods").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.PaymentMethodDAOImpl.countAllPaymentMethods()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public List<PaymentMethods> getAllPaymentMethodsForPaging(Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<PaymentMethods> paymentMethods = new ArrayList<>();

        try {
            Query query = session.createQuery("from PaymentMethods order by paymentMethodId desc");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            paymentMethods = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.PaymentMethodDAOImpl.getAllPaymentMethodsForPaging()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return paymentMethods;
    }

    @Override
    public Boolean checkPaymentMethodNameExists(String paymentMethodName) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from PaymentMethods where paymentMethodName = :paymentMethodName");
            query.setParameter("paymentMethodName", paymentMethodName);
            PaymentMethods paymentMethod = (PaymentMethods) query.uniqueResult();
            session.getTransaction().commit();

            if (paymentMethod != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.PaymentMethodDAOImpl.checkPaymentMethodNameExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean insertPaymentMethod(PaymentMethods paymentMethod) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            paymentMethod.setCreatedDate(new Date());
            paymentMethod.setUpdatedDate(new Date());
            session.save(paymentMethod);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.PaymentMethodDAOImpl.insertPaymentMethod()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean updatePaymentMethod(PaymentMethods paymentMethod) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            paymentMethod.setUpdatedDate(new Date());
            session.update(paymentMethod);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.PaymentMethodDAOImpl.updatePaymentMethod()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean disablePaymentMethod(Integer paymentMethodId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            PaymentMethods paymentMethod = getPaymentMethodById(paymentMethodId);
            paymentMethod.setPaymentMethodStatus(0);
            paymentMethod.setUpdatedDate(new Date());
            result = updatePaymentMethod(paymentMethod);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.PaymentMethodDAOImpl.disablePaymentMethod()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean enablePaymentMethod(Integer paymentMethodId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            PaymentMethods paymentMethod = getPaymentMethodById(paymentMethodId);
            paymentMethod.setPaymentMethodStatus(1);
            paymentMethod.setUpdatedDate(new Date());
            result = updatePaymentMethod(paymentMethod);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.PaymentMethodDAOImpl.enablePaymentMethod()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }
}
