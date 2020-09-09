/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import entities.Brands;
import entities.Categories;
import entities.Products;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public class FilterProduct {

    public List<Products> products;

    public List<Brands> brands;

    public List<Categories> categories;

    public FilterProduct() {

    }

    public FilterProduct(List<Products> products, List<Brands> brands, List<Categories> categories) {
        this.products = products;
        this.brands = brands;
        this.categories = categories;
    }

    public List<Products> getProducts() {
        return products;
    }

    public void setProducts(List<Products> products) {
        this.products = products;
    }

    public List<Brands> getBrands() {
        return brands;
    }

    public void setBrands(List<Brands> brands) {
        this.brands = brands;
    }

    public List<Categories> getCategories() {
        return categories;
    }

    public void setCategories(List<Categories> categories) {
        this.categories = categories;
    }

}
