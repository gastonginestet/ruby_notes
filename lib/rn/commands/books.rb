module RN
  module Commands
    module Books
      class Create < Dry::CLI::Command
        desc 'Create a book'

        argument :name, required: true, desc: 'Name of the book'

        example [
          '"My book" # Creates a new book named "My book"',
          'Memoires  # Creates a new book named "Memoires"'
        ]

        def call(name:, **)
          prompt = TTY::Prompt.new
          if (Dir.exist?("#{Dir.home}/.my_rns") == false) then
              puts "No se detectó el cajón de notas."
              puts "Creando el cajon de notas de RN en la ubicación por defecto: #{Dir.home}/.my_rns"
              Dir.mkdir("#{Dir.home}/.my_rns")
              puts "Creando cuaderno con nombre #{name} en  .my_rns/#{name}"
              Dir.mkdir("#{Dir.home}/.my_rns/#{name}")
          else
              if (Dir.exist?("#{Dir.home}/.my_rns/#{name}") == false) then
                puts "Creando cuaderno con nombre #{name} en .my_rns/#{name}"
                Dir.mkdir("#{Dir.home}/.my_rns/#{name}")
              else
                puts "El cuaderno con nombre #{name} en .my_rns/#{name} no está disponible"
                if (prompt.yes?("Quiere ingresar otro nombre para el cuaderno?")) then
                  #VER ESTO
                  self.call(prompt.ask("Que nombre le queres poner?"))
                end
              end
          end
        end
      end

      class Delete < Dry::CLI::Command
        desc 'Delete a book'

        argument :name, required: false, desc: 'Name of the book'
        option :global, type: :boolean, default: false, desc: 'Operate on the global book'

        example [
          '--global  # Deletes all notes from the global book',
          '"My book" # Deletes a book named "My book" and all of its notes',
          'Memories  # Deletes a book named "Memories" and all of its notes'
        ]

        def call(name: nil, **options)
          prompt = TTY::Prompt.new
          global = options[:global]
          if (global) then
            path="#{Dir.home}/.my_rns"
            if (prompt.yes?("Estas seguro que queres borrar todas las notas de #{path}")) then 
              puts "Borrando todas las notas del global book.."
              d = Dir.new(path)
              d.each_child  {|file| 
                path_file="#{path}/#{file}"
                FileUtils.rm_f(path_file)}
            end
          else
            path="#{Dir.home}/.my_rns/#{name}"
            if (Dir.exist?(path) == true) then
              if (prompt.yes?("Estas seguro que queres borrar todas las notas de #{path}")) then 
                puts "Borrando todas las notas del cuaderno #{name}"
                d = Dir.new(path)
                d.each_child  {|file| 
                  path_file="#{path}/#{file}"
                  FileUtils.rm_f(path_file)}
              end
            else
              puts "No existe el cuaderno con nombre #{name} en .my_rns/#{name}"
            end
          end
        end
      end

      class List < Dry::CLI::Command
        desc 'List books'

        example [
          '          # Lists every available book'
        ]

        def call(*)
          warn "TODO: Implementar listado de los cuadernos de notas.\nPodés comenzar a hacerlo en #{__FILE__}:#{__LINE__}."
        end
      end

      class Rename < Dry::CLI::Command
        desc 'Rename a book'

        argument :old_name, required: true, desc: 'Current name of the book'
        argument :new_name, required: true, desc: 'New name of the book'

        example [
          '"My book" "Our book"         # Renames the book "My book" to "Our book"',
          'Memoires Memories            # Renames the book "Memoires" to "Memories"',
          '"TODO - Name this book" Wiki # Renames the book "TODO - Name this book" to "Wiki"'
        ]

        def call(old_name:, new_name:, **)
          warn "TODO: Implementar renombrado del cuaderno de notas con nombre '#{old_name}' para que pase a llamarse '#{new_name}'.\nPodés comenzar a hacerlo en #{__FILE__}:#{__LINE__}."
        end
      end
    end
  end
end
