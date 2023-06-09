class ElementIgre
  attr_reader :x, :y
  def initialize(x,y)
      @x = x
      @y = y
  end


class Mreza

  def validateInput(igrano)
    puts igrano
    if igrano.x.is_a?(Integer) && igrano.x < 3 && igrano.y < 3 && igrano.x >= 0 && igrano.y >= 0 && je_prosto?(igrano.x,igrano.y)
      return true
    else return false
    end
  end

  attr_writer :mreza_array
    def initialize()
      @mreza_array = Array.new(3) { Array.new(3) { 0 } }
      @x = 0
      @y = 0
    end

    def je_prosto?(x,y)
      if @mreza_array[x][y] == -1 || @mreza_array[x][y] == 1
        return false
      else
        return true
      end
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

    def najdi_zmagovalca_vertikalno()
      vrstica = 0
      while(vrstica<3)
          if @mreza_array[vrstica][1] == @mreza_array[vrstica][0] && @mreza_array[vrstica][1] == @mreza_array[vrstica][2]
            if @mreza_array[vrstica][1] == 1
              puts "Zmaga Križ"
              return 1
            elsif @mreza_array[vrstica][1] == -1
              puts "Zmaga Krog"
              return -1
            end
          else return 0
          end
          vrstica += 1
      end
    end

    def najdi_zmagovalca_horizontalno()
      stolpec = 0
      while(stolpec<3)
          if @mreza_array[1][stolpec] == @mreza_array[0][stolpec] && @mreza_array[1][stolpec] == @mreza_array[2][stolpec]
            if @mreza_array[1][stolpec] == 1
              puts "Zmaga Križ"
              return 1
            elsif @mreza_array[1][stolpec] == -1
              puts "Zmaga Krog"
              return -1
            end
          else return 0
          end
          stolpec += 1
      end
    end

    def najdi_zmagovalca_diagonalno
      if @mreza_array[1][1] == @mreza_array[0][0] && @mreza_array[1][1] == @mreza_array[2][2] || @mreza_array[1][1] == @mreza_array[2][0] && @mreza_array[1][1] == @mreza_array[0][2]
        if @mreza_array[1][1] == 1
          puts "Zmaga Križ"
          return 1
        elsif @mreza_array[1][1] == -1
          puts "Zmaga Krog"
          return -1
        end

      end
      return 0
    end

    def vnesi_igrano(bla)
      bla.class == Kriz ?  @mreza_array[bla.x][bla.y] = 1 : @mreza_array[bla.x][bla.y] = -1
    end

  end



  class Krog < ElementIgre
  end

  class Kriz < ElementIgre
  end

  igra_ena = Mreza.new()

zmagovalec = 0
x = 0
y = 0
i = 0
play_array = Array.new()
while(i<9 && zmagovalec == 0)
    if i % 2 == 0
      puts "Na vrsti je krog. Vnesite koordinat x"
      x = gets.chomp.to_i
      puts "Na vrsti je krog. Vnesite koordinat y"
      y = gets.chomp.to_i
      play_array[i] = Krog.new(x,y)
      if igra_ena.validateInput(play_array[i])
        play_array[i] = Krog.new(x,y)
      else
        i = 10
        puts "NAPAKA!!!"
        break
      end
    else
      puts "Na vrsti je križec. Vnesite koordinat x"
      x = gets.chomp.to_i
      puts "Na vrsti je križec. Vnesite koordinat y"
      y = gets.chomp.to_i
      play_array[i] = Kriz.new(x,y)
      if igra_ena.validateInput(play_array[i])
        play_array[i] = Kriz.new(x,y)
      else
        i = 10
        puts "NAPAKA!!!"
        break
      end
    end

    igra_ena.vnesi_igrano(play_array[i])
    igra_ena.izrisi_mrezo()
    if(igra_ena.najdi_zmagovalca_horizontalno != 0)
      zmagovalec = igra_ena.najdi_zmagovalca_horizontalno
    elsif(igra_ena.najdi_zmagovalca_vertikalno != 0)
      zmagovalec = igra_ena.najdi_zmagovalca_vertikalno
    elsif(igra_ena.najdi_zmagovalca_diagonalno != 0)
      zmagovalec = igra_ena.najdi_zmagovalca_diagonalno
    end
    i += 1
    p zmagovalec
  end
end
