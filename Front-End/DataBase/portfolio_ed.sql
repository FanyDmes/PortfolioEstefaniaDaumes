-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 10-07-2022 a las 16:32:31
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfolio_ed`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educacion`
--

DROP TABLE IF EXISTS `educacion`;
CREATE TABLE IF NOT EXISTS `educacion` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `institucion` varchar(45) DEFAULT NULL,
  `fecha` char(11) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`,`persona_id`),
  KEY `fk_educacion_persona` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `educacion`
--

INSERT INTO `educacion` (`id`, `persona_id`, `titulo`, `institucion`, `fecha`, `descripcion`) VALUES
(1, 1, 'Desarrollo Web Fullstack', 'Argentina Programa', '2021 - 2022', 'Curso de Desarrollo Web FullStack donde se estudian diversas tecnologías como ser HTML, CSS, Bootstrap, Angular, Java, Spring Boot, entre otras.'),
(2, 1, 'Reparación y armado de redes', 'UTN Mar del plata', '2006', 'Curso completo de Reparación y armado de redes.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_laboral`
--

DROP TABLE IF EXISTS `experiencia_laboral`;
CREATE TABLE IF NOT EXISTS `experiencia_laboral` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `puesto` varchar(45) DEFAULT NULL,
  `empleador` varchar(45) DEFAULT NULL,
  `fecha` char(11) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`,`persona_id`),
  KEY `fk_experiencia_laboral_persona1` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `experiencia_laboral`
--

INSERT INTO `experiencia_laboral` (`id`, `persona_id`, `puesto`, `empleador`, `fecha`, `descripcion`) VALUES
(1, 1, 'Mantenimiento de PC', 'Freelancer', '2006-2015', 'Reparación de Pcs, Notebook, Tablets, Celulares.\', \'Armado de Pcs, personalizaciones. Instalaciones de software Windows, Antivuirus, actualizaciones en general.'),
(2, 1, 'Trabajo Administrativo', 'Trasda S.A', '2010-2012', 'Tareas administrativas.'),
(3, 1, 'Gestoria del Automotor', 'Gestoria general', '2013-2022', 'Gestiones varias en el area Automotríz,<br> Transferencias,<br> Prendas,<br> Denuncias de ventas,<br> Informes varios.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidad`
--

DROP TABLE IF EXISTS `habilidad`;
CREATE TABLE IF NOT EXISTS `habilidad` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `tipo_habilidad_id` int(11) NOT NULL,
  `nivel_habilidad_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `progreso` int(100) DEFAULT NULL,
  `icono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`persona_id`,`tipo_habilidad_id`,`nivel_habilidad_id`),
  KEY `fk_habilidad_persona1` (`persona_id`),
  KEY `fk_habilidad_tipo_habilidad1` (`tipo_habilidad_id`),
  KEY `fk_habilidad_nivel_habilidad1` (`nivel_habilidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `habilidad`
--

INSERT INTO `habilidad` (`id`, `persona_id`, `tipo_habilidad_id`, `nivel_habilidad_id`, `nombre`, `progreso`, `icono`) VALUES
(1, 1, 3, 1, 'HTML', 80, 'fa-brands fa-html5'),
(2, 1, 2, 1, 'Java/Spring Boot', 40, 'fa-brands fa-java'),
(3, 1, 3, 2, 'JavaScript', 60, 'fa-brands fa-html5'),
(4, 1, 2, 1, 'Bootstrap', 70, 'fa-brands fa-html5'),
(5, 1, 2, 1, 'Angular', 60, 'fa-brands fa-html5'),
(6, 1, 3, 1, 'CSS', 80, 'fa-brands fa-html5'),
(7, 1, 2, 1, ' MySql', 40, 'fa-brands fa-java'),
(8, 1, 3, 3, 'Workteam', 100, 'fa-brands fa-java'),
(9, 1, 3, 3, 'English', 100, 'fa-brands fa-java'),
(10, 1, 3, 3, 'Predisposición', 100, 'fa-brands fa-java'),
(11, 1, 3, 3, 'Autodidacta', 100, 'fa-brands fa-java');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_habilidad`
--

DROP TABLE IF EXISTS `nivel_habilidad`;
CREATE TABLE IF NOT EXISTS `nivel_habilidad` (
  `id` int(11) NOT NULL,
  `nivel_habilidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nivel_habilidad`
--

INSERT INTO `nivel_habilidad` (`id`, `nivel_habilidad`) VALUES
(1, 'Básico'),
(2, 'Intermedio'),
(3, 'Avanzado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `img_url` varchar(100) DEFAULT NULL,
  `linkedin_url` varchar(60) DEFAULT NULL,
  `portfolio_id` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `titulo`, `email`, `img_url`, `linkedin_url`, `portfolio_id`) VALUES
(1, 'Estefania Daumes', 'Desarrollador Web Fullstack Jr.', 'fanydaumes@gmail.com', 'https://avatars.githubusercontent.com/u/95221534?v=4', 'https://www.linkedin.com/in/estefan%C3%ADa-daumes-417916212/', 'https://github.com/FanyDmes/PortfolioEstefaniaDaumes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
CREATE TABLE IF NOT EXISTS `portfolio` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`persona_id`),
  KEY `fk_portfolio_persona1` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `portfolio`
--

INSERT INTO `portfolio` (`id`, `persona_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE IF NOT EXISTS `proyecto` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `img_url` varchar(100) DEFAULT NULL,
  `demo_url` varchar(100) DEFAULT NULL,
  `repo_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`persona_id`),
  KEY `fk_proyecto_persona1` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id`, `persona_id`, `titulo`, `descripcion`, `img_url`, `demo_url`, `repo_url`) VALUES
(1, 1, 'Portfolio - Argentina Programa', 'Proyecto final realizado durante el Curso de Desarrollo Web Fullstack Argentina Programa. Utiliza herramientas como HTML, CSS, JS (Angular) y Bootstrap.', 'assets/project-1.png', 'https://github.com/FanyDmes/PortfolioEstefaniaDaumes/blob/main/Front-End-Angular/src/index.html', 'https://github.com/FanyDmes/PortfolioEstefaniaDaumes/blob/main/Front-End-Angular/src/index.html'),
(2, 1, 'Calculadora', 'En este proyecto de calculadora utilicé herramientas como HTML, CSS, JavaScript. Permite ejecutar las cuatro operaciones básicas que son: sumar, restar, multiplicar y dividir, adicionalmente incluye un botón para resetear los resultados en caso de querer realizar una nueva operación.', 'assets/project-2.png', 'https://github.com/FanyDmes', 'https://github.com/FanyDmes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

DROP TABLE IF EXISTS `seccion`;
CREATE TABLE IF NOT EXISTS `seccion` (
  `id` int(11) NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `portfolio_persona_id` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `section_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`portfolio_id`,`portfolio_persona_id`),
  KEY `fk_seccion_portfolio1` (`portfolio_id`,`portfolio_persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id`, `portfolio_id`, `portfolio_persona_id`, `titulo`, `descripcion`, `section_img`) VALUES
(1, 1, 1, 'Hero', '1', '../assets/hero-image.jpg'),
(2, 1, 1, 'Sobre Mí', 'Hola! Mi nombre es Estefania y soy una recién graduada de Argentina Programa.<br> Mi objetivo es poder trabajar como Full Stack Develloper y continuar adquiriendo conocimientos, soy muy responsable y dedicada en todo aquello que emprendo, me gustaria formar parte de grandes proyectos que me permitan desarrollarme como profesional y mejorar mis habilidades.', '../assets.about.png'),
(3, 1, 1, 'Habilidades', NULL, NULL),
(4, 1, 1, 'Proyectos', NULL, NULL),
(5, 1, 1, 'Contacto', 'Ingresá tus datos así estamos en contacto.', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habilidad`
--

DROP TABLE IF EXISTS `tipo_habilidad`;
CREATE TABLE IF NOT EXISTS `tipo_habilidad` (
  `id` int(11) NOT NULL,
  `nombre_tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_habilidad`
--

INSERT INTO `tipo_habilidad` (`id`, `nombre_tipo`) VALUES
(1, 'Front-End'),
(2, 'Back-End'),
(3, 'Soft-Skill');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD CONSTRAINT `fk_educacion_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD CONSTRAINT `fk_experiencia_laboral_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `habilidad`
--
ALTER TABLE `habilidad`
  ADD CONSTRAINT `fk_habilidad_nivel_habilidad1` FOREIGN KEY (`nivel_habilidad_id`) REFERENCES `nivel_habilidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_habilidad_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_habilidad_tipo_habilidad1` FOREIGN KEY (`tipo_habilidad_id`) REFERENCES `tipo_habilidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `portfolio`
--
ALTER TABLE `portfolio`
  ADD CONSTRAINT `fk_portfolio_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_proyecto_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD CONSTRAINT `fk_seccion_portfolio1` FOREIGN KEY (`portfolio_id`,`portfolio_persona_id`) REFERENCES `portfolio` (`id`, `persona_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
