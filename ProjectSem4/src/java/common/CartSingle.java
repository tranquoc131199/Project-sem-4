/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import entities.Products;

/**
 *
 * @author Acer Nitro 5
 */
public class CartSingle {

    public Products product;

    public Integer productQuantity;

    public CartSingle() {
    }

    public CartSingle(Products product, Integer productQuantity) {
        this.product = product;
        this.productQuantity = productQuantity;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public Integer getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }

}
