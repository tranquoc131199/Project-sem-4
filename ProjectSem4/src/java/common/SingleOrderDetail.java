/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import entities.OrderDetails;

/**
 *
 * @author Acer Nitro 5
 */
public class SingleOrderDetail {

    private String productName;

    private double productPrice;

    private int productSale;

    private int productSaleQuantity;

    public SingleOrderDetail() {
    }

    public SingleOrderDetail(OrderDetails orderDetails) {
        setProductName(orderDetails.getProductId().getProductName());
        setProductPrice(orderDetails.getProductId().getProductPrice());
        setProductSaleQuantity(orderDetails.getOrderDetailQuantity());
        setProductSale(orderDetails.getOrderDetailSale());
    }

    public SingleOrderDetail(String productName, double productPrice, int productSaleQuantity, int productSale) {
        this.productName = productName;
        this.productPrice = productPrice;
        this.productSaleQuantity = productSaleQuantity;
        this.productSale = productSale;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductSaleQuantity() {
        return productSaleQuantity;
    }

    public void setProductSaleQuantity(int productSaleQuantity) {
        this.productSaleQuantity = productSaleQuantity;
    }

    public int getProductSale() {
        return productSale;
    }

    public void setProductSale(int productSale) {
        this.productSale = productSale;
    }
}
