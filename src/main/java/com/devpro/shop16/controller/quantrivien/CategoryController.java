package com.devpro.shop16.controller.quantrivien;

import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.service.CategoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/category/")
public class CategoryController {

    @Autowired
    private CategoriesService categoriesService;

    @RequestMapping(value = "category-list", method = RequestMethod.GET)
    public String categoryList(final Model model) throws IOException {

        List<Categories> categories=categoriesService.findAll();
        model.addAttribute("categories", categories);
        return "quantrivien/category";
    }

    @RequestMapping(value = {"add-category"}, method = RequestMethod.GET)
    public String admin_add_category(final Model model, final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {

        Categories addCate = new Categories();
        addCate.setCreatedDate(new Date());
        model.addAttribute("addCate", addCate);

        return "quantrivien/add-category";
    }

    @RequestMapping(value = {"add-category"}, method = RequestMethod.POST)
    public String admin_add_spring_form(final Model model, final HttpServletRequest request,
                                        final HttpServletResponse response, final @ModelAttribute("addCate") Categories categories
    ) throws Exception {
        categories.setCreatedDate(new Date());
        categoriesService.saveOrUpdate(categories);

        return "redirect:/admin/category/category-list";

    }

    @RequestMapping(value = "category-edit/{categoryId}", method = RequestMethod.GET)
    public String categoryEdit(final Model model, @PathVariable int categoryId) throws IOException {
        Categories category = categoriesService.getById(categoryId);
        model.addAttribute("category", category);
        model.addAttribute("createdDate", category.getCreatedDate());
        return "quantrivien/edit-category";
    }

    @RequestMapping(value = "category-edit-save", method = RequestMethod.POST)
    public String categoryEditSave(final Model model, @ModelAttribute("category") Categories category, HttpServletRequest request) throws IOException {

        category.setUpdatedDate(new Date());
        categoriesService.saveOrUpdate(category);
        return "redirect:/admin/category/category-list";
    }

    @RequestMapping(value = "category-delete/{categoryId}", method = RequestMethod.GET)
    public String categoryDelete(final Model model, @PathVariable int categoryId) throws IOException {

        Categories category = categoriesService.getById(categoryId);
        category.setStatus(Boolean.FALSE);
        categoriesService.inactive(category);

        return "redirect:/admin/category/category-list";
    }
}
