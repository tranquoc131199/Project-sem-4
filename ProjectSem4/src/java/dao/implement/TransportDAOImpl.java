/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.TransportDAO;
import entities.Transports;
import java.util.ArrayList;
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

}
