#!/bin/bash

if [ "$(id -u)" == "0" ]; then
	# Respaldamos el archivo original de /etc/hosts en /etc/hosts.bak
	if [ ! -f /etc/hosts.bak ]; then
		echo "Respaldo del /etc/hosts original"
		cp /etc/hosts /etc/hosts.bak
	fi

	# Descargamos las listas MVPS y MalwareDomain. 
	# Para agregar otras listas debe crear los comandos necesarios
	echo "Descargando listas..."
	cd /tmp
	wget -q http://www.malwaredomainlist.com/hostslist/hosts.txt -O malwaredomain.txt
	wget -q http://winhelp2002.mvps.org/hosts.txt -O mvps.txt
	wget -q http://someonewhocares.org/hosts/hosts -O someone.txt
	wget -q http://moaab.tk/hosts.txt -O moaab.txt
	
	# Usamos sed para eliminar las lineas que no queremos
	echo "Listas descargadas. Limpiando..."
	sed -i "s/127.0.0.1/0.0.0.0/g" mvps.txt
	sed -i '/#/d' mvps.txt
	sed -i '/localhost/d' mvps.txt

	sed -i "s/127.0.0.1/0.0.0.0/g" someone.txt
	sed -i '/#/d' someone.txt
	sed -i '/localhost/d' someone.txt
	sed -i '/broadcasthost/d' someone.txt
	sed -i '/local/d' someone.txt

	sed -i "s/127.0.0.1/0.0.0.0/g" malwaredomain.txt
	sed -i '/#/d' malwaredomain.txt
	sed -i '/localhost/d' malwaredomain.txt
	
	sed -i "s/127.0.0.1/0.0.0.0/g" moaab.txt
	sed -i '/#/d' moaab.txt
	sed -i '/localhost/d' moaab.txt
	sed -i '/broadcasthost/d' moaab.txt
	sed -i '/local/d' moaab.txt

	# Recreamos el archivo hosts
	echo "Recreando archivo /etc/hosts"
	cat /etc/hosts.bak > hosts
	cat malwaredomain.txt someone.txt mvps.txt moaab.txt >> hosts

	# Movemos el nuevo archivo a su posicion final
	echo "Copiando nuevo archivo /etc/hosts."
	mv -v hosts /etc/hosts

	# Borramos las listas originales
	echo "Borrando temporales..."
	rm malwaredomain.txt mvps.txt someone.txt moaab.txt

	# Proceso terminado
	echo "Blockhost ha terminado. Archivo /etc/hosts creado. Saliendo."
else
	echo "Se necesitan permisos de root o usar sudo para ejecutar este script"
fi
exit 0
