# Git

## Configurar git

```sh
> git config [--global | --system | --local] --list
```
Muestra todas las configuraciones del nivel especificado

```sh
> git config --[system | global | local] <key> <value>
```
Establece el valor <value> para la clase <key> en el nivel ([system | global | local]) correspondiente. Los valores en cada uno de los niveles sobreescribe el valor del anterior nivel

```sh
> git config --global user.name “Javier Gonzalo”
> git config --global user.email jgonzalopelaez@gmail.com
```

```sh
> git config --global core.autocrlf true (en windows)
> git config --global core.autocrlf input (en linux/mac)
```
Para no tener problema con los finales de línea, en windows cambia los finales de línea, en linux/mac no los cambia.

```sh
> git config --global alias.<alias> <comando>
```
Añade un alias

## Comandos
<kbd>$ git init</kbd>: inicializa un repositorio git en el directorio actual.

<kbd>$ git status</kbd>: muestra los cambios en el proyecto y los ficheros en el area de staging

<kbd>$ git add (&lt;file&gt; | &lt;dir&gt; | &lt;regex&gt;)</kbd>
Añade el fichero &lt;file&gt;, o el directorio &lt;dir&gt;, o todos los ficheros que cumplan el patron &lt;regex&gt; al area de staging

<kbd>$ git reset -- &lt;file&gt;</kbd>: elimina el fichero &lt;file&gt; del area de staging

```sh
> git rm <file> -> elimina el fichero <file> de disco y añade la eliminación al area de staging
```

>git commit [--amend] [-a] -m "descripcion del cambio" -> realiza el commit de todo lo que haya en el area de staging.
[--amend] -> añade los cambios al último
commit realizado
[-a] -> realiza el commit saltandose el area de staging

<kbd>$ git reset --soft HEAD^</kbd>: deshace el &uacute;ltimo commit y pone los cambios en la zona de staging.

<kbd>$ git reset --hard HEAD^</kbd>: deshace el &uacute;ltimo commit y sus cambios
 
<kbd>& git revert HEAD</kbd>: crea un nuevo commit con el inverso del &uacute;ltimo commit

### Remotes

<kbd>& git clone &lt;repository&gt; [&lt;folder&gt;]</kbd>: clona el proyecto contenido en &lt;repository&gt; a una carpeta con el nombre del repositorio o si se especifica el parámetro en una carpeta &lt;folder&gt;. Se crea un repositorio remoto que por defecto se llama origin

<kbd>& git remote add <name> <url></kbd>: añade el repositorio remoto <url> y lo almacena en la variable <name>

<kbd>& git remote -v</kbd>: muestra los origenes que hemos añadido a nuestro repositorio

<kbd>& git remote show &lt;remote&gt;</kbd>: muestra la url del repositorio, y las ramas conectadas.

<kbd>& git remote prune &lt;remote&gt;</kbd>: limpia las ramas borradas en remoto del origen &lt;remote&gt;.

<kbd>& git push -u  <remote-name> <branch></kbd>: sube los commits al repositorio almacenado en  <remote-name> a la rama <branch>

<kbd>& git pull <remote-name> <branch></kbd>: baja los commits del repositorio almacenado en <remote-name> de la rama <branch>

<kbd>& git fetch <remote-name></kbd>: trae toda la información disponible en el remoto <remote-name> que no tenemos todavía


### Comparar ficheros
<kbd>$ git diff [&lt;file&gt;]</kbd>: muestra las diferencias desde el &uacute;ltimo commit. Si especificamos un fichero &lt;file&gt; muestra las diferencias de dicho fichero desde el &uacute;ltimo commit.

<kbd>$ git diff --staged [&lt;file&gt;]</kbd>: muestra las diferencias de los ficheros en el area de staging desde el &uacute;ltimo commit. Si especificamos un fichero &lt;file&gt; muestra las diferencias de dicho fichero (si está en el area de staging( desde el &uacute;ltimo commit.

<kbd>$ git diff HEAD</Kbd>: muestra las diferencias con respecto a nuestro último commit

<kbd>$ git diff --name-status master..&lt;branch&gt;</Kbd>: muestra los ficheros que han cambiado entre la rama principal (master) y la rama &lt;branch&gt;

<kbd>$ git checkout -- &lt;file&gt;</Kbd>: restaura el fichero &lt;file&gt; a como era en el último commit

### Branchs
<kbd>$ git branch</kbd>: muestra las ramas que hay en local

<kbd>$ git branch -r</kbd>: muestra las ramas que hay en remoto

<kbd>$ git branch &lt;name&gt;</kbd>: crea una rama con nombre &lt;name&gt;

<kbd>$ git branch -d &lt;name&gt;</kbd>: elimina en local la rama con nombre &lt;name&gt;

<kbd>$ git branch -D &lt;name&gt;</kbd>: elimina en local la rama con nombre &lt;name&gt;. Esta opción hay que usarla cuando la rama se subio al repositorio remoto y ha sido eliminada del repositorio remoto.

<kbd>$ git push origin --delete &lt;name&gt;</kbd>: elimina en remoto la rama con nombre &lt;name&gt;

<kbd>$ git push origin &lt;branch&gt;</kbd>: sube los cambios de la rama local &lt;branch&gt; a la rama remota &lt;branch&gt;

>git checkout --track origin/<branch> -> crea una rama local llamada <branch> que apunta a la rama remota origin/<branch>

>git checkout <brach | tag> -> cambia a la rama <branch> o tag <tag>
>git checkout -b <rama> -> crea la rama <rama> y cambia a esa rama

<kbd>$ git merge &lt;rama&gt;</kbd>: mezcla la rama actual con la rama &lt;rama&gt;. Si en la rama actual no se han hecho cambios desde que se creo la rama, se hace un fast forward, los commits se llevan a la rama actual, si ha habido cambios en las dos ramas se crea un nuevo commit con el resultado de mezclar los commits de ambas ramas.

>git checkout <commit> -> mueve HEAD al commit <commit>

### Tags

```sh
> git tag
```
Muestra todos los tags creados

```sh
> git tag <tag> [-m <description>]
```
Crea en local una etiqueta con nombre &lt;tag&gt;, opcionalmente se le puede establecer una descripción

```sh
> git push --tags
```
Envia los tags al remoto

```sh
> git tag d <tag>
```
Elimina de local la etiqueta &lt;tag&gt;

```sh
> git push origin :refs/tags/<tag>
```
Elimina de remoto la etiqueta &lt;tag&gt;

#### Otros

>git blame <file> -> nos dice quien ha escrito cada línea del fichero <file>
>git fetch -> sincroniza nuestro repositorio local con el remoto, pero no actualiza nada de nuestro código

>git log [--stat] [-n] -> muestra todos los mensajes de commit
[--stat] -> muestra los ficheros incluidos en cada commit
[-n] -> número de commits a mostrar

>git cherry-pick [--edit] [--no-commit] <hash> -> copia un commit de otra rama con el hash <hash>
Stash
> git stash

guarda los cambios de la rama actual en un sitio temporal

> git stash list

muestra la pila de cambios guardados

> git stash apply stash@{n}

devuelve los cambios del sitio temporal a la rama de la posición n de la pila

> git stash pop [stash@{n}]
devuelve los cambios de la pila de stash a la rama actual y lo elimina de la pila, si no se especifica la posición de la pila se asume stash@{0}
