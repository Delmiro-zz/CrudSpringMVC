package br.com.caelum.contas.controller;

import java.util.List;

import javax.naming.Binding;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.contas.dao.ContaDAO;
import br.com.caelum.contas.modelo.Conta;

@Controller
public class ContaController {

	private ContaDAO dao;
	@Autowired
	public ContaController(ContaDAO dao) {
		this.dao = dao;
	}

	@RequestMapping("/form")
	public String formulario() {
		return "formulario";
	}

	@RequestMapping("/adicionaConta")
	public String adiciona(@Valid Conta conta, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "formulario";
		}
		System.out.println("Conta adicionada é: " + conta.getDescricao());
		dao.adiciona(conta);
		return "conta-adicionada";
	}

	@RequestMapping("/listaContas")
	public ModelAndView lista() {
		List<Conta> lista = dao.lista();
		ModelAndView mv = new ModelAndView("conta/lista");
		mv.addObject("contas", lista);
		return mv;
	}

	@RequestMapping("removeConta")
	public String remove(Conta conta) {
		dao.remove(conta);
		return "redirect:listaContas";
	}

	@RequestMapping("/pagaConta")
	public String paga(Conta conta) {
		dao.paga(conta.getId());
		return "redirect:listaContas";
	}

}
