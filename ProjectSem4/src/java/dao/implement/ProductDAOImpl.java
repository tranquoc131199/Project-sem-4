/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implement;

import common.FilterProduct;
import dao.ProductDAO;
import entities.Brands;
import entities.Categories;
import entities.ProductImages;
import entities.Products;
import java.util.ArrayList;
import java.util.Comparator;
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
public class ProductDAOImpl implements ProductDAO {

    @Autowired

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    //chờ thắng làm xong sẽ đưa sang brand
    @Override
    public List<Brands> getAllBrandsForClient() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Brands> brands = new ArrayList<>();

        try {
            brands = session.createQuery("from Brands where brandStatus = 1").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return brands;
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

    @Override
    public Integer countProductFilterForPaging(Brands brandId, Categories categoryId, String productName) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer count = 0;
        Query query;
        List<Products> collections;

        try {
            if (brandId == null && categoryId == null && "".equals(productName)) {
                query = session.createQuery("from Products where productStatus = 1");
                collections = query.list();
            } else if (brandId != null && categoryId == null && "".equals(productName)) {
                query = session.createQuery("from Products where productStatus = 1 and brandId = :brandId");
                query.setParameter("brandId", brandId);
                collections = query.list();
            } else if (brandId == null && categoryId != null && "".equals(productName)) {
                List<Categories> cas = session.createQuery("from Categories where parentId = :categoryId").setParameter("categoryId", categoryId.getCategoryId()).list();
                query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId");
                query.setParameter("categoryId", categoryId);
                collections = query.list();

                for (Categories c : cas) {
                    query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId");
                    query.setParameter("categoryId", c);
                    collections.addAll(query.list());
                }
            } else if (brandId == null && categoryId == null && !"".equals(productName)) {
                query = session.createQuery("from Products where productStatus = 1 and productName like :productName");
                query.setParameter("productName", "%" + productName + "%");
                collections = query.list();
            } else if (brandId != null && categoryId != null && "".equals(productName)) {
                List<Categories> cas = session.createQuery("from Categories where parentId = :categoryId").setParameter("categoryId", categoryId.getCategoryId()).list();
                query = session.createQuery("from Products where productStatus = 1 and brandId = :brandId and categoryId = :categoryId");
                query.setParameter("brandId", brandId);
                query.setParameter("categoryId", categoryId);
                collections = query.list();

                for (Categories c : cas) {
                    query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId");
                    query.setParameter("categoryId", c);
                    collections.addAll(query.list());
                }
            } else if (brandId == null && categoryId != null && !"".equals(productName)) {
                List<Categories> cas = session.createQuery("from Categories where parentId = :categoryId").setParameter("categoryId", categoryId.getCategoryId()).list();
                query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId and productName like :productName");
                query.setParameter("categoryId", categoryId);
                query.setParameter("productName", "%" + productName + "%");
                collections = query.list();

                for (Categories c : cas) {
                    query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId");
                    query.setParameter("categoryId", c);
                    collections.addAll(query.list());
                }
            } else if (brandId != null && categoryId == null && !"".equals(productName)) {
                query = session.createQuery("from Products where productStatus = 1 and brandId = :brandId and productName like :productName");
                query.setParameter("brandId", brandId);
                query.setParameter("productName", "%" + productName + "%");
                collections = query.list();
            } else {
                List<Categories> cas = session.createQuery("from Categories where parentId = :categoryId").setParameter("categoryId", categoryId.getCategoryId()).list();
                query = session.createQuery("from Products where productStatus = 1 and brandId = :brandId and categoryId = :categoryId and productName like :productName");
                query.setParameter("brandId", brandId);
                query.setParameter("categoryId", categoryId);
                query.setParameter("productName", "%" + productName + "%");
                collections = query.list();

                for (Categories c : cas) {
                    query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId");
                    query.setParameter("categoryId", c);
                    collections.addAll(query.list());
                }
            }

            count = collections.size();
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
    public List<Categories> getAllParentCategoriesForClient() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Categories> categories = new ArrayList<>();

        try {
            categories = session.createQuery("from Categories where categoryStatus = 1 and parentId = 0 order by categoryPiority desc").list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return categories;
    }

    @Override
    public List<Categories> getChildrenCategoriesByParentIdForClient(Integer parentId) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Categories> categories = new ArrayList<>();

        try {
            Query query = session.createQuery("from Categories where categoryStatus = 1 and parentId = :parentId order by categoryPiority desc");
            query.setParameter("parentId", parentId);
            categories = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("dao.impl.CategoryDAOImpl.getChildrenCategoriesByParentIdForDisplayFrontEnd()");
            e.getMessage();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return categories;
    }

    @Override
    public FilterProduct filterProductsForClient(Integer start, Integer limit, Brands brandId, Categories categoryId, String productName, Integer sort) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        FilterProduct products = null;
        Query query;
        List<Products> collections;

        if (sort == null || sort <= 0 || sort > 7) {
            sort = 1;
        }

        try {
            if (brandId == null && categoryId == null && "".equals(productName)) {
                query = session.createQuery("from Products where productStatus = 1");
                collections = query.list();
            } else if (brandId != null && categoryId == null && "".equals(productName)) {
                query = session.createQuery("from Products where productStatus = 1 and brandId = :brandId");
                query.setParameter("brandId", brandId);
                collections = query.list();
            } else if (brandId == null && categoryId != null && "".equals(productName)) {
                List<Categories> cas = session.createQuery("from Categories where parentId = :categoryId and categoryStatus = 1").setParameter("categoryId", categoryId.getCategoryId()).list();
                query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId");
                query.setParameter("categoryId", categoryId);
                collections = query.list();

                for (Categories c : cas) {
                    query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId");
                    query.setParameter("categoryId", c);
                    collections.addAll(query.list());
                }
            } else if (brandId == null && categoryId == null && !"".equals(productName)) {
                query = session.createQuery("from Products where productStatus = 1 and productName like :productName");
                query.setParameter("productName", "%" + productName + "%");
                collections = query.list();
            } else if (brandId != null && categoryId != null && "".equals(productName)) {
                List<Categories> cas = session.createQuery("from Categories where parentId = :categoryId and categoryStatus = 1").setParameter("categoryId", categoryId.getCategoryId()).list();
                query = session.createQuery("from Products where productStatus = 1 and brandId = :brandId and categoryId = :categoryId");
                query.setParameter("brandId", brandId);
                query.setParameter("categoryId", categoryId);
                collections = query.list();

                for (Categories c : cas) {
                    query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId");
                    query.setParameter("categoryId", c);
                    collections.addAll(query.list());
                }
            } else if (brandId == null && categoryId != null && !"".equals(productName)) {
                List<Categories> cas = session.createQuery("from Categories where parentId = :categoryId and categoryStatus = 1").setParameter("categoryId", categoryId.getCategoryId()).list();
                query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId and productName like :productName");
                query.setParameter("categoryId", categoryId);
                query.setParameter("productName", "%" + productName + "%");
                collections = query.list();

                for (Categories c : cas) {
                    query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId");
                    query.setParameter("categoryId", c);
                    collections.addAll(query.list());
                }
            } else if (brandId != null && categoryId == null && !"".equals(productName)) {
                query = session.createQuery("from Products where productStatus = 1 and brandId = :brandId and productName like :productName");
                query.setParameter("brandId", brandId);
                query.setParameter("productName", "%" + productName + "%");
                collections = query.list();
            } else {
                List<Categories> cas = session.createQuery("from Categories where parentId = :categoryId and categoryStatus = 1").setParameter("categoryId", categoryId.getCategoryId()).list();
                query = session.createQuery("from Products where productStatus = 1 and brandId = :brandId and categoryId = :categoryId and productName like :productName");
                query.setParameter("brandId", brandId);
                query.setParameter("categoryId", categoryId);
                query.setParameter("productName", "%" + productName + "%");
                collections = query.list();

                for (Categories c : cas) {
                    query = session.createQuery("from Products where productStatus = 1 and categoryId = :categoryId");
                    query.setParameter("categoryId", c);
                    collections.addAll(query.list());
                }
            }

            Stream<Products> stream = collections.stream();
            List<Products> productListOnly;
            switch (sort) {
                case 2:
                    productListOnly = stream.sorted(Comparator.comparing(Products::getProductPrice).reversed()).collect(Collectors.toList());
                    break;
                case 3:
                    productListOnly = stream.sorted(Comparator.comparing(Products::getProductStarAvg)).collect(Collectors.toList());
                    break;
                case 4:
                    productListOnly = stream.sorted(Comparator.comparing(Products::getProductStarAvg).reversed()).collect(Collectors.toList());
                    break;
                case 5:
                    productListOnly = stream.sorted(Comparator.comparing(Products::getProductSaleQuantity)).collect(Collectors.toList());
                    break;
                case 6:
                    productListOnly = stream.sorted(Comparator.comparing(Products::getProductSaleQuantity).reversed()).collect(Collectors.toList());
                    break;
                case 7:
                    productListOnly = stream.sorted(Comparator.comparing(Products::getProductId).reversed()).collect(Collectors.toList());
                    break;
                default:
                    productListOnly = stream.sorted(Comparator.comparing(Products::getProductPrice)).collect(Collectors.toList());
                    break;
            }

            List<Brands> brands = new ArrayList<>();
            List<Categories> categories = new ArrayList<>();

            if (brandId == null && categoryId == null) {
                brands = getAllBrandsForClient();
                categories = getAllParentCategoriesForClient();
            } else if (brandId != null && categoryId == null) {
                brands.add(brandId);

                for (Products p : collections) {
                    if (p.getCategoryId().getParentId() == 0) {
                        categories.add(p.getCategoryId());
                    }

                    if (p.getCategoryId().getParentId() != 0) {
                        query = session.createQuery("from Categories where categoryId = :categoryId");
                        query.setParameter("categoryId", p.getCategoryId().getParentId());
                        Categories cat = (Categories) query.uniqueResult();

                        if (cat.getParentId() == 0 && !Objects.equals(p.getCategoryId().getCategoryId(), cat.getCategoryId())) {
                            categories.add(cat);
                        }
                    }
                }
            } else if (brandId == null && categoryId != null) {
                categories.add(categoryId);
                categories.addAll(getChildrenCategoriesByParentIdForClient(categoryId.getCategoryId()));

                for (Products p : collections) {
                    brands.add(p.getBrandId());
                }
            } else {
                brands.add(brandId);
                categories.add(categoryId);
                categories.addAll(getChildrenCategoriesByParentIdForClient(categoryId.getCategoryId()));
            }

            categories = categories.stream().distinct().collect(Collectors.toList());
            brands = brands.stream().distinct().collect(Collectors.toList());
            productListOnly = productListOnly.stream().skip(start).limit(limit).collect(Collectors.toList());
            products = new FilterProduct(productListOnly, brands, categories);
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
