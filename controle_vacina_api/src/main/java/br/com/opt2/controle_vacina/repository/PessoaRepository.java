package br.com.opt2.controle_vacina.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.opt2.controle_vacina.domain.Pessoa;

@Repository
public interface PessoaRepository extends CrudRepository<Pessoa, Long>{
	List<Pessoa> findBycpf(Long cpf);
	List<Pessoa> findByNome(String nome);
	void deleteBycpf(Long cpf);
	void deleteByNome(String nome);
	
}
