package com.edutecno.Desafio_Empresa_Logistical.VO;

import java.util.List;

import com.edutecno.Desafio_Empresa_Logistical.modelo.Producto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor

public class ProductoVO {
	
	
	private List<Producto> productos;
	private String mensaje;
	private String codigo;

}
