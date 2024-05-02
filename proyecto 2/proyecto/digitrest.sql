-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 04-03-2024 a las 16:02:40
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `digitrest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `numeroMesa` int(11) NOT NULL,
  `estadoPedido` varchar(30) NOT NULL,
  `idMesero` int(11) NOT NULL,
  `idCocinero` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `fecha`, `numeroMesa`, `estadoPedido`, `idMesero`, `idCocinero`, `idCliente`) VALUES
(1, '0000-00-00 00:00:00', 4, 'preparando', 2, 3, 1),
(2, '0000-00-00 00:00:00', 3, 'listo', 2, 3, 1),
(3, '0000-00-00 00:00:00', 6, 'preparando', 2, 3, 1),
(4, '0000-00-00 00:00:00', 7, 'listo', 2, 3, 1),
(5, '2024-02-27 09:32:58', 2, 'listo', 2, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidoplatos`
--

CREATE TABLE `pedidoplatos` (
  `idPlato` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 1,
  `personalizacion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidoplatos`
--

INSERT INTO `pedidoplatos` (`idPlato`, `idPedido`, `cantidad`, `personalizacion`) VALUES
(3, 4, 2, 'sincilantro'),
(4, 2, 1, 'sin sal'),
(2, 3, 3, ''),
(1, 1, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `idPlato` int(11) NOT NULL,
  `nombrePlato` varchar(100) NOT NULL,
  `descripPlato` varchar(1000) NOT NULL,
  `fotoPlato` varchar(500) NOT NULL,
  `precioPlato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`idPlato`, `nombrePlato`, `descripPlato`, `fotoPlato`, `precioPlato`) VALUES
(1, 'Arroz', 'arrocito', 'hss74a5sa', 42000),
(2, 'Pollo', 'Pollito', 'hiduhakwd', 22000),
(3, 'Sopa', 'sopita', 'hss74a5sa', 42000),
(4, 'frijol', 'frijolito', 'jdaac', 30000),
(5, 'huevo', 'huevito', 'svasas', 10000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `descripRol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `descripRol`) VALUES
(1, 'administrador'),
(2, 'mesero'),
(3, 'cocinero'),
(4, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `idRol` int(11) NOT NULL,
  `correoUsuario` varchar(100) NOT NULL,
  `contraseña` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombreUsuario`, `idRol`, `correoUsuario`, `contraseña`) VALUES
(1, 'Juan', 4, 'juan077@gmail.com', '123456'),
(2, 'andrea', 2, 'andrea123@gmail.com', '654321'),
(3, 'camilo', 3, 'camilo098@gmail.com', '567890'),
(4, 'paula', 1, 'paula675@gmail.com', '098765');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idMesero` (`idMesero`),
  ADD KEY `idCocinero` (`idCocinero`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `pedidoplatos`
--
ALTER TABLE `pedidoplatos`
  ADD KEY `idPlato` (`idPlato`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`idPlato`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRol` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `idPlato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idMesero`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idCocinero`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`idCliente`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `pedidoplatos`
--
ALTER TABLE `pedidoplatos`
  ADD CONSTRAINT `pedidoplatos_ibfk_1` FOREIGN KEY (`idPlato`) REFERENCES `platos` (`idPlato`),
  ADD CONSTRAINT `pedidoplatos_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
