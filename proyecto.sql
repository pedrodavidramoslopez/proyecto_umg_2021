-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2021 a las 03:30:46
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompra` int(25) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `tipodepago` varchar(50) NOT NULL,
  `cantidad` int(75) NOT NULL,
  `total` int(50) NOT NULL,
  `fecha_De_compra` int(25) NOT NULL,
  `idproducto` int(25) NOT NULL,
  `idusuario` int(25) NOT NULL,
  `idproveedor` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idfactura` int(25) NOT NULL,
  `idventa` int(25) NOT NULL,
  `idcliente` int(50) NOT NULL,
  `idproducto` int(50) NOT NULL,
  `iva` int(50) NOT NULL,
  `preciofinal` int(50) NOT NULL,
  `descuento` int(25) NOT NULL,
  `seriefactura` int(50) NOT NULL,
  `idcodigotrabajo` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idinventario` int(25) NOT NULL,
  `idcompra` int(25) NOT NULL,
  `idventa` int(50) NOT NULL,
  `idproducto` int(50) NOT NULL,
  `fecha_de_ingreso` int(50) NOT NULL,
  `stock` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `idlogin` int(25) NOT NULL,
  `idusuario` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `idtipo_usuario` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(25) NOT NULL,
  `nombreproducto` varchar(50) NOT NULL,
  `costoproducto` int(50) NOT NULL,
  `fecha_de_caducidad` int(25) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `stock` varchar(25) NOT NULL,
  `descuento` int(25) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `fecha_de_ingreso` int(25) NOT NULL,
  `idproveedor` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` int(25) NOT NULL,
  `nit` int(25) NOT NULL,
  `marca` varchar(75) NOT NULL,
  `razonsocial` varchar(75) NOT NULL,
  `codigoproducto` int(25) NOT NULL,
  `telefono` int(25) NOT NULL,
  `direccion` varchar(75) NOT NULL,
  `correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestodetrabajo`
--

CREATE TABLE `puestodetrabajo` (
  `idpuestodetrabajo` int(25) NOT NULL,
  `codigo_puesto` int(25) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `area_laboral` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `idproducto` int(25) NOT NULL,
  `descripcion` varchar(75) NOT NULL,
  `codigoproducto` int(11) NOT NULL,
  `unidad_de_medida` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idtipousuario` int(25) NOT NULL,
  `descripcionrol` varchar(75) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` varchar(50) NOT NULL,
  `dpi` int(25) NOT NULL,
  `nit` int(25) NOT NULL,
  `nombres` varchar(75) NOT NULL,
  `apellidos` varchar(75) NOT NULL,
  `edad` int(10) NOT NULL,
  `sexo` varchar(25) NOT NULL,
  `fechanacimiento` int(25) NOT NULL,
  `telefono` int(25) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `idcodigotrabajo` int(25) NOT NULL,
  `fechaingreso` int(25) NOT NULL,
  `jornadalaboral` varchar(25) NOT NULL,
  `idpuestotrabajo` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventa` int(100) NOT NULL,
  `descripcion` varchar(75) NOT NULL,
  `cantidad` int(50) NOT NULL,
  `total` int(75) NOT NULL,
  `tipopagoventa` varchar(50) NOT NULL,
  `fechaventa` int(25) NOT NULL,
  `idproducto` int(25) NOT NULL,
  `idcodigotrabajo` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `idproveedor` (`idproveedor`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idfactura`),
  ADD KEY `idventa` (`idventa`,`idcliente`,`idproducto`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idcodigotrabajo` (`idcodigotrabajo`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idinventario`),
  ADD KEY `idcompra` (`idcompra`),
  ADD KEY `idventa` (`idventa`,`idproducto`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idlogin`),
  ADD KEY `idtipo_usuario` (`idtipo_usuario`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `puestodetrabajo`
--
ALTER TABLE `puestodetrabajo`
  ADD PRIMARY KEY (`idpuestodetrabajo`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idtipousuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `dpi` (`dpi`),
  ADD KEY `idpuestotrabajo` (`idpuestotrabajo`),
  ADD KEY `codigotrabajo` (`idcodigotrabajo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `idfactura` (`idcodigotrabajo`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idcodigotrabajo` (`idcodigotrabajo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventa` int(100) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `tipoproducto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`idcodigotrabajo`) REFERENCES `usuario` (`idcodigotrabajo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`idcompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `puestodetrabajo`
--
ALTER TABLE `puestodetrabajo`
  ADD CONSTRAINT `puestodetrabajo_ibfk_1` FOREIGN KEY (`idpuestodetrabajo`) REFERENCES `usuario` (`idpuestotrabajo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD CONSTRAINT `tipoproducto_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD CONSTRAINT `tipousuario_ibfk_1` FOREIGN KEY (`idtipousuario`) REFERENCES `login` (`idtipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `login` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idcodigotrabajo`) REFERENCES `usuario` (`idcodigotrabajo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
