# Git flow

Define un modelo de ramas y como mergear entre ellas:

* Master: almacena las liberaciones
* Develop: sirve para integrar las diferentes features
* Release: sirve para preparar una liberaci&oacute;n
* Feature: nuevos desarrollos
* HotFix: error en producci&oacuten 
* Bugfix: error en release

## Init

Para poder usar git flow el primer paso es ejecutar <kbd>git flow init</kbd> en un repositorio existente. Este comando permite configurar el nombre
de las distintas ramas

## Features

Para un nuevo desarrollo hay que crear una nueva rama a partir de develop, para ello ejecutar el siguiente comando:
<kbd>git flow feature start &lt;branchName&gt;</kbd>

Una vez terminado el desarrollo hay que integrar los cambios a develop, para ello ejecutar el siguiente comando:
<kbd>git flow feature finish &lt;nombre_rama&gt;</kbd>

## Releases

Para preparar una liberaci&oacute; hay que crear una nueva rama a partir de develop. Una vez creada no se deberían introducir nuevas features en esta rama.
En esta rama solo deberían ir bugfixes. Una vez lista para la liberaci&oacute;n la rama debe ser mergeada a master y etiquetada la versi&oacute;.
También debe mergearse a develop. Para crear una nueva rama de release ejecutar el siguiente comando:
<kbd>git flow release start &lt;version&gt;</kbd>

Una vez liberado hay que integrar los cambios a master, para ello ejecutar el siguiente comando:
<kbd>git flow release finish &lt;version&gt;</kbd>

## Hotfix

Para corregir un error de una liberaci&oacute; hay que crear una nueva rama a partir del master. Una vez corregido el error debe ser mergeado a master y a develop,
y master debe ser etiquetado con una nueva versi&acute;n. Para crear la rama ejecutar el siguiente comando: 
<kbd>git flow hotfix start &lt;nombre_rama&gt;</kbd>
