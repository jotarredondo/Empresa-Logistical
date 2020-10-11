package com.edutecno.Desafio_Empresa_Logistical.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import com.edutecno.Desafio_Empresa_Logistical.modelo.Producto;



@Repository
public interface ProductoDAO extends CrudRepository <Producto,Integer>, PagingAndSortingRepository<Producto, Integer>  {
	

	
	@Query (value = "SELECT id, codigo, nombre, precio, stock from producto where nombre like %?1% ",nativeQuery = true )
	List<Producto> findByNombre(String nombre);
	

		
	
}
