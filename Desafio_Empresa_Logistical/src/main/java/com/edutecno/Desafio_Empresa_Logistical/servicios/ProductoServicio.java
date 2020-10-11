package com.edutecno.Desafio_Empresa_Logistical.servicios;

import com.edutecno.Desafio_Empresa_Logistical.VO.NumeroVO;
import com.edutecno.Desafio_Empresa_Logistical.VO.ProductoVO;
import com.edutecno.Desafio_Empresa_Logistical.modelo.Producto;

public interface ProductoServicio {
	
	public ProductoVO findAll();
	
	public ProductoVO findByName(String nombre);
	
	public ProductoVO add(Producto producto);
	
	public ProductoVO update(Producto producto);
	
	public ProductoVO delete(Integer id);
	
	public ProductoVO getPage(Integer pagina, Integer cantidad);
	
	public NumeroVO getPageCount(long registros);

}
