#!/bin/bash

# Update and Upgrade
sudo apt-get update -y

# Docker Install
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# Use Docker without sudo
sudo groupadd docker
sudo usermod -aG docker vagrant
newgrp docker

# Install Java 17
sudo apt-get install fontconfig openjdk-17-jre -y

# Descargar la clave GPG de Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Agregar el repositorio de Jenkins a la lista de fuentes
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Actualizar la lista de paquetes nuevamente
sudo apt-get update

# Instalar Jenkins
sudo apt-get install -y jenkins

# Instalar tree
sudo apt-get install -y tree

# Instalar vim 
sudo apt install -y vim 

# Clonar el repositorio
git clone https://github.com/fcongedo/Challenge-DEVOPS

mkdir -p /home/vagrant/Documentos/Proyectos/BlogPersonal/{artículos,borradores,imágenes,plantillas,ProyectoAppMovil/android,ProyectoAppMovil/documentación,ProyectoAppMovil/ios,ProyectoAppMovil/recursos,TiendaOnline/código/backend/{controllers,models,routes,views},TiendaOnline/código/frontend/assets/{css,js},TiendaOnline/código/frontend/components,TiendaOnline/documentación,pruebas}

# Cambiar la propiedad del directorio para el usuario vagrant
sudo chown -R vagrant:vagrant /home/vagrant/Documentos/Proyectos

# Copiar archivos al directorio de destino
if [ -d /home/vagrant/Challenge-DEVOPS ]; then
  sudo cp /home/vagrant/Challenge-DEVOPS/archivos_bash/archivo{,2}.txt /home/vagrant/Documentos/Proyectos/BlogPersonal/artículos/
  sudo cp /home/vagrant/Challenge-DEVOPS/archivos_bash/{buscar_palabra.sh,buscar_remplazar.sh,menu.sh} /home/vagrant/Documentos/Proyectos/BlogPersonal/artículos/
fi

# Cambiar permisos para ejecutar archivos .sh
sudo chmod +x /home/vagrant/Documentos/Proyectos/BlogPersonal/artículos/*.sh
