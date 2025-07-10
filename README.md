# Coltan

Una extensión desarrollada para introducir nuevas características y soluciones a errores en Left 4 Dead 2.

## ¿Por qué existe este proyecto?

Se trata de un proyecto personal, un prototipo, que intento desarrollar seriamente…

En mi travesía, encontré varios límites técnicos que no pude superar. Aun así, intentaré desarrollar lo más que pueda para brindar una base de código que pueda ser utilizada a futuro como ejemplo (un ejemplo que me hubiera gustado tener a mano en su momento).

## ¿Cuáles son las prioridades de este proyecto?

Una de ellas es la posibilidad de habilitar y deshabilitar las características y soluciones durante una partida.

## ¿Cómo se maneja la incompatibilidad con otras extensiones?

Se escribió el código lo más flexible posible para no solo poder ser manipulado por el anfitrión, sino también por otras extensiones internamente.

Posiblemente, no cuenta con el mejor control de errores y pueda llegar a fallar en ciertas ocasiones…

## ¿Cómo se utiliza la extensión?

Una vez instalada y habilitada, el anfitrión debe utilizar los comandos disponibles.

> Cualquier comando debe **iniciar con un `!` y separarse del simbolo.**

## ¿Qué comandos se pueden utilizar para introducir características nuevas?

### `e_plyr_dp_item_enab` y `e_plyr_dp_item_disab`

Habilita y deshabilita la característica que permite a los sobrevivientes, soltar sus objetos **manteniendo la tecla `e` mientras se empuja una superficie.**

### `e_plyr_gv_item_enab` y `e_plyr_gv_item_disab`

Habilita y deshabilita la característica que permite a los sobrevivientes, dar sus objetos **al empujar a otro.**

## ¿Qué comandos se pueden utilizar para introducir soluciones a errores?

## ¿Como se automatizan los comandos?

Cree en la carpeta `ems` un archivo llamado `coltan` e incluya los comandos y sus parámetros.
