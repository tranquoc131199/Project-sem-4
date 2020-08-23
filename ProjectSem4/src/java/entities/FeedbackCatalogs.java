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
@Table(name = "FeedbackCatalogs")
public class FeedbackCatalogs implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name = "FeedbackCatalogId")
    private Integer feedbackCatalogId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "FeedbackCatalogName")
    private String feedbackCatalogName;
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
    @Column(name = "FeedbackCatalogStatus")
    private int feedbackCatalogStatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "feedbackCatalogId")
    private Collection<Feedbacks> feedbacksCollection;

    public FeedbackCatalogs() {
    }

    public FeedbackCatalogs(Integer feedbackCatalogId) {
        this.feedbackCatalogId = feedbackCatalogId;
    }

    public FeedbackCatalogs(Integer feedbackCatalogId, String feedbackCatalogName, Date createdDate, Date updatedDate, int feedbackCatalogStatus) {
        this.feedbackCatalogId = feedbackCatalogId;
        this.feedbackCatalogName = feedbackCatalogName;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.feedbackCatalogStatus = feedbackCatalogStatus;
    }

    public Integer getFeedbackCatalogId() {
        return feedbackCatalogId;
    }

    public void setFeedbackCatalogId(Integer feedbackCatalogId) {
        this.feedbackCatalogId = feedbackCatalogId;
    }

    public String getFeedbackCatalogName() {
        return feedbackCatalogName;
    }

    public void setFeedbackCatalogName(String feedbackCatalogName) {
        this.feedbackCatalogName = feedbackCatalogName;
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

    public int getFeedbackCatalogStatus() {
        return feedbackCatalogStatus;
    }

    public void setFeedbackCatalogStatus(int feedbackCatalogStatus) {
        this.feedbackCatalogStatus = feedbackCatalogStatus;
    }

    @XmlTransient
    public Collection<Feedbacks> getFeedbacksCollection() {
        return feedbacksCollection;
    }

    public void setFeedbacksCollection(Collection<Feedbacks> feedbacksCollection) {
        this.feedbacksCollection = feedbacksCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (feedbackCatalogId != null ? feedbackCatalogId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FeedbackCatalogs)) {
            return false;
        }
        FeedbackCatalogs other = (FeedbackCatalogs) object;
        if ((this.feedbackCatalogId == null && other.feedbackCatalogId != null) || (this.feedbackCatalogId != null && !this.feedbackCatalogId.equals(other.feedbackCatalogId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.FeedbackCatalogs[ feedbackCatalogId=" + feedbackCatalogId + " ]";
    }
    
}
