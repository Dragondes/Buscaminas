require 'sinatra'
require './config'
require './lib/tablero'
require 'Matrix'

def initialize()
    @buscaminas=Tablero.new()
    @buscaminas.insertarMinas()
    @buscaminas.insertarNumeroDeMinasAlrededor()
    @x=0
    
end

get '/' do
    @tab = @buscaminas.getTablero()
    @minRes=@buscaminas.mostrarBanderas()  
    erb :tablero
end    




