/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Admins;
import java.util.List;

/**
 *
 * @author Thang Pham
 */
public interface AdminDAO {
    
    public List<Admins> getAllAdmins();
    
    public Integer countAllAdmins();
    
    public List<Admins> getAllAdminsForPaging(Integer start, Integer limit);
    
    public Integer countAllAdminByAdminEmail(String adminEmail);
    
    public List<Admins> searchAdminByEmail(String adminEmail, Integer start, Integer limit);

    public Admins getAdminById(Integer adminId);
    
    public Boolean insertAdmin(Admins admin);
    
    public Boolean updateAdmin(Admins admin);
    
    public Admins checkAdminLogin(String adminEmail);
    
    public Boolean changeAdminPassword(Integer adminId, String adminPassword);
    
    public Boolean changeAdminAvatar(Integer adminId, String adminAvatar);
    
    public Boolean checkAdminEmailExists(String adminEmail);
    
    public Boolean checkAdminIdCardExists(String adminIdCard);
    
    public Boolean checkAdminPhoneExists(String adminPhone);
    
    public Boolean checkAdminAvatarExists(String adminAvatar);
}
