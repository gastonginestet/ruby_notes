require 'tty-editor'
require 'colorputs'

editor=TTY::Editor.new
editor.open('prueba.rn')
puts File.read('prueba.rn'), :rainbow