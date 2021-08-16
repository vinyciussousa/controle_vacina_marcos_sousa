package br.com.opt2.controle_vacina.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.opt2.controle_vacina.domain.Pessoa;
import br.com.opt2.controle_vacina.repository.PessoaRepository;

@Service
public class PessoaService {	
	@Autowired
	private PessoaRepository pessoaRepository;
	
	public Pessoa save(Pessoa pessoa) {
		return pessoaRepository.save(pessoa);
	}
	
	public List<Pessoa> findAll () {
		return (List<Pessoa>) pessoaRepository.findAll();
	}
	 
	public List<Pessoa> findBycpf(Long cpf){
		return pessoaRepository.findBycpf(cpf);
	}
	
	public List<Pessoa> findByNome(String nome){
		return pessoaRepository.findByNome(nome);
	}
	
	public void deleteBycpf(Long cpf) {
		pessoaRepository.deleteBycpf(cpf);
	}

	public void deleteByNome(String nome) {
		pessoaRepository.deleteByNome(nome);
	}
}