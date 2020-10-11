DROP DATABASE IF EXISTS logistical;
CREATE DATABASE logistical;
USE logistical;

CREATE TABLE Producto (
id INT AUTO_INCREMENT,
codigo VARCHAR (10),
nombre VARCHAR (50),
precio INT,
stock int ,
UNIQUE (codigo, nombre),
CONSTRAINT id_producto PRIMARY KEY(id)
);


INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "air90H", "Nike Air Max 90",96000, 10);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "airIIIHb", "Nike Air Max III",94400, 5);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "airJor1Mr", "Nike Air Jordan1 Satin",109000, 6);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "air90pH", "Nike Air Max 90 Premium",96990, 6);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "NSb22C", "Nike SB CCanvas",52000, 10);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "NMs7M", "Nike MS7 AMG",57990, 5);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "NMJVr13", "Nike MV13 Neymar Jr",66500, 6);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "NRV01h", "Nike React Vision",84990, 6);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "NZk62s", "Nike Air ZTK6",89000, 10);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "NKRF01h", "Nike Renew Fusion",59900, 5);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "ADZX01h", "Adidas ZX 2K Flux",69900, 10);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "ADZB01h", "Adidas ZX 2K Boost",99900, 7);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "ADNX01h", "Adidas Ninja ZX Torsion",129900, 10);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "ADZX01h", "Adidas ZX 750 HD",64900, 5);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "ADZ601h", "Adidas ZX 650 HD",69900, 10);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "AD2K01h", "Adidas ZX 2K 4D",219900, 10);
-- --
INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "NKJJ02h", "Nike Air Jordan V Low",139900, 10);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "NKRI05h", "Nike React Infinity Run",121990, 5);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "NKSR01h", "Nike SuperRep Go",74900, 12);

INSERT INTO Producto( codigo, nombre, precio, stock)
VALUES( "NKMR01h", "Nike Air Max 270 React",114900, 15);


SELECT*FROM Producto;

