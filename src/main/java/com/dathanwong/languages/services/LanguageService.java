package com.dathanwong.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.dathanwong.languages.models.Language;
import com.dathanwong.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository repo;
	
	public LanguageService(LanguageRepository repo) {
		this.repo = repo;
	}
	
	public List<Language> getLanguages(){
		return repo.findAll();
	}
	
	public void deleteLanguage(Long id) {
		repo.deleteById(id);
	}
	
	public Language createLanguage(Language lang) {
		return repo.save(lang);
	}
	
	public Language findLanguage(Long id) {
		Optional<Language> lang = repo.findById(id);
		if(lang.isPresent()) {
			return lang.get();
		}else {
			return null;
		}
	}
	
	public Language updateLanguage(Language lang) {
		return repo.save(lang);
	}
	
}
