/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import dao.ProductDAO;
import entities.Brands;
import entities.ProductImages;
import entities.Products;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Acer Nitro 5
 */
public class ProductDAOImpl implements ProductDAO {

    @Autowired

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Products> getAllProducts() {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();

        try {
            List listProduct = session.createQuery("from Products").list();
            session.getTransaction().commit();
            return listProduct;
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Boolean insertProduct(Products product) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        try {
            session.save(product);
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
    public List<Brands> getAllBrands() {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();

        try {
            List listBrand = session.createQuery("from Brands").list();
            session.getTransaction().commit();
            return listBrand;
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Boolean checkProductNameExists(String productName) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        try {
            Query query = session.createQuery("from Products where productName = :productName");
            query.setParameter("productName", "%" + productName + "%");
            Products product = (Products) query.uniqueResult();
            session.getTransaction().commit();

            if (product != null) {
                return true;
            }
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return false;
    }

    @Override
    public Brands getBrandById(Integer brandId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Brands brand = new Brands();

        try {
            Query query = session.createQuery("from Brands where brandId = :brandId");
            query.setParameter("brandId", brandId);
            brand = (Brands) query.uniqueResult();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return brand;
    }

    @Override
    public Boolean updateProduct(Products product) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        try {
            session.update(product);
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
    public Products getProductById(Integer productId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Products product = new Products();

        try {
            Query query = session.createQuery("from Products where productId = :productId");
            query.setParameter("productId", productId);
            product = (Products) query.uniqueResult();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return product;
    }

    @Override
    public Boolean insertProductImage(ProductImages productImage) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        try {
            session.save(productImage);
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
    public Boolean disableProduct(Integer productId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        try {
            Products product = getProductById(productId);
            product.setProductStatus(0);
            product.setUpdatedDate(new Date());
            result = updateProduct(product);
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
    public Boolean enableProduct(Integer productId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        try {
            Products product = getProductById(productId);
            product.setProductStatus(1);
            product.setUpdatedDate(new Date());
            result = updateProduct(product);
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
    public List<ProductImages> getAllImagesByProductId(Integer productId) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        List<ProductImages> listImage = new ArrayList<>();
        try {
            Query query = session.createQuery("from ProductImages where productId = :productId");
            Products product = getProductById(productId);
            query.setParameter("productId", product);
            listImage = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return listImage;
    }

    @Override
    public Products getBestSaleProduct() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Products product = new Products();
        try {
            Query query = session.createQuery("from Products where productStatus = 1 order by productSale desc");
            query.setMaxResults(1);
            product = (Products) query.list().get(0);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return product;
    }

    @Override
    public Products getBestSellProduct() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Products product = new Products();
        try {
            Query query = session.createQuery("from Products where productStatus = 1 order by productSaleQuantity desc");
            query.setMaxResults(1);
            product = (Products) query.list().get(0);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return product;
    }

    @Override
    public List<Products> getTopTwelveBestSellForProducts() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Products> products = new ArrayList<>();

        try {
            Query query = session.createQuery("from Products where productStatus = 1 order by productSaleQuantity desc");
            query.setMaxResults(13);
            products = query.list();

            for (Products p : products) {
                Products pro = getBestSellProduct();

                if (Objects.equals(p.getProductId(), pro.getProductId())) {
                    products.remove(p);
                    break;
                }
            }
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return products;
    }

    @Override
    public List<Products> getTopTwelveBestSaleForProducts() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Products> products = new ArrayList<>();

        try {
            Query query = session.createQuery("from Products where productStatus = 1 order by productSale desc");
            query.setMaxResults(13);
            products = query.list();

            for (Products p : products) {
                Products pro = getBestSaleProduct();

                if (Objects.equals(p.getProductId(), pro.getProductId())) {
                    products.remove(p);
                    break;
                }
            }
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return products;
    }

    @Override
    public Boolean checkNewProduct(Integer productId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Boolean result = false;
        try {
            Query query = session.createQuery("from Products where productStatus = 1 order by productId desc");
            query.setMaxResults(20);
            List<Products> products = query.list();
            Products product = getProductById(productId);

            for (Products p : products) {
                if (Objects.equals(p.getProductId(), product.getProductId())) {
                    result = true;
                    break;
                }
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
    public List<Products> getFourNewProduct() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Products> products = new ArrayList<>();
        try {
            Query query = session.createQuery("from Products where productStatus = 1 order by productId desc");
            query.setMaxResults(4);
            products = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return products;
    }

}
