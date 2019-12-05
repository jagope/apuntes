# Git

## Configurar git

<kbd>$ git config [--global | --system | --local] --list</kbd>: muestra todas las configuraciones del nivel especificado

<kbd>$ > git config --[system | global | local] &t;key&gt; &lt;value&gt;</kbd>: Establece el valor &lt;value&gt; para la clase &lt;key&gt; en el nivel ([system | global | local]) correspondiente. Los valores en cada uno de los niveles sobreescribe el valor del anterior nivel

<kbd>$ git config --global user.name “Javier Gonzalo”</kbd>

<kbd>$ git config --global user.email jgonzalopelaez@gmail.com</kbd>


<kbd>$ git config --global core.autocrlf true</kbd>:  (en windows)
<kbd>$ git config --global core.autocrlf input</kbd>:  (en linux/mac)

Para no tener problema con los finales de línea, en windows cambia los finales de línea, en linux/mac no los cambia.

<kbd>$ git config --global alias.<alias> <comando>añade un alias

## Comandos
<kbd>$ git init</kbd>: inicializa un repositorio git en el directorio actual.

<kbd>$ git status</kbd>: muestra los cambios en el proyecto y los ficheros en el area de staging

<kbd>$ git add (&lt;file&gt; | &lt;dir&gt; | &lt;regex&gt;)</kbd>
Añade el fichero &lt;file&gt;, o el directorio &lt;dir&gt;, o todos los ficheros que cumplan el patron &lt;regex&gt; al area de staging

<kbd>$ git reset -- &lt;file&gt;</kbd>: elimina el fichero &lt;file&gt; del area de staging

<kbd>$ git rm <file> -> elimina el fichero <file> de disco y añade la eliminación al area de staging</kbd>

<kbd>$git commit [--amend] [-a] -m "descripcion del cambio" </kbd> realiza el commit de todo lo que haya en el area de staging.

[--amend] -> añade los cambios al último
commit realizado
[-a] -> realiza el commit saltandose el area de staging

<kbd>$ git reset --soft HEAD^</kbd>: deshace el &uacute;ltimo commit y pone los cambios en la zona de staging.

<kbd>$ git reset --hard HEAD^</kbd>: deshace el &uacute;ltimo commit y sus cambios

<kbd>$ git reset --hard &lt;SHA&gt;</kbd>: devuelve la rama al commit con el SHA &lt;SHA&gt; y descarte el resto de commits.
 
<kbd>& git revert HEAD</kbd>: crea un nuevo commit con el inverso del &uacute;ltimo commit

### Remotes

<kbd>& git clone &lt;repository&gt; [&lt;folder&gt;]</kbd>: clona el proyecto contenido en &lt;repository&gt; a una carpeta con el nombre del repositorio o si se especifica el parámetro en una carpeta &lt;folder&gt;. Se crea un repositorio remoto que por defecto se llama origin

<kbd>& git remote add <name> <url></kbd>: añade el repositorio remoto <url> y lo almacena en la variable <name>

<kbd>& git remote -v</kbd>: muestra los origenes que hemos añadido a nuestro repositorio

<kbd>& git remote show &lt;remote&gt;</kbd>: muestra la url del repositorio, y las ramas conectadas.

<kbd>& git remote prune &lt;remote&gt;</kbd>: limpia las ramas borradas en remoto del origen &lt;remote&gt;.

<kbd>& git push &lt;remoteName&gt; &lt;localBranchName&gt;[:&lt;remoteBranchName&gt;]</kbd>: sube los commits al repositorio con nombre &lt;remote-name&gt; de la rama llamada &lt;localBranchName&gt;. Opcionalmente podemos establecer el nombre &lt;remoteBranchName&gt; de la rama con el que se creara en remoto, sino se creará con &lt;localBranchName&gt;. 

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

<kbd>$ git push [--delete | -d] &lt;remote&gt; &lt;name&gt;</kbd>: elimina del remoto &lt;remote&gt; la rama con nombre &lt;name&gt;

<kbd>$ git push origin &lt;branch&gt;</kbd>: sube los cambios de la rama local &lt;branch&gt; a la rama remota &lt;branch&gt;

<kbd>$ git checkout --track origin/<branch> -> crea una rama local llamada <branch> que apunta a la rama remota origin/<branch>

<kbd>$ git checkout <brach | tag></kbd>: cambia a la rama <branch> o tag <tag>
<kbd>$ git checkout -b <rama></kbd>: crea la rama <rama> y cambia a esa rama

<kbd>$ git merge &lt;rama&gt;</kbd>: mezcla la rama actual con la rama &lt;rama&gt;. Si en la rama actual no se han hecho cambios desde que se creo la rama, se hace un fast forward, los commits se llevan a la rama actual, si ha habido cambios en las dos ramas se crea un nuevo commit con el resultado de mezclar los commits de ambas ramas.

<kbd>$ git checkout <commit></kbd>: mueve HEAD al commit <commit>

### Tags

<kbd>$ git tag</kbd>: muestra todos los tags creados.

<kbd>$ git tag &lt;tag&gt; [-m <description>]</kbd>: crea en local una etiqueta con nombre &lt;tag&gt;, opcionalmente se le puede establecer una descripción.

<kbd>$ git push --tags</kbd>: env&iacute;a los tags al remoto

<kbd>$ git tag -d &lt;tag&gt;</kbd>: elimina de local la etiqueta &lt;tag&gt;

<kbd>$ git push origin :refs/tags/&lt;tag&gt;</kbd>: elimina de remoto la etiqueta &lt;tag&gt;

#### Stash
<kbd>$ git stash</kbd>: guarda los cambios de la rama actual en un sitio temporal

<kbd>$ git stash list</kbd>: muestra la pila de cambios guardados

<kbd>$ git stash apply stash@{n}</kbd>: devuelve los cambios del sitio temporal a la rama de la posición n de la pila

<kbd>$ git stash pop [stash@{n}]</kbd>: devuelve los cambios de la pila de stash a la rama actual y lo elimina de la pila, si no se especifica la posición de la pila se asume stash@{0}

#### Otros

<kbd>$git blame &lt;file&gt;</kbd>: nos dice quien ha escrito cada línea del fichero &lt;file&gt;.

<kbd>$git fetch</kbd>: sincroniza nuestro repositorio local con el remoto, pero no actualiza nada de nuestro código

<kbd>$git log [--stat] [-n]</kbd>: muestra todos los mensajes de commit
[--stat] -> muestra los ficheros incluidos en cada commit
[-n] -> número de commits a mostrar

<kbd>$git cherry-pick [--edit] [--no-commit] &lt;hash&gt;+</kbd>: Copia uno o varios commit de otra rama con el hash &lt;hash&gt;, esto genera un nuevo commit con un hash diferente. Con la opción --edit podemos especificar la descripción del nuevo commit. Con la opción --no-commit copia los cambios pero no hace commit.

<kbd>$ git filter-branch --index-filter &lt;command&gt; -- [--all, HEAD]</kbd>: recorre cada uno de los commits, ejecuta sobre él el comando &lt;command&gt; y vuelve a hacer commit. Puede ejecutarde sobre la rama actual, HEAD, o sobre todas las remas, --all.
Ejemplos:
git filter-branch --index-filter 'git rm --cached --ignore-unmatch password.txt' -- --all, elimina de todas las ramas el fichero password.txt

<kbd>$ git reflog</kbd>: nos muestra todos los commits, incluso los borrados, por lo que lo podemos utilizar para recuperar commits. Reflog existe solamente en el repositorio local.
