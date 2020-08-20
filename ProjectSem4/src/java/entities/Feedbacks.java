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
@Table(name = "Feedbacks")
public class Feedbacks implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name = "FeedbackId")
    private Integer feedbackId;
    @Size(max = 250)
    @Column(name = "FeedbackFullname")
    private String feedbackFullname;
    @Size(max = 20)
    @Column(name = "FeedbackPhone")
    private String feedbackPhone;
    @Size(max = 250)
    @Column(name = "FeedbackEmail")
    private String feedbackEmail;
    @Size(max = 1073741823)
    @Column(name = "FeedbackAddress")
    private String feedbackAddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "FeedbackContent")
    private String feedbackContent;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FeedbacksTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date feedbacksTime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FeedbackStatus")
    private int feedbackStatus;
    @JoinColumn(name = "FeedbackCatalogId", referencedColumnName = "FeedbackCatalogId")
    @ManyToOne(optional = false)
    private FeedbackCatalogs feedbackCatalogId;

    public Feedbacks() {
    }

    public Feedbacks(Integer feedbackId) {
        this.feedbackId = feedbackId;
    }

    public Feedbacks(Integer feedbackId, String feedbackContent, Date feedbacksTime, int feedbackStatus) {
        this.feedbackId = feedbackId;
        this.feedbackContent = feedbackContent;
        this.feedbacksTime = feedbacksTime;
        this.feedbackStatus = feedbackStatus;
    }

    public Integer getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(Integer feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getFeedbackFullname() {
        return feedbackFullname;
    }

    public void setFeedbackFullname(String feedbackFullname) {
        this.feedbackFullname = feedbackFullname;
    }

    public String getFeedbackPhone() {
        return feedbackPhone;
    }

    public void setFeedbackPhone(String feedbackPhone) {
        this.feedbackPhone = feedbackPhone;
    }

    public String getFeedbackEmail() {
        return feedbackEmail;
    }

    public void setFeedbackEmail(String feedbackEmail) {
        this.feedbackEmail = feedbackEmail;
    }

    public String getFeedbackAddress() {
        return feedbackAddress;
    }

    public void setFeedbackAddress(String feedbackAddress) {
        this.feedbackAddress = feedbackAddress;
    }

    public String getFeedbackContent() {
        return feedbackContent;
    }

    public void setFeedbackContent(String feedbackContent) {
        this.feedbackContent = feedbackContent;
    }

    public Date getFeedbacksTime() {
        return feedbacksTime;
    }

    public void setFeedbacksTime(Date feedbacksTime) {
        this.feedbacksTime = feedbacksTime;
    }

    public int getFeedbackStatus() {
        return feedbackStatus;
    }

    public void setFeedbackStatus(int feedbackStatus) {
        this.feedbackStatus = feedbackStatus;
    }

    public FeedbackCatalogs getFeedbackCatalogId() {
        return feedbackCatalogId;
    }

    public void setFeedbackCatalogId(FeedbackCatalogs feedbackCatalogId) {
        this.feedbackCatalogId = feedbackCatalogId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (feedbackId != null ? feedbackId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Feedbacks)) {
            return false;
        }
        Feedbacks other = (Feedbacks) object;
        if ((this.feedbackId == null && other.feedbackId != null) || (this.feedbackId != null && !this.feedbackId.equals(other.feedbackId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Feedbacks[ feedbackId=" + feedbackId + " ]";
    }
    
}
