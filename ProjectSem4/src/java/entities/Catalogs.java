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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "Catalogs")
public class Catalogs implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name = "CatalogId")
    private Integer catalogId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "CatalogName")
    private String catalogName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CatalogPiority")
    private int catalogPiority;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ParentId")
    private int parentId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "ParentName")
    private String parentName;
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
    @Column(name = "CatalogStatus")
    private int catalogStatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "catalogId")
    private Collection<News> newsCollection;
    @JoinColumn(name = "AdminId", referencedColumnName = "AdminId")
    @ManyToOne(optional = false)
    private Admins adminId;

    public Catalogs() {
    }

    public Catalogs(Integer catalogId) {
        this.catalogId = catalogId;
    }

    public Catalogs(Integer catalogId, String catalogName, int catalogPiority, int parentId, String parentName, Date createdDate, Date updatedDate, int catalogStatus) {
        this.catalogId = catalogId;
        this.catalogName = catalogName;
        this.catalogPiority = catalogPiority;
        this.parentId = parentId;
        this.parentName = parentName;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.catalogStatus = catalogStatus;
    }

    public Integer getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Integer catalogId) {
        this.catalogId = catalogId;
    }

    public String getCatalogName() {
        return catalogName;
    }

    public void setCatalogName(String catalogName) {
        this.catalogName = catalogName;
    }

    public int getCatalogPiority() {
        return catalogPiority;
    }

    public void setCatalogPiority(int catalogPiority) {
        this.catalogPiority = catalogPiority;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
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

    public int getCatalogStatus() {
        return catalogStatus;
    }

    public void setCatalogStatus(int catalogStatus) {
        this.catalogStatus = catalogStatus;
    }

    @XmlTransient
    public Collection<News> getNewsCollection() {
        return newsCollection;
    }

    public void setNewsCollection(Collection<News> newsCollection) {
        this.newsCollection = newsCollection;
    }

    public Admins getAdminId() {
        return adminId;
    }

    public void setAdminId(Admins adminId) {
        this.adminId = adminId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (catalogId != null ? catalogId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Catalogs)) {
            return false;
        }
        Catalogs other = (Catalogs) object;
        if ((this.catalogId == null && other.catalogId != null) || (this.catalogId != null && !this.catalogId.equals(other.catalogId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Catalogs[ catalogId=" + catalogId + " ]";
    }
    
}
