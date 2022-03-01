# Sistemas de Cobro de Agua Potable
## El Proyecto está realizado en el Entorno Web usando las siguientes Tecnologias: C# ASP.NET, JQuery, HTML/CSS, MySQL.

## Instalación :
 ## Todos los programas necesarios para la instalacíon local del proyecto se encuentra enel directorio Utils.
 1 Instalar el Servidor de Base de Datos MySQL.<br>
 2 Instalar el Cliente de MySQL puede ser el que se encuentra MySQL From o otro.<br>
 3 Crear una Base de Datos con el nombre "agua" en el directorio de utils se encuentra un respaldo de la misma.<br>
 4 Instalar el conector ODBC de MySQL para poder enlazar la cadena de Conexión.<br>
 5 Instalar en IDE Visual Studio.<br>
 6 Dentro del Proyecto debera modificar el método con el nombre de Conexión el cual debera ingresar sus credenciales del SGB MySQL.<br>
 7 Dentro del mismo proyecto debera de aplicar la opción de Copilar la Aplicación este mismo realizara un refresh de las nuevas configuraciones.<br>
 8 Para poder usar los Reportes debera de Instalar Crystal Report de igual manera se encuentran en el directorio de Utils.<br>
 
 ## Funcionalidades :
 ## Modulo de Login 
 
  Las credenciales del sistemas son las siguientes: 
  <b>User:</b>0707012605
  <b>Pass:</b>123456
 ## Modulo de Socios
 
  Las funcionalidades del Modulo consiste en la Gestión y Generación de Contratos los Socios al igual que la Asignación de Medidores de los mismos.
  ## Modulo de Consumo de Agua
   Consiste en el Ingreso de M3 de Consumo del Socio, el cuál mostrara el valor monetario que debera cancelar por su mensualidad de consumo, en el mismo podra imprimir un recibo      de Pago de igual manera podra realizar un reporte de fechas con la información de Cosumo de M3 de los pueblos.
   
  ## Modulo de Multas
   Se podra vincular una multa a un socio dependiendo de la sanción que haya cometido, todo esto es configurable tanto el nombre de la multa como el valor de la misma.<br>
   Cuando un socio posea una multa o no realizo el pago correspondiente de la mensualidad el valor de la sanción se sumara al nuevo valor a cancelar para el nuevo mes <b>El valor de multa se agrega al nuevo valor ha cancelar o "Por no pagar el mes anterior su sumara el valor de la sanción por no pagar puntualmente más el nuevo valor a cancelar" </b>
   ## Modulo de Cobros
   El cual se encargara del registro del pago del consumo de M3 del socio del mes y la emesión de pago del mismo.


