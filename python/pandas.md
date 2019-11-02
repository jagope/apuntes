# Pandas

Con pandas podemos leer ficheros csv, json, xlsx...

```python
pip install pandas
```

## Leer xlxs

Para poder leer ficheros xlxs necesitamos instalar la siguiente librería:

```python
pip install xlrd
```

```python
df = pandas.read_excell(<file>, sheet_name=<n>)
```

## Leer csv

```python
df = pandas.read_csv(<file>[, sep=<n>])
```
