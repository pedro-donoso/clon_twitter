![Captura desde 2023-08-15 00-02-02](https://github.com/pedro-donoso/clon_twitter/assets/68760595/79fd9972-2d32-4130-8cb6-6085d3fc434b)


### PROCESO
1) Abrir terminal ubuntu, dentro de la carpeta principal BootcampROR:

```bash
ls
```
```bash
cd BootcampROR
```

2) Crear proyecto rails con base de datos postgresql:

```bash
rails new clon_twitter -d postgresql
```

3) Ingresar al nuevo proyecto creado:

```bash
ls
```
```bash
cd clon-twitter
```

4) Crear commmit:

```bash
git add .
```
```bash
git commit -m "primer commit"
```

5) Abrir vscode y cerrar terminal ubuntu:

```bash
code .
```

7) Crear repositorio en github:

```bash
git init
```

8) Inicializar postgresql desde terminal vscode y dejar corriendo (renombrar a terminal postgresql):

```bash
sudo service postgresql start
```

9) Abrir terminal 2 en vscode y generar base de datos (renombrar a terminal rails server):

```bash
rails db:create
```

10) Consideraciones scaffold: 
- modelo (Primera letra Mayusculas y palabra en singular)

- atributos del modelo (clave:valor)

- trabajar siempre en ingles

```bash
rails g scaffold Tweet description:text
``` 

- userName (si no se define es string)

11) Revisar carpeta migrate:
- se genera en la carpeta db, debe contener el formato asignado al scaffold

12) Genero la migracion:
    
```bash
rails db:migrate
```

13) Revisar routes:
    
- en config -> routes
debe aparecer resources con modelo en minuscula y plural, tweets

14) Definir root:
    
- en routes descomentar y cambiar articles, dejar modelo generado en plural
root "tweets#index"
guardar

15) Dejar corriendo servidor de rails desde terminal 2 y revisar sitio web:
    
```bash
rails s
```

- localhost 3000

16) Revisar controllers:
    
en app -> controllers
aparece controller creado
tweets_controller.rb

17) Abrir terminal 3 (renombrar a terminal) y commitear:
    
```bash
git add.
```

```bash
git commit -m "mensaje"
```

- sync changes o git pull

18) Generar datos con gema faker:
    
- en gemfile agregar al final comentario

#Gemas agregadas por mi
gem 'faker'

- guardar

19) Instalar gema, desde terminal 3 ejecutar:

```bash
bundle
```

20) Agregar contenido al seed:
    
- en carpeta bd -> seeds.rb

- al final del archivo agregar texto:
puts "Creating tweets..."

escribir accion y logica aqui

- guardar

21) Revisar en carpeta migrate los nombres clave: valor asignados

escribirlos igual en la logica del archivo seeds creado con la fecha 2023...

22) Actualizo el seeds.rb

```bash
rails db:seed
```

aparecerá el mensaje por consola creado
Creating tweets...

23) Revisar funcionamiento app

localhost:3000

24) Modificar cantidad de tweets a 500:
    
- en seeds.rb

10.times do

- detener rails server
  
```bash
ctrl c
```

25) Al cambiar la cantidad de datos a 500 debemos resetear la base de datos, desde terminal ejecutar:

```bash
rails db:reset
```

26) Volver a correr servidor de rails desde terminal rails server, ejecutar:

```bash
rails s
```

27) Realizo commit de la app funcionando:
    
desde terminal ejecutar:

```bash
git add .
```

```bash
git commit -m "feat: Faker"
```

28) Agrego paginacion con gem pagy:
    
- Ir al archivo Gemfile y editar al final donde agrego mis gemas agregadas

- Guardar cambios Gemfile

- Ejecutar bundle para agregar gema

```bash
bundle
```

29) Incluir pagy en controller:
    
- buscar controller -> ctrl p

- application_controller.rb editar:

incluir bajo Class

	include Pagy::Backend

- guardar cambios

30) Incluir pagy en application_helper.rb
    
- Buscar controller -> ctrl p

- Incluir bajo module

	include Pagy::Frontend

esto afectara a toda la app

31) Cambiar en vista index:
    
ctrl p -> tweets_controller.rb

- incluir bajo @tweets = Tweet.all (comentar esta linea) #

 @pagy, @tweets = pagy(Tweet.all)

32) Agregar helpers adicionales:
    
views -> tweets -> index.html.erb

- pegar al final del archivo

<%== pagy_nav(@pagy) if @pagy.pages > 1%>

- guardar archivo

33) Reiniciar desde terminal rails server para ver funcionamiento de pagy:

```bash
ctrl c
```
```bash
rails s
```
- Pagy funcionando:
    
34) Agrego ID a indice 
_tweet.html.erb

35) Agrego cdn para estilo css bootstrap en:
    
application.html.erb

sobre </head>

cdn js bootstrap
sobre </body>

36) Agrego contenedor en html:
    
application.html.erb

37) Edito la vista _tweet.html.erb:

views -> tweets

agrego card bootstrap

abajo de dom_id tweet

copio datos especificos del pagina 1 tweet y los agrego a pagina principal de todos

38) Agrego initializer de pagy:
    
config -> initializers 

copiar documentaci√≥n de github

crear archivo pagy.rb
y pegar initializer de pagy

39) Activar navegacion de bootstrap:
    
buscar en archivo pagy.rb
"bootstrap"

y descomento extras de bootstrap

40) Detener el servidor y volver a correr, cada vez que se modifica un archivo initializer

terminal rails server

```bash
rails s
```

41) Editar vista index para aplicar estilo de paginacion de bootstrap:

views -> tweets -> index-html.erb

aplico formato segun documentación
pagy_bootstrap_nav

42) Renderizar solo 10 tweets:
    
en initializer pagy.rb

cambiar 20 por defecto a 10 desactivando comentario

reiniciar rails s para aplicar

43) Creo buscador:
    
eligo un navbar con buscador de bootstrap

en views -> creo carpeta shared -> creo archivo _navbar.html.erb

44) Pegar render en application:
    
views -> layouts -> application.html.erb

sobre container

<%= render 'shared/navbar' %>

Envío calamar new tweet a navbar y lo edito

Agrego validacion desde backend (model)
    
bajo ApplicationRecord

49) agrego gema ransack
Gemfile
gem 'ransack'

terminal -> bundle
