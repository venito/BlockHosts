BlockHosts
==========

Un pequeño script bash para crear archivos /etc/hosts personalizados

Este script usa las listas de MVPS, MalwareDomains y Someonecares 
para crear un archivo hosts personalizado que bloquea buena parte de los
dominios maliciosos y de publicidad de Internet. El script lleva
consigo un sencillo instalador que a su vez automatiza todo el proceso
inicial de configuración y realiza la creación inicial del hosts, 
haciendo un respaldo del archivos hosts original.

Para instalar el archivo solo necesita hacer el siguiente procedimiento:

git clone https://github.com/YukiteruAmano/BlockHosts.git

cd BlockHosts

sudo ./INSTALL

Con eso ya tendrá instalado el script.

Para ejecutar solo deben usar el comando

sudo blockhost.sh 

O hacerlo por la direccion completa

sudo /usr/local/bin/blockhosts.sh

Para desinstalar solo hagan

sudo ./UNINSTALL
