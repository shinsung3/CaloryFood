package com.ssafy.controller;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.UserVO;
import com.ssafy.model.dto.eatFood;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService service;

	@Autowired
	FoodService fservice;

	@GetMapping("/user/signup")
	public String goSignUp() {
		return "signup";
	}

	@PostMapping("/user/signup")
	public String signUp(Model model, UserVO user, RedirectAttributes ra) {
		try {
			int res = service.insert(user);
			service.insertAl(user.getId(), user.getAllergy());
			ra.addFlashAttribute("msg", "회원가입 성공!");
			return "redirect:/index";
		} catch (DuplicateKeyException e) {
			logger.trace("error: {}", e);
			model.addAttribute("alarm", "이미 존재하는 아이디입니다.");
			model.addAttribute("prev", user);
			return "signup";
		}
	}

	@PostMapping("/user/login")
	public String login(Model model, HttpSession session, String id, String pw, RedirectAttributes ra,
			HttpServletRequest req) {
		try {
			if (service.loginck(id, pw)) {
				ra.addFlashAttribute("msg", "로그인 성공!");
				UserVO u = service.select(id);
				session.setAttribute("loginId", u);
				session.setAttribute("allergy", service.selectAl(id));
				logger.trace("allergy: {}", service.selectAl(id));
				return "redirect:/index";
			}else {
				return "redirect:/index";
			}
		} catch (Exception e) {
			req.setAttribute("msg", "로그인 실패! 아이디 혹은 비밀번호를 다시 확인하세요");
			ra.addFlashAttribute("msg", "로그인 실패! 아이디 혹은 비밀번호를 다시 확인하세요");
			return "redirect:/index";
		}
	}

	@PostMapping("/user/modiuser")
	public String modiUser(Model model, RedirectAttributes ra, HttpSession session, UserVO user) {
		service.update(user);
		service.updateAl(user.getId(), user.getAllergy());
		session.setAttribute("loginId", user);
		session.setAttribute("allergy", service.selectAl(user.getId()));
		ra.addFlashAttribute("msg", "회원정보가 수정되었습니다.");
		return "redirect:/user/godetailUser";
	}

	@GetMapping("/user/godetailUser")
	public String goUserinfo() {
		return "userinfo";
	}

	@GetMapping("/user/logout")
	public String logOut(RedirectAttributes ra, HttpSession session) {
		ra.addFlashAttribute("msg", "로그아웃 되었습니다.");
		session.setAttribute("loginId", null);
		session.setAttribute("allergy", null);
		return "redirect:/index";
	}

	@GetMapping("/user/singout")
	public String singOut(RedirectAttributes ra, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("loginId");
		String id = user.getId();
		fservice.deleteFood(id);
		service.deleteAl(id);
		service.delete(id);
		session.setAttribute("loginId", null);
		session.setAttribute("allergy", null);
		ra.addFlashAttribute("msg", "회원탈퇴가 완료되었습니다.");
		return "redirect:/index";
	}

	@GetMapping("/user/eatfood")
	public String eatInfo(HttpSession session, HttpServletRequest req) {
		UserVO user = (UserVO) session.getAttribute("loginId");
		String id = user.getId();
		List<Food> list = new ArrayList<Food>();
		List<eatFood> food = service.selectEat(id);
		for (int i = 0; i < food.size(); i++) {
			list.add(fservice.select(food.get(i).getCode()));
		}
		req.setAttribute("list", list);
		req.setAttribute("foods", food);
		return "eatinfo";
	}

	@GetMapping("/deleteEat")
	public String deleteEat(int eatcode, RedirectAttributes ra, HttpServletRequest req) {
		fservice.deleteEat(eatcode);
		ra.addFlashAttribute("msg", "섭취정보를 삭제하였습니다.");
		String referer = req.getHeader("Referer");
		return "redirect:" + referer;
	}

	@GetMapping("/user/findpw")
	public String goFindpw() {
		return "findpw";
	}

	@PostMapping("/user/findpwForm")
	public String findPwForm(UserVO user, HttpServletRequest req, RedirectAttributes ra) {
		UserVO u = service.select(user.getId());
		if (u.getTel().equals(user.getTel())) {
			req.setAttribute("user", user);
			return "findpw";
		} else {
			ra.addFlashAttribute("msg", "아이디와 전화번호를 다시 확인해주세요");
			String referer = req.getHeader("Referer");
			return "redirect:" + referer;
		}
	}

	@PostMapping("/user/changePw")
	public String changePw(String id, String pw, RedirectAttributes ra) {
		UserVO u = service.select(id);
		u.setPw(pw);
		service.update(u);
		ra.addFlashAttribute("msg", "비밀번호 변경이 완료되었습니다. 로그인 해 주십시오");
		return "redirect:/index";
	}

}
