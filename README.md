# Weather App

Repo para el challenge de Weather App en Flutter.

## Algunas notas sobre el desarrollo del proyecto:

El proyecto se desarrolló en inglés como manera más estandar y genérica para una app. Así como 
también por costumbre y comodidad a la hora de usar los resultados de la api.

### API para el Clima:
Se optó por usar la siguiente api: https://www.metaweather.com/api/
Ya que ofrece buenos endpoints fáciles de usar y provee mucha info detallada, además de imagenes, etc.

### Búsqueda de Ciudades:
A la hora de agregar una nueva ciudad con su clima, se ofrece una Search Bar donde se puede buscar una nueva ciudad y agregarla.
Para ello, se implementó una busqueda simultanea, es decir, a medida que vas tipeando se realizan llamadas a la api con el texto ingresado y se traen los resultados correspondientes a las ciudades que matchean.
Para que el funcionamiento sea más orgánico y para no realizar demasiadas llamadas a la api, se utilizó un Debouncer, que lo que hace es esperar a que el usuario deje de tipear por al menos 1 segundo para realizar una llamada a la api con el texto ingresado hasta el momento.

### Agregar una ciudad:
Una vez que realicé una busqueda y la app me muestra los resultados correspondientes, puedo simplemente clickear en el botón + al costado de la ciudad que quiero agregar.

### Lista de Ciudades:
En esta pantalla la app me muestra las ciudades que tengo agregadas al momento.

### Clima de una ciudad en particular:
Al hacer click en una de la ciudades de mi lista de ciudades, paso a la pantalla del clima específico de esta ciudad, donde me muestra la temperatura y la fecha correspondiente al dia de hoy (teniendo en cuenta zona horaria de la ciudad que estoy viendo).
En la parte baja de la pantalla puedo ver más informacion detallada del clima.

### Pronóstico de los proximos dias:
Al hacer click en la flecha hacia arriba ^ (parte baje de la pantalla) abro una ventana scrolleable con el detalle del clima para los proximos dias.


## Tema Tests:
Ademas del desarrollo de la app en sí, se agregaron una serie de tests (carpeta test).
Si bien no cubren todo el funcionamiento de la app, y se podrían profundizar o extender mucho más.
Mi idea fue mostrar un poco de unit tests, algunos test sobre los modelos utilizados en la app (City, Weather), y también realizar algunos test más complejos, como por ejemplo tests de widgets, donde se simula la interaccion con distintos elementos dentro de los widgets y también se utiliza la libreria 'Mockito' para poder justamente hacer un "mock" de ciertos servicios, en este caso del servicio de la API.



