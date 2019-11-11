package com.ssafy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.UserVO;
import com.ssafy.model.dto.eatFood;
import com.ssafy.model.service.FoodService;

@Controller
public class FoodController {
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);

	@Autowired
	FoodService service;

	@GetMapping("/index")
	public String firstLoad(Model model, HttpServletRequest req) {
		req.setAttribute("food", service.selectAll());
		return "index";
	}

	@GetMapping("/detail")
	public String detail(Model model, int code, HttpServletRequest req) {
		req.setAttribute("detail", "detail");
		req.setAttribute("food", service.select(code));
		return "detailinfo";
	}

	@GetMapping("/productInfo")
	public String productInfo(Model model, HttpServletRequest req) {
		req.setAttribute("food", service.selectAll());
		return "productInfo";
	}

	@ResponseBody
	@PostMapping("/search/ajax")
	public List<Food> searchAjax(Model model, String name, String by) {
		List<Food> list = service.selectAll();
		List<Food> res = new ArrayList<Food>();
		if (by.equals("상품명")) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getName().contains(name)) {
					res.add(list.get(i));
				}
			}
		} else if (by.equals("재료명")) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getMaterial().contains(name)) {
					res.add(list.get(i));
				}
			}
		} else if (by.equals("제조사")) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getMaker().contains(name)) {
					res.add(list.get(i));
				}
			}
		}
		logger.trace("search json:{}", res);
		return res;
	}

	@ResponseBody
	@PostMapping("/detail/chart")
	public Food detailChart(Model model, int code) {
		Food f = service.select(code);
		return f;
	}

	@GetMapping("/eatfood")
	public String addEat(int code, HttpSession session, RedirectAttributes ra,HttpServletRequest req) {
		if (session.getAttribute("loginId") == null) {
			ra.addFlashAttribute("msg", "로그인 후 이용할 수 있습니다.");
			String referer = req.getHeader("Referer");
			return "redirect:"+referer;
		} else {
			UserVO user = (UserVO) session.getAttribute("loginId");
			String id = user.getId();
			eatFood food = new eatFood(id, code);
			service.insertFood(food);
			ra.addFlashAttribute("msg","섭취정보가 추가되었습니다.");
			String referer=req.getHeader("Referer");
			return "redirect:"+referer;
		}
	}
}
