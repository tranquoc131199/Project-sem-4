/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.OrderDAO;
import entities.Customers;
import entities.OrderDetails;
import entities.Orders;
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
 * @author Acer Nitro 5
 */
public class OrderDAOImpl implements OrderDAO {

    @Autowired
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

    @Override
    public Integer countAllOrders() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            List list = session.createQuery("from Orders").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public List<Orders> getAllOrdersForPaging(Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Orders> orders = new ArrayList<>();

        try {
            Query query = session.createQuery("from Orders order by orderId desc");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            orders = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return orders;
    }

    @Override
    public Integer countAllOrdersSearch(String orderCode) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            List list = session.createQuery("from Orders").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public List<Orders> searchOrders(String orderCode, Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Orders> orders = new ArrayList<>();

        try {
            Query query = session.createQuery("from Orders where orderCode like :orderCode order by orderId desc");
            query.setParameter("orderCode", "%" + orderCode + "%");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            orders = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.OrderDAOImpl.getAllOrdersForPaging()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return orders;
    }

    @Override
    public Orders getOrderById(Integer orderId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Orders order = new Orders();

        try {
            Query query = session.createQuery("from Orders where orderId = :orderId");
            query.setParameter("orderId", orderId);
            order = (Orders) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return order;
    }

    @Override
    public List<OrderDetails> getOrderDetailByOrderId(int orderId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            List<OrderDetails> listOrderDeatil = session.createQuery("from OrderDetails where orderId = :orderId").setParameter("orderId", orderId).list();
            if (listOrderDeatil == null) {
                return null;
            }
            session.getTransaction().commit();
            return listOrderDeatil;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.getMessage();
            return null;
        } finally {
            session.close();
        }
    }

    @Override
    public Boolean updateOrder(Integer orderId, Integer orderStatus) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Orders order = getOrderById(orderId);
            order.setOrderStatus(orderStatus);
            order.setUpdatedDate(new Date());
            session.update(order);
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
    public List<Orders> getAllOrdersByCustomerId(Integer customerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Orders> orders = new ArrayList<>();

        try {
            Customers c = (Customers) session.createQuery("from Customers where customerId = :customerId").setParameter("customerId", customerId).uniqueResult();
            Query query = session.createQuery("from Orders where customerId = :customerId order by orderId desc");
            query.setParameter("customerId", c);
            orders = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.OrderDAOImpl.getAllOrdersByCustomerId()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return orders;
    }
}
