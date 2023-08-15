![Captura desde 2023-08-14 18-28-22](https://github.com/pedro-donoso/clon_twitter/assets/68760595/69f71e4f-83f7-4883-9dd8-5c90d682e0b7)
### PROCESO
1) abrir terminal ubuntu, dentro de la carpeta principal BootcampROR

ls
cd BootcampROR

2) crear proyecto rails con base de datos postgresql

rails new clon_twitter -d postgresql

3) ingresar al nuevo proyecto creado

ls
cd clon-twitter

4) hacer commmit

git add .
git commit -m "primer commit"

5) abrir vscode y cerrar terminal ubuntu
code .


6) crear repositorio en github
opcion 1 desde git init


7) inicializar postgresql desde terminal vscode y dejar corriendo (renombrar a terminal postgresql)
sudo service postgresql start


8) abrir terminal 2 en vscode y generar base de datos (renombrar a terminal rails server)
rails db:create

9) consideraciones scaffold: 
modelo (Primera letra Mayusculas y palabra en singular)

atributos del modelo (clave:valor)

trabajar siempre en ingles

rails g scaffold Tweet description:text  

userName (si no se define es string)

10) revisar carpeta migrate
se genera en la carpeta db, debe contener el formato asignado al scaffold

11) genero la migracion
rails db:migrate

12) revisar routes
en config -> routes
debe aparecer resources con modelo en minuscula y plural, tweets

13) definir root 
en routes descomentar y cambiar articles, dejar modelo generado en plural
root "tweets#index"
guardar

14) revisar sitio web 
rails s
localhost 3000

15) revisar controllers
en app -> controllers
aparece controller creado
tweets_controller.rb

16) dejar corriendo servidor de rails desde terminal 2
rails s

17) abril terminal 3 (renombrar a terminal) y commitear
git add.
git commit -m "mensaje"
sync changes o git pull

18) generar datos con gema faker
en gemfile agregar al final comentario:

# Gemas agregadas por mi
gem 'faker'

guardar

19) instalar gema, desde terminal 3 ejecutar:
bundle

20)agregar contenido al seed
en carpeta bd -> seeds.rb

al final del archivo agregar texto:
puts "Creating tweets..."

escribir accion y logica aqui

guardar

21) revisar en carpeta migrate los nombres clave: valor asignados

escribirlos igual en la logica del archivo seeds creado con la fecha 2023...

22) actualizo el seeds.rb
rails db:seed

aparecera el mensaje por consola creado
Creating tweets...

24) revisar funcionamiento app
localhost:3000

25) modificar cantidad de tweets a 500
en seeds.rb

10.times do

detener rails server
ctrl c

26) al cambiar la cantidad de datos a 500 debemos resetear la base de datos, desde terminal ejecutar:

rails db:reset

27) volver a correr servidor de rails, desde terminal rails server, ejecutar:

rails s

28) realizo commit de la app funcionando
desde termina ejecutar:

git add .
git commit -m "feat: Faker"

29) agrego paginacion con gem pagy
ir al archivo Gemfile y editar al final donde agrego mis gemas agregadas
guardar cambios Gemfile

ejecutar bundle para agregar gema
bundle

30) incluir pagy en controller
buscar controller -> ctrl p

application_controller.rb editar:

incluir bajo Class

	include Pagy::Backend

guardar cambios

31)incluir pagy en application_helper.rb
buscar controller -> ctrl p

incluir bajo module

	include Pagy::Frontend

esto afectara a toda la app

32) cambiar en vista index
ctrl p -> tweets_controller.rb

incluir bajo @tweets = Tweet.all (comentar esta linea) #

 @pagy, @tweets = pagy(Tweet.all)

33) agregar helpers adicionales
views -> tweets -> index.html.erb

pegar al final del archivo

<%== pagy_nav(@pagy) if @pagy.pages > 1%>

guardar archivo

33) reiniciar desde terminal rails server para ver funcionamiento de pagy

ctrl c
rails s

34) PAGY FUNCIONANDO
FALTA AGREGAR ESTILOS


35) agrego ID a indice 
_tweet.html.erb

36) agrego cdn para estilo css bootstrap en:
application.html.erb

sobre </head>

cdn js bootstrap
sobre </body>

37) agrego contenedor en html
application.html.erb

38) edito la vista _tweet.html.erb

views -> tweets

agrego card bootstrap

abajo de dom_id tweet

39) copio datos especificos del pagina 1 tweet y los agrego a pagina principal de todos

40) agrego initializer de pagy
config -> initializers 
copiar documentación de github
crear archivo pagy.rb
y pegar initializer de pagy

41) activar navegacion de bootstrap
buscar en archivo pagy.rb
"bootstrap"

y descomento extras de bootstrap

42) detener el servidor y volver a correr, cada vez que se modifica un archivo initializer

terminal rails server -> rails s

43) editar vista index para aplicar estilo de paginacion de bootstrap

views -> tweets -> index-html.erb

aplico formato segun documentación
pagy_bootstrap_nav

44) renderizar solo 10 tweets
en initializer pagy.rb

cambiar 20 por defecto a 10 desactivando comentario

reiniciar rails s para aplicar