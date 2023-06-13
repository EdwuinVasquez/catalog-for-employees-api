-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-06-2023 a las 15:29:00
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rimocatalogo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `CEDULA_USUARIO` double NOT NULL,
  `NOMBRE_USUARIO` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ROL_USUARIO` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CLAVE_USUARIO` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PREGUNTA_USUARIO` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RESPUESTA_USUARIO` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `USUARIO_ACTIVADO` tinyint(1) NOT NULL,
  `FECHA_REGISTRO_USUARIO` datetime NOT NULL,
  `ULTIMO_ACCESO` datetime NOT NULL,
  `CORREO_USUARIO` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`CEDULA_USUARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`CEDULA_USUARIO`, `NOMBRE_USUARIO`, `ROL_USUARIO`, `CLAVE_USUARIO`, `PREGUNTA_USUARIO`, `RESPUESTA_USUARIO`, `USUARIO_ACTIVADO`, `FECHA_REGISTRO_USUARIO`, `ULTIMO_ACCESO`, `CORREO_USUARIO`) VALUES
(35761, 'ADMON', 'ADMINISTRADOR', '$2a$10$7Zo110LItIFqgz73OA0bdu9oEkpC/bNg0AAoAOGn7Dn9xzRB5US12', 'color favorito', '$2a$10$WiLEmrNPNPNYW20KlEYcGOgDzdsmrvVkqnb4LAp0cpS4F1m2BDSEC', 1, '2023-01-30 15:00:36', '2023-06-07 10:04:03', ''),
(55078, 'ADMON', 'ADMINISTRADOR', '$2a$10$rKX4/LhKnjVNbI2XSdxwz.oX6tENK2Up95294xaZfoDMBUoKJORMi', 'NIT DE RIMO', '$2a$10$Aq8AsC3s0oSf/bOkKJUCS.fcO1nGMcbPpjjChmoSVm2BKb7bLijau', 1, '2023-01-30 14:56:47', '2023-06-02 08:05:24', ''),
(67290, 'ADMON', 'ADMINISTRADOR', '$2a$10$cW6YIW0pcIZEgyHAF6itf.bGi1jyQ2.Im8fPIG5D4N6VSzRErTDd2', 'Numero de admin', '$2a$10$6Gth19C4qun5oAUUX7o4fO07YaEMBJ7oiGfHMX4Df3L7nz2Dgc7K.', 1, '2023-01-30 15:00:36', '2023-01-30 15:04:05', ''),
(43754923, 'Jannet Tapias Escudero', 'EMPLEADO', '$2y$10$eE2D6I5ifakAW2F.eq9M2e0a4hSjM7mk1RdDrl.XHtzQXrHqUXNrG', 'Nombre de tu primer perro', '$2y$10$Ie0/q8.w.q0KI4TReIzPAONu8VjaUXu0A90M7GMmaug//7UoHe/Tu', 1, '2023-01-27 13:49:46', '2023-05-30 13:57:43', '3164202853'),
(36309241, 'Mayerli Alejandra Ramírez', 'EMPLEADO', '$2y$10$yl3IEaEp4uBSNMa5U6sJ6uzgDmrV3ruFkc8zoYt4/IBMymG5V79F2', 'Nombre de mi hijo', '$2y$10$sg2I/mGX0Eiiq0H75YD1GusT5W4y4sbYOJI4/5atEKeUXFWxezgou', 1, '2023-03-13 17:28:57', '2023-05-17 16:17:37', 'cartera@rimoplasticas.com'),
(43208414, 'DIANA MARIA ARDILA GAVIRIA', 'EMPLEADO', '$2y$10$qGEMQZad6/4YVj4v5ByKyeF3o8.XX4NTIbaibrCB4QAllqhm2EpwO', 'JULIETAMORA', '$2y$10$XjC8s07PddXc7ZzcAVIBM.7i6eJ9XoziIu0y2AFoQcXwXmOpt8dgO', 1, '2023-03-15 17:20:36', '2023-06-06 09:00:05', 'tesoreria@rimoplasricas.com'),
(43276869, 'Isabel Cristina Garavito Salas', 'EMPLEADO', '$2y$10$5KyE.LTZi5txLwxbesQSE.LkCgsiyEmvt3SYNYjwl.Z4dQnIRHhqO', 'Nombre de mascota', '$2y$10$s2o5X2Xpe7eBbtgCGFnF0.IVMQsUWBI6BitvblcLWsRA3LCO1lOG.', 1, '2023-03-29 14:13:42', '2023-03-29 14:13:57', '3122582336'),
(1017219795, 'Sebastian leiva caro', 'EMPLEADO', '$2y$10$JAKtk5D/gm9Fr4Er857M9.yh0GzszKu8WMW1ACp17..zHUGVxEOu6', 'color favorito', '$2y$10$hftimRt5IvsEFU4Q0tDn/uO6STHsvoGikDejpyzXpYigizXkSGHqe', 1, '2023-03-29 16:38:18', '2023-06-07 07:13:39', '3122748679'),
(71728327, 'Fernando de Jesús Zuluaga Espinosa', 'EMPLEADO', '$2y$10$.KJlr8u5thh73pbZJYlkxuhZ3NLdqV5.dqKA084PHhXYHfhb9Swt.', 'Nombre mama', '$2y$10$6YNbHKlXjYA3Gmp8allOzuSe7Mf5fNlHoKjdBCArcwg7OgxoFBbTe', 1, '2023-03-31 08:41:50', '2023-04-20 13:05:31', '3116177315'),
(42799409, 'Maryluz duque', 'EMPLEADO', '$2y$10$oQ68uyadlufodLX1fVQ2D.KwmhY39lBkOuN9mnujELD4.nIhnWyQy', 'Nombre de tu hijo mayor', '$2y$10$kVIhm2ZvK9.fSzcatd7glu6hDujt4WVWuPV3M0JAt/zj/AwY/JQyC', 1, '2023-03-31 08:53:47', '2023-05-04 14:18:19', 'Marydm5722@gmail.com'),
(1036423595, 'Arley castro perez', 'EMPLEADO', '$2y$10$7kyFw26V1EJIxzMfgMRjSeaZdu9t42uZ3by6s0vjgH30wyc2OMfwK', 'Fecha de nacimiento', '$2y$10$YjP2sHdMh7nVu1R0uLnsT.ydwi7anxz4HSbpCc56gWiGI0NsfMBMy', 1, '2023-03-31 09:21:01', '2023-06-06 15:58:02', '3193275599'),
(1015332106, 'Edwin Vasquez', 'EMPLEADO', '$2y$10$SIo1X.L198ZUXoSiCcAT2O9ZuZiI5BMat1lY06FH3Jn/CieU1VK7C', 'Color favorito', '$2y$10$TFMMIcAEtt.25UEBnBvooep1Q7A2uQkdkLM7k4n17337UPc.X9X1y', 1, '2023-04-18 16:51:42', '2023-06-13 08:40:23', '3023621404'),
(1040748255, 'Cristian Posada Ramirez', 'EMPLEADO', '$2y$10$uDTZC5o7SpdPo23GLX0breyadqUP.zfN9gOCFCX1dTPWQisoEp5CW', 'equipo de futbol', '$2y$10$fPlV0hndX.Ps6gZaWKv3IuGsCEgJSXsOE.IGF9BllcevU20Fe4dMa', 1, '2023-05-04 14:07:49', '2023-05-04 14:08:00', '3214402449'),
(1037593336, 'Reinel Perez', 'EMPLEADO', '$2y$10$i6aG34hJcjEujT/p/3n7aO9U6WGsiz2otLZ79EqhbaLmTFENikJ2y', 'documento de identidad', '$2y$10$bkIE9M4Mwy2/C3ncRIwpNOKzjEZcNII7p8tmRgjJgo7gGwe7IXR1O', 1, '2023-05-05 06:56:04', '2023-06-13 08:37:07', '3013252555'),
(15515295, 'Juan Felipe Giraldo Vélez', 'EMPLEADO', '$2y$10$fq4R04R2IrWQrByMmUdNnelBvcixYfYHmrwGwx2OlQ672SC54LQpG', 'Donde trabajas', '$2y$10$VbUt4bmN.zBQiwFGYkN6HOkZO4xKB68bYFaiMAQr2PycBB9ufHgW6', 1, '2023-05-05 09:31:04', '2023-05-05 09:31:04', '3117359920'),
(32354914, 'Isabel Cristiana Aguirre Agudelo', 'EMPLEADO', '$2y$10$X5mSnPk6zEgfMdXKgSeyLO/hNfAxTgAPe68uoi5sHJZNEZJr91VKG', 'Nombre hija mayor', '$2y$10$zXEBJiywjsoEFHTo1p3efe/O4/RgLWUmPaq0m/PeWoibVwKUTQnHm', 1, '2023-05-05 09:34:00', '2023-05-05 09:35:40', 'Isabel Cristina Aguirre Agudelo'),
(15507890, 'Rafael Antonio Londoño Gomez', 'EMPLEADO', '$2y$10$HsYAtYDSoQT/t5G3rTBGE.5kVt8KLuKzF9aeY4uJEWv11l4VQL07e', 'Como se llama mi Perro', '$2y$10$mQM0sp2bQKai5UCme99Ve.ffWvkiwELtDeQqXPCj4ivH8CsflJDfe', 1, '2023-05-08 09:49:35', '2023-05-08 09:50:10', 'rafaellond@gmail.com'),
(15513199, 'GIOVANY ZAPATA', 'EMPLEADO', '$2y$10$aXxaO5VftRA/1xj/1UJHreQIM2BcW9uNu3MaK5JsyqLQ1pS4.Dq6K', 'CUAL ES EL NOMBRE DE MI HIJA', '$2y$10$xXf3sXXLR6VtFE8Vc12hlOQQGDML5UztyrN8RMxBADX4k2XrSBEde', 1, '2023-05-08 12:54:37', '2023-06-08 14:12:27', '3114648563'),
(39423636, 'Lizeth Montoya', 'EMPLEADO', '$2y$10$YWccwzi6shC8wooX3/QtpOoYjmLIydMr5bW59/FWMWsRlHFwTmaae', 'Color favorito', '$2y$10$CcaljEI/mEdtCCLowq/lG.H90J9.uKnR4aqzXFGMny7r5qsekpx7i', 1, '2023-05-08 15:12:20', '2023-05-10 15:47:49', 'mairalizeth0109@gmail.com'),
(1036627029, 'Kelly olarte', 'EMPLEADO', '$2y$10$pIHkEU1OxF9a2yaFeWxgDu0x2I7TeY96AqLdo2Lpn9Xr3kqUrrCjm', 'Nombre de mi hija', '$2y$10$64p0/U8jRx2DA3AZDIGllecxqSL8h4c6T48Txdz3rg7tkBwOjJCoO', 1, '2023-05-08 15:47:05', '2023-05-08 15:47:47', '3146083538'),
(43711128, 'MONICA GIRALDO', 'EMPLEADO', '$2y$10$2wtMbqUbLn.XeV4gPLjWSOiiWh8uLMZkOynD1nhCIHUeEvASwO7iS', 'COLOR FAVORITO', '$2y$10$Qt.UNgQPjE/fksnE27rR6ulIavy3Xp.NMhjkA.nriooaHfLw23aNW', 1, '2023-05-10 09:32:10', '2023-06-01 06:23:18', 'MONICAGIRALDO2201@HOTMAIL.COM'),
(1007845124, 'Kevin', 'EMPLEADO', '$2y$10$NN.IyZIWo5zAemPDdSxtOuYIMmWl8sgsMaRUraDA.oCzd9qczOkHi', 'Color favorito', '$2y$10$KAmVd2W2I3AnRTZW8oiNoe1WIExQsyqjz/8D4kBPVp/KIFLCFah6G', 1, '2023-05-10 13:36:48', '2023-05-10 13:38:08', '3007782339'),
(43152823, 'sandra milena uribe duque', 'EMPLEADO', '$2y$10$tZvc52SmyHNQvvhdymMWIebymYv8gjpPokzkn3yqiOslmmWj1pVq6', 'nombre de mi mama', '$2y$10$AU73thdkNFb340vZpXshMeurCrNIKxVw.YHkHQ8bNLFiF7HKvueDO', 1, '2023-05-12 12:01:39', '2023-05-16 14:05:20', '3215155326'),
(1003177732, 'karen carranza', 'EMPLEADO', '$2y$10$57etTvhQgBBllxp1//tUXOBNKkNTxDhEOjIn0D5m1XvVqcZLq3QAW', 'el nombre de mi mama ', '$2y$10$eaVafe3iUmWJ4pFz9GgbCORw93NFtB1i0qxknBwD5oHRrKpDROUny', 1, '2023-05-15 13:20:36', '2023-05-25 16:39:47', '3225238612'),
(1152717442, 'Ariana Estefany Pacheco Asprilla ', 'EMPLEADO', '$2y$10$kg8KXix2vT7VcnVsLNUbdOvoMgX1Kzd/5QGCqwvI0mEHC7RG8Kgly', 'Nombre de Madre', '$2y$10$2xOanYNlefbNheyF6POEReSDLuAAfVWp4K9hC3aK9Q7vJ.0sqe7ja', 1, '2023-05-16 15:36:02', '2023-05-16 15:36:34', '3225162958'),
(1026146471, 'veronica maria montoya henao', 'EMPLEADO', '$2y$10$ZBfpW510Ns8d4dMq4jM96ufsCzshTaxFbQHMHv1g3USk/RCgpRCWy', 'nombre de mi primer hijo', '$2y$10$tNQWaS5RRslt57bkLhcNwOOgH/skH8bjIQcJXMFomuAAGIctwune2', 1, '2023-05-17 14:25:41', '2023-06-07 14:03:23', '3106398008'),
(1042093530, 'Leandra Gallego Perez', 'EMPLEADO', '$2y$10$I.rkOzEmNJEBbtCRXgdTAevC6EpoSn5C44TkJnyjQYji3QaZYcES2', 'Color favorito', '$2y$10$rcjqrzMLk2m4lbcOfKbyd.tFloe2Lf8tClHcpqacYYfaa.tul6asm', 1, '2023-05-18 15:12:24', '2023-06-07 13:42:58', '3024623211'),
(1128453359, 'Andrea perez', 'EMPLEADO', '$2y$10$Ztw17fS2CGBGg3LkZGyWRuIsszhTInSJIdbK22yYkJATSueYupHTe', 'nombre gata blanca ', '$2y$10$XqGuPA5fQ.x9ux6NF2bhyuAdT3qmiTQYZ6FqdQ2CoLRSpfSFSuyu2', 1, '2023-05-19 09:48:03', '2023-05-19 09:53:06', '3015244124'),
(43708464, 'ELIZABETH VILLA', 'EMPLEADO', '$2y$10$Ckz.POZlV73ZohkoDirqi.D6D5bia0bQdZ9PSFDLRB4N/O2c/wY.e', 'nombre de mi hija mayor', '$2y$10$u818gpl.VCnV.QRItvPoyuokr/z31/n/ROFsgeLaQEVfh0ztwhfu6', 1, '2023-05-25 07:55:41', '2023-05-25 07:56:09', '3126894312'),
(43113232, 'Vianney Echavarria M', 'EMPLEADO', '$2y$10$TJtJhlh.fP/sTTuhQvPb0.arN/1hWtvmhmTd9SBOPiUSLnTjF595q', 'Nombre del hijo', '$2y$10$fcOqUG7KRdllhaxnIhFYX.0IXug1RxPGBb8LykgaP/S31ZNjg6Vqm', 1, '2023-05-25 13:57:02', '2023-05-25 13:58:50', '3113584931'),
(43988338, 'María Vanessa Paniagua Alvarez', 'EMPLEADO', '$2y$10$zg8LjW/1V13R14hlP5pWVefAJDsjF0yNf94FvDVJTLElibdZH7uiW', 'Nombre de mi mama', '$2y$10$rBN/kCh/14J66iGEx6mloO2pL2GPKdSvr7msaLTQTANDxbwlK3omm', 1, '2023-05-25 15:20:30', '2023-05-25 15:20:30', '3015266466'),
(71394942, 'JOHN FREDDY GIL PINEDA', 'EMPLEADO', '$2y$10$ZCs.XspHehctCekmtIJ0Iu2YhZANfDnYQJ/FV//Wi5GRW7o5wV8ka', 'BARRIO DONDE NACI', '$2y$10$USevmqgGbh8Qdw972xzshOZxzSGnGYFSxfMLxX3P.C4TaztJHae96', 1, '2023-05-26 07:08:18', '2023-06-06 17:02:35', 'fredygilpineda@hotmail.com'),
(1042064127, 'Adrian Camilo Londoño Salas', 'EMPLEADO', '$2y$10$MutJeufPamOVyXKJZMx2uujvjFoE5kbgMeZa7kZi.Qrm00HjJgkf6', 'el nombre de mi hijo', '$2y$10$0J0f9PFUgmhTIZQnlLN3s.qB6ik.rZCp.geRn4wVN4ABNQ0LZFZz.', 1, '2023-05-26 10:10:58', '2023-05-26 10:11:30', '3218918466'),
(1001683065, 'miguel cervantes', 'EMPLEADO', '$2y$10$qtS1svdYpMgNSQ5WrHDw6..sGBItdRzImXr3RJtscLPVtwUm/jYke', 'primer nombre', '$2y$10$ATgOV5ue0/OfZtOU9wO3LONcPtqZ69xWvXXlc8mDcyM5fUWzEofA6', 1, '2023-05-29 08:41:06', '2023-05-30 13:50:33', '3122723016'),
(42792464, 'clara restrepo', 'EMPLEADO', '$2y$10$P5AqfP3JIJ8sgpBdKVPBg.XYCzSisa0rwYUGX2kyMMIBVODyn0D12', ' cual es la fecha de nacimiento de mi nieta', '$2y$10$..kF3B4FmB8kpnfizRMiD.TR6UzhPc68bHWaRaDtXoN6kDRoCTYIS', 1, '2023-05-29 11:19:55', '2023-05-29 11:20:40', '3193242351'),
(1027891945, 'SAMUEL ROMERO', 'EMPLEADO', '$2y$10$slcXoIN0uGzbev52SZF3Wu2lGIYM7pJD1HJVuwD59pHLaUSjZhKCe', 'apellido papa', '$2y$10$bUuMpZHKZ.0Qya9A2/8gmet0vzOWcj3ZBmT4uQUa1yGGh/hkVGvjC', 1, '2023-05-30 13:34:40', '2023-05-31 11:39:03', '3155028672'),
(1152442412, 'marinelfin restrepo montoya', 'EMPLEADO', '$2y$10$hUJlFYqb9rsouqfrivy.DOPrgn4NdAHO4aN9RXPIL1nI5TT6ewMr6', 'cual es mi comida favorita', '$2y$10$zW6UVP4IorxgRFoZiYi4veV9eVrWo1pM9Onvho3IJzCfRZgQ4Xf0.', 1, '2023-05-30 13:37:35', '2023-05-30 13:44:38', '3114763059'),
(43682387, 'blanca ochoa', 'EMPLEADO', '$2y$10$9qUq3ktzA5cMEfF7oV8oMOQGJHhsSgTtijQux4RhycSNvLKPc5nY2', 'nombre de mi primer hijo', '$2y$10$mY4YjOhrT.btapvsfsFOGuziV8vE7izAe4WSn.UHBgIM5Gpx8JAoG', 1, '2023-05-30 13:40:33', '2023-05-30 13:43:07', '3116255865'),
(1002064649, 'Daniel Giraldo', 'EMPLEADO', '$2y$10$iAErXLi9.kHVkMzNsbV8HuZhmmlyBh1lmSuxF168BSJZS1dfkSP0G', 'nombre de mi primer mascota', '$2y$10$wegIoJ3rzKTduWAROJ30neh72X7vZ.Wu/.DSme7UMDeXMBzRaGprm', 1, '2023-05-30 14:30:02', '2023-05-30 14:30:33', '3103784616'),
(71638671, 'Argemiro Quiroz Garcia', 'EMPLEADO', '$2y$10$oVvLlTi2CvPv8pSydczs7e9vg/zzpHL.mls1WpO9eenuELKlr8VZK', 'Cual es tu deporte favorito', '$2y$10$MNwvxjlBqlfmfmUdB/Y.7eOLrptVZq2vUvU.8Yxr7TaDR/Bhewkp.', 1, '2023-05-31 11:29:15', '2023-05-31 11:30:16', '6045954772'),
(1039049056, 'FRANCY MAZO', 'EMPLEADO', '$2y$10$Mr1pSGAOKNK8DsSh948lnuLGu.y340tjK155BhS1D162M0bxPOelC', 'Cual fue el nombre de tu primer mascota', '$2y$10$VFCNZNzVGWO22lOw/H1m7eIV99DtWoxMNNOKUIyRDE4JQ4/6T/2TG', 1, '2023-05-31 14:09:54', '2023-05-31 14:10:22', '3016190860'),
(1026154732, 'Xiomara Herrera', 'EMPLEADO', '$2y$10$NQziNn2ugnPPdPo12nz01OXdJw5fO66HiCuz7LOWgBneZHCWjCj..', 'Cual fue el nombre de tu primer mascota', '$2y$10$FthyIqFhMHvV0pC7k43fSuca9lYwI0j4CX89LBPgYML2LjVMGAx5e', 1, '2023-06-01 13:32:02', '2023-06-01 13:32:34', '3174513898');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
