package com.poly.ControllerAdmin;

import java.util.List;
import java.util.Optional;

import com.poly.dao.ProductsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.DiscountDao;
import com.poly.entity.Discount;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class DiscountController {

    @Autowired
    DiscountDao discountDao;

    @Autowired
    ProductsDao productsDao;

    @GetMapping("/discount")
    public String showDiscountManagementPage(Model model) {
        model.addAttribute("discount", new Discount());
        List<Discount> discounts = discountDao.findAll();
        model.addAttribute("list", discounts);
        model.addAttribute("listProduct", productsDao.findAll());
        return "views/admin/discount";
    }
    @PostMapping("/savediscount")
    public String saveDiscount(@ModelAttribute("discount") @Valid Discount discount, BindingResult result) {
        if (result.hasErrors()) {
            // Nếu có lỗi validation, trả về lại form với thông báo lỗi
            return "views/admin/discount"; // Thay your-form-template bằng tên template của trang form
        }

        // Xử lý lưu discount nếu không có lỗi
        discountDao.save(discount);
        return "redirect:/admin/discount";
    }

    @GetMapping("/deletediscount/{id}")
    public String deleteDiscount(@PathVariable("id") Integer id) {
        discountDao.deleteById(id);
        return "redirect:/admin/discount";
    }

    @GetMapping("/editdiscount/{id}")
    public String showEditDiscountForm(@PathVariable("id") Integer id, Model model) {
        Optional<Discount> optionalDiscount = discountDao.findById(id);
        if (optionalDiscount.isPresent()) {
            Discount discount = optionalDiscount.get();
            model.addAttribute("discount", discount); // Sửa tên thuộc tính thành "editDiscount"
            return "views/admin/discount"; // Đảm bảo rằng bạn có một template "edit_discount" để hiển thị form chỉnh sửa
        } else {
            // Xử lý khi không tìm thấy discount với id tương ứng
            return "redirect:/admin/discount";
        }
    }

    @PostMapping("/updatediscount")
    public String updateDiscount(@ModelAttribute("discount") @Valid Discount discount, BindingResult result) {
        if (result.hasErrors()) {
            // Nếu có lỗi validation, trả về lại form với thông báo lỗi
            return "views/admin/discount"; // Thay your-form-template bằng tên template của trang form
        }

        // Xử lý cập nhật discount nếu không có lỗi
        discountDao.save(discount);
        return "redirect:/admin/discount";
    }
}
