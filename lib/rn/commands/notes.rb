module RN
  module Commands
    module Notes
      class Create < Dry::CLI::Command
        desc 'Create a note'

        argument :title, required: true, desc: 'Title of the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo                        # Creates a note titled "todo" in the global book',
          '"New note" --book "My book" # Creates a note titled "New note" in the book "My book"',
          'thoughts --book Memoires    # Creates a note titled "thoughts" in the book "Memoires"'
        ]

        def call(title:, **options)
          book = options[:book]
          if book.nil? then
              Note.new.create_global(title)
          else
              Note.new.create_in_book(title,book)
          end
          # "ruby bin/rn notes create 'nombre_nota' --book 'nombre_libro'"
        end
      end

      class Delete < Dry::CLI::Command
        desc 'Delete a note'

        argument :title, required: true, desc: 'Title of the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo                        # Deletes a note titled "todo" from the global book',
          '"New note" --book "My book" # Deletes a note titled "New note" from the book "My book"',
          'thoughts --book Memoires    # Deletes a note titled "thoughts" from the book "Memoires"'
        ]

        def call(title:, **options)
          book = options[:book]
          if book.nil? then
              Note.new.delete_in_global(title)
          else
              Note.new.delete_in_book(book,title)
          end
        end
      end

      class Edit < Dry::CLI::Command
        desc 'Edit the content a note'

        argument :title, required: true, desc: 'Title of the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo                        # Edits a note titled "todo" from the global book',
          '"New note" --book "My book" # Edits a note titled "New note" from the book "My book"',
          'thoughts --book Memoires    # Edits a note titled "thoughts" from the book "Memoires"'
        ]

        def call(title:, **options)
          book = options[:book]
          if book.nil? then
              Note.new.edit_in_global(title)
          else
              Note.new.edit_in_book(book,title) 
          end
        end
      end

      class Retitle < Dry::CLI::Command
        desc 'Retitle a note'

        argument :old_title, required: true, desc: 'Current title of the note'
        argument :new_title, required: true, desc: 'New title for the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo TODO                                 # Changes the title of the note titled "todo" from the global book to "TODO"',
          '"New note" "Just a note" --book "My book" # Changes the title of the note titled "New note" from the book "My book" to "Just a note"',
          'thoughts thinking --book Memoires         # Changes the title of the note titled "thoughts" from the book "Memoires" to "thinking"'
        ]

        def call(old_title:, new_title:, **options)
          book = options[:book]
          if book.nil? then
              Note.new.retitle_in_global(old_title,new_title)
          else
              Note.new.retitle_in_book(book,old_title,new_title)
          end
        end
      end

      class List < Dry::CLI::Command
        desc 'List notes'

        option :book, type: :string, desc: 'Book'
        option :global, type: :boolean, default: false, desc: 'List only notes from the global book'

        example [
          '                 # Lists notes from all books (including the global book)',
          '--global         # Lists notes from the global book',
          '--book "My book" # Lists notes from the book named "My book"',
          '--book Memoires  # Lists notes from the book named "Memoires"'
        ]

        def call(**options)
          book = options[:book]
          global = options[:global]
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
      end

      class Show < Dry::CLI::Command
        desc 'Show a note'

        argument :title, required: true, desc: 'Title of the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo                        # Shows a note titled "todo" from the global book',
          '"New note" --book "My book" # Shows a note titled "New note" from the book "My book"',
          'thoughts --book Memoires    # Shows a note titled "thoughts" from the book "Memoires"'
        ]

        def call(title:, **options)
          book = options[:book]
          if book.nil? then
            file_path="#{Dir.home}/.my_rns/#{title}.rn"
            if File.exist?(file_path) then
              puts "Imprimiendo contenido de la nota... "
              puts File.read(file_path)
            else
              puts "No existe la nota con nombre: '#{title}'"
            end
          else
              book_path="#{Dir.home}/.my_rns/#{book}/"
              file_path="#{Dir.home}/.my_rns/#{book}/#{title}.rn"
              if Dir.exist?(book_path) then
                  if File.exist?(file_path) then
                    puts "Imprimiendo contenido de la nota..."
                    puts File.read(file_path)
                  end
              else
                puts "No existe cuaderno con nombre: '#{book}'"
              end  
          end
        end
      end
    end
  end
end
