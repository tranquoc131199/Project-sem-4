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
@Table(name = "Products")
public class Products implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductId")
    private Integer productId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "ProductName")
    private String productName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ProductCode")
    private String productCode;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ProductStarAvg")
    private double productStarAvg;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "ProductFeatureImage")
    private String productFeatureImage;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "ProductImages")
    private String productImages;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ProductPrice")
    private double productPrice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ProductSale")
    private int productSale;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ProductWarranty")
    private int productWarranty;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ProductSaleQuantity")
    private int productSaleQuantity;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "ProductDescription")
    private String productDescription;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1000)
    @Column(name = "SpecificationName")
    private String specificationName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "SpecificationValue")
    private String specificationValue;
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
    @Column(name = "ProductStatus")
    private int productStatus;
    @JoinColumn(name = "BrandId", referencedColumnName = "BrandId")
    @ManyToOne(optional = false)
    private Brands brandId;
    @JoinColumn(name = "CategoryId", referencedColumnName = "CategoryId")
    @ManyToOne(optional = false)
    private Categories categoryId;

    public Products() {
    }

    public Products(Integer productId) {
        this.productId = productId;
    }

    public Products(Integer productId, String productName, String productCode, double productStarAvg, String productFeatureImage, String productImages, double productPrice, int productSale, int productWarranty, int productSaleQuantity, String productDescription, String specificationName, String specificationValue, Date createdDate, Date updatedDate, int productStatus) {
        this.productId = productId;
        this.productName = productName;
        this.productCode = productCode;
        this.productStarAvg = productStarAvg;
        this.productFeatureImage = productFeatureImage;
        this.productImages = productImages;
        this.productPrice = productPrice;
        this.productSale = productSale;
        this.productWarranty = productWarranty;
        this.productSaleQuantity = productSaleQuantity;
        this.productDescription = productDescription;
        this.specificationName = specificationName;
        this.specificationValue = specificationValue;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.productStatus = productStatus;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public double getProductStarAvg() {
        return productStarAvg;
    }

    public void setProductStarAvg(double productStarAvg) {
        this.productStarAvg = productStarAvg;
    }

    public String getProductFeatureImage() {
        return productFeatureImage;
    }

    public void setProductFeatureImage(String productFeatureImage) {
        this.productFeatureImage = productFeatureImage;
    }

    public String getProductImages() {
        return productImages;
    }

    public void setProductImages(String productImages) {
        this.productImages = productImages;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductSale() {
        return productSale;
    }

    public void setProductSale(int productSale) {
        this.productSale = productSale;
    }

    public int getProductWarranty() {
        return productWarranty;
    }

    public void setProductWarranty(int productWarranty) {
        this.productWarranty = productWarranty;
    }

    public int getProductSaleQuantity() {
        return productSaleQuantity;
    }

    public void setProductSaleQuantity(int productSaleQuantity) {
        this.productSaleQuantity = productSaleQuantity;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getSpecificationName() {
        return specificationName;
    }

    public void setSpecificationName(String specificationName) {
        this.specificationName = specificationName;
    }

    public String getSpecificationValue() {
        return specificationValue;
    }

    public void setSpecificationValue(String specificationValue) {
        this.specificationValue = specificationValue;
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

    public int getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(int productStatus) {
        this.productStatus = productStatus;
    }

    public Brands getBrandId() {
        return brandId;
    }

    public void setBrandId(Brands brandId) {
        this.brandId = brandId;
    }

    public Categories getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Categories categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Products[ productId=" + productId + " ]";
    }
    
}
