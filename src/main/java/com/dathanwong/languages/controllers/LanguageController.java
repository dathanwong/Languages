package com.dathanwong.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dathanwong.languages.models.Language;
import com.dathanwong.languages.services.LanguageService;

@Controller
@RequestMapping("/languages")
public class LanguageController {
	private LanguageService service;
	
	public LanguageController(LanguageService service) {
		this.service = service;
	}
	
	@RequestMapping("")
	public String homePage(Model model,@ModelAttribute("language") Language lang) {
		this.addLanguagesToModel(model);
		return "/languages/home.jsp";
	}
	
	@RequestMapping("/{id}/edit")
	public String editPage(@PathVariable("id") Long id, Model model) {
		Language lang = service.findLanguage(id);
		model.addAttribute("language", lang);
		return "/languages/edit.jsp";
	}
	
	@RequestMapping("/{id}")
	public String showPage(@PathVariable("id") Long id) {
		return "/languages/show.jsp";
	}
	
	@PostMapping("")
	public String create(@Valid @ModelAttribute("language") Language lang, BindingResult result, Model model) {
		this.addLanguagesToModel(model);
		if(result.hasErrors()) {
			return "/languages/home.jsp";
		}else {
			System.out.println("Successfully Created Language");
			service.createLanguage(lang);
			return "redirect:/languages";
		}
	}
	
	@PutMapping("/{id}")
	public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("language") Language lang, BindingResult result, Model model) {
		Language language = service.findLanguage(id);
		model.addAttribute("language", lang);
		if(result.hasErrors()) {
			return "/languages/edit.jsp";
		}else {
			language.setName(lang.getName());
			language.setCreator(lang.getCreator());
			language.setVersion(lang.getVersion());
			service.updateLanguage(language);
			return "redirect:/languages";
		}
	}
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable("id") Long id) {
		service.deleteLanguage(id);
		return "redirect:/languages";
	}
	
	private void addLanguagesToModel(Model model) {
		List<Language> languages = service.getLanguages();
		if(languages != null) {
			model.addAttribute("languages", languages);
		}
	}

}
