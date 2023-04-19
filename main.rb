class Mreza
    def initialize(x, y)
      @x = 0
      @y = 0
      @mreza_array = Array.new(3) { Array.new(3) { 0 } }
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

    def vpisi_v_mrezo(self)
    end

  end

  class Krog < Mreza
  end

  class Kriz < Mreza
  end

  igra_ena = Mreza.new(0, 0)
  igra_ena.izrisi_mrezo()
