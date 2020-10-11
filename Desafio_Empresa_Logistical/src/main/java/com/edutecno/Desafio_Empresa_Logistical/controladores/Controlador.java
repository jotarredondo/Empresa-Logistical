package com.edutecno.Desafio_Empresa_Logistical.controladores;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edutecno.Desafio_Empresa_Logistical.VO.ProductoVO;
import com.edutecno.Desafio_Empresa_Logistical.modelo.Producto;
import com.edutecno.Desafio_Empresa_Logistical.servicios.ProductoServicio;
import com.edutecno.Desafio_Empresa_Logistical.util.Util;


@Controller
public class Controlador {
	
	@Autowired
	ProductoServicio productoServicio;
	
	ProductoVO productoVO;
	
	
	
	
	//Inicio JSP
	
	Integer items = 5;
	
	@RequestMapping(value = {"/","inicio"}, method = RequestMethod.GET )
	public String inicio (Model modelo, @RequestParam(defaultValue = "1")Integer p, @RequestParam(required=false )Integer itemsPorPagina) {
			
			if(itemsPorPagina != null) {
				
				items = itemsPorPagina;
			}
		modelo.addAttribute("paginador", Util.getPaginas(p, (int) productoServicio.getPageCount(items).getValor()));
		modelo.addAttribute("paginaActual", p);
		
		productoVO = productoServicio.getPage(p-1, items);
		modelo.addAttribute("productos", productoVO.getProductos());
		modelo.addAttribute("mensaje", productoVO.getMensaje());
		modelo.addAttribute("codigo", productoVO.getCodigo());
		modelo.addAttribute("itemsPorPagina", items);
		return "index";
	}
	
	
	// Buscar JSP
	
	@RequestMapping(value = "buscar", method = RequestMethod.POST)
	public String buscar (@RequestParam String dato, ModelMap modelo) {
		productoVO = productoServicio.findByName(dato);
		System.out.println(productoVO);
		
		modelo.addAttribute("productos", productoVO.getProductos());
		modelo.addAttribute("mensaje", productoVO.getMensaje());
		modelo.addAttribute("codigo", productoVO.getCodigo());
		return "index";
		
	}
	
	//Agregar Registro JSP
	
	@RequestMapping(value = "agregar", method = RequestMethod.POST)
	public String addLibro (ModelMap modelo , @ModelAttribute Producto producto) {
		productoVO = productoServicio.add(producto);
		modelo.addAttribute("mensaje", productoVO.getMensaje());
		modelo.addAttribute("codigo", productoVO.getCodigo());
		return "index";
	}
	
	//Eliminar Registro JSP
	
	@RequestMapping(value = "borrar", method = RequestMethod.POST )
	public String borrar (ModelMap modelo, @RequestParam String opcion) {
		
		productoVO = productoServicio.delete(Integer.parseInt(opcion));
		modelo.addAttribute("mensaje", productoVO.getMensaje());
		
		return "index";
	}
	
	// Modificar registro JSP
	
	@RequestMapping(value = "actualizar", method = RequestMethod.POST)
	public String actualizar (ModelMap modelo ,@ModelAttribute Producto producto) {
		if(producto.getId() < productoServicio.findAll().getProductos().size()) {
		productoVO = productoServicio.update(producto);
		modelo.addAttribute("mensaje", productoVO.getMensaje());
		}
		else {
			modelo.addAttribute("mensaje", "Ingrese un id válido");
		}
		return "index";
	}	
	
}
