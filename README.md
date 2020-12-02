# rn

Ruby Notes, o simplemente `rn`, es un gestor de notas concebido como un clon simplificado
de la excelente herramienta [TomBoy](https://wiki.gnome.org/Apps/Tomboy).

## Uso de `rn`

Para ejecutar el comando principal de la herramienta se utiliza el script `bin/rn`, el cual
puede correrse de las siguientes manera:

```bash
$ ruby bin/rn [args]
```

O bien:

```bash
$ bundle exec bin/rn [args]
```

O simplemente:

```bash
$ bin/rn [args]
```

> Notá que para la ejecución de la herramienta, es necesario tener una versión reciente de
> Ruby (2.5 o posterior) y tener instaladas sus dependencias, las cuales se manejan con
> Bundler. Para más información sobre la instalación de las dependencias, consultar la
> siguiente sección ("Desarrollo").


## Comandos
Commandos que se pueden para los cuadernos:
*  rn books create NAME                               ` Crear cuaderno`
*  rn books delete [NAME]                             ` Borrar cuaderno`
*  rn books list                                      ` Listar cuadernos`
*  rn books rename OLD_NAME NEW_NAME                  ` Renombrar cuaderno`

Commandos que se pueden para las notas:
*  rn notes create TITLE                                   ` Crear una nota`
*  rn notes delete TITLE                                   ` Borrar una nota`
*  rn notes edit TITLE                                     ` Editar el contenido de una nota`
*  rn notes list                                           ` Listar notas`
*  rn notes retitle OLD_TITLE NEW_TITLE                    ` Cambiar el titulo de una nota`
*  rn notes show TITLE                                     ` Mostrar una nota`
*  rn notes export TITLE                                   ` Exportar una nota`

### Instalación de dependencias

Este proyecto utiliza Bundler para manejar sus dependencias. Si aún no sabés qué es eso
o cómo usarlo, no te preocupes: ¡lo vamos a ver en breve en la materia! Mientras tanto,
todo lo que necesitás saber es que Bundler se encarga de instalar las dependencias ("gemas")
que tu proyecto tenga declaradas en su archivo `Gemfile` al ejecutar el siguiente comando:

```bash
$ bundle install
```

> Nota: Bundler debería estar disponible en tu instalación de Ruby, pero si por algún
> motivo al intentar ejecutar el comando `bundle` obtenés un error indicando que no se
> encuentra el comando, podés instalarlo mediante el siguiente comando:
>
> ```bash
> $ gem install bundler
> ```

Una vez que la instalación de las dependencias sea exitosa (esto deberías hacerlo solamente
cuando estés comenzando con la utilización del proyecto), podés comenzar a probar la
herramienta y a desarrollar tu entrega.

--------------------
## Update 2/12/2020

 *  Se usó "tty-progressbar" con fines estéticos. (Instalar dependencias con bundle)
 *  Se agregó nueva funcionalidad a las notas, ahora se pueden exportar notas, ejemplos:
 ```ruby
 ruby bin/rn notes export --book libro | exporta todas las notas del cuaderno "libro"
 ```

 ```ruby
 ruby bin/rn notes export nota --book libro | exporta la nota "nota" del cuaderno "libro"
 ```

 ```ruby
 ruby bin/rn notes export --global | exporta todas las notas del cuaderno global
 ```

  ```ruby
 ruby bin/rn notes export --all | exporta TODAS las notas
 ```

 ```ruby
 ruby bin/rn notes export nota | exporta la nota "nota" del cuaderno global
 ```
