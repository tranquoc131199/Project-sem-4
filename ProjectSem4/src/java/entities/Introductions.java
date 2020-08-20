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
@Table(name = "Introductions")
public class Introductions implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name = "IntroductionId")
    private Integer introductionId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "IntroductionContent")
    private String introductionContent;
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
    @Column(name = "IntroductionStatus")
    private int introductionStatus;
    @JoinColumn(name = "AdminId", referencedColumnName = "AdminId")
    @ManyToOne(optional = false)
    private Admins adminId;

    public Introductions() {
    }

    public Introductions(Integer introductionId) {
        this.introductionId = introductionId;
    }

    public Introductions(Integer introductionId, String introductionContent, Date createdDate, Date updatedDate, int introductionStatus) {
        this.introductionId = introductionId;
        this.introductionContent = introductionContent;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.introductionStatus = introductionStatus;
    }

    public Integer getIntroductionId() {
        return introductionId;
    }

    public void setIntroductionId(Integer introductionId) {
        this.introductionId = introductionId;
    }

    public String getIntroductionContent() {
        return introductionContent;
    }

    public void setIntroductionContent(String introductionContent) {
        this.introductionContent = introductionContent;
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

    public int getIntroductionStatus() {
        return introductionStatus;
    }

    public void setIntroductionStatus(int introductionStatus) {
        this.introductionStatus = introductionStatus;
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
        hash += (introductionId != null ? introductionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Introductions)) {
            return false;
        }
        Introductions other = (Introductions) object;
        if ((this.introductionId == null && other.introductionId != null) || (this.introductionId != null && !this.introductionId.equals(other.introductionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Introductions[ introductionId=" + introductionId + " ]";
    }
    
}
