require 'Matrix'
class Tablero

    def initialize ()
        @filasTotales=8
        @columnasTotales=8
        @tablero = Matrix.build(8,8) { 0 }
        @minas=10
        @banderas=10
    end
    def quitarUnaBandera()
        @banderas=@banderas-1
    end
    def getTablero()
        @tablero
    end
    def mostrarTablero()
        puts @tablero
    end
    def mostrarTablero2()
        (0..7).each do |fila|
            (0..7).each do |columna|
                puts @tablero[fila,columna]
            end
        ends
    end
    def mostrarTamañoTablero()
        @tablero.size()
    end
    def mostrarBanderas()
        @banderas
    end
    def mostrarUnaCasilla(fila, columna)
        @tablero[fila, columna] 
    end
    def insertarMinas()
        @tablero[0,4]=100
        @tablero[1,1]=100 
        @tablero[1,5]=100
        @tablero[2,0]=100
        @tablero[3,0]=100
        @tablero[3,5]=100
        @tablero[4,1]=100
        @tablero[6,7]=100
        @tablero[7,4]=100
        @tablero[7,6]=100
    end
    def contarMinas()
        contador = 0
        (0..7).each do |fila|
            (0..7).each do |columna|
                if (@tablero[fila,columna]==100)
                    contador = contador + 1
                end
            end
        end
        contador
    end
    def contarMinasAlrededor(fila,columna)
        numeroMinasAlrededor = 0
        (fila-1..fila+1).each do |filaActual|
            (columna-1..columna+1).each do |columnaActual|
                if filaActual>-1 and filaActual<@filasTotales and columnaActual>-1 and columnaActual<@columnasTotales
                    if @tablero[filaActual,columnaActual] == 100
                        numeroMinasAlrededor= numeroMinasAlrededor + 1
                    end
                end
            end
        end
        @tablero[fila,columna] = numeroMinasAlrededor
    end
    def insertarNumeroDeMinasAlrededor()
        (0..@filasTotales-1).each do |filaActual|
            (0..@columnasTotales-1).each do |columnaActual|
                if @tablero[filaActual,columnaActual] != 100
                    contarMinasAlrededor(filaActual,columnaActual)
                end
            end
        end
    end
end
