create database requerimiento;
use requerimiento;

CREATE TABLE `usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `gerencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idGerencia` int(11) NOT NULL,
  `asignable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_departamento_gerencia_idx` (`idGerencia`),
  CONSTRAINT `fk_departamento_gerencia` FOREIGN KEY (`idGerencia`) REFERENCES `gerencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `encargado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_encargado_dpto_idx` (`idDepartamento`),
  CONSTRAINT `fk_encargado_dpto` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `requerimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDptoSolicitante` int(11) NOT NULL,
  `idEncargadoAsignado` int(11) NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cerrado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_requerimiento_dpto_idx` (`idDptoSolicitante`),
  KEY `fk_requerimiento_encargado_idx` (`idEncargadoAsignado`),
  CONSTRAINT `fk_requerimiento_dpto` FOREIGN KEY (`idDptoSolicitante`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_requerimiento_encargado` FOREIGN KEY (`idEncargadoAsignado`) REFERENCES `encargado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO `usuario` VALUES
	(1, 'admin', 'admin');

INSERT INTO `gerencia` VALUES
	(1, 'Gerencia General'),
    (2, 'Gerencia Comercial'),
    (3, 'Gerencia Administrativa'),
    (4, 'Gerencia Operativa');

INSERT INTO `departamento` VALUES
	(1, 'Finanzas', 3, 0),
    (2, 'Recursos Humanos', 3, 0),
    (3, 'Marketing', 2, 0),
    (4, 'Comercial', 2, 0),
    (5, 'Compras', 2, 0),
    (6, 'Operaciones', 4, 0),
    (7, 'Abastecimiento', 4, 1),
    (8, 'TIC', 4, 1);

INSERT INTO `encargado` VALUES
	(1, 'Juan', 'Perez', 7),
    (2, 'Marta', 'Castro', 7),
    (3, 'Pedro', 'Rodriguez', 8),
    (4, 'Ana', 'Soto', 8),
    (5, 'Carlos', 'Rodriguez', 8);
    