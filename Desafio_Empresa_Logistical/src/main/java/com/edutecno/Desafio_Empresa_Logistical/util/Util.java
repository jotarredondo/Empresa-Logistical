package com.edutecno.Desafio_Empresa_Logistical.util;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public abstract class Util {
	
	public static List<Integer> getPaginas (Integer pagina, Integer total) {
		
		Integer botones = 2;
		Integer inicio = (pagina - botones) < 1 ? 1 : pagina- botones;
		Integer lista = (pagina + botones) > total ? total : pagina + botones;
		List<Integer> paginas = IntStream.rangeClosed(inicio,lista).boxed().collect(Collectors.toList());
				
		return paginas;
		
	}

}
