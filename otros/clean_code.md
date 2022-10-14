# Clean Code

### DRY Principle (Don’t Repeat Yourself)

Hay que evitar el código duplicado

### The Principle of Least Surprise

Las funciones o clases deben hacer lo que (razonablemente) se espera de ellas. Es decir, una función o una clase debe tener, en función de su nombre, un comportamiento obvio para cualquier programador, sin que este tenga la necesidad de sumergirse en su código.

### The Boy Scout Rule

La regla del Boy Scout dice: «deja el campamento más limpio de como te lo encontraste». Ampliándola a otros ámbitos sería algo así como: «deja las cosas mejor de como te las encontraste».

### F.I.R.S.T
Como ya sabemos, los test forman un papel fundamental en el arte de escribir código limpio. No obstante, no es suficiente con escribirlos de cualquier manera. Deben cumplir una serie de reglas.

#### Fast
Los test deben correr rápido. Deben tardar poco en ejecutarse. De no ser así, es probable que nos de pereza ejecutarlos y, por tanto, que no lo hagamos con la frecuencia deseada. El no ejecutar los test con relativa frecuencia puede hacer que tardemos más en encontrar los problemas que vayan surgiendo.
#### Independent
Los test deben ser independientes unos de otros. El resultado de un test no debe condicionar el de los siguientes. Deben poder ejecutarse en el orden que se quiera. De lo contrario, un fallo en el primer test, puede desencadenar un fallo en cascada de los demás, haciendo complejo el diagnóstico del sistema.
#### Repeatable
Los test deben poder ejecutarse en cualquier entorno (desarrollo, pre-producción, producción…). De no ser así, siempre tendremos una excusa para cuando los test fallen.
#### Self-Validating
Los test deben devolver una respuesta booleana. Pasan o no pasan. No deben dejar una cadena de caracteres en un fichero de log que tengamos que comprobar nosotros mismos, o dejar dos ficheros de un tamaño determinado que, igualmente tengamos que comprobar. De lo contrario, requerirán una alta evaluación manual que nos hará perder tiempo y precisión.
#### Timely
Los test deben ser escritos antes que el código de producción. De no ser así, el código de producción será difícil de testear.
