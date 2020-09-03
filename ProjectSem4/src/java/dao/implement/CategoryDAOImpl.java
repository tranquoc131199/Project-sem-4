/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.CategoryDAO;
import entities.Categories;
import entities.Products;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.jasper.tagplugins.jstl.ForEach;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Acer Nitro 5
 */
public class CategoryDAOImpl implements CategoryDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Categories> getAllCategory() {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            List listCategory = session.createQuery("from Categories").list();
            session.getTransaction().commit();
            return listCategory;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Boolean insertCategory(Categories category) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        try {
            session.save(category);
            session.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public Integer getMaxCategoryPiority() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer max = 0;
        try {
            Query query = session.createQuery("select max(categoryPiority) from Categories");
            max = (Integer) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return max;
    }

    @Override
    public Boolean checkCategoryNameExists(String categoryName) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            Query query = session.createQuery("from Categories where categoryName = :categoryName");
            query.setParameter("categoryName", categoryName);
            Categories categories = (Categories) query.uniqueResult();
            session.getTransaction().commit();
            if (categories != null) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public Categories getCategoryById(Integer categoryId) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        Categories categories = new Categories();
        try {
            Query query = session.createQuery("from Categories where categoryId = :categoryId");
            query.setParameter("categoryId", categoryId);
            categories = (Categories) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return categories;
    }

    @Override
    public Boolean updateCategory(Categories category) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        try {
            session.update(category);
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
    public Boolean disableCategory(Integer categoryId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        try {
            Categories category = getCategoryById(categoryId);
            category.setCategoryStatus(0);
            category.setUpdatedDate(new Date());
            result = updateCategory(category);

            //chỗ này để viết disableProductByCategory nhưng mà chưa hiểu nên chưa viết nhé
            disableChildCategory(categoryId);
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
    public Boolean disableChildCategory(Integer parentId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            Query query = session.createQuery("from Categories Where parentId = :parentId");
            query.setParameter("parentId", parentId);
            //khoi tao list Categories để foreach
            List<Categories> categories = query.list();

            // update từng category có parentId được truyền vào từ disableCategory()
            categories.forEach((c) -> {
                c.setCategoryStatus(0);
                c.setUpdatedDate(new Date());
                session.update(c);
            });
            session.getTransaction().commit();
            return true;

        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public Boolean disableProductByCategory(Integer categoryId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Categories> listCategory = new ArrayList<>();
        List<Products> listProduct = new ArrayList<>();
        try {
            Query query = session.createQuery("from Categories where categoryId = :categoryId");
            query.setParameter("categoryId", categoryId);
            listCategory.add((Categories) query.uniqueResult());
            query = session.createQuery("from Categories where parentId = :categoryId");
            query.setParameter("categoryId", categoryId);
            listCategory.addAll(query.list());

        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return false;
    }

    @Override
    public Boolean enableCategory(Integer categoryId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        try {
            Categories category = getCategoryById(categoryId);
            category.setCategoryStatus(1);
            category.setUpdatedDate(new Date());
            result = updateCategory(category);

            //chỗ này để viết enable ProductByCategory nhưng mà chưa hiểu nên chưa viết nhé
            
            enableAllCategory(categoryId);
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
    public Boolean enableAllCategory(Integer parentId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            Query query = session.createQuery("from Categories Where parentId = :parentId");
            query.setParameter("parentId", parentId);
            //khoi tao list Categories để foreach
            List<Categories> categories = query.list();

            // update từng category có parentId được truyền vào từ disableCategory()
            categories.forEach((c) -> {
                c.setCategoryStatus(1);
                c.setUpdatedDate(new Date());
                session.update(c);
            });
            session.getTransaction().commit();
            return true;

        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public Boolean enableAllProducty(Integer categoryId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
