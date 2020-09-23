/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.CustomerDAO;
import entities.Customers;
import entities.OrderDetails;
import entities.Orders;
import entities.ProductComments;
import entities.Products;
import entities.Wishlists;
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

    @Override
    public Boolean removeWishlist(Customers customer, Products product) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("delete from Wishlists where customerId = :customerId and productId = :productId");
            query.setParameter("customerId", customer);
            query.setParameter("productId", product);
            int i = query.executeUpdate();

            if (i > 0) {
                result = true;
            }

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
    public Boolean addToWishlist(Wishlists wishlist) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.save(wishlist);
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
    public Boolean checkCustomerPhoneExists(String customerPhone) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Customers where customerPhone = :customerPhone");
            query.setParameter("customerPhone", customerPhone);
            Customers customer = (Customers) query.uniqueResult();
            session.getTransaction().commit();

            if (customer != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.checkCustomerPhoneExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

@Override
    public List<Customers> getAllCustomers(Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Customers> customers = new ArrayList<>();

        try {
            Query query = session.createQuery("from Customers order by customerId desc");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            customers = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.getAllCustomers()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return customers;
    }

    @Override
    public Integer countAllCustomers() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            List list = session.createQuery("from Customers").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.countAllCustomers()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public Integer countAllCustomersByName(String customerFullname) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            Query query = session.createQuery("from Customers where customerFullname like :customerFullname order by customerId desc");
            query.setParameter("customerFullname", "%" + customerFullname + "%");
            count = query.list().size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.countAllCustomers()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public List<Customers> searchCustomersByName(String customerFullname, Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Customers> customers = new ArrayList<>();

        try {
            Query query = session.createQuery("from Customers where customerFullname like :customerFullname order by customerId desc");
            query.setParameter("customerFullname", "%" + customerFullname + "%");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            customers = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.searchCustomersByName()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return customers;
    }


    @Override
    public Customers getCustomerByEmail(String customerEmail) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Customers customer = new Customers();

        try {
            Query query = session.createQuery("from Customers where customerEmail = :customerEmail");
            query.setParameter("customerEmail", customerEmail);
            customer = (Customers) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.getCustomerByEmail()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return customer;
    }

    @Override
    public Boolean insertCustomer(Customers customer) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.save(customer);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.insertCustomer()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean updateCustomer(Customers customer) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.update(customer);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.updateCustomer()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean changeCustomerInformation(Integer customerId, String customerFullName, String customerPhone, Date customerBirthday, String customerAddress) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Customers customer = getCustomerById(customerId);
            customer.setCustomerFullName(customerFullName);
            customer.setCustomerPhone(customerPhone);
            customer.setCustomerBirthday(customerBirthday);
            customer.setCustomerAddress(customerAddress);
            result = updateCustomer(customer);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.changeCustomerInformation()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

 @Override
    public Boolean disableCustomer(Integer customerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Customers customer = getCustomerById(customerId);
            customer.setCustomerStatus(0);
            result = updateCustomer(customer);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.disableCustomer()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean enableCustomer(Integer customerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Customers customer = getCustomerById(customerId);
            customer.setCustomerStatus(1);
            result = updateCustomer(customer);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.enableCustomer()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Customers checkCustomerLogin(String customerEmail) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Customers customer = new Customers();

        try {
            Query query = session.createQuery("from Customers where customerEmail = :customerEmail");
            query.setParameter("customerEmail", customerEmail);
            customer = (Customers) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.checkCustomerLogin()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return customer;
    }

    @Override
    public Boolean changeCustomerPassword(Integer customerId, String customerPassword) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Customers customer = getCustomerById(customerId);
            customer.setCustomerPassword(customerPassword);
            result = updateCustomer(customer);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.changeCustomerPassword()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean changeCustomerAvatar(Integer customerId, String customerAvatar) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Customers customer = getCustomerById(customerId);
            customer.setCustomerAvatar(customerAvatar);
            result = updateCustomer(customer);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.changeCustomerAvatar()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean updateCustomerStatus(Integer customerId, Integer customerStatus) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Customers customer = getCustomerById(customerId);
            customer.setCustomerStatus(customerStatus);
            result = updateCustomer(customer);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.updateCustomerStatus()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean checkCustomerEmailExists(String customerEmail) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Customers where customerEmail = :customerEmail");
            query.setParameter("customerEmail", customerEmail);
            Customers customer = (Customers) query.uniqueResult();
            session.getTransaction().commit();

            if (customer != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.checkCustomerEmailExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }
    

    @Override
    public Boolean checkCustomerAvatarExists(String customerAvatar) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Customers where customerAvatar = :customerAvatar");
            query.setParameter("customerAvatar", customerAvatar);
            Customers customer = (Customers) query.uniqueResult();
            session.getTransaction().commit();

            if (customer != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.checkCustomerAvatarExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public ProductComments getProductCommentById(Integer productCommentId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        ProductComments productComment = new ProductComments();

        try {
            Query query = session.createQuery("from ProductComments where productCommentId = :productCommentId");
            query.setParameter("productCommentId", productCommentId);
            productComment = (ProductComments) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.getProductCommentById()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return productComment;
    }

    @Override
    public List<ProductComments> getProductCommentsByCustomerId(Integer customerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<ProductComments> productComments = new ArrayList<>();

        try {
            Query query = session.createQuery("from ProductComments where customerId = :customerId order by productCommentId desc");
            Customers c = getCustomerById(customerId);
            query.setParameter("customerId", c);
            productComments = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.getProductCommentsByCustomerId()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return productComments;
    }

    @Override
    public Boolean updateProductCommentStatus(Integer productCommentId, Integer status) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            ProductComments productComment = getProductCommentById(productCommentId);
            productComment.setProductCommentStatus(status);
            session.update(productComment);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.updateProductCommentStatus()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();

        }

        return result;
    }

    @Override
    public Integer countBoughtProductsByCustomerId(Integer customerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            Query query = session.createQuery("from Orders where customerId = :customerId and orderStatus = 1");
            Customers c = getCustomerById(customerId);
            query.setParameter("customerId", c);
            List<Orders> orders = query.list();
            List<OrderDetails> orderDetails = new ArrayList<>();

            for (Orders o : orders) {
                query = session.createQuery("from OrderDetails where orderId = :orderId");
                query.setParameter("orderId", o);
                orderDetails.addAll(query.list());
            }

            count = orderDetails.stream().map((od) -> od.getOrderDetailQuantity()).reduce(count, Integer::sum);
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.countBoughtProductsByCustomerId()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public Boolean deleteCustomer(Integer customerId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("delete from Customers where customerId = :customerId");
            query.setParameter("customerId", customerId);
            int i = query.executeUpdate();

            if (i > 0) {
                result = true;
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CustomerDAOImpl.deleteCustomer()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    

}
