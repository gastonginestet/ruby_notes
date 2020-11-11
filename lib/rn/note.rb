class Note

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

end
