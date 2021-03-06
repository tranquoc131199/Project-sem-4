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
    public List<OrderDetails> getOrderDetailByOrderId(Integer orderId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            List<OrderDetails> listOrderDeatil = session.createQuery("from OrderDetails where OrderId = :OrderId").setParameter("OrderId", orderId).list();
//            List<OrderDetails> listOrderDeatil = session.createSQLQuery("select * from OrderDetails where OrderId = ?").setParameter("orderId", orderId).list();
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

    @Override
    public long countOrderForDisplayOnDashboard() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        long count = 0;

        try {
            Query query = session.createQuery("select count(orderId) from Orders where orderStatus = 1");
            count = (long) query.uniqueResult();
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
    public Double sumRevenueForDisplayOnDashboard() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Double revenue = 0d;

        try {
            Query query = session.createQuery("from Orders where orderStatus = 1");
            List<Orders> orders = query.list();
            List<OrderDetails> orderDetails = new ArrayList<>();

            long DAY_IN_MS = 1000 * 60 * 60 * 24;
            Date date = new Date(System.currentTimeMillis() - (7 * DAY_IN_MS));

            for (Orders o : orders) {
                query = session.createQuery("from OrderDetails where OrderId = :OrderId and createdDate >= :createdDate");
                query.setParameter("OrderId", o.getOrderId());
                query.setParameter("createdDate", date);
                orderDetails.addAll(query.list());
            }

            revenue = orderDetails.stream().map((od) -> (od.getOrderDetailQuantity() * od.getOrderDetailPrice() * (100 - od.getOrderDetailSale()) / 100)).reduce(revenue, (accumulator, _item) -> accumulator + _item);

            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return revenue;
    }

    @Override
    public List<Orders> getTopTenOrderToDisplayOnDashboard() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Orders> orders = new ArrayList<>();

        try {
            Query query = session.createQuery("from Orders where orderStatus = 4 order by orderId desc");
            query.setMaxResults(10);
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
    public List<OrderDetails> weekOrder() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<OrderDetails> orderDetails = new ArrayList<>();

        try {
            Query query = session.createQuery("from Orders where orderStatus = 1");
            List<Orders> orders = query.list();

            long DAY_IN_MS = 1000 * 60 * 60 * 24;
            Date date = new Date(System.currentTimeMillis() - (7 * DAY_IN_MS));

            for (Orders o : orders) {
                query = session.createQuery("from OrderDetails where OrderId = :OrderId and createdDate >= :createdDate");
                query.setParameter("OrderId", o.getOrderId());
                query.setParameter("createdDate", date);
                orderDetails.addAll(query.list());
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return orderDetails;
    }

    @Override
    public List<OrderDetails> monthOrder() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<OrderDetails> orderDetails = new ArrayList<>();

        try {
            Query query = session.createQuery("from Orders where orderStatus = 1");
            List<Orders> orders = query.list();

            long DAY_IN_MS = 1000 * 60 * 60 * 24;
            Date date = new Date(System.currentTimeMillis() - (30 * DAY_IN_MS));

            for (Orders o : orders) {
                query = session.createQuery("from OrderDetails where OrderId = :OrderId and createdDate >= :createdDate");
                query.setParameter("OrderId", o.getOrderId());
                query.setParameter("createdDate", date);
                orderDetails.addAll(query.list());
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return orderDetails;
    }

    @Override
    public List<OrderDetails> quarterOrder() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<OrderDetails> orderDetails = new ArrayList<>();

        try {
            Query query = session.createQuery("from Orders where orderStatus = 1");
            List<Orders> orders = query.list();

            long DAY_IN_MS = 1000 * 60 * 60 * 24;
            Date date = new Date(System.currentTimeMillis() - (90 * DAY_IN_MS));

            for (Orders o : orders) {
                query = session.createQuery("from OrderDetails where OrderId = :OrderId and createdDate >= :createdDate");
                query.setParameter("OrderId", o.getOrderId());
                query.setParameter("createdDate", date);
                orderDetails.addAll(query.list());
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return orderDetails;
    }

    @Override
    public List<OrderDetails> yearOrder() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<OrderDetails> orderDetails = new ArrayList<>();

        try {
            Query query = session.createQuery("from Orders where orderStatus = 1");
            List<Orders> orders = query.list();

            long DAY_IN_MS = 1000 * 60 * 60 * 24;
            Date date = new Date(System.currentTimeMillis() - (365 * DAY_IN_MS));

            for (Orders o : orders) {
                query = session.createQuery("from OrderDetails where OrderId = :OrderId and createdDate >= :createdDate");
                query.setParameter("OrderId", o.getOrderId());
                query.setParameter("createdDate", date);
                orderDetails.addAll(query.list());
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return orderDetails;
    }

    @Override
    public List<OrderDetails> customOrder(Date startDate, Date endDate) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<OrderDetails> orderDetails = new ArrayList<>();

        try {
            Query query = session.createQuery("from Orders where orderStatus = 1");
            List<Orders> orders = query.list();

            for (Orders o : orders) {
                query = session.createQuery("from OrderDetails where OrderId = :OrderId and createdDate >= :startDate and createdDate <= :endDate");
                query.setParameter("OrderId", o.getOrderId());
                query.setParameter("startDate", startDate);
                query.setParameter("endDate", endDate);
                orderDetails.addAll(query.list());
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return orderDetails;
    }
}
