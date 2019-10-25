# Python

### Comentarios

Los comentarios empiezan con #

### Funciones

#### Definición

```python
def <nombre_funcion>():
  ...
```

#### keyword parameters
```python
def <nombre_funcion>(a, b):
  ...

<nombre_funcion(a = 4, b = 5)
```

#### default parameters
```python
def <nombre_funcion>(a, b = 5):
  ...
```
Los par&aacute;metros por defecto se deben definir siempre al final

#### var args
```python
def <nombre_funcion>(*args):
  ...
```
Los par&aacute;metros se reciben como una lista

#### keyword var args
```python
def <nombre_funcion>(**kargs):
  ...
```
Los par&aacute;metros se reciben como un diccionario

#### Funciones predefinidas

```print('<cadena>')```: escribe <cadena> en la consola

```input()```: lee la entrada de la consola

### Instrucciones de control

#### if

```python
if <expresion>:
  ...
elif <expresion>:
  ...
else:
  <expresion>
```

#### For

```python
for i in [1, 3, 4]:
  print(i)    
```

## Data types

La funci&oacute;n <kdb>type</kdb> nos devuelve el tipo de una variable

### int

### str

#### formateo de strings
```python
"hello %s %s" % (name, surname)

f"hello {name} {surname}" # since python 3.6
```

### float

### list

#### Definición

```python
['value1', 'value2',...]
```

#### Acceso

se puede acceder por posición o por rango
```python
spam[1]

spam[1:4]
```

se puede omitir cualquiera de los dos lados del rango
```python
spam[:4] # devuelve del primero al tercero

spam[2:] # devuelve del tercero al &uacute;ltimo
```


se puede acceder desde el principio o desde el final
```python
spam[1]

spam[-3]
```

#### Borrado
```python
del spam[4]
```

#### Concatenación de listas
```python
[1, 3, 4] + [5, 7, 9]
```

#### Añadir elementos
```python
list.append(item)
```
#### Operadores in y not in

```python
 4 in [1, 3, 4]
```

```python
 4 not in [1, 3, 4]
```

### Tuples
```python
(4, 5, 6)
```
Es igual que list, pero con la direfencia de que es inmutable

### dict
```python
{"key": value }
```

### Control de excepciones

```python
try:
  ...
except <exception>:
  ...
```

#### Lanzar una excepci&oacute;n

```python
raise exception(<description>)
```

### Módulos

```python
import <modulo>
```

#### os

Nos permite manipular la estructura de directorios, leer y escribir archivos.

#### subprocess

Nos permite trabajar de forma directa con órdenes del sistema operativo.
