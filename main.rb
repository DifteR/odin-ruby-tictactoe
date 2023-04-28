class ElementIgre
  attr_reader :x, :y
  def initialize(x,y)
      @x = x
      @y = y
  end

  def self.validateInput(igrano)
    puts igrano
    if igrano.x.is_a?(Integer) && igrano.x < 3 && igrano.y < 3 && igrano.x >= 0 && igrano.y >= 0# && igrano.x.class = Integer && igrano.y.class = Integer
      return true
    else return false
    end

  end
end
class Mreza
  attr_writer :mreza_array
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

    def vnesi_igrano(bla)
      bla.class == Kriz ?  @mreza_array[bla.x][bla.y] = -1 : @mreza_array[bla.x][bla.y] = 1
      puts bla.x.class
    end

  end



  class Krog < ElementIgre
  end

  class Kriz < ElementIgre
  end

  igra_ena = Mreza.new()

nadaljuj = true
x = 0
y = 0
i = 0
play_array = Array.new()
while(i<9)
    if i % 2 == 0
      puts "Na vrsti je krog. Vnesite koordinat x"
      x = gets.chomp.to_i
      puts "Na vrsti je krog. Vnesite koordinat y"
      y = gets.chomp.to_i
      play_array[i] = Krog.new(x,y)
      if ElementIgre.validateInput(play_array[i])
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
      if ElementIgre.validateInput(play_array[i])
        play_array[i] = Kriz.new(x,y)
      else
        i = 10
        puts "NAPAKA!!!"
        break
      end
    end

    igra_ena.vnesi_igrano(play_array[i])
    igra_ena.izrisi_mrezo()
    i += 1
end
