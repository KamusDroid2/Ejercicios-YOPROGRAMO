-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 02-07-2022 a las 18:39:14
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.0.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `nombreAl` varchar(45) DEFAULT NULL,
  `apellidoAl` varchar(45) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `direccionComp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `nombreAl`, `apellidoAl`, `fechaNac`, `direccionComp`) VALUES
(1, 'Jorge', 'Benitez', '1992-05-13', 'San Juan 23'),
(2, 'Alberto', 'Fernandez', '1998-06-16', 'Perito Moreno 546'),
(3, 'Katherina', 'Stephenson', '1994-04-16', 'Cochabamba 3000'),
(4, 'Laura', 'Ebert', '1994-08-23', 'Alberti 9832');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_has_cursos_disponibles`
--

CREATE TABLE `alumnos_has_cursos_disponibles` (
  `alumnos_id` int(11) NOT NULL,
  `cursos_disponibles_id` int(11) NOT NULL,
  `cursos_disponibles_edificios_id` int(11) NOT NULL,
  `cursos_disponibles_dias_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos_has_cursos_disponibles`
--

INSERT INTO `alumnos_has_cursos_disponibles` (`alumnos_id`, `cursos_disponibles_id`, `cursos_disponibles_edificios_id`, `cursos_disponibles_dias_id`) VALUES
(1, 4, 9, 5),
(2, 5, 4, 6),
(3, 2, 6, 2),
(4, 5, 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos_disponibles`
--

CREATE TABLE `cursos_disponibles` (
  `id` int(11) NOT NULL,
  `cursoName` varchar(45) DEFAULT NULL,
  `edificios_id` int(11) NOT NULL,
  `dias_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursos_disponibles`
--

INSERT INTO `cursos_disponibles` (`id`, `cursoName`, `edificios_id`, `dias_id`) VALUES
(1, 'Macrame Tecnico Avanzado', 3, 6),
(2, 'Opera Renacentista y trap', 6, 2),
(3, 'Lavado de calcetines', 4, 1),
(4, 'Neurogenesis y pastafrolas', 9, 5),
(5, 'Death Metal con cuencos tibetanos', 4, 6),
(6, 'Cambio de filtro SPAR', 7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE `dias` (
  `id` int(11) NOT NULL,
  `dias` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`id`, `dias`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sabado'),
(7, 'Domingo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificios`
--

CREATE TABLE `edificios` (
  `id` int(11) NOT NULL,
  `edificios` varchar(45) DEFAULT NULL,
  `aula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `edificios`
--

INSERT INTO `edificios` (`id`, `edificios`, `aula`) VALUES
(1, 'Chuck Schuldilner', 1),
(2, 'Chuck Schuldilner', 2),
(3, 'Chuck Schuldilner', 3),
(4, 'Yngwie Malmsteen', 1),
(5, 'Yngwie Malmsteen', 2),
(6, 'Yngwie Malmsteen', 3),
(7, 'Atahualpa', 1),
(8, 'Atahualpa', 2),
(9, 'Atahualpa', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alumnos_has_cursos_disponibles`
--
ALTER TABLE `alumnos_has_cursos_disponibles`
  ADD PRIMARY KEY (`alumnos_id`,`cursos_disponibles_id`,`cursos_disponibles_edificios_id`,`cursos_disponibles_dias_id`),
  ADD KEY `fk_alumnos_has_cursos_disponibles_cursos_disponibles1` (`cursos_disponibles_id`,`cursos_disponibles_edificios_id`,`cursos_disponibles_dias_id`);

--
-- Indices de la tabla `cursos_disponibles`
--
ALTER TABLE `cursos_disponibles`
  ADD PRIMARY KEY (`id`,`edificios_id`,`dias_id`),
  ADD KEY `fk_cursos_disponibles_edificios1` (`edificios_id`),
  ADD KEY `fk_cursos_disponibles_dias1` (`dias_id`);

--
-- Indices de la tabla `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `edificios`
--
ALTER TABLE `edificios`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos_has_cursos_disponibles`
--
ALTER TABLE `alumnos_has_cursos_disponibles`
  ADD CONSTRAINT `fk_alumnos_has_cursos_disponibles_alumnos1` FOREIGN KEY (`alumnos_id`) REFERENCES `alumnos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alumnos_has_cursos_disponibles_cursos_disponibles1` FOREIGN KEY (`cursos_disponibles_id`,`cursos_disponibles_edificios_id`,`cursos_disponibles_dias_id`) REFERENCES `cursos_disponibles` (`id`, `edificios_id`, `dias_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cursos_disponibles`
--
ALTER TABLE `cursos_disponibles`
  ADD CONSTRAINT `fk_cursos_disponibles_dias1` FOREIGN KEY (`dias_id`) REFERENCES `dias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cursos_disponibles_edificios1` FOREIGN KEY (`edificios_id`) REFERENCES `edificios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
