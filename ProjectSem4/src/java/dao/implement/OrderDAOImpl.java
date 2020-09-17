/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.OrderDAO;
import entities.OrderDetails;
import entities.Orders;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 *
 * @author Acer Nitro 5
 */
public class OrderDAOImpl implements OrderDAO {

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
    public Boolean insertOrder(Orders order) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.save(order);
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
    public Boolean insertOrderDetail(OrderDetails orderDetail) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.save(orderDetail);
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
