-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema portfolio_ed
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio_ed
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio_ed` DEFAULT CHARACTER SET utf8 ;
USE `portfolio_ed` ;

-- -----------------------------------------------------
-- Table `portfolio_ed`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ed`.`persona` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `img_url` VARCHAR(100) NULL DEFAULT NULL,
  `linkedin_url` VARCHAR(60) NULL DEFAULT NULL,
  `portfolio_id` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio_ed`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ed`.`educacion` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `persona_id` INT(11) NOT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `institucion` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` CHAR(11) NULL DEFAULT NULL,
  `descripcion` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_educacion_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_ed`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio_ed`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ed`.`experiencia_laboral` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `persona_id` INT(11) NOT NULL,
  `puesto` VARCHAR(45) NULL DEFAULT NULL,
  `empleador` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` CHAR(11) NULL DEFAULT NULL,
  `descripcion` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_experiencia_laboral_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_ed`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio_ed`.`nivel_habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ed`.`nivel_habilidad` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nivel_habilidad` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio_ed`.`tipo_habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ed`.`tipo_habilidad` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio_ed`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ed`.`habilidades` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo_habilidad_id` INT(11) NOT NULL,
  `nivel_habilidad_id` INT(11) NOT NULL,
  `persona_id` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `progreso` INT(100) NULL DEFAULT NULL,
  `icono` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `tipo_habilidad_id`, `nivel_habilidad_id`, `persona_id`),
  CONSTRAINT `fk_habilidades_nivel_habilidad1`
    FOREIGN KEY (`nivel_habilidad_id`)
    REFERENCES `portfolio_ed`.`nivel_habilidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habilidades_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_ed`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habilidades_tipos_habilidad1`
    FOREIGN KEY (`tipo_habilidad_id`)
    REFERENCES `portfolio_ed`.`tipo_habilidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio_ed`.`portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ed`.`portfolio` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `persona_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_portfolio_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_ed`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio_ed`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ed`.`proyectos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `persona_id` INT(11) NOT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(500) NULL DEFAULT NULL,
  `img_url` VARCHAR(100) NULL DEFAULT NULL,
  `demo_url` VARCHAR(100) NULL DEFAULT NULL,
  `repo_url` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_proyectos_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_ed`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio_ed`.`secciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ed`.`secciones` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `portfolio_id` INT(11) NOT NULL,
  `portfolio_persona_id` INT(11) NOT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(500) NULL DEFAULT NULL,
  `section_img` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `portfolio_id`, `portfolio_persona_id`),
  CONSTRAINT `fk_secciones_portfolio1`
    FOREIGN KEY (`portfolio_id` , `portfolio_persona_id`)
    REFERENCES `portfolio_ed`.`portfolio` (`id` , `persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT persona VALUES (1, 'Estefania Daumes', 'Desarrollador Web Fullstack Jr.', 'fanydaumes@gmail.com', 'https://avatars.githubusercontent.com/u/95221534?v=4', 'https://www.linkedin.com/in/estefan%C3%ADa-daumes-417916212/', 'https://github.com/FanyDmes/PortfolioEstefaniaDaumes');

INSERT portfolio VALUES (1, 1);

INSERT seccion VALUES(1, 1, 1, 'Hero', 1, 'assets/hero-image.jpg');

INSERT seccion VALUES(2, 1, 1, 'Sobre Mí', 'Hola! Mi nombre es Estefania y soy una recién graduada de Argentina Programa.<br> Mi objetivo es poder trabajar como Full Stack Develloper y continuar adquiriendo conocimientos, soy muy responsable y dedicada en todo aquello que emprendo, me gustaria formar parte de grandes proyectos que me permitan desarrollarme como profesional y mejorar mis habilidades.','../assets.about.png');

INSERT seccion VALUES(3, 1, 1,'Habilidades',NULL,NULL);

INSERT seccion VALUES(4, 1, 1, 'Proyectos',NULL,NULL);

INSERT seccion VALUES(5, 1, 1, 'Contacto', 'Ingresá tus datos así estamos en contacto.' , NULL);

INSERT tipo_habilidad VALUES(1, 'Front-End');

INSERT tipo_habilidad VALUES(2, 'Back-End');

INSERT tipo_habilidad VALUES(3, 'Soft-Skill');

INSERT nivel_habilidad VALUES (1, Básico);

INSERT nivel_habilidad VALUES (2, Intermedio);

INSERT nivel_habilidad VALUES (3, Avanzado);

INSERT habilidad VALUES (1, 1, 3, 1, 'HTML', 80, 'fa-brands fa-html5');

INSERT habilidad VALUES (2, 1, 3, 1, 'CSS', 80, 'fa-brands fa-html5');

INSERT habilidad VALUES (3, 1, 2, 1, 'JavaScript', 60, 'fa-brands fa-html5');

INSERT habilidad VALUES (4, 1, 2, 1, 'Bootstrap', 70, 'fa-brands fa-html5');

INSERT habilidad VALUES (5, 1, 2, 1, 'Angular', 60, 'fa-brands fa-html5');

INSERT habilidad VALUES (6, 2, 1, 1, 'Java/Spring Boot', 40, 'fa-brands fa-java');

INSERT habilidad VALUES (7, 2, 1, 1, ' MySql', 40, 'fa-brands fa-java');

INSERT habilidad VALUES (8, 3, 3, 1, 'Workteam', 100, "fa-solid fa-people-carry-box");

INSERT habilidad VALUES (9, 3, 3, 1,'English', 100, 'fa-brands fa-java');

INSERT habilidad VALUES (10, 3, 3, 1,'Predisposición', 100, 'fa-brands fa-java');

INSERT habilidad VALUES (11, 3, 3, 1,' Autodidacta', 100, 'fa-brands fa-java');

INSERT educacion VALUES (1, 1, 'Desarrollo Web Fullstack', '2021 - 2022', 'Argentina Programa', 'Curso de Desarrollo Web FullStack donde se estudian diversas tecnologías como ser HTML, CSS, Bootstrap, Angular, Java, Spring Boot, entre otras.');

INSERT educacion VALUES (2, 1, 'Reparación y armado de redes', '2006', 'UTN Mar del plata', 'Curso completo de Reparación y armado de redes.');

INSERT experiencia_laboral VALUES(1, 1, 'Mantenimiento de PC', '2006-2015', 'Reparación de Pcs, Notebook, Tablets, Celulares.', 'Freelancer', 'Armado de Pcs, personalizaciones. Instalaciones de software Windows, Antivuirus, actualizaciones en general.');

INSERT experiencia_laboral VALUES(2, 1, 'Trasda S.A', '2010-2012', 'Gestoria general.', 'Tareas administrativas.');

INSERT experiencia_laboral VALUES(3, 1, 'Gestoria del Automotor', '2013-2022', 'Trabajo Administrativo.', 'Gestiones varias en el area Automotríz,<br> Transferencias,<br> Prendas,<br> Denuncias de ventas,<br> Informes varios.');

INSERT proyectos VALUES (1, 1, 'Portfolio - Argentina Programa ', 'Proyecto final realizado durante el Curso de Desarrollo Web Fullstack Argentina Programa. Utiliza herramientas como HTML, CSS, JS (Angular) y Bootstrap.', 'assets/project-1.png', 'https://github.com/FanyDmes/PortfolioEstefaniaDaumes/blob/main/Front-End-Angular/src/index.html', 'https://github.com/FanyDmes/PortfolioEstefaniaDaumes/blob/main/Front-End-Angular/src/index.html');

INSERT proyectos VALUES (2, 1, 'Calculadora', 'En este proyecto de calculadora utilicé herramientas como HTML, CSS, JavaScript. Permite ejecutar las cuatro operaciones básicas que son: sumar, restar, multiplicar y dividir, adicionalmente incluye un botón para resetear los resultados en caso de querer realizar una nueva operación.', 'assets/project-2.png', 'https://github.com/FanyDmes', 'https://github.com/FanyDmes');