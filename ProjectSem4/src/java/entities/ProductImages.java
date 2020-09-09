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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


/**
 *
 * @author Acer Nitro 5
 */
@Entity
@Table(name = "ProductImages")

public class ProductImages implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductImageId")
    private Integer productImageId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1000)
    @Column(name = "ProductImage")
    private String productImage;
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
    @Column(name = "ProductImageStatus")
    private int productImageStatus;
    @JoinColumn(name = "ProductId", referencedColumnName = "ProductId")
    @ManyToOne(optional = false)
    private Products productId;

    public ProductImages() {
    }

    public ProductImages(Integer productImageId) {
        this.productImageId = productImageId;
    }

    public ProductImages(Integer productImageId, String productImage, Date createdDate, Date updatedDate, int productImageStatus) {
        this.productImageId = productImageId;
        this.productImage = productImage;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.productImageStatus = productImageStatus;
    }

    public Integer getProductImageId() {
        return productImageId;
    }

    public void setProductImageId(Integer productImageId) {
        this.productImageId = productImageId;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
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

    public int getProductImageStatus() {
        return productImageStatus;
    }

    public void setProductImageStatus(int productImageStatus) {
        this.productImageStatus = productImageStatus;
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
        hash += (productImageId != null ? productImageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductImages)) {
            return false;
        }
        ProductImages other = (ProductImages) object;
        if ((this.productImageId == null && other.productImageId != null) || (this.productImageId != null && !this.productImageId.equals(other.productImageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.ProductImages[ productImageId=" + productImageId + " ]";
    }
    
}
