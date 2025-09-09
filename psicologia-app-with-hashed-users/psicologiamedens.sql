-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-08-2025 a las 22:16:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adherenciahabitos`
--

CREATE TABLE `adherenciahabitos` (
  `IdDiarioEmocional` int(11) NOT NULL,
  `IdPaciente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `Dia` date DEFAULT NULL,
  `TomaMedicamentos` varchar(1000) DEFAULT NULL,
  `TiempoEjercicio` varchar(1000) DEFAULT NULL,
  `Alimentación` varchar(1000) DEFAULT NULL,
  `EmocionDominante` varchar(1000) DEFAULT NULL,
  `AutoEvaluacion` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `IdCita` int(11) NOT NULL,
  `IdPaciente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha_cita` datetime NOT NULL,
  `motivo` text DEFAULT NULL,
  `estado` enum('programada','Cancelada','Completada') DEFAULT 'Programada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diarioemocionalcoductual`
--

CREATE TABLE `diarioemocionalcoductual` (
  `IdDiarioEmocional` int(11) NOT NULL,
  `IdPaciente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `Dia` varchar(1000) DEFAULT NULL,
  `EmosicionDia` varchar(1000) DEFAULT NULL,
  `NivelGlucosa` varchar(1000) DEFAULT NULL,
  `Situacion` varchar(1000) DEFAULT NULL,
  `Conducta` varchar(1000) DEFAULT NULL,
  `Estrategia` varchar(1000) DEFAULT NULL,
  `Resultado` varchar(1000) DEFAULT NULL,
  `Estatus` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas`
--

CREATE TABLE `encuestas` (
  `id_encuesta` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `activa` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente_clinico`
--

CREATE TABLE `expediente_clinico` (
  `idexpediente` int(11) NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `motivo_consulta` text DEFAULT NULL,
  `estado_emocional` text DEFAULT NULL,
  `historial_personal` text DEFAULT NULL,
  `antecedentes_psicologicos` text DEFAULT NULL,
  `medicamentos` text DEFAULT NULL,
  `diagnostico` text DEFAULT NULL,
  `plan_terapeutico` text DEFAULT NULL,
  `seguimiento_evolucion` text DEFAULT NULL,
  `expectativas_atencion` text DEFAULT NULL,
  `objetivo_atencion` text DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `estatus` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `expediente_clinico`
--

INSERT INTO `expediente_clinico` (`idexpediente`, `idpaciente`, `idusuario`, `motivo_consulta`, `estado_emocional`, `historial_personal`, `antecedentes_psicologicos`, `medicamentos`, `diagnostico`, `plan_terapeutico`, `seguimiento_evolucion`, `expectativas_atencion`, `objetivo_atencion`, `fecha`, `estatus`) VALUES
(14, 1, NULL, 'estoy asi por el de sistemas', 'estoy asi por el de sistemas', 'estoy asi por el de sistemas', 'estoy asi por el de sistemas', 'estoy asi por el de sistemas', NULL, NULL, NULL, NULL, 'estoy asi por el de sistemas', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_expediente`
--

CREATE TABLE `historial_expediente` (
  `idhistorial` int(11) NOT NULL,
  `idexpediente` int(11) NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `motivo_consulta` text NOT NULL,
  `estado_emosional` text NOT NULL,
  `historial_personal` text NOT NULL,
  `antecedentes_psicologicos` text NOT NULL,
  `medicamento` text NOT NULL,
  `diagnosticos` text NOT NULL,
  `plan_terapeutico` text NOT NULL,
  `seguimiento` text NOT NULL,
  `expectativas_atencion` text NOT NULL,
  `objetivo_atencion` text NOT NULL,
  `estatus` varchar(500) NOT NULL,
  `fecha_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitoreoglucosa`
--

CREATE TABLE `monitoreoglucosa` (
  `IdDiarioEmocional` int(11) NOT NULL,
  `IdPaciente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `Dia` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `EventoExtresante` varchar(1000) DEFAULT NULL,
  `NivelExtres` varchar(1000) DEFAULT NULL,
  `Pensamiento` varchar(1000) DEFAULT NULL,
  `NivelGlucosa` varchar(1000) DEFAULT NULL,
  `Tecnica` varchar(1000) DEFAULT NULL,
  `CambiosEmosionales` varchar(1000) DEFAULT NULL,
  `Estatus` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `idpaciente` int(11) NOT NULL,
  `nombre` varchar(1000) DEFAULT NULL,
  `apellidoPaterno` varchar(1000) DEFAULT NULL,
  `apellidoMaterno` varchar(1000) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `genero` varchar(500) DEFAULT NULL,
  `curp` varchar(500) DEFAULT NULL,
  `estadoCivil` varchar(500) DEFAULT NULL,
  `Nohijos` int(11) DEFAULT NULL,
  `religion` varchar(500) DEFAULT NULL,
  `ocupacion` varchar(500) DEFAULT NULL,
  `gradoEstudios` varchar(500) DEFAULT NULL,
  `noHermanos` int(11) DEFAULT NULL,
  `posicionOcupa` varchar(500) DEFAULT NULL,
  `estatus` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`idpaciente`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `fechaNacimiento`, `genero`, `curp`, `estadoCivil`, `Nohijos`, `religion`, `ocupacion`, `gradoEstudios`, `noHermanos`, `posicionOcupa`, `estatus`) VALUES
(1, 'Yanarith', 'CRUZ', 'VILLAMELON', '1999-06-10', 'Otro', 'RAFM810812MHGNRR03', 'Soltero', 0, 'Islamica', 'Psicologia', 'maestria', 1, 'Psicologa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Calendario'),
(3, 'Expedientes'),
(4, 'Seguimiento'),
(5, 'Acceso'),
(6, 'Encuesta'),
(7, 'Resultados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planaccion`
--

CREATE TABLE `planaccion` (
  `IdPlanAccion` int(11) NOT NULL,
  `IdPaciente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `ObjetivoSmart` varchar(1000) DEFAULT NULL,
  `ObstaculoAnticipado` varchar(1000) DEFAULT NULL,
  `RecursoAyuda` varchar(1000) DEFAULT NULL,
  `PlanAlternativo` varchar(1000) DEFAULT NULL,
  `FechaRevisión` date DEFAULT NULL,
  `Estatus` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `id_encuesta` int(11) NOT NULL,
  `texto_pregunta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorios`
--

CREATE TABLE `recordatorios` (
  `IdRecordatorio` int(11) NOT NULL,
  `IdCita` int(11) NOT NULL,
  `fecha_recordatorio` datetime NOT NULL,
  `mensaje` text DEFAULT NULL,
  `enviado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id_respuesta` int(11) NOT NULL,
  `IdPaciente` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `respuesta_texto` text NOT NULL,
  `fecha_respuesta` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
(1, 'Jorge Luis', 'RFC', '47715777', '', '', '', '', 'admin', '$2b$12$YQva0affJVQd2yHqRf.np.MIYExqmSLyqqZzbhjercIZqVxNNT6Wq', '1487132068.jpg', 1),
(7, 'José Antonio Villagrán Gutiérrez', 'CE', '1', 'Guadalupe Victoria #7', '7731135196', 'antoniovillagran846@gmail.com', 'Administrador', 'antonio', '$2b$12$uUIWQNGME7NzN/7gCNqhguDKSXfnGER9TkIFhVRnSHpfSin3wkvkW', '1657905213.jpg', 1),
(8, 'ignacio trejo cruz', 'RFC', '0011', 'EL LLANO', '773732-33-24', 'grupogargo1@gmail.com', 'Vendedor', 'gargonacho', '$2b$12$tiTEIzNQcnz3Eoivivk9p.fspTg7ipufvg/KBghdsd0WnQjElbryS', '', 1),
(9, 'MICHIMALOYA', 'RFC', 'michimaloya1', '', '', '', 'Administrador', 'MICHIMALOYA', '$2b$12$gQQHa5uRGI7S1/h3F34mquawc1RgiV2C53UKbDwY36rwPDpVsPRAq', '', 1),
(10, 'vendedor', 'RFC', '32432432fdfdsf', 'Barrio Alto', '7731135196', 'vendedor@gmail.com', 'Vendedor', 'vendedor', '$2b$12$Rq/EcCyRVsslVBWO461dH.jHWxfhWmxXllSX7HivZ1n4tsAafrzcu', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(96, 1, 1),
(97, 1, 2),
(98, 1, 3),
(99, 1, 4),
(100, 1, 5),
(101, 1, 6),
(102, 1, 7),
(159, 8, 1),
(160, 8, 2),
(161, 8, 3),
(162, 8, 4),
(163, 8, 5),
(164, 8, 6),
(165, 8, 7),
(166, 7, 1),
(167, 7, 2),
(168, 7, 3),
(169, 7, 4),
(170, 7, 5),
(171, 7, 6),
(172, 7, 7),
(173, 9, 1),
(174, 9, 2),
(175, 9, 3),
(176, 9, 4),
(177, 9, 5),
(178, 9, 6),
(179, 9, 7),
(180, 10, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adherenciahabitos`
--
ALTER TABLE `adherenciahabitos`
  ADD PRIMARY KEY (`IdDiarioEmocional`) USING BTREE,
  ADD KEY `IdPaciente` (`IdPaciente`) USING BTREE,
  ADD KEY `idusuario` (`idusuario`) USING BTREE;

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`IdCita`) USING BTREE,
  ADD KEY `IdPaciente` (`IdPaciente`) USING BTREE,
  ADD KEY `idusuario` (`idusuario`) USING BTREE;

--
-- Indices de la tabla `diarioemocionalcoductual`
--
ALTER TABLE `diarioemocionalcoductual`
  ADD PRIMARY KEY (`IdDiarioEmocional`) USING BTREE,
  ADD KEY `IdPaciente` (`IdPaciente`) USING BTREE,
  ADD KEY `idusuario` (`idusuario`) USING BTREE;

--
-- Indices de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD PRIMARY KEY (`id_encuesta`) USING BTREE;

--
-- Indices de la tabla `expediente_clinico`
--
ALTER TABLE `expediente_clinico`
  ADD PRIMARY KEY (`idexpediente`) USING BTREE,
  ADD KEY `idusuario` (`idusuario`) USING BTREE,
  ADD KEY `IdPaciente` (`idpaciente`) USING BTREE;

--
-- Indices de la tabla `historial_expediente`
--
ALTER TABLE `historial_expediente`
  ADD PRIMARY KEY (`idhistorial`) USING BTREE;

--
-- Indices de la tabla `monitoreoglucosa`
--
ALTER TABLE `monitoreoglucosa`
  ADD PRIMARY KEY (`IdDiarioEmocional`) USING BTREE,
  ADD KEY `IdPaciente` (`IdPaciente`) USING BTREE,
  ADD KEY `idusuario` (`idusuario`) USING BTREE;

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`idpaciente`) USING BTREE;

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `planaccion`
--
ALTER TABLE `planaccion`
  ADD PRIMARY KEY (`IdPlanAccion`) USING BTREE,
  ADD KEY `IdPaciente` (`IdPaciente`) USING BTREE,
  ADD KEY `idusuario` (`idusuario`) USING BTREE;

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`) USING BTREE,
  ADD KEY `id_encuesta` (`id_encuesta`) USING BTREE;

--
-- Indices de la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  ADD PRIMARY KEY (`IdRecordatorio`) USING BTREE,
  ADD KEY `IdCita` (`IdCita`) USING BTREE;

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id_respuesta`) USING BTREE,
  ADD UNIQUE KEY `IdPaciente` (`IdPaciente`,`id_pregunta`) USING BTREE,
  ADD KEY `id_pregunta` (`id_pregunta`) USING BTREE;

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_usuario_permiso_permiso_idx` (`idpermiso`),
  ADD KEY `fk_usuario_permiso_usuario_idx` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adherenciahabitos`
--
ALTER TABLE `adherenciahabitos`
  MODIFY `IdDiarioEmocional` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `IdCita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diarioemocionalcoductual`
--
ALTER TABLE `diarioemocionalcoductual`
  MODIFY `IdDiarioEmocional` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  MODIFY `id_encuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expediente_clinico`
--
ALTER TABLE `expediente_clinico`
  MODIFY `idexpediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `historial_expediente`
--
ALTER TABLE `historial_expediente`
  MODIFY `idhistorial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `monitoreoglucosa`
--
ALTER TABLE `monitoreoglucosa`
  MODIFY `IdDiarioEmocional` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `idpaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `planaccion`
--
ALTER TABLE `planaccion`
  MODIFY `IdPlanAccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  MODIFY `IdRecordatorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id_respuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adherenciahabitos`
--
ALTER TABLE `adherenciahabitos`
  ADD CONSTRAINT `adherenciahabitos_ibfk_1` FOREIGN KEY (`IdPaciente`) REFERENCES `paciente` (`IdPaciente`),
  ADD CONSTRAINT `adherenciahabitos_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`IdPaciente`) REFERENCES `paciente` (`IdPaciente`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `diarioemocionalcoductual`
--
ALTER TABLE `diarioemocionalcoductual`
  ADD CONSTRAINT `diarioemocionalcoductual_ibfk_1` FOREIGN KEY (`IdPaciente`) REFERENCES `paciente` (`IdPaciente`),
  ADD CONSTRAINT `diarioemocionalcoductual_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `expediente_clinico`
--
ALTER TABLE `expediente_clinico`
  ADD CONSTRAINT `expediente_clinico_ibfk_1` FOREIGN KEY (`idpaciente`) REFERENCES `paciente` (`IdPaciente`),
  ADD CONSTRAINT `expediente_clinico_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `monitoreoglucosa`
--
ALTER TABLE `monitoreoglucosa`
  ADD CONSTRAINT `monitoreoglucosa_ibfk_1` FOREIGN KEY (`IdPaciente`) REFERENCES `paciente` (`IdPaciente`),
  ADD CONSTRAINT `monitoreoglucosa_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `planaccion`
--
ALTER TABLE `planaccion`
  ADD CONSTRAINT `planaccion_ibfk_1` FOREIGN KEY (`IdPaciente`) REFERENCES `paciente` (`IdPaciente`),
  ADD CONSTRAINT `planaccion_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`id_encuesta`) REFERENCES `encuestas` (`id_encuesta`);

--
-- Filtros para la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  ADD CONSTRAINT `recordatorios_ibfk_1` FOREIGN KEY (`IdCita`) REFERENCES `citas` (`IdCita`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`IdPaciente`) REFERENCES `paciente` (`IdPaciente`),
  ADD CONSTRAINT `respuestas_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`);

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_usuario_permiso_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
