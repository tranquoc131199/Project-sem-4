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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Acer Nitro 5
 */
@Entity
@Table(name = "ProductComments")
public class ProductComments implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name = "ProductCommentId")
    private Integer productCommentId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ProductCommentRate")
    private int productCommentRate;
    @Size(max = 500)
    @Column(name = "ProductCommentContent")
    private String productCommentContent;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ProductCommentTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date productCommentTime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ProductCommentStatus")
    private int productCommentStatus;
    @JoinColumn(name = "CustomerId", referencedColumnName = "CustomerId")
    @ManyToOne(optional = false)
    private Customers customerId;
    @JoinColumn(name = "ProductId", referencedColumnName = "ProductId")
    @ManyToOne(optional = false)
    private Products productId;

    public ProductComments() {
    }

    public ProductComments(Integer productCommentId) {
        this.productCommentId = productCommentId;
    }

    public ProductComments(Integer productCommentId, int productCommentRate, Date productCommentTime, int productCommentStatus) {
        this.productCommentId = productCommentId;
        this.productCommentRate = productCommentRate;
        this.productCommentTime = productCommentTime;
        this.productCommentStatus = productCommentStatus;
    }

    public Integer getProductCommentId() {
        return productCommentId;
    }

    public void setProductCommentId(Integer productCommentId) {
        this.productCommentId = productCommentId;
    }

    public int getProductCommentRate() {
        return productCommentRate;
    }

    public void setProductCommentRate(int productCommentRate) {
        this.productCommentRate = productCommentRate;
    }

    public String getProductCommentContent() {
        return productCommentContent;
    }

    public void setProductCommentContent(String productCommentContent) {
        this.productCommentContent = productCommentContent;
    }

    public Date getProductCommentTime() {
        return productCommentTime;
    }

    public void setProductCommentTime(Date productCommentTime) {
        this.productCommentTime = productCommentTime;
    }

    public int getProductCommentStatus() {
        return productCommentStatus;
    }

    public void setProductCommentStatus(int productCommentStatus) {
        this.productCommentStatus = productCommentStatus;
    }

    public Customers getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customers customerId) {
        this.customerId = customerId;
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
        hash += (productCommentId != null ? productCommentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductComments)) {
            return false;
        }
        ProductComments other = (ProductComments) object;
        if ((this.productCommentId == null && other.productCommentId != null) || (this.productCommentId != null && !this.productCommentId.equals(other.productCommentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.ProductComments[ productCommentId=" + productCommentId + " ]";
    }
    
}
