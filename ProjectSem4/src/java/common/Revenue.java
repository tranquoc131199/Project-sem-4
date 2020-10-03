/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import entities.OrderDetails;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public class Revenue {
    
    private List<SingleOrderDetail> singleOrderDetails;
    
    private int totalProductSale;
    
    private double totalRevenue;

    public Revenue() {
    }

    public Revenue(List<OrderDetails> orderDetails) {
        orderDetails.stream().map((od) -> new SingleOrderDetail(od)).forEachOrdered((s) -> {
            singleOrderDetails.add(s);
        });
        init();
    }

    public Revenue(List<SingleOrderDetail> singleOrderDetails, int totalProductSale, double totalRevenue) {
        this.singleOrderDetails = singleOrderDetails;
        this.totalProductSale = totalProductSale;
        this.totalRevenue = totalRevenue;
        init();
    }
    
    private void init() {
        singleOrderDetails.stream().map((s) -> {
            this.totalProductSale += s.getProductSaleQuantity();
            return s;
        }).forEachOrdered((s) -> {
            this.totalRevenue += ((s.getProductPrice() * ((100 - s.getProductSale()) / 100)) * s.getProductSaleQuantity());
        });
    }

    public List<SingleOrderDetail> getSingleOrderDetails() {
        return singleOrderDetails;
    }

    public void setSingleOrderDetails(List<SingleOrderDetail> singleOrderDetails) {
        this.singleOrderDetails = singleOrderDetails;
    }

    public int getTotalProductSale() {
        return totalProductSale;
    }

    public void setTotalProductSale(int totalProductSale) {
        this.totalProductSale = totalProductSale;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
}
