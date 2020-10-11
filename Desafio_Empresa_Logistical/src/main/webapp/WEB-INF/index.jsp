<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<!--CSS de Bootstrap 4.2.1-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!-- Link Css -->
<link href="css/style.css" rel="stylesheet">
<!-- Google fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@300;500;700&display=swap" rel="stylesheet">



</head>
<body>
<script type="text/javascript">
            function setItemPagina(itemPorPagina){
            window.location.href="inicio?p=1&itemsPorPagina="+itemPorPagina;
            
        }
    </script>
	
	
	<div class="container" id="cuerpo">
		<nav class="navbar navbar-expand-lg fixed-top col-sm-12">
			<div class="container justify-content-center ">
				<div class="mx-5 px-5 py-2 text-center">
					<h2>Empresa Logistical</h2>
				</div>
			</div>
		</nav>

		<div class="card align-item-center shadow rounded m-5 p-5" id="card1">
			<div class="aling-items-center px-5 mx-5">
				<form action="buscar" method="post" class="text-align-center">
					<div class="form-group">
						<h4 class="primer text-center">Registro de productos</h4>
						<input class="form-control text-center" type="text" id="dato"
							name="dato" /> <span class="Error"></span>
					</div>

					<div class="form-group text-center">
						<button type="submit" class="btn btn-sm" id="btn">Buscar</button>
					</div>
				</form>
				<div class="justify-content-center mx-5 px-5">
					<div class="text-center">
						<button type="button" class="btn btn-sm" data-toggle="modal"
						data-target="#formAgregar" data-whatever="@fat" id="btn">Agregar</button>
						<button type="button" class="btn btn-sm" data-toggle="modal"
						data-target="#formQuitar" data-whatever="@fat" id="btn">Quitar</button>
						<button type="button" class="btn btn-sm" data-toggle="modal"
						data-target="#formActualizar" data-whatever="@fat" id="btn">Actualizar</button>
						
						
					</div>
				</div>
			</div>
		</div>


		<div class=" my-3 py-2"></div>
		
			<div class = "text-center" id="listadoRegistro">
			<label>Articulos por pagina</label>
				<div class="justify-content-center ">
					<button onclick="setItemPagina(5);" class="btn btn-sm" id="btn">5</button>
					<button onclick="setItemPagina(10);" class="btn btn-sm" id="btn">10</button>
					<button onclick="setItemPagina(15);" class="btn btn-sm" id="btn">15</button>
				</div>
			</div>
		

		<!-- Tabla registros -->
		<div class="container px-5 shadow rounded" id="listadoRegistro">

			<c:out value="${mensaje}"></c:out>
			<table class="table table-borderless">
				<thead>
					<tr>
						<th scope="col"><h5>Id</h5></th>
						<th scope="col"><h5>Codigo</h5></th>
						<th scope="col"><h5>Nombre</h5></th>
						<th scope="col"><h5>Precio</h5></th>
						<th scope="col"><h5>Stock</h5></th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${productos}" var="producto">
						<tr>
							<td><c:out value="${producto.getId()}"></c:out></td>
							<td><c:out value="${producto.getCodigo()}"></c:out></td>
							<td><c:out value="${producto.getNombre()}"></c:out></td>
							<td><c:out value="${producto.getPrecio()}"></c:out></td>
							<td><c:out value="${producto.getStock()}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<ul class="pagination pagination-lg justify-content-center">
				<c:forEach items="${paginador}" var="pagina">
					<li class="page-item ${paginaActual == pagina ? 'disabled' : ''}"><a
						class="page-link" href="inicio?p=${pagina}" tabindex="-1">${pagina}</a></li>
				</c:forEach>
			</ul>
		</div>

		<!-- Modal Agregar-->
		<div class="modal fade" id="formAgregar" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Agregar producto</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="agregar" method="post" modelAttribute="producto">
							<div class="form-group">
								<label for="titulo">Codigo</label> <input type="text"
									class="form-control" name="codigo"
									placeholder="Ingrese código del producto" required>
							</div>
							<div class="form-group">
								<label for="año">Nombre</label> <input type="text"
									class="form-control" name="nombre"
									placeholder="Ingrese nombre del producto" required>
							</div>
							<div class="form-group">
								<label for="autor">Precio</label> <input type="number"
									class="form-control" name="precio" placeholder="Ingrese precio"
									required>
							</div>
							<div class="form-group">
								<label for="imprenta">Stock</label> <input type="number"
									class="form-control" name="stock" placeholder="Ingrese Stock"
									required>
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Agregar</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

		<!-- Modal Borrar -->
		<div class="modal fade" id="formQuitar" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ingrese código del producto</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<form action="borrar" method="post">
							<div class="form-group">
								<input type="text" class="form-control" name="opcion"
									placeholder="Ingrese codigo del producto">
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Eliminar</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

		<!-- Modal Modificar -->
		<div class="modal fade" id="formActualizar" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Actualizar registro</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<form action="actualizar" method="post" modelAttribute="producto">
							<div class="form-group">
								<label for="titulo">Id</label> <input type="number"
									class="form-control" name="id"
									placeholder="Ingrese código del producto" required>
							</div>
							<div class="form-group">
								<label for="titulo">Codigo</label> <input type="text"
									class="form-control" name="codigo"
									placeholder="Ingrese código del producto" required>
							</div>
							<div class="form-group">
								<label for="año">Nombre</label> <input type="text"
									class="form-control" name="nombre"
									placeholder="Ingrese nombre del producto" required>
							</div>
							<div class="form-group">
								<label for="autor">Precio</label> <input type="number"
									class="form-control" name="precio" placeholder="Ingrese precio"
									required>
							</div>
							<div class="form-group">
								<label for="imprenta">Stock</label> <input type="number"
									class="form-control" name="stock" placeholder="Ingrese Stock"
									required>
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Actualizar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>


	<!--jQuery 3.3.1 -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

	<!--Popper JS 1.14.3-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>

	<!--Bootstrap JS 4.2.1-->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>