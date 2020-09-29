/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.TransportDAO;
import entities.Transports;
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
public class TransportDAOImpl implements TransportDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Transports> getAllTransportsClient() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Transports> transports = new ArrayList<>();

        try {
            transports = session.createQuery("from Transports where transportStatus = 1").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return transports;
    }

    @Override
    public Boolean insertTransport(Transports transport) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            transport.setCreatedDate(new Date());
            transport.setUpdatedDate(new Date());
            session.save(transport);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.TransportDAOImpl.insertTransport()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Transports getTransportById(Integer transportId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Transports transport = new Transports();

        try {
            Query query = session.createQuery("from Transports where transportId = :transportId");
            query.setParameter("transportId", transportId);
            transport = (Transports) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return transport;
    }

    @Override
    public Integer countAllTransport() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            List list = session.createQuery("from Transports").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.TransportDAOImpl.countAllTransport()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public List<Transports> getAllTransportsForPaging(Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Transports> transports = new ArrayList<>();

        try {
            Query query = session.createQuery("from Transports order by transportId desc");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            transports = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.TransportDAOImpl.getAllTransports()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return transports;
    }

    @Override
    public Boolean checkTransportNameExists(String transportName) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Transports where transportName = :transportName");
            query.setParameter("transportName", transportName);
            Transports transport = (Transports) query.uniqueResult();
            session.getTransaction().commit();

            if (transport != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.TransportDAOImpl.checkTransportNameExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean disableTransport(Integer transportId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Transports transport = getTransportById(transportId);
            transport.setTransportStatus(0);
            transport.setUpdatedDate(new Date());
            result = updateTransport(transport);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.TransportDAOImpl.disableTransport()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean enableTransport(Integer transportId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Transports transport = getTransportById(transportId);
            transport.setTransportStatus(1);
            transport.setUpdatedDate(new Date());
            result = updateTransport(transport);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.TransportDAOImpl.enableTransport()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean updateTransport(Transports transport) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            transport.setUpdatedDate(new Date());
            session.update(transport);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.TransportDAOImpl.updateTransport()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }
}
