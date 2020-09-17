/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Acer Nitro 5
 */
@Entity
@Table(name = "Customers")
public class Customers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CustomerId")
    private Integer customerId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "CustomerFullName")
    private String customerFullName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "CustomerEmail")
    private String customerEmail;
    @Size(max = 20)
    @Column(name = "CustomerPhone")
    private String customerPhone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    @Column(name = "CustomerPassword")
    private String customerPassword;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "CustomerAvatar")
    private String customerAvatar;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CustomerGender")
    private int customerGender;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CustomerBirthday")
    @Temporal(TemporalType.DATE)
    private Date customerBirthday;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "CustomerAddress")
    private String customerAddress;
    @Size(max = 20)
    @Column(name = "CustomerCheckCode")
    private String customerCheckCode;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CustomerStatus")
    private int customerStatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customerId")
    private Collection<Orders> ordersCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customerId")
    private Collection<ProductComments> productCommentsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customerId")
    private Collection<Wishlists> wishlistsCollection;

    public Customers() {
    }

    public Customers(Integer customerId) {
        this.customerId = customerId;
    }

    public Customers(Integer customerId, String customerFullName, String customerEmail, String customerPassword, String customerAvatar, int customerGender, Date customerBirthday, String customerAddress, int customerStatus) {
        this.customerId = customerId;
        this.customerFullName = customerFullName;
        this.customerEmail = customerEmail;
        this.customerPassword = customerPassword;
        this.customerAvatar = customerAvatar;
        this.customerGender = customerGender;
        this.customerBirthday = customerBirthday;
        this.customerAddress = customerAddress;
        this.customerStatus = customerStatus;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCustomerFullName() {
        return customerFullName;
    }

    public void setCustomerFullName(String customerFullName) {
        this.customerFullName = customerFullName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public String getCustomerAvatar() {
        return customerAvatar;
    }

    public void setCustomerAvatar(String customerAvatar) {
        this.customerAvatar = customerAvatar;
    }

    public int getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(int customerGender) {
        this.customerGender = customerGender;
    }

    public Date getCustomerBirthday() {
        return customerBirthday;
    }

    public void setCustomerBirthday(Date customerBirthday) {
        this.customerBirthday = customerBirthday;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerCheckCode() {
        return customerCheckCode;
    }

    public void setCustomerCheckCode(String customerCheckCode) {
        this.customerCheckCode = customerCheckCode;
    }

    public int getCustomerStatus() {
        return customerStatus;
    }

    public void setCustomerStatus(int customerStatus) {
        this.customerStatus = customerStatus;
    }

    @XmlTransient
    public Collection<Orders> getOrdersCollection() {
        return ordersCollection;
    }

    public void setOrdersCollection(Collection<Orders> ordersCollection) {
        this.ordersCollection = ordersCollection;
    }

    @XmlTransient
    public Collection<ProductComments> getProductCommentsCollection() {
        return productCommentsCollection;
    }

    public void setProductCommentsCollection(Collection<ProductComments> productCommentsCollection) {
        this.productCommentsCollection = productCommentsCollection;
    }

    @XmlTransient
    public Collection<Wishlists> getWishlistsCollection() {
        return wishlistsCollection;
    }

    public void setWishlistsCollection(Collection<Wishlists> wishlistsCollection) {
        this.wishlistsCollection = wishlistsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (customerId != null ? customerId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customers)) {
            return false;
        }
        Customers other = (Customers) object;
        if ((this.customerId == null && other.customerId != null) || (this.customerId != null && !this.customerId.equals(other.customerId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Customers[ customerId=" + customerId + " ]";
    }

}
