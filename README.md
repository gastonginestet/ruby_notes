# rn

Ruby Notes, o simplemente `rn`, es un gestor de notas concebido como un clon simplificado
de la excelente herramienta [TomBoy](https://wiki.gnome.org/Apps/Tomboy).


### Instalación de dependencias

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

### Versiones
* Rails 6.0.3.4
* Yarn 1.22.10
* Node v15.7.0

--------------------
 ## Update 7/3/2021

 * Se instaló Rails en el repo y todo lo anterior fue a parar a la rama `CLI-App`
 * Se decidió utilizar el Framework CSS Tailwind para el diseño de las vistas.
 * Se eligió utilizar para el manejo de sesiones, la gema [Sorcery](https://github.com/Sorcery/sorcery)
 * Se agregó como gema y paquetes para `yarn` , [Codemirror](https://codemirror.net/) para la visualización de las notas.