/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.NewDAO;
import entities.Catalogs;
import entities.News;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Acer Nitro 5
 */
public class NewDAOImpl implements NewDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<News> getAllNews(Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<News> news = new ArrayList<>();

        try {
            Query query = session.createQuery("from News order by newId desc");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            news = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return news;
    }

    @Override
    public List<Catalogs> getAllChildrenCatalogsByParentIdFrontEnd(Integer parentId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Catalogs> catalogs = new ArrayList<>();

        try {
            Query query = session.createQuery("from Catalogs where catalogStatus = 1 and parentId = :parentId order by catalogPiority");
            query.setParameter("parentId", parentId);
            catalogs = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return catalogs;
    }

    @Override
    public Integer countAllNews() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            List list = session.createQuery("from News").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.countAllNews()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public Catalogs getCatalogById(Integer catalogId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Catalogs catalog = new Catalogs();

        try {
            Query query = session.createQuery("from Catalogs where catalogId = :catalogId");
            query.setParameter("catalogId", catalogId);
            catalog = (Catalogs) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CatalogDAOImpl.getCatalogById()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return catalog;
    }

    @Override
    public List<News> getAllNewsByCatalogId(Integer catalogId, Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<News> news = new ArrayList<>();

        try {
            Query query = session.createQuery("from News where catalogId = :catalogId");
            Catalogs c = getCatalogById(catalogId);
            query.setParameter("catalogId", c);
            news = query.list();
            List<Catalogs> catalogs = getAllChildrenCatalogsByParentIdFrontEnd(catalogId);

            for (Catalogs ct : catalogs) {
                query = session.createQuery("from News where catalogId = :catalogId");
                query.setParameter("catalogId", ct);
                news.addAll(query.list());
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return news;
    }

    @Override
    public Integer countAllNewsByCatalogId(Integer catalogId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            Query query = session.createQuery("from News where catalogId = :catalogId");
            Catalogs c = getCatalogById(catalogId);
            query.setParameter("catalogId", c);
            List list = query.list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.countAllNewsByCatalogId()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public List<News> getAllNewsFrontEnd(Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<News> news = new ArrayList<>();

        try {
            Query query = session.createQuery("from News where newStatus = 1 order by newId desc");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            news = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.getAllNewsFrontEnd()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return news;
    }

    @Override
    public List<News> getFiveRelatedNew(Integer newId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<News> news = new ArrayList<>();

        try {
            News n = getNewById(newId);
            Query query = session.createQuery("from News where newStatus = 1 and catalogId = :catalogId");
            query.setParameter("catalogId", n.getCatalogId());
            query.setMaxResults(6);
            news = query.list();

            for (News aNew : news) {
                if (Objects.equals(aNew.getNewId(), n.getNewId())) {
                    news.remove(aNew);
                } else {
                    news.remove(5);
                }
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.getAllNewsFrontEnd()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return news;
    }

    @Override
    public Integer countAllNewsFrontEnd() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            List list = session.createQuery("from News where newStatus = 1").list();
            count = list.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.countAllNewsFrontEnd()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public List<News> getAllNewsByCatalogIdFrontEnd(Integer catalogId, Integer start, Integer limit) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<News> news = new ArrayList<>();
        List<News> collections;

        try {
            Query query = session.createQuery("from News where newStatus = 1 and catalogId = :catalogId order by newId desc");
            Catalogs c = getCatalogById(catalogId);
            query.setParameter("catalogId", c);
            collections = query.list();
            List<Catalogs> catalogs = getAllChildrenCatalogsByParentIdFrontEnd(catalogId);

            for (Catalogs ct : catalogs) {
                query = session.createQuery("from News where newStatus = 1 and catalogId = :catalogId");
                query.setParameter("catalogId", c);
                collections.addAll(query.list());
            }

            Stream<News> stream = collections.stream();
            news = stream.limit(limit).skip(start).collect(Collectors.toList());
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return news;
    }

    @Override
    public Integer countAllNewsByCatalogIdFrontEnd(Integer catalogId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;

        try {
            Query query = session.createQuery("from News where newStatus = 1 and catalogId = :catalogId");
            Catalogs c = getCatalogById(catalogId);
            query.setParameter("catalogId", c);
            List<News> news = query.list();
            List<Catalogs> catalogs = getAllChildrenCatalogsByParentIdFrontEnd(catalogId);

            for (Catalogs ct : catalogs) {
                query = session.createQuery("from News where newStatus = 1 and catalogId = :catalogId");
                query.setParameter("catalogId", ct);
                news.addAll(query.list());
            }

            count = news.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.countAllNewsByCatalogIdFrontEnd()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return count;
    }

    @Override
    public Boolean insertNew(News news) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.save(news);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.insertNew()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean updateNew(News news) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            session.update(news);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.updateNew()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public News getNewById(Integer newId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        News news = new News();

        try {
            Query query = session.createQuery("from News where newId = :newId");
            query.setParameter("newId", newId);
            news = (News) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.getNewById()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return news;
    }

    @Override
    public Boolean disableNew(Integer newId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            News news = getNewById(newId);
            news.setNewStatus(0);
            news.setUpdatedDate(new Date());
            result = updateNew(news);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.disableNew()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean enableNew(Integer newId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            News news = getNewById(newId);
            news.setNewStatus(1);
            news.setUpdatedDate(new Date());
            result = updateNew(news);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.enableNew()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public Boolean checkNewTitleExists(String newTitle) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;

        try {
            Query query = session.createQuery("from News where newTitle = :newTitle");
            query.setParameter("newTitle", newTitle);
            News news = (News) query.uniqueResult();
            session.getTransaction().commit();

            if (news != null) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.checkNewTitleExists()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return result;
    }

    @Override
    public List<News> getSixNewest() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<News> news = new ArrayList();

        try {
            Query query = session.createQuery("from News where newStatus = 1 order by newId desc");
            query.setMaxResults(7);
            news = query.list();
            News n = getNewest();

            for (News aNew : news) {
                if (Objects.equals(aNew.getNewId(), n.getNewId())) {
                    news.remove(aNew);
                    break;
                }
            }

            if (news.size() == 7) {
                news.remove(6);
            }

            if (news.isEmpty()) {
                news = null;
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.NewDAOImpl.getSixNewst()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return news;
    }

    @Override
    public News getNewest() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        News news = null;

        try {
            Query query = session.createQuery("from News where newStatus = 1 order by newId desc");
            query.setMaxResults(1);
            news = (News) query.list().get(0);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return news;
    }
    
     @Override
    public List<Catalogs> getAllParentCatalogsFrontEnd() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Catalogs> catalogs = new ArrayList<>();
        
        try {
            catalogs = session.createQuery("from Catalogs where catalogStatus = 1 and parentId = 0 order by catalogPiority").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        
        return catalogs;
    }


    @Override
    public String generateNewsHtml() {
        String html = "";
        List<Catalogs> catalogs = getAllParentCatalogsFrontEnd();

        for (Catalogs c : catalogs) {
            html += "<div class='col-md-4'>";
            html += "<ul class='list-links'>";
            html += "<li>";
            html += "<h3 class='list-links-title'><a href='/ProjectSem4/new/index.htm?catalogId=" + c.getCatalogId() + "'>" + c.getCatalogName() + "</a></h3>";
            html += "</li>";

            List<Catalogs> children = getAllChildrenCatalogsByParentIdFrontEnd(c.getCatalogId());

            html = children.stream().map((ct) -> "<li><a href='/ProjectSem4/new/index.htm?catalogId=" + ct.getCatalogId() + "'>" + ct.getCatalogName() + "</a></li>").reduce(html, String::concat);

            html += "</ul>";
            html += "<hr class='hidden-md hidden-lg'>";
            html += "</div>";
        }

        return html;
    }
}
