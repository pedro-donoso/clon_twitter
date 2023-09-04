![Captura desde 2023-08-15 00-02-02](https://github.com/pedro-donoso/clon_twitter/assets/68760595/79fd9972-2d32-4130-8cb6-6085d3fc434b)


### PROCESO
1- Abrir terminal ubuntu, dentro de la carpeta principal BootcampROR:

```bash
ls
```
```bash
cd BootcampROR
```
<br>

2. Crear proyecto rails con base de datos postgresql:

```bash
rails new clon_twitter -d postgresql
```
<br>

3. Ingresar al nuevo proyecto creado:

```bash
ls
```
```bash
cd clon-twitter
```
<br>

4. Crear commmit:

```bash
git add .
```
```bash
git commit -m "primer commit"
```
<br>

5. Abrir vscode y cerrar terminal ubuntu:

```bash
code .
```
<br>

6. Crear repositorio en github:

```bash
git init
```
<br>

7. Inicializar postgresql desde terminal vscode y dejar corriendo (renombrar a terminal postgresql):

```bash
sudo service postgresql start
```
<br>

8. Abrir terminal 2 en vscode y generar base de datos (renombrar a terminal rails server):

```bash
rails db:create
```
<br>

9. Consideraciones scaffold:
    
- modelo (Primera letra Mayusculas y palabra en singular)

- atributos del modelo (clave:valor)

- trabajar siempre en ingles

```bash
rails g scaffold Tweet description:text
``` 

- userName (si no se define es string)

  <br>

10. Revisar carpeta migrate:
    
- se genera en la carpeta db, debe contener el formato asignado al scaffold

11. Genero la migracion:
    
```bash
rails db:migrate
```

12. Revisar routes:
    
- en config -> routes
debe aparecer resources con modelo en minuscula y plural, tweets

13. Definir root:
    
- en routes descomentar y cambiar articles, dejar modelo generado en plural
root "tweets#index"
guardar

14. Dejar corriendo servidor de rails desde terminal 2 y revisar sitio web:
    
```bash
rails s
```

- localhost 3000

15. Revisar controllers:
    
en app -> controllers
aparece controller creado
tweets_controller.rb

16. Abrir terminal 3 (renombrar a terminal) y commitear:
    
```bash
git add.
```

```bash
git commit -m "mensaje"
```

- sync changes o git pull

17. Generar datos con gema faker:
    
- en gemfile agregar al final comentario

#Gemas agregadas por mi
gem 'faker'

- guardar

18. Instalar gema, desde terminal 3 ejecutar:

```bash
bundle
```

19. Agregar contenido al seed:
    
- en carpeta bd -> seeds.rb

- al final del archivo agregar texto:
puts "Creating tweets..."

escribir accion y logica aqui

- guardar

20. Revisar en carpeta migrate los nombres clave: valor asignados

escribirlos igual en la logica del archivo seeds creado con la fecha 2023...

21. Actualizo el seeds.rb

```bash
rails db:seed
```

aparecerá el mensaje por consola creado
Creating tweets...

22. Revisar funcionamiento app

localhost:3000

23. Modificar cantidad de tweets a 500:
    
- en seeds.rb

10.times do

- detener rails server
  
```bash
ctrl c
```

24. Al cambiar la cantidad de datos a 500 debemos resetear la base de datos, desde terminal ejecutar:

```bash
rails db:reset
```

25. Volver a correr servidor de rails desde terminal rails server, ejecutar:

```bash
rails s
```

26. Realizo commit de la app funcionando:
    
desde terminal ejecutar:

```bash
git add .
```

```bash
git commit -m "feat: Faker"
```

27. Agrego paginacion con gem pagy:
    
- Ir al archivo Gemfile y editar al final donde agrego mis gemas agregadas

- Guardar cambios Gemfile

- Ejecutar bundle para agregar gema

```bash
bundle
```

28. Incluir pagy en controller:
    
- buscar controller -> ctrl p

- application_controller.rb editar:

incluir bajo Class

	include Pagy::Backend

- guardar cambios

29. Incluir pagy en application_helper.rb
    
- Buscar controller -> ctrl p

- Incluir bajo module

	include Pagy::Frontend

esto afectara a toda la app

30. Cambiar en vista index:
    
ctrl p -> tweets_controller.rb

- incluir bajo @tweets = Tweet.all (comentar esta linea) #

 @pagy, @tweets = pagy(Tweet.all)
 

31. Agregar helpers adicionales:
    
views -> tweets -> index.html.erb

- pegar al final del archivo

<%== pagy_nav(@pagy) if @pagy.pages > 1%>

- guardar archivo


32. Reiniciar desde terminal rails server para ver funcionamiento de pagy:

```bash
ctrl c
```
```bash
rails s
```
- Pagy funcionando:
    
33. Agrego ID a indice
    
_tweet.html.erb

34. Agrego cdn para estilo css bootstrap en:
    
application.html.erb

sobre </head>

cdn js bootstrap
sobre </body>

35. Agrego contenedor en html:
    
application.html.erb

36. Edito la vista _tweet.html.erb:

views -> tweets

agrego card bootstrap

abajo de dom_id tweet

copio datos especificos del pagina 1 tweet y los agrego a pagina principal de todos

37. Agrego initializer de pagy:
    
config -> initializers 

copiar documentación de github

crear archivo pagy.rb
y pegar initializer de pagy

38. Activar navegacion de bootstrap:
    
buscar en archivo pagy.rb
"bootstrap"

y descomento extras de bootstrap

39. Detener el servidor y volver a correr, cada vez que se modifica un archivo initializer

terminal rails server

```bash
rails s
```

40. Editar vista index para aplicar estilo de paginacion de bootstrap:

views -> tweets -> index-html.erb

aplico formato segun documentación
pagy_bootstrap_nav


41. Renderizar solo 10 tweets:
    
en initializer pagy.rb

cambiar 20 por defecto a 10 desactivando comentario

reiniciar rails s para aplicar


42. Creo buscador:
    
eligo un navbar con buscador de bootstrap

en views -> creo carpeta shared -> creo archivo _navbar.html.erb


43. Pegar render en application:
    
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
