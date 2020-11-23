require 'tablero.rb'


RSpec.describe Tablero do
    
    before { @tablero = Tablero.new }
    
    #it 'debería devolver 64' do
    #    @tablero.insertarMinas()
    #    @tablero.insertarNumerosEnTablero()
    #   expect(@tablero.obtenerTamanioTablero()).to eq(64)
    #end
    it 'debería devolver una matriz 8x8' do
        @tablero.insertarMinas()
        @tablero.insertarNumeroDeMinasAlrededor()
        @tablero.mostrarTablero()
    end
    it 'debería devolver 8' do
        @tablero.insertarMinas()
        @tablero.insertarNumeroDeMinasAlrededor()
        expect(@tablero.mostrarTamañoTablero()).to eq(7)
    end
    it 'debería devolver 1 porque solo hay una bomba alrededor de esa casilla' do
        @tablero.insertarMinas()
        @tablero.insertarNumeroDeMinasAlrededor()
       expect(@tablero.mostrarUnaCasilla(0, 0)).to eq(1)
    end

    it 'debería devolver 2 porque hay dos bombas alrededor de esa casilla' do
        @tablero.insertarMinas()
        @tablero.insertarNumeroDeMinasAlrededor()
       expect(@tablero.mostrarUnaCasilla(0, 5)).to eq(2)
    end

    it 'debería mostrar 10 por las 10 minas existentes' do
        @tablero.insertarMinas()
        expect(@tablero.contarMinas()).to eq(10)
    end
    it 'debería devolver 10 banderas que nos quedan' do
        @tablero.insertarMinas()
        expect(@tablero.mostrarBanderas()).to eq(10)
    end
    it 'debería devolver 9 banderas que nos quedan' do
        @tablero.quitarUnaBandera()
        @tablero.quitarUnaBandera()
        expect(@tablero.mostrarBanderas()).to eq(8)
    end

end