# Coltan

Una extensión desarrollada para introducir nuevas características y soluciones a errores en Left 4 Dead 2.

## ¿Cuáles son las prioridades de esta extensión?

1. Posibilidad de habilitar y deshabilitar las características y soluciones durante una partida.

2. Flexibilidad del código; para no solo poder ser manipulado por el anfitrión, sino también por otras extensiones internamente.

3. Solamente introducir características nuevas relacionadas con mecánicas, y soluciones a errores relacionados con mecánicas ya existentes en el juego; no introducir animaciones, modelos, sonidos, entre otros…

## ¿Cómo se utiliza la extensión?

Una vez instalada y habilitada, el anfitrión debe utilizar los comandos disponibles.

> Cualquier comando debe **iniciar con un `!` y separarse del simbolo.**

## ¿Qué comandos se pueden utilizar para introducir características nuevas?

### `e_plyr_dp_item_enab` y `e_plyr_dp_item_disab`

Habilita y deshabilita la característica que permite a los sobrevivientes, soltar sus objetos **manteniendo la tecla `e` mientras se empuja una superficie.**

### `e_plyr_gv_item_enab` y `e_plyr_gv_item_disab`

Habilita y deshabilita la característica que permite a los sobrevivientes, dar sus objetos **al empujar a otro.**

## ¿Qué comandos se pueden utilizar para introducir soluciones a errores?

## ¿Como se automatizan los comandos de la extensión?

Cree en la carpeta `ems` un archivo llamado `coltan` e incluya los comandos y sus parámetros.
