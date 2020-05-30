package com.examen.controlador;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.examen.entidad.Cliente;
import com.examen.entidad.Tipo;
import com.examen.servicio.ClienteServicio;
import com.examen.servicio.TipoServicio;

@Controller
public class ClienteController {

	@Autowired
	private ClienteServicio clienteServicio;
	
	@Autowired
	private TipoServicio tipoServicio;

	@RequestMapping("/verCliente")
	public String ver() {
		return "registraCliente";
	}
	
	@RequestMapping("/cargaTipo")
	@ResponseBody
	public List<Tipo> listaTipo() {
		return tipoServicio.listaTipo();
	}
	
	@RequestMapping("/registraCliente")
	public String metRegistra(Cliente obj,HttpSession session) {
		Cliente aux = clienteServicio.insertaCliente(obj);
		if(aux == null) {
			session.setAttribute("MENSAJE", "Registro erróneo");
		}else {
			session.setAttribute("MENSAJE", "Registro exitos");
		}
		return "redirect:verCliente";
	}


	
	
}
