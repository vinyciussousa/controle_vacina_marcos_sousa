package br.com.opt2.controle_vacina.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.opt2.controle_vacina.domain.Pessoa;
import br.com.opt2.controle_vacina.service.PessoaService;

@RestController
@RequestMapping("/api/v1/pessoas")
public class PessoaResource {
	@Autowired
	private PessoaService pessoaService;
	
	@PostMapping
	public Pessoa save(@RequestBody Pessoa pessoa) {
		return pessoaService.save(pessoa);
	}
	
	/*@GetMapping
	public ResponseEntity<List<Pessoa>> findAll(){
		List<Pessoa> pessoas = pessoaService.findAll();
		if(pessoas == null || pessoas.isEmpty()) {
			return new ResponseEntity<List<Pessoa>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Pessoa>>(HttpStatus.OK);
	}
	
	@GetMapping(path = {"/{cpf}"})
	public ResponseEntity<?> findBycpf(@PathVariable Long cpf){
		return pessoaService.findBycpf(cpf)
				.map(record -> ResponseEntity.ok().body(record))
				.orElse(ResponseEntity.notFound().build());
	}
	
	@PutMapping(value="/{cpf}")
	public ResponseEntity<Pessoa> update(@PathVariable("cpf") String cpf, @RequestBody Pessoa pessoa) {
		return (pessoaService.findByCPF(cpf))
				.map(record -> {
					record.setCpf(pessoa.getCpf());
					record.setCidade(pessoa.getCidade());
					record.setData(pessoa.getData());
					record.setNome(pessoa.getNome());
					record.setResponsavel(pessoa.getResponsavel());
					record.setSegunda(pessoa.getSegunda());
					record.setUf(pessoa.getUf());
					record.setVacina(pessoa.getVacina());
						Pessoa updated = pessoaService.save(record);
						return ResponseEntity.ok().body(updated);
						
				}).orElse(ResponseEntity.notFound().build());
	}*/
	
	@GetMapping
	public List<Pessoa> findAll(){
		return pessoaService.findAll();
	}
	
	@GetMapping(path = {"/{cpf}"})
	public List<Pessoa> findBycpf(@PathVariable("cpf") Long cpf) {
		return pessoaService.findBycpf(cpf);
	}
	
	@GetMapping(path = {"/{nome}"})
	public List<Pessoa> findByNome(@PathVariable("nome") String nome) {
		return pessoaService.findByNome(nome);
	}
	
	@DeleteMapping(path = {"/{cpf}"})
	public void deleteBycpf(@PathVariable("cpf") Long cpf) {
		pessoaService.deleteBycpf(cpf);
	}
	
	@DeleteMapping(path = {"/{nome}"})
	public void deleteByNome(@PathVariable("nome") String nome) {
		pessoaService.deleteByNome(nome);
	}
}
