
<p>&nbsp;</p>

![logo](http://gastonmz.com/imbatman/logo.png)

<p>&nbsp;</p>

![Lenguaje](https://img.shields.io/badge/Lenguaje-Objective--C-orange)
![Xcode](https://img.shields.io/badge/Xcode-13.1-blue)
![Plataforma](https://img.shields.io/badge/Plataforma-iOS-8E64B0)
![Estado](https://img.shields.io/badge/Estado%20del%20desarrollo-60%-yellow)
![GitHub last commit](https://img.shields.io/github/last-commit/gastonmz/imbatman?label=Ultima%20actualizacion)
![Licencia](https://img.shields.io/badge/Licencia-Libre-lightgray)

<p>&nbsp;</p>

# Bienvenidos

En este repositorio encontraran un app que permite buscar y conocer información de los personajes de Marvel Comics &reg;.Este proyecto está desarrollado 100% en Objective-C demostrando que aún conserva toda su arcaica magia y potencial.

<p>&nbsp;</p>

![home](http://gastonmz.com/imbatman/home.png)
![resultados](http://gastonmz.com/imbatman/resultados.png)
![info](http://gastonmz.com/imbatman/info.png)
![zoom1](http://gastonmz.com/imbatman/zoom1.png)
![zoom2](http://gastonmz.com/imbatman/zoom2.png)
<!-- 
<img align="left" src="https://github.com/Orderella/PopupDialog/blob/master/Assets/PopupDialog01.gif?raw=true" width="300">
<img src="https://github.com/Orderella/PopupDialog/blob/master/Assets/PopupDialog02.gif?raw=true" width="300">
<img align="left" src="https://github.com/Orderella/PopupDialog/blob/master/Assets/PopupDialog03.gif?raw=true" width="300">
<img src="https://github.com/Orderella/PopupDialog/blob/master/Assets/PopupDialogDark01.png?raw=true" width="300">

<p>&nbsp;</p>
-->
## Caracteristicas Activas

- [x] Heroe del dia (que cambia automaticamente todos los dias)
- [x] Muestra el historial de los 3 ultimos heroes visitados
- [x] Buscador (limitado hasta 10 resultados)
- [x] Zoom sobre imagenes al tocarlas


## Caracteristicas Pendientes _(en desarrollo)_

- [x] Implementar transiciones dinamicas entre vistas.
- [x] Permitir filtrar resultados por abecedario
- [x] Permitir hacer una nueva busqueda en la lista de resultados
- [x] Permitir seleccionar el limite de resultados
- [x] Animaciones de objetos en pantallas

<p>&nbsp;</p>

# Especificaciones técnicas

El proyecto fue desarrollado 100% en Objetive-C utilizando librerias externas via Pods como:
- `RestKit:` es una libreria para implementar servicios web RESTful.Proporciona un potente motor de mapeo de objetos que se integra a la perfección con CoreData y un simple conjunto mapeo de red primitivas para solicitudes HTTP y respuestas integradas.
- `SVGKit:` libreria que permite implementar imagenes vectorizadas en lugar de clasicas imágenes png y jpg impidiendo la perdida de resolución.
- `Lottie:` es una libreria que renderiza animaciones de After Effects en tiempo real, lo que permite que las aplicaciones usen animaciones tan fácilmente como usan imágenes estáticas.
- `SDWebImage:` libreria liviana que permite cargar las imagenes en un componente UIImageView en segundo plano.
- `PopupDialog:` es una librería excelente que le da vida con animaciones y estilos a las ventanas emergentes, muy simple de implementar.


## Estado actual

Antes de detallar a continuación, este proyecto tiene un roadmap completo ideado a partir de un [sketchbook][sketch-link] donde luego se creo a partir de ello la interfaz de usuario 100% vectorial (de mi autoria) que pueden observar en este [documento PDF][pdf-link] o [acceder a su diseño a través de Illustrator][ai-link].

`Dado a cuestiones de tiempo, no se implementaron constraints en las vistas, por ende es solo reproducible en la versión de iPhone SE 2da edición (tanto simulador como dispositivo físico)`

- Creacion de objetos para RestKit de respuestas obtenidos de los servicios de Marvel API
- Implementación que permite seleccionar un heroe al azar diariamente como Hereo del Dia
- Utilización de PopupDialog para ver las imagenes con mejor resolución
- Busqueda de heroe desde la pantalla principal
- Se guardan los ultimos 3 heroes visitados en el NSUserDefaults y se muestran en la pantalla principal
- En la pantalla de información del heroe se obtiene la caratula de cada actividad del hereo utilizando simplemente NSURLSession

[sketch-link]: https://github.com/gastonmz/imbatman/blob/main/Diseños%20UI/Im%20Batman%20-%20wireframe.sketch
[pdf-link]: https://github.com/gastonmz/imbatman/blob/main/Diseños%20UI/Im%20Batman%20-%20Interface%20de%20Usuario.pdf
[ai-link]: https://github.com/gastonmz/imbatman/blob/main/Diseños%20UI/Im%20Batman%20-%20Interface%20de%20Usuario.ai

## Tareas pendientes
- Implementación de control de errores en el código 
- Implementación de constraints
- Implementación de filtro de resultados por inicial del abecedario en la pantalla de resultados
- Implementación de buscador en la pagina de resultados
- Implementación de slider que permite seleccionar el máximo de resultados a mostrar en la tabla 
- Unit Testing en los servicios utilizados en el app
- Animaciones de objetos en las pantallas
- Cambios aleatorios de fondos de pantalla
- Animacion en la transicion de vistas utilzando lottie

<p>&nbsp;</p>

# Instalación

Simplemente clonar el proyecto, ejecutar `pod install` dentro de la carpeta y abrir `Im Batman.xcworkspace` con Xcode.

## Compatibilidad

 Fue desarrollado con Xcode 13.1

 
## Dispositivo Preferido

Actualmente solo fue desarrallo teniendo en cuenta el iPhone SE 2da edición

<p>&nbsp;</p>

# Por qué el nombre?

## Im Batman

Porque soy fanatico de Batman (y el resto del universo DC); comics principalmente y, series y peliculas animadas... aunque puedo decir que el mejor live action que concentra el personaje tal cual los comics es Ben Affleck (`#batfleck`). 

y qué tiene que ver con el universo Marvel? nada. Aunque es de público conocimiento que Batman es un excelente detective y necesitar estar al tanto de todo a su alrededor ;)

<p>&nbsp;</p>


# Changelog
* **1.0.1**  Versión inicial del proyecto

<p>&nbsp;</p>

# Autor

Gaston Mz, gastonmz@gmail.com
<br/>
Fanático de las novelas de Stephen King y comics del universo DC. Un amor incondicional por mi pastor alemán. Y si, también soy un viejo pasado los 40 años que sigue andando en BMX... 
<br />
Todo lo demás lo encontrás en [LinkTree](https://linktr.ee/gastonmz)
<p>&nbsp;</p>


# Licencia

EL código y diseño de la interfaz es de mi auditoria. Siéntanse libre de clonar el repo y utilizarlo para sus propios fines.

## Derechos de autor

La información obtenida en el uso del App es provista por el API de Marvel:
`Data provided by Marvel. © 2022 MARVEL`
Algunos de los diseños de la UI fueron descargados desde [Vecteezy](https://vecteezy.com)
de forma gratuita y editados. 
