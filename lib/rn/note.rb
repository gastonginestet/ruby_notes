require_relative 'storable'

class Note
  include Storable

  attr_accessor :id, :title, :body

  # Definimos un constructor básico para poder establecer los atributos de la nueva instancia en el mismo `new`.
  def initialize(id, title, body)
    self.id = id
    self.title = title
    self.body = body
  end
end