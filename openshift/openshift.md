# Openshift

## Install

### Install with docker

Se puede instalar usando contenedores en los sistemas operativos fedora, centos y red hat linux. Para ello hay que descargar el cliente de origin de https://github.com/openshift/origin/releases y ejecutar el comando ```oc cluster up```

Para que funcione hace falta configurar docker añadiendo la siguiente configuración en el fichero /etc/docker/daemon.json:
```json
{
  "insecure-registries":["172.30.0.0/16"]
}
```


### Install with minishift

Se puede instalar con minishift, que se encarga de crear una máquina virtual con todo lo necesario. https://www.okd.io/minishift/

## Comandos

### cluster
```oc cluster up```: descarga las imagenes necesarias de docker y arranca los servicios
```oc cluster status```: 
