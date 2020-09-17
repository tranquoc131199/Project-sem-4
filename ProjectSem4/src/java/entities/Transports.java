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
@Table(name = "Transports")
public class Transports implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TransportId")
    private Integer transportId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "TransportName")
    private String transportName;
    @Size(max = 1073741823)
    @Column(name = "TransportDescription")
    private String transportDescription;
    @Basic(optional = false)
    @NotNull
    @Column(name = "TransportPrice")
    private double transportPrice;
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
    @Column(name = "TransportStatus")
    private int transportStatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "transportId")
    private Collection<Orders> ordersCollection;

    public Transports() {
    }

    public Transports(Integer transportId) {
        this.transportId = transportId;
    }

    public Transports(Integer transportId, String transportName, double transportPrice, Date createdDate, Date updatedDate, int transportStatus) {
        this.transportId = transportId;
        this.transportName = transportName;
        this.transportPrice = transportPrice;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.transportStatus = transportStatus;
    }

    public Integer getTransportId() {
        return transportId;
    }

    public void setTransportId(Integer transportId) {
        this.transportId = transportId;
    }

    public String getTransportName() {
        return transportName;
    }

    public void setTransportName(String transportName) {
        this.transportName = transportName;
    }

    public String getTransportDescription() {
        return transportDescription;
    }

    public void setTransportDescription(String transportDescription) {
        this.transportDescription = transportDescription;
    }

    public double getTransportPrice() {
        return transportPrice;
    }

    public void setTransportPrice(double transportPrice) {
        this.transportPrice = transportPrice;
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

    public int getTransportStatus() {
        return transportStatus;
    }

    public void setTransportStatus(int transportStatus) {
        this.transportStatus = transportStatus;
    }

    @XmlTransient
    public Collection<Orders> getOrdersCollection() {
        return ordersCollection;
    }

    public void setOrdersCollection(Collection<Orders> ordersCollection) {
        this.ordersCollection = ordersCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (transportId != null ? transportId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Transports)) {
            return false;
        }
        Transports other = (Transports) object;
        if ((this.transportId == null && other.transportId != null) || (this.transportId != null && !this.transportId.equals(other.transportId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Transports[ transportId=" + transportId + " ]";
    }

}
