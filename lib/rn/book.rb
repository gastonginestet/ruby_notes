module Book
    def create(name)
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
            end
        end
    end
end