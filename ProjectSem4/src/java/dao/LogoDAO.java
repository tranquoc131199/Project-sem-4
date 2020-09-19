/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Logoes;
import java.util.List;

/**
 *
 * @author Thang Pham
 */
public interface LogoDAO {
    
    public List<Logoes> getAllLogoes(Integer start, Integer limit);
    
    public Integer countAllLogoes();
    
    public Logoes getLogoToDisplay();
    
    public Boolean insertLogo(Logoes logo);
    
    public Boolean updateLogo(Logoes logo);
    
    public Logoes getLogoById(Integer logoId);
    
    public Boolean disableLogo(Integer logoId);
    
    public Boolean disableAllLogo();
    
    public Boolean enableLogo(Integer logoId);
    
    public Boolean checkLogoImageExists(String logoImage);
}
