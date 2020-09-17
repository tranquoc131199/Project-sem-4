/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Transports;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public interface TransportDAO {

    /**
     * Lấy tất cả các bản ghi Transports có TransportStatus = 1 để người dùng
     * lựa chọn lúc đặt hàng
     *
     * @return
     */
    public List<Transports> getAllTransportsClient();

    /**
     * Lấy phương thức vận chuyển theo mã
     *
     * @param transportId
     * @return
     */
    public Transports getTransportById(Integer transportId);

}
