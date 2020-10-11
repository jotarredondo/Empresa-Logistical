package com.edutecno.Desafio_Empresa_Logistical.servicios;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edutecno.Desafio_Empresa_Logistical.VO.NumeroVO;
import com.edutecno.Desafio_Empresa_Logistical.VO.ProductoVO;
import com.edutecno.Desafio_Empresa_Logistical.dao.ProductoDAO;
import com.edutecno.Desafio_Empresa_Logistical.modelo.Producto;


@Service
public class ProductoServicioImp implements ProductoServicio {
	
	@Autowired
	ProductoDAO productoDao;
	
	ProductoVO setProducto;
	
	private static Logger logger = LoggerFactory.getLogger(ProductoDAO.class);

	@Override
	public ProductoVO findAll() {
		
		setProducto = new ProductoVO( new ArrayList<Producto>(),"Ha ocurrido un error", "101");
		
		try {
			
			setProducto.setProductos((List<Producto>)productoDao.findAll());
			setProducto.setMensaje(String.format("Se obtuvieron %d registros", setProducto.getProductos().size()));
			setProducto.setCodigo("0");
		}catch (Exception e){
			logger.error("ProductoServicioImp : findAll()");
		}
		
		
		return setProducto;
	}

	@Override
	public ProductoVO findByName(String nombre) {
		
		setProducto = new ProductoVO( new ArrayList<Producto>(),"Ha ocurrido un error", "102");
		
		try {
			setProducto.setProductos((List<Producto>)productoDao.findByNombre(nombre));
			setProducto.setMensaje(String.format(" Se encontraron %d registros ", setProducto.getProductos().size()));
			setProducto.setCodigo("0");
			
		} catch (Exception e) {
			logger.error("ProductoServicioImp : findByName : " + e);
		}
		
		return setProducto;
	}

	@Override
	public ProductoVO add (Producto producto) {
		
		setProducto = new ProductoVO( new ArrayList<Producto>(),"Ha ocurrido un error", "103");
			try {
				productoDao.save(producto);
				setProducto.setMensaje(String.format(" Se añadió correctamente el producto %s con el código %s", producto.getNombre(), producto.getCodigo()));
				setProducto.setCodigo("0");
				
			}catch (Exception e){
				
				logger.error("ProductoServicioImp : add : " + e);
			}
		
		return setProducto;
	}

	@Override
	public ProductoVO update(Producto producto) {
		
		setProducto = new ProductoVO( new ArrayList<Producto>(),"Ha ocurrido un error", "104");
		
			try {
				productoDao.save(producto);
				setProducto.setMensaje(String.format( " Se actualizó correctamente el producto %s ", producto.getNombre()));
				setProducto.setCodigo("0");
			
		}catch (Exception e){
			
			logger.error("ProductoServicioImp : update : " + e);
		}
		
		return setProducto;
	}

	@Override
	public ProductoVO delete(Integer id) {
		
		setProducto = new ProductoVO( new ArrayList<Producto>(),"Ha ocurrido un error", "105");
		
		try {
			productoDao.deleteById(id);
			setProducto.setMensaje(String.format(" Se ha eliminado exitosamente el registro "));
			setProducto.setCodigo("0");
			
		}catch (Exception e) {
			
			logger.error("ProductoServicioImp : delete : " + e);
		}
		
		return setProducto;
	}

	@Override
	@Transactional(readOnly = true)
	public ProductoVO getPage(Integer pagina, Integer cantidad) {
		
		setProducto = new ProductoVO(new ArrayList<Producto>(), "Ha ocurrido un error", "106");
		
		try {
			Pageable pageable = PageRequest.of(pagina,cantidad);
			Page<Producto> responsePage = productoDao.findAll(pageable);
			setProducto.setProductos(responsePage.getContent());
			setProducto.setMensaje(String.format("Se han encontrado %d registros", setProducto.getProductos().size()));
			setProducto.setMensaje("0");
			
		}catch (Exception e) {
			
			logger.error("ProductoServicioImp + getPage" + e);
			
		}
		return setProducto;
	}

	@Override
	public NumeroVO getPageCount(long registros) {
		
		NumeroVO pages = new NumeroVO(0 ,"Ha ocurrido un error", "107");
		
		try {
			
			long cantidad = productoDao.count();
				if(registros == 0 && cantidad == 0) {
					
					pages.setValor(1);
				} else {
					
					pages.setValor((cantidad/registros) + (cantidad % registros == 0 ? 0: 1));
				}
				pages.setCodigo("201");
				pages.setMensaje(String.format("Hay %d paginas", pages.getValor()));
			
		}catch (Exception e) {
			
			logger.error("ProductoServicioImp + getPageCount" + e);
		}
		return pages;
	}
	
}
