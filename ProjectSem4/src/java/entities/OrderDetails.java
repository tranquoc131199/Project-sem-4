/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Acer Nitro 5
 */
@Entity
@Table(name = "OrderDetails")
public class OrderDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "OrderDetailId")
    private Integer orderDetailId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "OrderDetailQuantity")
    private int orderDetailQuantity;
    @Basic(optional = false)
    @NotNull
    @Column(name = "OrderDetailPrice")
    private double orderDetailPrice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "OrderDetailSale")
    private int orderDetailSale;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CreatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "UpdatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "OrderDetailStatus")
    private int orderDetailStatus;
    @JoinColumn(name = "OrderId", referencedColumnName = "OrderId")
    @ManyToOne(optional = false)
    private Orders orderId;
    @JoinColumn(name = "ProductId", referencedColumnName = "ProductId")
    @ManyToOne
    private Products productId;

    public OrderDetails() {
    }

    public OrderDetails(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public OrderDetails(Integer orderDetailId, int orderDetailQuantity, double orderDetailPrice, int orderDetailSale, Date createdDate, Date updatedDate, int orderDetailStatus) {
        this.orderDetailId = orderDetailId;
        this.orderDetailQuantity = orderDetailQuantity;
        this.orderDetailPrice = orderDetailPrice;
        this.orderDetailSale = orderDetailSale;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.orderDetailStatus = orderDetailStatus;
    }

    public Integer getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getOrderDetailQuantity() {
        return orderDetailQuantity;
    }

    public void setOrderDetailQuantity(int orderDetailQuantity) {
        this.orderDetailQuantity = orderDetailQuantity;
    }

    public double getOrderDetailPrice() {
        return orderDetailPrice;
    }

    public void setOrderDetailPrice(double orderDetailPrice) {
        this.orderDetailPrice = orderDetailPrice;
    }

    public int getOrderDetailSale() {
        return orderDetailSale;
    }

    public void setOrderDetailSale(int orderDetailSale) {
        this.orderDetailSale = orderDetailSale;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public int getOrderDetailStatus() {
        return orderDetailStatus;
    }

    public void setOrderDetailStatus(int orderDetailStatus) {
        this.orderDetailStatus = orderDetailStatus;
    }

    public Orders getOrderId() {
        return orderId;
    }

    public void setOrderId(Orders orderId) {
        this.orderId = orderId;
    }

    public Products getProductId() {
        return productId;
    }

    public void setProductId(Products productId) {
        this.productId = productId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderDetailId != null ? orderDetailId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetails)) {
            return false;
        }
        OrderDetails other = (OrderDetails) object;
        if ((this.orderDetailId == null && other.orderDetailId != null) || (this.orderDetailId != null && !this.orderDetailId.equals(other.orderDetailId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.OrderDetails[ orderDetailId=" + orderDetailId + " ]";
    }
    
}
