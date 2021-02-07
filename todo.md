* ver el tamaño del titulo (documentar la decisión)
* implementar validaciones
* como usuario nada mas pueden acceder a sus propios cuadernos y a sus propias notas 
* incluir seeds

      name = File.basename("#{dir_path}/#{file}", '.*')
      file_data = File.read("#{dir_path}/#{file}")
      file_data = CommonMarker.render_html(file_data,:DEFAULT)
      new_exported_file = "#{Dir.home}/my_exported_notes/#{name}.html"
      File.write(new_exported_file, file_data)