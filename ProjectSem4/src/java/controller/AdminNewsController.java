/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.paging;
import dao.CatalogDAO;
import common.validate;
import dao.NewDAO;
import entities.Admins;
import entities.Catalogs;
import entities.Logoes;
import entities.News;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Acer Nitro 5
 */
@Controller
@RequestMapping(value = "admin")
public class AdminNewsController {

    private NewDAO newDAO;
    private CatalogDAO catalogDAO;

    @Autowired
    public void setCatalogDAO(CatalogDAO catalogDAO) {
        this.catalogDAO = catalogDAO;
    }

    @Autowired
    public void setNewDAO(NewDAO newDAO) {
        this.newDAO = newDAO;
    }

    @RequestMapping(value = "catalog")
    public String index(RedirectAttributes attributes, HttpSession session, Model model) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }
        List<Catalogs> catalogs = catalogDAO.getAllCatalogs();
        if (catalogs.size() > 0) {
            model.addAttribute("catalogs", catalogs);
        }

        model.addAttribute("title", "Quản lý danh mục tin tức");
        return "Admin/catalog-list";
    }

    @RequestMapping(value = "catalog/initInsertCatalog")
    public String doInsertCatalog(HttpSession session, Model model) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.html";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }
        //khai bao list catalog
        List<Catalogs> catalogs = catalogDAO.getAllCatalogs();

        if (catalogs.size() > 0) {
            model.addAttribute("catalogs", catalogs);
        }

        model.addAttribute("maxPiority", catalogDAO.getMaxCatalogPiority() + 1);
        model.addAttribute("title", "Thêm mới danh mục tin tức");
        return "Admin/catalog-insert";
    }

    @RequestMapping(value = "catalog/insertCatalog", method = RequestMethod.POST)
    public String doInsertCatalog(RedirectAttributes attributes, HttpSession session, String catalogName, Integer catalogPiority, Integer parentId, Integer catalogStatus) {

        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }
        if (validate.isEmpty(catalogName)) {
            attributes.addFlashAttribute("error", "Tên danh mục không được để trống!");
            return "redirect:/admin/catalog/initInsertCatalog.htm";
        }

        String parentName;

        if (parentId <= 0) {
            parentName = "Không có";
        } else {
            Catalogs catalogCheck = catalogDAO.getCatalogById(parentId);

            if (catalogCheck == null) {
                attributes.addFlashAttribute("error", "Mã danh mục cha không tồn tại!");
                return "redirect:/admin/catalog/initInsertCatalog.htm";
            } else {
                parentName = catalogCheck.getCatalogName();
            }
        }
        Catalogs catalog = new Catalogs();
        catalog.setAdminId((Admins) session.getAttribute("adminLogin"));
        catalog.setCatalogName(catalogName);
        catalog.setCatalogPiority(catalogPiority);
        catalog.setCatalogStatus(catalogStatus);
        catalog.setParentId(parentId);
        catalog.setParentName(parentName);
        catalog.setCreatedDate(new Date());
        catalog.setUpdatedDate(new Date());

        boolean check = catalogDAO.insertCatalog(catalog);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể thêm mới danh mục tin tức vào lúc này!");
            return "redirect:/admin/catalog/initInsertCatalog.htm";
        } else {
            attributes.addFlashAttribute("success", "Thêm mới danh mục tin tức thành công!");
            return "redirect:/admin/catalog.htm";
        }
    }

    @RequestMapping(value = "catalog/disable")
    public String disableCatalog(RedirectAttributes attributes, HttpSession session, String catalogId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        int catalogIdCheck = validate.convertStringToInt(catalogId, 0);
        Catalogs catalog = catalogDAO.getCatalogById(catalogIdCheck);

        if (catalog == null) {
            attributes.addFlashAttribute("error", "Mã danh mục không tồn tại!");
            return "redirect:/admin/catalog.html";
        }

        boolean check = catalogDAO.disableCatalog(catalogIdCheck);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể cập nhật danh mục tin tức vào lúc này!");
            return "redirect:/admin/catalog.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật trạng thái thành công <3");
            return "redirect:/admin/catalog.htm";
        }
    }

    @RequestMapping(value = "/catalog/enable")
    public String enableCatalog(RedirectAttributes attributes, HttpSession session, String catalogId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        int catalogIdCheck = validate.convertStringToInt(catalogId, 0);
        Catalogs catalog = catalogDAO.getCatalogById(catalogIdCheck);

        if (catalog == null) {
            attributes.addFlashAttribute("error", "Mã danh mục không tồn tại!");
            return "redirect:/admin/catalog.htm";
        }

        boolean check = catalogDAO.enableCatalog(catalogIdCheck);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể cập nhật danh mục tin tức vào lúc này!");
            return "redirect:/admin/catalog.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật trạng thái thành công <3");
            return "redirect:/admin/catalog.htm";
        }
    }

    @RequestMapping(value = "catalog/initUpdateCatalog")
    public String updateCatalog(RedirectAttributes attributes, HttpSession session, Model model, String catalogId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        List<Catalogs> catalogs = catalogDAO.getAllCatalogs();

        if (catalogs.size() > 0) {
            model.addAttribute("catalogs", catalogs);
        }

        int catalogIdCheck = validate.convertStringToInt(catalogId, 0);
        Catalogs catalog = catalogDAO.getCatalogById(catalogIdCheck);

        if (catalog == null) {
            attributes.addFlashAttribute("error", "Mã danh mục cha không tồn tại!");
            return "redirect:index.htm";
        }

        model.addAttribute("catalog", catalog);
        model.addAttribute("title", "Cập nhật danh mục tin tức");
        return "Admin/catalog-update";
    }

    @RequestMapping(value = "catalog/updateCatalog", method = RequestMethod.POST)
    public String doUpdateCatalog(RedirectAttributes attributes, HttpSession session, Integer catalogId, String catalogName, Integer catalogPiority, Integer parentId, Integer catalogStatus) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        Catalogs catalog = catalogDAO.getCatalogById(catalogId);
        String parentName;

        if (catalog == null) {
            attributes.addFlashAttribute("error", "Mã danh mục cha không tồn tại!");
            return "redirect:/admin/catalog.htm";
        }

        if (validate.isEmpty(catalogName)) {
            attributes.addFlashAttribute("error", "Tên danh mục không được để trống!");
            return "redirect:/admin/catalog/initUpdateCatalog.htm";
        }

        if (catalogPiority <= 0) {
            attributes.addFlashAttribute("error", "Độ ưu tiên không hợp lệ!");
            return "redirect:/admin/catalog/initUpdateCatalog.htm";
        }

        if (catalogStatus != 1 && catalogStatus != 0) {
            attributes.addFlashAttribute("error", "Trạng thái không hợp lệ!");
            return "redirect:/admin/catalog/initUpdateCatalog.htm";
        }

        if (parentId <= 0) {
            parentName = "Không có";
        } else {
            Catalogs catalogCheck = catalogDAO.getCatalogById(parentId);

            if (catalogCheck == null) {
                attributes.addFlashAttribute("error", "Mã danh mục cha không tồn tại!");
                return "redirect:/admin/catalog/initUpdateCatalog.htm";
            } else {
                parentName = catalogCheck.getCatalogName();
            }
        }

        catalog.setAdminId((Admins) session.getAttribute("adminLogin"));
        catalog.setCatalogName(catalogName);
        catalog.setCatalogPiority(catalogPiority);
        catalog.setCatalogStatus(catalogStatus);
        catalog.setParentId(parentId);
        catalog.setParentName(parentName);
        catalog.setUpdatedDate(new Date());

        boolean check = catalogDAO.updateCatalog(catalog);

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể thêm mới danh mục tin tức vào lúc này!");
            return "redirect:/admin/catalog/initUpdateCatalog.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật danh mục tin tức thành công!");
            return "redirect:/admin/catalog.htm";
        }
    }

    @RequestMapping(value = "new")
    public String index(RedirectAttributes attributes, HttpSession session, Model model, Integer page, String catalogId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        if (page == null || page <= 0) {
            page = 1;
        }

        int totalRecords;
        String firstLink = "/ProjectSem4/admin/new/";
        String currentLink = "/ProjectSem4/admin/new/";
        List<News> news;
        paging paging;
        List<Catalogs> catalogs = catalogDAO.getAllCatalogs();
        model.addAttribute("title", "Quản lý tin tức");

        if (catalogId == null || catalogId.equals("")) {
            totalRecords = newDAO.countAllNews();
            firstLink += "index.htm";
            currentLink += "index.htm{p}";
            paging = new paging(page, totalRecords, 12, currentLink, firstLink);
            news = newDAO.getAllNews(paging.startRecord, 12);

            if (news.size() > 0) {
                model.addAttribute("news", news);
            }

            if (paging.generateHtml().length() > 0) {
                model.addAttribute("paging", paging.generateHtml());
            }

            if (catalogs.size() > 0) {
                model.addAttribute("catalogs", catalogs);
            }

            return "Admin/new-list";
        } else {
            int catalogIdCheck = validate.convertStringToInt(catalogId, 0);

            if (catalogIdCheck <= 0) {
                attributes.addFlashAttribute("error", "Mã danh mục không tồn tại!");
                return "redirect:/admin/new.htm";
            } else {
                Catalogs catalog = catalogDAO.getCatalogById(catalogIdCheck);

                if (catalog == null) {
                    attributes.addFlashAttribute("error", "Mã danh mục không tồn tại!");
                    return "redirect:/admin/new.htm";
                } else {
                    totalRecords = newDAO.countAllNewsByCatalogId(catalogIdCheck);
                    firstLink += "index.htm?catalogId=" + catalogId;
                    currentLink += "index.htm{p}&catalogId=" + catalogId;
                    paging = new paging(page, totalRecords, 12, currentLink, firstLink);
                    news = newDAO.getAllNewsByCatalogId(catalogIdCheck, paging.startRecord, 12);
                    catalogs.removeAll(catalogs);
                    catalogs.add(catalog);
                    catalogs.addAll(catalogDAO.getAllChildrenCatalogsByParentId(catalogIdCheck));

                    if (news.size() > 0) {
                        model.addAttribute("news", news);
                    }

                    if (paging.generateHtml().length() > 0) {
                        model.addAttribute("paging", paging.generateHtml());
                    }

                    if (catalogs.size() > 0) {
                        model.addAttribute("catalogs", catalogs);
                    }

                    model.addAttribute("catalogId", catalogId);
                    return "Admin/new-list";
                }
            }
        }
    }

    @RequestMapping(value = "new/initInsert")
    public String insertNew(HttpSession session, Model model) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        List<Catalogs> catalogs = catalogDAO.getAllCatalogs();

        if (catalogs.size() > 0) {
            model.addAttribute("catalogs", catalogs);
        }

        model.addAttribute("title", "Thêm mới tin tức");
        return "Admin/new-insert";
    }

    @RequestMapping(value = "new/insert")
    public String doInsertNew(@RequestParam(value = "newImage") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, RedirectAttributes attributes, HttpSession session, Model model, String newTitle, Integer catalogId, String newDescription, String newContent, Integer newStatus) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:admin/login.htm";
        }

        Catalogs catalog = catalogDAO.getCatalogById(catalogId);

        if (catalog == null || catalog.getCatalogStatus() != 1) {
            attributes.addFlashAttribute("error", "Mã danh mục không tồn tại!");
            return "redirect:/admin/new/initInsert.htm";
        }

        if (validate.isEmpty(newTitle)) {
            attributes.addFlashAttribute("error", "Tiêu đề tin tức không được để trống!");
            return "redirect:/admin/new/initInsert.htm";
        }

        if (validate.isEmpty(newDescription)) {
            attributes.addFlashAttribute("error", "Mô tả tin tức không được để trống!");
            return "redirect:/admin/new/initInsert.htm";
        }

        if (validate.isEmpty(newContent)) {
            attributes.addFlashAttribute("error", "Nội dung tin tức không được để trống!");
            return "redirect:/admin/new/initInsert.htm";
        }

        if (!validate.checkMaxLenght(newTitle, 250)) {
            attributes.addFlashAttribute("error", "Độ dài tiêu đề tin tức không được vượt quá 250 ký tự!");
            return "redirect:/admin/new/initInsert.htm";
        }

        if (!validate.checkMaxLenght(newDescription, 250)) {
            attributes.addFlashAttribute("error", "Độ dài mô tả tin tức không được vượt quá 250 ký tự!");
            return "redirect:/admin/new/initInsert.htm";
        }

        boolean check = newDAO.checkNewTitleExists(newTitle);

        if (check) {
            attributes.addFlashAttribute("error", "Tiêu đề tin tức đã tồn tại!");
            return "redirect:/admin/new/initInsert.htm";
        }

        String file = commonsMultipartFiles.getOriginalFilename();

        if (file.equals("")) {
            attributes.addFlashAttribute("error", "Vui lòng chọn hình ảnh đại diện cho tin tức!");
            return "redirect:/admin/new/initInsert.htm";
        }

        String extension = FilenameUtils.getExtension(file);

        if (!validate.isValidImage(extension)) {
            attributes.addFlashAttribute("error", "Định dạng tệp tin không được hỗ trợ!");
            return "redirect:/admin/new/initInsert.htm";
        }

        String newFileName = validate.generateNameTypeB("newImage");

        if (!"".equals(file)) {
            String path = request.getServletContext().getRealPath("jsp/Admin/uploads/images/News");
            path = path.substring(0, path.indexOf("\\build"));
            path = path + "\\web\\jsp\\Admin\\uploads\\images\\News";
            File fileDir = new File(path);

            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            try {
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + newFileName));
                News news = new News();
                news.setCatalogId(catalog);
                news.setNewTitle(newTitle);
                news.setNewImage(newFileName);
                news.setNewDescription(newDescription);
                news.setNewContent(newContent);
                news.setNewLike(0);
                news.setNewViewed(0);
                news.setAdminId((Admins) session.getAttribute("adminLogin"));
                news.setCreatedDate(new Date());
                news.setUpdatedDate(new Date());

                check = newDAO.insertNew(news);

                if (!check) {
                    attributes.addFlashAttribute("error", "Thêm mới tin tức thất bại!");
                    return "redirect:/admin/new/initInsert.htm";
                }
            } catch (IOException | IllegalStateException e) {
                attributes.addFlashAttribute("error", "Tải file thất bại! \n" + e.getMessage());
                return "redirect:/admin/new/initInsert.htm";
            }
        }

        attributes.addFlashAttribute("success", "Thêm mới tin tức thành công!");
        return "redirect:/admin/new.htm";
    }

    @RequestMapping(value = "new/initUpdate")
    public String updateNew(RedirectAttributes attributes, HttpSession session, Model model, String newId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        } else {
            model.addAttribute("adminLogin", (Admins) session.getAttribute("adminLogin"));
        }

        List<Catalogs> catalogs = catalogDAO.getAllCatalogs();
        int newIdCheck = validate.convertStringToInt(newId, 0);
        News news = newDAO.getNewById(newIdCheck);

        if (newIdCheck <= 0 || news == null) {
            attributes.addFlashAttribute("error", "Mã tin tức không tồn tại!");
            attributes.addFlashAttribute("newId", newId);
            return "redirect:/admin/new/initUpdate.htm";
        }

        if (catalogs.size() > 0) {
            model.addAttribute("catalogs", catalogs);
        }

        model.addAttribute("news", news);
        model.addAttribute("title", "Cập nhật tin tức");
        return "Admin/new-update";
    }

    @RequestMapping(value = "new/update")
    public String doUpdateNew(@RequestParam(value = "newImage") CommonsMultipartFile commonsMultipartFiles, HttpServletRequest request, RedirectAttributes attributes, HttpSession session, Model model, Integer newId, String newTitle, Integer catalogId, String newDescription, String newContent, Integer newStatus) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:admin/login.htm";
        }

        Catalogs catalog = catalogDAO.getCatalogById(catalogId);
        News news = newDAO.getNewById(newId);
        String oldFileName;

        if (news == null) {
            attributes.addFlashAttribute("error", "Mã tin tức không tồn tại!");
            return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
        }

        String oldImage = news.getNewImage();

        if (catalog == null || catalog.getCatalogStatus() != 1) {
            attributes.addFlashAttribute("error", "Mã danh mục không tồn tại!");
            return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
        }

        if (validate.isEmpty(newTitle)) {
            attributes.addFlashAttribute("error", "Tiêu đề tin tức không được để trống!");
            return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
        }

        if (validate.isEmpty(newDescription)) {
            attributes.addFlashAttribute("error", "Mô tả tin tức không được để trống!");
            return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
        }

        if (validate.isEmpty(newContent)) {
            attributes.addFlashAttribute("error", "Nội dung tin tức không được để trống!");
            return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
        }

        if (!validate.checkMaxLenght(newTitle, 250)) {
            attributes.addFlashAttribute("error", "Độ dài tiêu đề tin tức không được vượt quá 250 ký tự!");
            return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
        }

        if (!validate.checkMaxLenght(newDescription, 250)) {
            attributes.addFlashAttribute("error", "Độ dài mô tả tin tức không được vượt quá 250 ký tự!");
            return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
        }

        String file = commonsMultipartFiles.getOriginalFilename();

        if (!"".equals(file)) {
            String extension = FilenameUtils.getExtension(file);

            if (!validate.isValidImage(extension)) {
                attributes.addFlashAttribute("error", "Định dạng tệp tin không được hỗ trợ!");
                return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
            }

            String newFileName = validate.generateNameTypeB("newImage");

            String path = request.getServletContext().getRealPath("jsp/Admin/uploads/images/News");
            path = path.substring(0, path.indexOf("\\build"));
            path = path + "\\web\\jsp\\Admin\\uploads\\images\\News";
            oldFileName = path + "\\" + news.getNewImage();
            File fileDir = new File(path);

            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            try {
                commonsMultipartFiles.transferTo(new File(fileDir + File.separator + newFileName));
                news.setAdminId((Admins) session.getAttribute("adminLogin"));
                news.setCatalogId(catalog);
                news.setCreatedDate(new Date());
                news.setNewTitle(newTitle);
                news.setNewDescription(newDescription);
                news.setNewContent(newContent);
                news.setNewImage(newFileName);
                news.setNewStatus(newStatus);
                boolean check = newDAO.updateNew(news);

                if (!check) {
                    attributes.addFlashAttribute("error", "Cập nhật tin tức thất bại!");
                    return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
                }

                if (oldFileName.length() > 0) {
                    Path oldPath = Paths.get(oldFileName);

                    if (Files.exists(oldPath)) {
                        try {
                            Files.delete(oldPath);
                        } catch (IOException ex) {
                            Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            } catch (IOException | IllegalStateException e) {
                attributes.addFlashAttribute("error", "Tải file thất bại! \n" + e.getMessage());
                return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
            }
        } else {
            news.setAdminId((Admins) session.getAttribute("adminLogin"));
            news.setCatalogId(catalog);
            news.setCreatedDate(new Date());
            news.setNewTitle(newTitle);
            news.setNewDescription(newDescription);
            news.setNewContent(newContent);
            news.setNewStatus(newStatus);
            boolean check = newDAO.updateNew(news);

            if (!check) {
                attributes.addFlashAttribute("error", "Cập nhật tin tức thất bại!");
                return "redirect:/admin/new/initUpdate.htm?newId=" + newId;
            }
        }

        attributes.addFlashAttribute("success", "Cập nhật tin tức thành công!");
        return "redirect:/admin/new.htm";
    }
    
    @RequestMapping(value = "new/detail")
    public String detailNew(RedirectAttributes attributes, HttpSession session, Model model, Integer newId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        News news = newDAO.getNewById(newId);

        if (news == null) {
            attributes.addFlashAttribute("error", "Mã tin tức không tồn tại!");
            return "redirect:index.htm";
        }

        List<Catalogs> catalogs = catalogDAO.getAllParentCatalogsFrontEnd();
        
        
        if (catalogs.size() > 0) {
            model.addAttribute("catalogs", catalogs);
        }
        
        
        model.addAttribute("news", news);
        model.addAttribute("title", "Chi tiết tin tức");
        return "Admin/new-detail";
    }
    
    @RequestMapping(value = "new/disable")
    public String disableNew(RedirectAttributes attributes, HttpSession session, String newId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        int newIdCheck = validate.convertStringToInt(newId, 0);
        News news = newDAO.getNewById(newIdCheck);

        if (news == null) {
            attributes.addFlashAttribute("error", "Mã tin tức không tồn tại!");
            return "redirect:/admin/new.htm";
        }

        boolean check = newDAO.disableNew(news.getNewId());

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể cập nhật tin tức vào lúc này!");
            return "redirect:/admin/new.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật tin tức thành công!");
            return "redirect:/admin/new.htm";
        }
    }
    
   
    @RequestMapping(value = "new/enable")
    public String enableNew(RedirectAttributes attributes, HttpSession session, String newId) {
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login.htm";
        }

        int newIdCheck = validate.convertStringToInt(newId, 0);
        News news = newDAO.getNewById(newIdCheck);

        if (news == null) {
            attributes.addFlashAttribute("error", "Mã tin tức không tồn tại!");
            return "redirect:/admin/new.htm";
        }

        boolean check = newDAO.enableNew(news.getNewId());

        if (!check) {
            attributes.addFlashAttribute("error", "Không thể cập nhật tin tức vào lúc này!");
            return "redirect:/admin/new.htm";
        } else {
            attributes.addFlashAttribute("success", "Cập nhật tin tức thành công!");
            return "redirect:/admin/new.htm";
        }
    }
}
