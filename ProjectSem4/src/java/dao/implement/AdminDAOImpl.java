/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.AdminDAO;
import entities.Admins;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 *
 * @author Thang Pham
 */
public class AdminDAOImpl implements AdminDAO {

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
    public List<Admins> getAllAdmins() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Admins> admins = new ArrayList<>();

        try {
            admins = session.createQuery("from Admins").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.getAllAdmins()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return admins;
    }
    
    @Override
    public Integer countAllAdmins() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;
        
        try {
            List list = session.createQuery("from Admins").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.countAllAdmins()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
                    
        }
        
        return count;
    }

    @Override
    public List<Admins> getAllAdminsForPaging(Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Admins> admins = new ArrayList<>();

        try {
            Query query = session.createQuery("from Admins order by adminId desc");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            admins = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.getAllAdmins()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return admins;
    }
    
    @Override
    public Integer countAllAdminByAdminEmail(String adminEmail) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;
        
        try {
            List list = session.createQuery("from Admins where adminEmail like :adminEmail").setParameter("adminEmail", "%" + adminEmail + "%").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.countAllAdmins()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
                    
        }
        
        return count;
    }

    @Override
    public List<Admins> searchAdminByEmail(String adminEmail, Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Admins> admins = new ArrayList<>();

        try {
            Query query = session.createQuery("from Admins where adminEmail like :adminEmail order by adminId desc");
            query.setParameter("adminEmail", "%" + adminEmail + "%");
            admins = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.searchAdminByEmail()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return admins;
    }

    @Override
    public Boolean updateAdmin(Admins admin) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.update(admin);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.updateAdmin()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Admins checkAdminLogin(String adminEmail) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Admins admin = new Admins();

        try {
            Query query = session.createQuery("from Admins where adminEmail = :adminEmail");
            query.setParameter("adminEmail", adminEmail);
            admin = (Admins) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.checkAdminLogin()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return admin;
    }

    @Override
    public Admins getAdminById(Integer adminId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Admins admin = new Admins();

        try {
            Query query = session.createQuery("from Admins where adminId = :adminId");
            query.setParameter("adminId", adminId);
            admin = (Admins) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.getAdminById()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return admin;
    }

    @Override
    public Boolean insertAdmin(Admins admin) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.save(admin);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.insertAdmin()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean changeAdminPassword(Integer adminId, String adminPassword) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Admins admin = getAdminById(adminId);
            admin.setAdminPassword(adminPassword);
            session.update(admin);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.changeAdminPassword()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean changeAdminAvatar(Integer adminId, String adminAvatar) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Admins admin = getAdminById(adminId);
            admin.setAdminAvatar(adminAvatar);
            session.update(admin);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.changeAdminAvatar()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean checkAdminEmailExists(String adminEmail) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Admins where adminEmail = :adminEmail");
            query.setParameter("adminEmail", adminEmail);
            Admins admin = (Admins) query.uniqueResult();
            session.getTransaction().commit();

            if (admin != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.checkAdminEmailExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean checkAdminIdCardExists(String adminIdCard) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Admins where adminIdCard = :adminIdCard");
            query.setParameter("adminIdCard", adminIdCard);
            Admins admin = (Admins) query.uniqueResult();
            session.getTransaction().commit();

            if (admin != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.checkAdminIdCardExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean checkAdminPhoneExists(String adminPhone) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Admins where adminPhone = :adminPhone");
            query.setParameter("adminPhone", adminPhone);
            Admins admin = (Admins) query.uniqueResult();
            session.getTransaction().commit();

            if (admin != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.checkAdminPhoneExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean checkAdminAvatarExists(String adminAvatar) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from Admins where adminAvatar = :adminAvatar");
            query.setParameter("adminAvatar", adminAvatar);
            Admins admin = (Admins) query.uniqueResult();
            session.getTransaction().commit();

            if (admin != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.AdminDAOImpl.checkAdminAvatarExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }
}
