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
```sh
> git init
```
 
Inicializa un repositorio git en el directorio actual.

```sh
> git status
```
Muestra los cambios en el proyecto y los ficheros en el area de staging

```sh
> git add <file>
```
Añade el fichero &lt;file&gt; al area de staging

```sh
> git reset <file>
```
Elimina el fichero &lt;file&gt; del area de staging

```sh
> git rm <file> -> elimina el fichero <file> de disco y añade la eliminación al area de staging
```

>git commit [--amend] [-a] -m "descripcion del cambio" -> realiza el commit de todo lo que haya en el area de staging.
[--amend] -> añade los cambios al último
commit realizado
[-a] -> realiza el commit saltandose el area de staging

```sh
> git reset --soft HEAD^ -> deshace el último commit y pone los cambios en la zona de staging
```
>git remote add <name> <url> -> añade el repositorio remoto <url> y lo almacena en la variable <name>

>git remote -v -> muestra los origenes que hemos añadido a nuestro repositorio

>git push -u  <remote-name> <branch> -> sube los commits al repositorio almacenado en  <remote-name> a la rama <branch>

>git pull <remote-name> <branch> -> baja los commits del repositorio almacenado en <remote-name> de la rama <branch>

>git fetch <remote-name> -> trae toda la información disponible en el remoto <remote-name> que no tenemos todavía

> git diff <file> -> muestra las diferencias del fichero <fichero> con respecto al último commit
> git diff HEAD -> muestra las diferencias con respecto a nuestro último commit
> git diff --staged -> muestra las diferencias con el area de staging
> git diff --name-status master..<branch> -> muestra los ficheros que han cambiado entre la rama principal (master) y la rama <branch>
>git checkout -- <file> ->restaura el fichero <file> a como era en el último commit

### Branchs
```sh
> git branch
```
Muestra las ramas que hay en local

```sh
> git branch -r
```
Muestra las ramas que hay en remoto

```sh
> git branch <name>
```
crea una rama con nombre &lt;name&gt;

```sh
> git branch -d <name>
```
Elimina la rama con nombre &lt;name&gt; (solo en local)

```sh
> git push origin --delete <name>
```
Elimina la rama con nombre &lt;name&gt;	, pero solo del remoto

```sh
> git push origin <branch>
```
Sube los cambios de la rama local &lt;branch&gt; a la rama remota &lt;branch&gt;

>git checkout --track origin/<branch> -> crea una rama local llamada <branch> que apunta a la rama remota origin/<branch>

>git checkout <brach | tag> -> cambia a la rama <branch> o tag <tag>
>git checkout -b <rama> -> crea la rama <rama> y cambia a esa rama


>git merge <rama> -> mezcla la rama actual con la rama <rama>
>git clone <repository> -> clona el proyecto contenido en <repository> a una carpeta local

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
