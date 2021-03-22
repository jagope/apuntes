# Javascript ES6+

## Let
Define una variable con ámbito de bloque:
```javascript
function() {
   let name = “Scott”; // solo es accesible dentro de la función
}

for(let i=0; i<array.length; i++) { // solo es accesible dentro del for
   console.log(array[i]);
}
```

## Const
Define una variable que no se puede modificar. Tiene ámbito de bloque.
```javascript
const MAX = 10;
```javascript

## Functions

### Default parameters
Podemos darle un valor por defecto a los parámetros de una función asignándole un valor en la definición del parámetro:

```javascript
function (name = ”scott”) {
   return name;
}
```


### Named parameters
Cuando uno de los parámetros es un objeto con propiedades podemos usar nombres para que sea más fácil entender como se debe llamar a la función

```javascript
function log(name, {option1, option2}) {
   console.log(“Name: “ + name);
   console.log(“Option1: “ + option1);
   console.log(“Option2: “ + option2);
}

log(“string”, {option1 : true, option2: “string”});
```javascript

### Rest parameters
Para pasar un nùmero indeterminado de parámetros. Puede definirse junto con otros parámetros, pero el parámetro rest tiene que ser siempre definido el último:

```javascript
function (...numbers) {
   let result = 0;

   for (let i = 0; i < numbers.length; i++) {
      result += numbers[i];
   }

   return result;
}
```

## Arrays

### Spread operator
Transforma los componentes de un array en componentes individuales.

```javascript
var f = function (x, y, z) {
   ...
}

f(...[1, 2, 3]);

var a = [4, 5, 6];
var b = [3, ...a, 7];
```

También se puede usar para crear una copia de un array
```javascript
const oldArra = [1, 2, 3];
const newArray = [...oldArray];

const otherNewArray = [...oldArray, 6, 7];
```

# Object initializer shorthand
Podemos eliminar los nombres de las propiedades cuando estas propiedades tienen el mismo nombre que la variable que le estamos asignando

```javascript
var name = “nombre”;

var user = {
   name
}

console.log(user.name);
```

# Object destructuring
Podemos usar atajos para asignar propiedades desde objetos a variables locales

```javascript
let { name } = {name: “nombre”, apellido: “apellido”};
console.log(name);
```

# Adding a function to an object
```javascript
let user = {
    name: “nombre”,
    apellido: “apellido”,
    isActive() {
       ...
    }
};
console.log(name);
```

# Merging objects with duplicate properties

Cuando pasamos un objeto de propiedades a una función, si esta tiene muchos parámetros es mejor no usar named parameters. Para establecer los valores por defecto en vez de usar || es mejor usar un objeto de propiedades “default” y mezclarlo con el objeto recibido por parámetro

```javascript
function name (target, time, options = {}) {
    let default = {
       ...
    }

    let settings = Object.assign({}, default, options);
};
```

# Array destructuring
Podemos usar atajos para asignar propiedades desde objetos a variables locales

```javascript
let users = [“Tom”, “Tim”, “Peter”];
let [a, b, c] = users;

for … of
Podemos usar atajos para asignar propiedades desde objetos a variables locales
let users = [“Tom”, “Tim”, “Peter”];
for (let user of users) {
   console.log(user);
}
´´´

# Array.find
Devuelve el primer elemento en el array que satisface una función de testing dada
```javascript
let users = [
   {login: “Tom”, admin: true},
   {login: “Tim”, admin: false}
];

let admin = users.find(user => admin.true);
```

# Template literals
Podemos declarar templates en vez de Strings, donde le podemos pasar cadenas de sustitución en vez de usar concatenación de cadenas:

```javascript
let category = “music”;
led id= 122;

old: let url = “http://apiserver/” + category + “/” + id;

new: let url = `http://apiserver/${category}/${id}`;
```

# Map

```javascript
let categories = new Map();
categories.set(<key>, <value>);

let value = categories.get(<key>);

Iterating Maps with for … of
let categories = new Map();

for (let [key, value] = categories) {
    console.log(`${key} = ${value}`);
}
```

#WeakMap
Tipo de Map que solo acepta objetos como clave.

```javascript
let category = {};

let categories = new WeakMap();
categories.set(category, <value>);

let value = categories.get(category);
```

# Set
Puede ser usado con destructuring y con for … of

```javascript
let category = {};

let categories = new Set();
categories.add(category);
```

# WeakSet
Tipo de Set que solo acepta objetos.

```javascript
let category = {};

let categories = new WeakSet();
categories.add(category);

categories.has(category);
categories.delete(category);
```

# Iterator Object
Por defecto no se puede iterar sobre un objeto, para poder iterar sobre el tenemos que implementar el método Symbol.Iterator

```javascript
let category = {
   ...
};

category[Symbol.Iterator] = function() {
   let properties = Object.keys(this);
   let count = 0;
   let isDone = false;
   let next = () => {
      if (count > properties.length) {
          isDone = true;
      }
      return {done: isDone, value: this[properties[count++]]};
   }

   return { next };
};
```

# Generators
Devuelve el mismo método next que un Iterator

```javascript
function *nameList() {
   yield “Sam”;
   yield “Tyler”;
}


let category = {
   ...
};

category[Symbol.Iterator] = *function() {
   let properties = Object.keys(this);

   for (let p of properties) {
      yield this[p];
   }
};
```

# Class
Declaración de clase:

```javascript
class User {

   constructor(name) {
      this.name = name;
   }

   getName() {
      return this.name;
   }
}
```

## Herencia:
```javascript
class Employee extends User {

   constructor(name) {
      this.name = name;
   }

   doWork() {
      return “Complete!”;
   }
}
```

super:
```javascript
class Employee extends User {

   constructor(name, title) {
      super(name);
      this.title = title;
   }

   doWork() {
      return “Complete!”;
   }
}
```

getters and setters:
```javascript
class User {

   constructor(name) {
      this._name = name;
   }

   get name() {
      return this._name;
   }

   set name() {
      this._name = newValue;
   }
}
```

Los getters y setters se llaman al acceder a la propiedad, el get cuanto intentamos recuperar el valor y el ser cuando intentamos establecerle el valor. 

```javascript
class User {

   constructor(name) {
      this.name = name; // llamaria a la función set
   }

   get name() {
      return this.name;// llamaría en un bucle infinito a la función get
   }

   set name() {
      this.name = newValue;
   }
}
```

Si llamamos a la propiedad igual que los getter y setters se produciría un error de bucle infinito.

```javascript
instanceof
function (param) {
    if (param instanceof User) {
        …
    }
}
```

# Modules
con la opción default limitamos la función que se exporta a la que lo declara, las demás no son visibles

```javascript
flash-message.js

export default function (message) {
    alert (message);
}

app.js

import flashMessage from ‘./flash-message.js’;

flashMessage(‘hello’);
```

para exportar más funciones tenemos que utilizar los named exports
```javascript
flash-message.js

export function alertMessage(message) {
    alert(message);
}

export function logMessage(message) {
    console.log(message);
}

app.js

import { alertMessage, logMessage } from ‘./flash-message.js’;

alertMessage(‘hello’);
logMessage(‘hello’);
```

podemos importarlo como un objeto

```javascript
flash-message.js

export function alertMessage(message) {
    alert(message);
}

export function logMessage(message) {
    console.log(message);
}

app.js

import * as flash from ‘./flash-message.js’;

flash.alertMessage(‘hello’);
flash.logMessage(‘hello’);
```

#Console Time
Escribe en la consola el tiempo que ha pasado entre las dos llamadas. Se pueden anidar varias llamadas con distintas cadenas.
```javascript
console.time(“<cadena1>”);
…
console.time(“<cadena2>”);
…
console.time(“<cadena2>”);
....
console.timeEnd(“<cadena1>”);
```

#Document fragment
Contenedor invisible que contiene múltiples elementos DOM sin estar en ningún nodo. Útil para crear una estructura y luego añadirla al árbol DOM y generar un solo reflow, en vez de ir añadiendo partes al árbol DOM y generar múltiples reflows de la página

```javascript
var fragment = document.createDocumentFragment();
for (var i = 0; i < <array>.length; i++) {
    var element = document.createElement(“li”);
    element.appendChild(document.createTextNode( <array>[i]));
    fragment.appendChild(element);
}
document.getElementById(“<id>”).appendChild(fragment);
```

#Varios
Devolver tiempo en milliseconds
```javascript
var time = +new Date();
```


# Prototype
Añadir propiedades a los prototypes
Por ejemplo, añadir al prototype String una nueva función que cuenta el número de caracteres de un caracter pasado por parámetro:

```javascript
String.prototype.countAll = function (letter) {
    ...
};

Crear un prototype
function <Class> (property1, property2, …) {
    this.property1 = property1,
    this.property2 = property2,
    …
}
<Class>.prototype = {
    <method1> : function () { … },
    <method2> : function () { … },
    ...
};
var <class> = new <Class>(value1, value2, … );
```

## Sobreescribir propiedades de un prototype

```javascript
<Class>.prototype.valueOf = function () {
    ...
};
```

`# Arrays
array.map()

```javascript
array.map(function (item) {
    ...
};
```


Devuelve un array en el que ha aplicado a cada elemento del array la función definida dentro de la función map

# array.shift()
devuelve el primer elemento del array y lo elimina del array

# array.pop()
# array.push()
# array.forEach()
# array.reduce()
# array.reduce(function (resultado, valor) {
    ...
});

La función reduce nos permite convertir un Array de elementos en un único elemento definiendo la operación que necesitamos para realizar la transformación. Para realizar dicha operación la función recibe dos parámetros el primero es el resultado  , que es la variable que se utiliza para ir almacenando lo que ha sucedido en cada una de las iteraciones y el segundo parámetro es el item de cada iteración.
