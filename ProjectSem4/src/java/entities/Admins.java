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
@Table(name = "Admins")
public class Admins implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name = "AdminId")
    private Integer adminId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "AdminEmail")
    private String adminEmail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    @Column(name = "AdminPassword")
    private String adminPassword;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "AdminFullName")
    private String adminFullName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "AdminBirthday")
    @Temporal(TemporalType.DATE)
    private Date adminBirthday;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "AdminIdCard")
    private String adminIdCard;
    @Basic(optional = false)
    @NotNull
    @Column(name = "AdminGender")
    private int adminGender;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "AdminAddress")
    private String adminAddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "AdminHomeLand")
    private String adminHomeLand;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "AdminPhone")
    private String adminPhone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "AdminAvatar")
    private String adminAvatar;
    @Basic(optional = false)
    @NotNull
    @Column(name = "AdminStatus")
    private int adminStatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "adminId")
    private Collection<News> newsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "adminId")
    private Collection<Introductions> introductionsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "adminId")
    private Collection<Catalogs> catalogsCollection;

    public Admins() {
    }

    public Admins(Integer adminId) {
        this.adminId = adminId;
    }

    public Admins(Integer adminId, String adminEmail, String adminPassword, String adminFullName, Date adminBirthday, String adminIdCard, int adminGender, String adminAddress, String adminHomeLand, String adminPhone, String adminAvatar, int adminStatus) {
        this.adminId = adminId;
        this.adminEmail = adminEmail;
        this.adminPassword = adminPassword;
        this.adminFullName = adminFullName;
        this.adminBirthday = adminBirthday;
        this.adminIdCard = adminIdCard;
        this.adminGender = adminGender;
        this.adminAddress = adminAddress;
        this.adminHomeLand = adminHomeLand;
        this.adminPhone = adminPhone;
        this.adminAvatar = adminAvatar;
        this.adminStatus = adminStatus;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getAdminFullName() {
        return adminFullName;
    }

    public void setAdminFullName(String adminFullName) {
        this.adminFullName = adminFullName;
    }

    public Date getAdminBirthday() {
        return adminBirthday;
    }

    public void setAdminBirthday(Date adminBirthday) {
        this.adminBirthday = adminBirthday;
    }

    public String getAdminIdCard() {
        return adminIdCard;
    }

    public void setAdminIdCard(String adminIdCard) {
        this.adminIdCard = adminIdCard;
    }

    public int getAdminGender() {
        return adminGender;
    }

    public void setAdminGender(int adminGender) {
        this.adminGender = adminGender;
    }

    public String getAdminAddress() {
        return adminAddress;
    }

    public void setAdminAddress(String adminAddress) {
        this.adminAddress = adminAddress;
    }

    public String getAdminHomeLand() {
        return adminHomeLand;
    }

    public void setAdminHomeLand(String adminHomeLand) {
        this.adminHomeLand = adminHomeLand;
    }

    public String getAdminPhone() {
        return adminPhone;
    }

    public void setAdminPhone(String adminPhone) {
        this.adminPhone = adminPhone;
    }

    public String getAdminAvatar() {
        return adminAvatar;
    }

    public void setAdminAvatar(String adminAvatar) {
        this.adminAvatar = adminAvatar;
    }

    public int getAdminStatus() {
        return adminStatus;
    }

    public void setAdminStatus(int adminStatus) {
        this.adminStatus = adminStatus;
    }

    @XmlTransient
    public Collection<News> getNewsCollection() {
        return newsCollection;
    }

    public void setNewsCollection(Collection<News> newsCollection) {
        this.newsCollection = newsCollection;
    }

    @XmlTransient
    public Collection<Introductions> getIntroductionsCollection() {
        return introductionsCollection;
    }

    public void setIntroductionsCollection(Collection<Introductions> introductionsCollection) {
        this.introductionsCollection = introductionsCollection;
    }

    @XmlTransient
    public Collection<Catalogs> getCatalogsCollection() {
        return catalogsCollection;
    }

    public void setCatalogsCollection(Collection<Catalogs> catalogsCollection) {
        this.catalogsCollection = catalogsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (adminId != null ? adminId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Admins)) {
            return false;
        }
        Admins other = (Admins) object;
        if ((this.adminId == null && other.adminId != null) || (this.adminId != null && !this.adminId.equals(other.adminId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Admins[ adminId=" + adminId + " ]";
    }

}
