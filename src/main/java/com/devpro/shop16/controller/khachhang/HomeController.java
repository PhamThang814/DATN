package com.devpro.shop16.controller.khachhang;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.Subcribe;
import com.devpro.shop16.service.CategoriesService;
import com.devpro.shop16.service.PagerData;
import com.devpro.shop16.service.ProductService;
import com.devpro.shop16.service.SubcribeService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController extends BaseController {
	
	private final ProductService productService;
	
	private final SubcribeService subcribeService;
	private final CategoriesService categoriesService;

	public HomeController(ProductService productService, SubcribeService subcribeService, CategoriesService categoriesService) {
		this.productService = productService;
		this.subcribeService = subcribeService;
		this.categoriesService = categoriesService;
	}


	@RequestMapping(value = { "/home/search", "/home" }, method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		Subcribe subcribe = new Subcribe();
		model.addAttribute("subcribe", subcribe);
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		
		model.addAttribute("productsWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "khachhang/index";
	}

	@RequestMapping(value = "/home/find", method = RequestMethod.GET)
	public String find(final Model model, final HttpServletRequest request) {
		String s = request.getParameter("keyword").trim();
		PagerData<Product> products = productService.findByKeyword(s);
		model.addAttribute("productsWithPaging", products);
		return "khachhang/collection";
	}

	@RequestMapping(value = { "/ajax/home", "/"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_subcribe(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response, 
			final @RequestBody Subcribe subcribe) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		model.addAttribute("subcribe", "");

		List<Subcribe> subcribes = subcribeService.checkEmailSubcribe(subcribe);
		if(subcribes.size() == 0) {
			subcribeService.saveOrUpdate(subcribe);
			jsonResult.put("code", 200);
			jsonResult.put("message", "Cảm ơn, " + subcribe.getEmail() + " đã đăng kí thành công!");
		} else {
			jsonResult.put("err", "Bạn chưa nhập email / Trùng email");
		}

		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/product/details/{productSeo}"}, method = RequestMethod.GET)
	public String productDetails(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("productSeo") String productSeo)
			throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.seo = productSeo;
		
		PagerData<Product> products = productService.search(searchModel);
		Product product = products.getData().get(0);

		int categoryId=product.getCategories().getId();
		PagerData<Product> productRelated = productService.findByCategoryId(categoryId);
		productRelated.getData().remove(product);

		model.addAttribute("product", product);
		model.addAttribute("productRelated", productRelated);
		return "khachhang/details";
	}
	@RequestMapping(value = "/category/{categoryId}", method = RequestMethod.GET)
	public String productInCategory(Model model,
									@PathVariable int categoryId,
									final HttpServletRequest request) {

		Categories category = categoriesService.getById(categoryId);
//		SearchModel productSearch = new SearchModel();
//		int SIZE_OF_PAGE = 3;

		// Bat dau phan trang
//		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
//			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
//		} else {
//			productSearch.setCurrentPage(1);
//		}
//
//		List<Product> allProducts = productService.searchProduct(productSearch, categoryId);
//
//		List<Product> products = new ArrayList<>();
//
//		// Tong so trang theo tim kiem
//		int totalPages = allProducts.size() / SIZE_OF_PAGE;
//		if (allProducts.size() % SIZE_OF_PAGE > 0) {
//			totalPages++;
//		}
//
//		// Neu tong so trang < trang hien tai (Lại bấm tìm kiếm)
//		if (totalPages < productSearch.getCurrentPage()) {
//			productSearch.setCurrentPage(1);
//		}
//
//		// Lay sanh sach sp can hien thi trong 1 trang
//		int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE; // Vi tri dau 1 trang
//		int index = firstIndex, count = 0;
//		while (index < allProducts.size() && count < SIZE_OF_PAGE) {
//			products.add(allProducts.get(index));
//			index++;
//			count++;
//		}
//
//		// Phan trang
//		productSearch.setSizeOfPage(SIZE_OF_PAGE); // so ban ghi tren mot trang
//		productSearch.setTotalItems(allProducts.size()); // tong so san pham tim kiem
//
//
		PagerData<Product> products = productService.findByCategoryId(categoryId);
		model.addAttribute("productsWithPaging", products);
		model.addAttribute("category",category);

		return "khachhang/collection";
	}

}
