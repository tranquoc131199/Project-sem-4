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
@Table(name = "Logoes")
public class Logoes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name = "LogoId")
    private Integer logoId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "LogoImage")
    private String logoImage;
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
    @Column(name = "LogoStatus")
    private int logoStatus;

    public Logoes() {
    }

    public Logoes(Integer logoId) {
        this.logoId = logoId;
    }

    public Logoes(Integer logoId, String logoImage, Date createdDate, Date updatedDate, int logoStatus) {
        this.logoId = logoId;
        this.logoImage = logoImage;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.logoStatus = logoStatus;
    }

    public Integer getLogoId() {
        return logoId;
    }

    public void setLogoId(Integer logoId) {
        this.logoId = logoId;
    }

    public String getLogoImage() {
        return logoImage;
    }

    public void setLogoImage(String logoImage) {
        this.logoImage = logoImage;
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

    public int getLogoStatus() {
        return logoStatus;
    }

    public void setLogoStatus(int logoStatus) {
        this.logoStatus = logoStatus;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (logoId != null ? logoId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Logoes)) {
            return false;
        }
        Logoes other = (Logoes) object;
        if ((this.logoId == null && other.logoId != null) || (this.logoId != null && !this.logoId.equals(other.logoId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Logoes[ logoId=" + logoId + " ]";
    }
    
}
