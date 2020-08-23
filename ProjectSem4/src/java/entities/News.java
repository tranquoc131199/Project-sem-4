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
@Table(name = "News")
public class News implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name = "NewId")
    private Integer newId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "NewTitle")
    private String newTitle;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "NewImage")
    private String newImage;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "NewDescription")
    private String newDescription;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "NewContent")
    private String newContent;
    @Basic(optional = false)
    @NotNull
    @Column(name = "NewLike")
    private int newLike;
    @Basic(optional = false)
    @NotNull
    @Column(name = "NewViewed")
    private int newViewed;
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
    @Column(name = "NewStatus")
    private int newStatus;
    @JoinColumn(name = "AdminId", referencedColumnName = "AdminId")
    @ManyToOne(optional = false)
    private Admins adminId;
    @JoinColumn(name = "CatalogId", referencedColumnName = "CatalogId")
    @ManyToOne(optional = false)
    private Catalogs catalogId;

    public News() {
    }

    public News(Integer newId) {
        this.newId = newId;
    }

    public News(Integer newId, String newTitle, String newImage, String newDescription, String newContent, int newLike, int newViewed, Date createdDate, Date updatedDate, int newStatus) {
        this.newId = newId;
        this.newTitle = newTitle;
        this.newImage = newImage;
        this.newDescription = newDescription;
        this.newContent = newContent;
        this.newLike = newLike;
        this.newViewed = newViewed;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.newStatus = newStatus;
    }

    public Integer getNewId() {
        return newId;
    }

    public void setNewId(Integer newId) {
        this.newId = newId;
    }

    public String getNewTitle() {
        return newTitle;
    }

    public void setNewTitle(String newTitle) {
        this.newTitle = newTitle;
    }

    public String getNewImage() {
        return newImage;
    }

    public void setNewImage(String newImage) {
        this.newImage = newImage;
    }

    public String getNewDescription() {
        return newDescription;
    }

    public void setNewDescription(String newDescription) {
        this.newDescription = newDescription;
    }

    public String getNewContent() {
        return newContent;
    }

    public void setNewContent(String newContent) {
        this.newContent = newContent;
    }

    public int getNewLike() {
        return newLike;
    }

    public void setNewLike(int newLike) {
        this.newLike = newLike;
    }

    public int getNewViewed() {
        return newViewed;
    }

    public void setNewViewed(int newViewed) {
        this.newViewed = newViewed;
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

    public int getNewStatus() {
        return newStatus;
    }

    public void setNewStatus(int newStatus) {
        this.newStatus = newStatus;
    }

    public Admins getAdminId() {
        return adminId;
    }

    public void setAdminId(Admins adminId) {
        this.adminId = adminId;
    }

    public Catalogs getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Catalogs catalogId) {
        this.catalogId = catalogId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (newId != null ? newId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof News)) {
            return false;
        }
        News other = (News) object;
        if ((this.newId == null && other.newId != null) || (this.newId != null && !this.newId.equals(other.newId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.News[ newId=" + newId + " ]";
    }
    
}
