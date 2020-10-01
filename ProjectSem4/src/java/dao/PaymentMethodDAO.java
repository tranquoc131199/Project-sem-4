/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.PaymentMethods;
import java.util.List;

/**
 *
 * @author Acer Nitro 5
 */
public interface PaymentMethodDAO {

    /**
     * Lấy ra danh sách tất cả các bản ghi PaymentMethods có PaymentMethodStatus
     * = 1 để người dùng lựa chọn lúc đặt hàng
     *
     * @return
     */
    public List<PaymentMethods> getAllPaymentMethodsClient();

    /**
     * Lấy phương thức thanh toán theo mã
     *
     * @param paymentMethodId
     * @return
     */
    public PaymentMethods getPaymentMethodById(Integer paymentMethodId);

    public Integer countAllPaymentMethods();

    public List<PaymentMethods> getAllPaymentMethodsForPaging(Integer start, Integer limit);

    public Boolean checkPaymentMethodNameExists(String paymentMethodName);

    public Boolean insertPaymentMethod(PaymentMethods paymentMethod);

    public Boolean updatePaymentMethod(PaymentMethods paymentMethod);

    public Boolean disablePaymentMethod(Integer paymentMethodId);

    public Boolean enablePaymentMethod(Integer paymentMethodId);
}
