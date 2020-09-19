/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.FilterProduct;
import common.paging;
import common.validate;
import dao.CategoryDAO;
import dao.ProductDAO;
import entities.Admins;
import entities.Brands;
import entities.Categories;
import entities.ProductImages;
import entities.Products;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Acer Nitro 5
 */
@Controller
@RequestMapping(value = "admin")
public class AdminProductController {

    private CategoryDAO categoryDAO;

    private ProductDAO productDAO;

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @Autowired
    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @RequestMapping(value = "category", method = RequestMethod.GET)
    public String loadCategory(Model model) {
        List<Categories> allCategory = categoryDAO.getAllCategory();
        model.addAttribute("allCategory", allCategory);
        return "Admin/category-list";
    }

    @RequestMapping(value = "category/initInsertCategory")
    public String initInsertCategory(Model model) {
        int maxPiority = categoryDAO.getMaxCategoryPiority();
        if (maxPiority >= 0) {
            model.addAttribute("maxPiority", maxPiority + 1);
        }
        List<Categories> categories = categoryDAO.getAllCategory();
        model.addAttribute("categories", categories);
        return "Admin/category-insert";
    }

    @RequestMapping(value = "category/insertCategory")
    public String insertCategory(RedirectAttributes attributes, String categoryName, String parentId, String categoryPiority, String categoryStatus) {
        if (validate.isEmpty(categoryName)) {
            attributes.addFlashAttribute("error", "Tên danh mục không được để trống");
            return "redirect:/admin/category/initInsertCategory.htm";
        }
        if (!validate.checkMaxLenght(categoryName, 250)) {
            attributes.addFlashAttribute("error", "Độ dài tên danh mục không được quá 250 kí tự");
            return "redirect:/admin/category/initInsertCategory.htm";
        }

        boolean check = categoryDAO.checkCategoryNameExists(categoryName);
        if (check) {
            attributes.addFlashAttribute("error", "Tên danh mục đã tồn tại");
            return "redirect:/admin/category/initInsertCategory.htm";
        }
        int parentIdInsert = validate.convertStringToInt(parentId, 0);
        String parentName;
        if (parentIdInsert <= 0) {
            parentName = "Không có";
        } else {
            Categories categories = categoryDAO.getCategoryById(parentIdInsert);
            if (categories == null) {
                attributes.addFlashAttribute("error", "Danh mục cha không tồn tại!");
                return "redirect:/admin/category/initInsertCategory.htm";
            } else {
                parentName = categories.getCategoryName();
            }
        }

        int categoryStatusInsert = validate.convertStringToInt(categoryStatus, 0);
        int categoryPiorityInsert = validate.convertStringToInt(categoryPiority, 0);

        Categories category = new Categories();
        category.setCategoryName(categoryName);
        category.setCategoryPiority(categoryPiorityInsert);
        category.setCategoryStatus(categoryStatusInsert);
        category.setParentId(parentIdInsert);
        category.setParentName(parentName);
        category.setCreatedDate(new Date());
        category.setUpdatedDate(new Date());

        check = categoryDAO.insertCategory(category);
        if (check) {
            attributes.addFlashAttribute("success", "Thêm mới danh mục sản phẩm thành công");
            return "redirect:/admin/category.htm";

        } else {
            attributes.addFlashAttribute("error", "Thêm mới danh mục không thành công!");
            return "redirect:/admin/category/initInsertCategory.htm";
        }
    }

    @RequestMapping(value = "category/disable")
    public String disableCategory(RedirectAttributes attributes, Integer categoryId) {

        boolean check = categoryDAO.disableCategory(categoryId);
        if (check) {
            attributes.addFlashAttribute("success", "Cập nhật danh mục sản phẩm thành công");
            attributes.addFlashAttribute("categoryId", categoryId);
            return "redirect:/admin/category.htm";
        } else {
            attributes.addFlashAttribute("error", "Cập nhật danh mục sản phẩm không thành công!");
            attributes.addFlashAttribute("categoryId", categoryId);
            return "redirect:/admin/category.htm";
        }
    }

    @RequestMapping(value = "category/enable")
    public String enableCategory(RedirectAttributes attributes, Integer categoryId) {

        boolean check = categoryDAO.enableCategory(categoryId);
        if (check) {
            attributes.addFlashAttribute("success", "Cập nhật danh mục sản phẩm thành công");
            attributes.addFlashAttribute("categoryId", categoryId);
            return "redirect:/admin/category.htm";
        } else {
            attributes.addFlashAttribute("error", "Cập nhật danh mục sản phẩm không thành công!");
            attributes.addFlashAttribute("categoryId", categoryId);
            return "redirect:/admin/category.htm";
        }
    }

//    @RequestMapping(value = "category/preUpdate")
//    public String preUpdateCategory(RedirectAttributes attributes, Model model, Integer categoryId) {
//               
//        return null;
//
//    }
//
//    @RequestMapping(value = "category/preUpdate")
//    public String updateCategory(RedirectAttributes attributes, Integer categoryId) {
//        return null;
//
//    }
    @RequestMapping(value = "product", method = RequestMethod.GET)
    public String loadproduct(RedirectAttributes attributes, Model model, String brandId, String categoryId, Integer page) {

        Brands brand = null;
        Categories category = null;
        String keyword = "";

        //check xem hãng sản xuất có tồn tại không hoặc status có được sử dụng k 
        if (brandId != null && !brandId.equals("")) {
            // chờ thắng commit để ghép vafp(tạm thời lấy từ productDao)
            brand = productDAO.getBrandById(validate.convertStringToInt(brandId, 0));

            if (brand == null || brand.getBrandStatus() != 1) {
                attributes.addFlashAttribute("error", "Mã hãng sản xuất không tồn tại!");
                return "redirect:/product/index.htm";
            }
        } else {
            brandId = "";
        }

        //check xem dah mục sản phẩm có tồn tại haowjc có status =1 không
        if (categoryId != null && !categoryId.equals("")) {
            category = categoryDAO.getCategoryById(validate.convertStringToInt(categoryId, 0));

            if (category == null || category.getCategoryStatus() != 1) {
                attributes.addFlashAttribute("error", "Mã danh mục sản phẩm không tồn tại!");
                return "redirect:/product/index.html";
            }
        } else {
            categoryId = "";
        }

        if (page == null || page <= 0) {
            page = 1;
        }

        if (keyword == null || keyword.equals("")) {
            keyword = "";
            model.addAttribute("keyword", keyword);
        }
        //khai báo list Brand
        List<Brands> brands;
        //khai bao list categories
        List<Categories> categories;
        //khai bao list product
        List<Products> products;
        //khai bao đối tượng phân trang
        paging paging;
        //khai báo đối tượng lọc
        FilterProduct filters;
        // số trang
        String pagingHtm = "";

        //đường link đầu
        String firstLink = "/ProjectSem4/admin/product.htm?brandId=" + brandId + "&categoryId=" + categoryId + "&keyword=" + keyword;
        //đường link tiếp theo
        String currentLink = "/ProjectSem4/admin/product.htm{p}&brandId=" + brandId + "&categoryId=" + categoryId + "&keyword=" + keyword;
        // lấy ra tổng số sản phẩm. 
        int totalRecords = productDAO.countProductFilterForPaging(brand, category, keyword);

        if (totalRecords > 12) {
            paging = new paging(page, totalRecords, 12, currentLink, firstLink);
            filters = productDAO.filterProductsForAdmin(paging.startRecord, 12, keyword, brand, category);
            products = filters.products;
            brands = filters.brands;
            categories = filters.categories;
            pagingHtm = paging.generateHtml();
        } else {
            filters = productDAO.filterProductsForAdmin(0, totalRecords, keyword, brand, category);
            products = filters.products;
            brands = filters.brands;
            categories = filters.categories;
        }

        if (brands != null) {
            model.addAttribute("brands", brands);
            model.addAttribute("brandId", brandId);
        }

        if (categories != null) {
            model.addAttribute("categories", categories);
            model.addAttribute("categoryId", categoryId);
        }

        if (keyword.length() > 0) {
            model.addAttribute("keyword", keyword);
        }

        if (products.size() > 0) {
            model.addAttribute("allProduct", products);
        }

        if (pagingHtm.length() > 0) {
            model.addAttribute("pagingHtml", pagingHtm);
        }

        model.addAttribute("title", "Quản lý sản phẩm");
        return "Admin/product-list";
    }

    @RequestMapping(value = "product/initInsertProduct")
    public String initInsertProduct(RedirectAttributes attributes, Model model) {
        List<Categories> listCategory = categoryDAO.getAllCategory();
        List<Brands> listBrand = productDAO.getAllBrands();
        if (listCategory.size() <= 0) {
            attributes.addFlashAttribute("error", "Chưa có danh mục sản phẩm nào, vui lòng thêm mới trước !");
            return "redirect:/admin/initInsertProduct.htm";
        } else {
            model.addAttribute("listCategory", listCategory);
        }
        if (listBrand.size() <= 0) {
            attributes.addFlashAttribute("error", "Chưa có hãng sản phẩm nào, vui lòng thêm mới trước !");
            return "redirect:/admin/initInsertProduct.htm";
        } else {
            model.addAttribute("listBrand", listBrand);
        }
        return "Admin/product-insert";
    }

    @RequestMapping(value = "product/insertProduct", method = RequestMethod.POST)
    public String insertProduct(String productFeatureImage, HttpServletRequest request,
            RedirectAttributes attributes, String productName,
            String productCode, String productSale, String productWarranty, String categoryId, String brandId, String productPrice, String productDescription, String productStatus, String specificationName, String specificationValue
    ) {

        if (validate.isEmpty(productName)) {
            attributes.addFlashAttribute("error", "Tên sản phẩm không được để trống !");
            return "redirect:/admin/product/initInsertProduct.htm";
        }
        if (validate.isEmpty(productCode)) {
            attributes.addFlashAttribute("error", "Mã sản phẩm không được để trống!");
            return "redirect:/admin/product/initInsertProduct.htm";
        }
        if (!validate.checkMaxLenght(productName, 250)) {
            attributes.addFlashAttribute("error", "Tên sản phẩm không được quá 250 ký tự!");
            return "redirect:/admin/product/initInsertProduct.htm";
        }
        if (productDAO.checkProductNameExists(productName)) {
            attributes.addFlashAttribute("error", "Tên sản phẩm đã tồn tại!");
            return "redirect:/admin/product/initInsertProduct.htm";
        }
        if (validate.isEmpty(productCode)) {
            attributes.addFlashAttribute("error", "Mã sản phẩm không được để trống!");
            return "redirect:/admin/product/initInsertProduct.htm";
        }
        if (validate.isEmpty(productPrice)) {
            attributes.addFlashAttribute("error", "Giá sản phẩm không được để trống!");
            return "redirect:/admin/product/initInsertProduct.htm";
        }
        if (validate.isEmpty(productSale)) {
            attributes.addFlashAttribute("error", "Mức giảm giá phẩm không được để trống!");
            return "redirect:/admin/product/initInsertProduct.htm";
        }
        if (validate.isEmpty(productWarranty)) {
            attributes.addFlashAttribute("error", "Tháng bảo hành không được để trống!");
            return "redirect:/admin/product/initInsertProduct.htm";
        }

        if (validate.isEmpty(productFeatureImage)) {
            attributes.addFlashAttribute("error", "Ảnh đại diện không được để trống!");
            return "redirect:/admin/product/initInsertProduct.htm";
        }
        if (validate.isEmpty(productDescription)) {
            attributes.addFlashAttribute("error", "Mô tả sản phẩm không được để trống!");
            return "redirect:/admin/product/initInsertProduct.htm";
        }

        Categories category = categoryDAO.getCategoryById(validate.convertStringToInt(categoryId, 0));
        Brands brand = productDAO.getBrandById(validate.convertStringToInt(brandId, 0));

        Products product = new Products();
        product.setProductName(productName);
        product.setProductCode(productCode);
        product.setProductPrice(validate.convertStringToDouble(productPrice, 0));
        product.setProductSale(validate.convertStringToInt(productSale, 0));
        product.setCategoryId(category);
        product.setBrandId(brand);
        product.setProductFeatureImage(productFeatureImage);
        product.setProductWarranty(validate.convertStringToInt(productWarranty, 0));
        product.setProductSaleQuantity(0);
        product.setProductStarAvg(5);
        product.setProductDescription(productDescription);
        product.setSpecificationName(specificationName);
        product.setSpecificationValue(specificationValue);
        product.setCreatedDate(new Date());
        product.setUpdatedDate(new Date());
        product.setProductStatus(validate.convertStringToInt(productStatus, 0));
        boolean check = productDAO.insertProduct(product);
        if (check) {
            attributes.addFlashAttribute("success", "Thêm mới sản phẩm thành công!");

            return "redirect:/admin/product.htm";
        } else {
            attributes.addFlashAttribute("error", "Thêm mới sản phẩm không thành công!");
            return "redirect:/admin/product/initInsertProduct.htm";
        }
    }

    @RequestMapping(value = "product/initUpdateProduct")
    public String initUpdateProduct(RedirectAttributes attributes, Model model, Integer productId) {
        List<Categories> listCategory = categoryDAO.getAllCategory();
        List<Brands> listBrand = productDAO.getAllBrands();

        Products product = productDAO.getProductById(productId);

        if (listCategory.size() <= 0) {
            attributes.addFlashAttribute("error", "Chưa có danh mục sản phẩm nào, vui lòng thêm mới trước !");
            return "redirect:/admin/initUpdateProduct.htm";
        } else {
            model.addAttribute("listCategory", listCategory);
        }
        if (listBrand.size() <= 0) {
            attributes.addFlashAttribute("error", "Chưa có hãng sản phẩm nào, vui lòng thêm mới trước !");
            return "redirect:/admin/initUpdateProduct.htm";
        } else {
            model.addAttribute("listBrand", listBrand);
        }

        model.addAttribute("product", product);
        model.addAttribute("title", "Cập nhật sản phẩm");
        return "Admin/product-update";

    }

    @RequestMapping(value = "product/updateProduct", method = RequestMethod.POST)
    public String updateProduct(RedirectAttributes attributes, String productFeatureImage, Integer productId, String productName,
            String productCode, String productSale, String productWarranty, String categoryId, String brandId, String productPrice, String productDescription, String productStatus, String specificationName, String specificationValue) {
        if (validate.isEmpty(productName)) {
            attributes.addFlashAttribute("error", "Tên sản phẩm không được để trống !");
            return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
        }
        if (validate.isEmpty(productCode)) {
            attributes.addFlashAttribute("error", "Mã sản phẩm không được để trống!");
            return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
        }
        if (!validate.checkMaxLenght(productName, 250)) {
            attributes.addFlashAttribute("error", "Tên sản phẩm không được quá 250 ký tự!");
            return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
        }
        if (productDAO.checkProductNameExists(productName)) {
            attributes.addFlashAttribute("error", "Tên sản phẩm đã tồn tại!");
            return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
        }
        if (validate.isEmpty(productCode)) {
            attributes.addFlashAttribute("error", "Mã sản phẩm không được để trống!");
            return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
        }
        if (validate.isEmpty(productPrice)) {
            attributes.addFlashAttribute("error", "Giá sản phẩm không được để trống!");
            return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
        }
        if (validate.isEmpty(productSale)) {
            attributes.addFlashAttribute("error", "Mức giảm giá phẩm không được để trống!");
            return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
        }
        if (validate.isEmpty(productWarranty)) {
            attributes.addFlashAttribute("error", "Tháng bảo hành không được để trống!");
            return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
        }

        if (validate.isEmpty(productDescription)) {
            attributes.addFlashAttribute("error", "Mô tả sản phẩm không được để trống!");
            return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
        }
        Categories category = categoryDAO.getCategoryById(validate.convertStringToInt(categoryId, 0));
        Brands brand = productDAO.getBrandById(validate.convertStringToInt(brandId, 0));

        Products product = productDAO.getProductById(productId);
        if (!productFeatureImage.equals("")) {
            product.setProductName(productName);
            product.setProductCode(productCode);
            product.setProductPrice(validate.convertStringToDouble(productPrice, 0));
            product.setProductSale(validate.convertStringToInt(productSale, 0));
            product.setCategoryId(category);
            product.setBrandId(brand);
            product.setProductFeatureImage(productFeatureImage);
            product.setProductWarranty(validate.convertStringToInt(productWarranty, 0));
            product.setProductDescription(productDescription);
            product.setSpecificationName(specificationName);

            product.setSpecificationValue(specificationValue);
            product.setUpdatedDate(new Date());
            product.setProductStatus(validate.convertStringToInt(productStatus, 0));
            boolean check = productDAO.updateProduct(product);
            if (!check) {
                attributes.addFlashAttribute("error", "Cập nhật sản phẩm thất bại!");
                return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
            }
        } else {
            product.setProductName(productName);
            product.setProductCode(productCode);
            product.setProductPrice(validate.convertStringToDouble(productPrice, 0));
            product.setProductSale(validate.convertStringToInt(productSale, 0));
            product.setCategoryId(category);
            product.setBrandId(brand);
            product.setProductWarranty(validate.convertStringToInt(productWarranty, 0));
            product.setProductDescription(productDescription);
            product.setSpecificationName(specificationName);

            product.setSpecificationValue(specificationValue);
            product.setUpdatedDate(new Date());
            product.setProductStatus(validate.convertStringToInt(productStatus, 0));
            boolean check = productDAO.updateProduct(product);
            if (!check) {
                attributes.addFlashAttribute("error", "Cập nhật sản phẩm thất bại!");
                return "redirect:/admin/product/initUpdateProduct.htm?productId=" + productId;
            }
        }

        attributes.addFlashAttribute("success", "Cập nhật sản phẩm thành công!");
        return "redirect:/admin/product.htm";

    }

    @RequestMapping(value = "product/detailProduct")
    public String detailProduct(RedirectAttributes attributes, Model model, Integer productId) {
        List<ProductImages> listImage = productDAO.getAllImagesByProductId(productId);

        Products product = productDAO.getProductById(productId);
        if (listImage.size() > 0) {
            model.addAttribute("listImage", listImage);
        }
        model.addAttribute("product", product);
        model.addAttribute("title", "Chi tiết sản phẩm");
        return "Admin/product-detail";
    }

    @RequestMapping(value = "product/insertProductImage", method = RequestMethod.POST)
    public String insertProductImage(RedirectAttributes attributes, Integer productId, String productImage) {
        Products product = productDAO.getProductById(productId);

        if ("".equals(productImage)) {
            attributes.addFlashAttribute("error", "Vui lòng chọn ảnh!");
            return "redirect:/admin/product/detailProduct.htm?productId=" + productId;
        }
        try {
            ProductImages img = new ProductImages();
            img.setProductImage(productImage);
            img.setProductId(product);
            img.setProductImageStatus(1);
            img.setCreatedDate(new Date());
            img.setUpdatedDate(new Date());
            boolean check = productDAO.insertProductImage(img);
            if (!check) {
                attributes.addFlashAttribute("error", "Thêm hình ảnh không thành công?");
                return "redirect:/admin/product/detailProduct.htm?productId=" + productId;
            }

        } catch (Exception e) {
            attributes.addFlashAttribute("error", "Tải file thất bại! \n" + e.getMessage());
            return "redirect:/admin/product/detailProduct.htm?productId=" + productId;
        }
        attributes.addFlashAttribute("success", "Thêm mới hình ảnh sản phẩm thành công!");
        return "redirect:/admin/product/detailProduct.htm?productId=" + productId;
    }

    @RequestMapping(value = "product/disable")
    public String disableProduct(RedirectAttributes attributes, Integer productId) {
        boolean check = productDAO.disableProduct(productId);
        if (check) {
            attributes.addFlashAttribute("success", "Khóa sản phẩm thành công");
            return "redirect:/admin/product/detailProduct.htm?productId=" + productId;
        } else {
            attributes.addFlashAttribute("error", "Cập nhật sản phẩm không thành công!");
            return "redirect:/admin/product/detailProduct.htm?productId=" + productId;
        }
    }

    @RequestMapping(value = "product/enable")
    public String enableProduct(RedirectAttributes attributes, Integer productId) {
        boolean check = productDAO.enableProduct(productId);
        if (check) {
            attributes.addFlashAttribute("success", "Mở khóa sản phẩm thành công");
            return "redirect:/admin/product/detailProduct.htm?productId=" + productId;
        } else {
            attributes.addFlashAttribute("error", "Cập nhật sản phẩm không thành công!");
            return "redirect:/admin/product/detailProduct.htm?productId=" + productId;
        }
    }

}
