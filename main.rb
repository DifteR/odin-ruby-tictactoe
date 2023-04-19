class Mreza
    def initialize()
      @mreza_array = Array.new(3) { Array.new(3) { 0 } }
      @x = 0
      @y = 0
    end

    def izrisi_mrezo
      @mreza_array.each do |vrstica|
        vrstica.each do |stevilo|
          if stevilo == 0
            print " "
          elsif stevilo == -1
            print "O"
          elsif stevilo == 1
            print "X"
          else
            print "NAPAKA!!!"
          end
        end
        puts "\n"
      end
    end

    def vnesi_igrano(x,y)
        self.instance_of? == Kriz ?  @mreza_array[x][y] = -1 : @mreza_array[x][y] = 1

    end

  end

  class Krog < Mreza
    def initialize(x,y)
        @x = x
        @y = y
    end
  end

  class Kriz < Mreza
    def initialize(x,y)
        @x = x
        @y = y
    end
  end

  igra_ena = Mreza.new()
  igra_ena.izrisi_mrezo()
