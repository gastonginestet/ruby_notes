class Note

  def check_for_global_book()
    if (Dir.exist?("#{Dir.home}/.my_rns") == false) then
      puts "No se detectó el cajón de notas."
      puts "Creando el cajon de notas de RN en la ubicación por defecto: #{Dir.home}/.my_rns"
      Dir.mkdir("#{Dir.home}/.my_rns")
    end
  end

  def create(book,title)
      check_for_global_book()
      if book.nil? then
        create_global(title)
      else
        create_in_book(title,book)
      end
  end

  def create_global(title)
    file_path="#{Dir.home}/.my_rns/#{title}.rn"
    if File.exist?(file_path) then
      puts "Existe la nota con nombre #{title}"
    else
      puts "Creando nota con nombre #{title}"
      puts "Abriendo editor.."
      editor=TTY::Editor.new
      editor.open(file_path)
      puts "Imprimiendo contenido... con colores!"
      puts File.read(file_path), :rainbow
    end
end

def create_in_book(title,book)
  book_path="#{Dir.home}/.my_rns/#{book}/"
  file_path="#{Dir.home}/.my_rns/#{book}/#{title}.rn"
  if Dir.exist?(book_path) then
    if File.exist?(file_path) then
      puts "Existe la nota con nombre #{title}"
    else
      puts "Creando nota con nombre #{title}"
      puts "Abriendo editor.."
      editor=TTY::Editor.new
      editor.open(file_path)
      puts "Imprimiendo contenido... con colores!"
      puts File.read(file_path), :rainbow
    end
  else
    puts "No existe cuaderno con nombre: '#{book}'"
  end 
end

def delete(book,title)
    check_for_global_book()
    if book.nil? then
      delete_in_global(title)
    else
      delete_in_book(book,title)
    end
end

def delete_in_global(title)
  prompt = TTY::Prompt.new
  file_path="#{Dir.home}/.my_rns/#{title}.rn"
  if File.exist?(file_path) then
    if (prompt.yes?("Estas seguro que queres borrar la nota con nombre: '#{title}' en el cuaderno global?")) then 
    puts "Borrando la nota con nombre: '#{title}' , en el cuaderno global ...."
    FileUtils.rm_f(file_path)
    puts "Borrada!"
    end
  else
    puts "No existe la nota con nombre: '#{title}'"
  end
end

def delete_in_book(book,title)
    prompt = TTY::Prompt.new
    book_path="#{Dir.home}/.my_rns/#{book}/"
    file_path="#{Dir.home}/.my_rns/#{book}/#{title}.rn"
    if Dir.exist?(book_path) then
      if File.exist?(file_path) then
        if (prompt.yes?("Estas seguro que queres borrar la nota con nombre: '#{title}' en el cuaderno global?")) then 
          puts "Borrando la nota con nombre: '#{title}' , en el cuaderno: '#{book}' ...."
          FileUtils.rm_f(file_path)
          puts "Borrada!"
          end
      else
        puts "No existe la nota con nombre: '#{title}' , en el cuaderno: '#{book}'"
      end
    else
      puts "No existe cuaderno con nombre: '#{book}'"
    end 
end

def edit(book,title)
  check_for_global_book()
  if book.nil? then
    edit_in_global(title)
  else
    edit_in_book(book,title) 
  end
end

def edit_in_global(title)
  file_path="#{Dir.home}/.my_rns/#{title}.rn"
  if File.exist?(file_path) then
    puts "Abriendo editor.."
    editor=TTY::Editor.new
    editor.open(file_path)
    puts "Imprimiendo contenido... con colores!"
    puts File.read(file_path), :rainbow
  else
    puts "No existe la nota con nombre: '#{title}'"
  end
end

def edit_in_book(book,title)
  book_path="#{Dir.home}/.my_rns/#{book}/"
  file_path="#{Dir.home}/.my_rns/#{book}/#{title}.rn"
  if Dir.exist?(book_path) then
      if File.exist?(file_path) then
        puts "Abriendo editor.."
        editor=TTY::Editor.new
        editor.open(file_path)
        puts "Imprimiendo contenido... con colores!"
        puts File.read(file_path), :rainbow
      end
  else
    puts "No existe cuaderno con nombre: '#{book}'"
  end 
end

def retitle(book,title)
  check_for_global_book()
  if book.nil? then
    retitle_in_global(old_title,new_title)
  else
    retitle_in_book(book,old_title,new_title)
  end
end

def retitle_in_global(old_title, new_title)
  file_path="#{Dir.home}/.my_rns/#{old_title}.rn"
  if File.exist?(file_path) then
    new_path="#{Dir.home}/.my_rns/#{new_title}.rn"
    puts "Reenombrando nota con nombre: #{old_title} a #{new_title}.."
    File.rename file_path, new_path
    puts "Listo!"
  else
    puts "No existe la nota con nombre: '#{old_title}'"
  end
end

def retitle_in_book(book,old_title,new_title)
  book_path="#{Dir.home}/.my_rns/#{book}/"
  file_path="#{Dir.home}/.my_rns/#{book}/#{old_title}.rn"
  if Dir.exist?(book_path) then
      if File.exist?(file_path) then
        new_path="#{Dir.home}/.my_rns/#{book}/#{new_title}.rn"
        puts "Reenombrando nota con nombre: #{old_title} a #{new_title}.."
        File.rename file_path, new_path
        puts "Listo!"
      else
        puts "No existe la nota con nombre: '#{old_title}'"
      end
  else
    puts "No existe cuaderno con nombre: '#{book}'"
  end  
end

def list(book)
  check_for_global_book()
  if book.nil? then
    dir_path="#{Dir.home}/.my_rns/"
    list_files_from(dir_path)
  else
      dir_path="#{Dir.home}/.my_rns/#{book}/"
      if Dir.exist?(dir_path) then
        list_files_from(dir_path)
      else
        puts "No existe cuaderno con nombre: '#{book}'"
      end  
  end
end

def list_files_from(dir_path)
  Dir.each_child(dir_path) {|file| 
    if (File.directory?("#{dir_path}/#{file}") == false) then 
      puts "#{file}" 
    end } 
end

def show(title,book)
  check_for_global_book()
  if book.nil? then
    file_path="#{Dir.home}/.my_rns/#{title}.rn"
    if File.exist?(file_path) then
      puts " |Imprimiendo contenido de la nota| "
      puts "------------------------------------"
      puts File.read(file_path)
      puts "------------------------------------"
      puts " |             FIN                | "
    else
      puts "No existe la nota con nombre: '#{title}'"
    end
  else
      book_path="#{Dir.home}/.my_rns/#{book}/"
      file_path="#{Dir.home}/.my_rns/#{book}/#{title}.rn"
      if Dir.exist?(book_path) then
          if File.exist?(file_path) then
            puts " |Imprimiendo contenido de la nota| "
            puts "------------------------------------"
            puts File.read(file_path)
            puts "------------------------------------"
            puts " |             FIN                | "
          end
      else
        puts "No existe cuaderno con nombre: '#{book}'"
      end  
  end
end

end
