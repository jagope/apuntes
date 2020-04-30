### JIT

Hay dos modos de jit, client y server. Client es para optimizaciones para ir más rápido al principio, server son optimizaciones más
profundas, es más rápido al principio, pero más rápido a la larga. Se puede seleccionar un modo u otro al arrancar la aplicación:

java 7
```cmd
java [-server | -client]
```

java 8
```cmd
java [-XX:TieredStopAtLevel=1 | -XX:-TieredCompilation]
```

El código optimizado se guarda en la CODE CACHE, esta tiene un tamaño de 250 mb, si se llena no se podrán optimizar nuevos métodos,
se puede aumentar el tamaño de la cache con el siguiente parámetro

```cmd
java -XX:ReservedCodeCacheSize=<N>
```

En java 9 esta cache se ha partido en 3, para aumentar los tamaños:
```cmd
java -NonNMethodCodeHeapSize -ProfiledCodeHeapSize -NonProfiledCodeHeapSize
```
