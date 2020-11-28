class Book

  def create_global_book()
    puts "No se detectó el cajón de notas."
    puts "Creando el cajon de notas de RN en la ubicación por defecto: #{Dir.home}/.my_rns"
    Dir.mkdir("#{Dir.home}/.my_rns")
  end
  
  def create(name)
    prompt = TTY::Prompt.new
    if (Dir.exist?("#{Dir.home}/.my_rns") == false) then
        create_global_book()
        puts "Creando cuaderno con nombre #{name} en  .my_rns/#{name}"
        Dir.mkdir("#{Dir.home}/.my_rns/#{name}")
    else
        if (Dir.exist?("#{Dir.home}/.my_rns/#{name}") == false) then
          puts "Creando cuaderno con nombre #{name} en .my_rns/#{name}"
          Dir.mkdir("#{Dir.home}/.my_rns/#{name}")
        else
          puts "El cuaderno con nombre #{name} en .my_rns/#{name} no está disponible"
        end
    end
end

def delete(global,name)
  if (Dir.exist?("#{Dir.home}/.my_rns") == true) then
    if (global) then
      Book.new.delete_global
    else
      Book.new.delete_book(name)
    end
  else
    puts "No se detectó el cajón de notas."
  end
end

def delete_global
  prompt = TTY::Prompt.new
  path="#{Dir.home}/.my_rns"
  if (prompt.yes?("Estas seguro que queres borrar todas las notas de #{path}")) then 
    puts "Borrando todas las notas del global book.."
    d = Dir.new(path)
    d.each_child  {|file| 
      path_file="#{path}/#{file}"
      FileUtils.rm_f(path_file)}
  end
end

def delete_book(name)
    prompt = TTY::Prompt.new
    path="#{Dir.home}/.my_rns/#{name}"
    if (Dir.exist?(path) == true) then
        if (prompt.yes?("Estas seguro que queres borrar todas las notas de #{path} y el cuaderno")) then 
          puts "Borrando el contenido y el cuaderno #{name}"
          d = Dir.new(path)
          d.each_child  {|file| 
            path_file="#{path}/#{file}"
            FileUtils.rm_f(path_file)}
          FileUtils.remove_dir(path,true)
        end
    else
      puts "No existe el cuaderno con nombre #{name} en /.my_rns/"
    end
end

def list()
  path="#{Dir.home}/.my_rns"
  if (Dir.exist?(path) == false) then
    puts "No se detectó el cajón de notas."
  else
    Dir.each_child(path) {|x| 
      if (File.directory?("#{path}/#{x}")) then 
        puts "#{x}" 
      end } 
  end
end

def rename(old_name,new_name)
  path="#{Dir.home}/.my_rns"
  if (Dir.exist?(path) == false) then
    puts "No se detectó el cajón de notas."
  else
    old_path="#{Dir.home}/.my_rns/#{old_name}"
    new_path="#{Dir.home}/.my_rns/#{new_name}"
    if (Dir.exist?(old_path) == true) then
      if (Dir.exist?(new_path) == true) then
        puts "Ese nombre de cuaderno ya existe."
      else
        puts "Reenombrando cuaderno con nombre #{old_name} a #{new_name}.."
        File.rename old_path, new_path
        puts "Listo!"
      end
    else
      puts "No existe cuaderno con nombre #{old_name}"
    end
  end
end

end
