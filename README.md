# Coltan

Se trata de una extensión para introducir nuevas características y correcciones de errores a Left 4 Dead 2.

## ¿Cómo se descarga e instala la extensión?

Vaya a [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3485586174) y suscríbase para descargar e instalar automáticamente (o manualmente [mediante uno de los lanzamientos](https://github.com/ish8t/coltan/releases)).

## ¿Cómo se utiliza la extensión?

Solamente el anfitrión puede utilizar los comandos disponibles a continuación…

_Cualquier comando debe **iniciar con `!` y separarse del simbolo.**_

### `e_pl_drop_item_enab` y `e_pl_drop_item_disab`

Habilita y deshabilita la característica que permite a los sobrevivientes, soltar sus objetos **manteniendo la tecla «e» al caminar, mientras se empuja una superficie.**

### `f_pl_dam_drop_item_cons_enab` y `f_pl_dam_drop_item_cons_disab`

Habilita y deshabilita la corrección a la inconsistencia del daño, soltando los objetos de los **sobrevivientes al infligirse daño (a veces).**

### ~~`e_pl_take_and_give_item_enab` y `e_pl_take_and_give_item_disab`~~

## ¿Cómo se automatizan los comandos de la extensión?

Cree en la carpeta `ems` un archivo llamado `coltan` e incluya sus comandos.

## ¿Cuales es la informacion tecnica de la extension?

### ¿Cómo se acoplan otras extensiones a esta?

Se puede utilizar el codigo del proyecto como una especie de libreria, ya que; al permitir cambiar el comportamiento a nivel de codigo, puede simplemente desactivar enteramente la extension si asi lo requiere.

Aunque, no se garantiza que el codigo no colisione con otras extensiones por la magnitud de funciones involucradas, no deberia ser problematico al tener en cuenta que la mayoria de funciones en las otras extensiones, probablemente ya las disponga en esta extension.

### ¿Cómo se controlan los errores de la extension?

Al utilizar una estructua de callbacks por eventos, hace no tan esencial el uso de try/catch para los errores. Aunque no evita los errores criticos, permite que otros errores no provoquen un cierre en mitad de partida.

## ¿Quiénes contribuyen directa e indirectamente a la extensión?

* [Irina Iacob](https://unsplash.com/es/@kalineri) autora de la imagen utilizada en la miniatura.
