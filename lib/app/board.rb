$:.unshift File.expand_path("./../lib", __FILE__)

require 'views/show'

class Board < Show

    attr_accessor  :array_cases, :win_jeux ,:jeux_nul , :choose_case
  
    def initialize
        super
      # La premier ligne du bord
      @A1 = BoardCase.new("11", " ");   @A2 = BoardCase.new("12", " ");       @A3 = BoardCase.new("13", " ")
      # La deuxieme ligne du bord
      @B1 = BoardCase.new("21", " ") ; @B2 = BoardCase.new("22", " ") ;      @B3 = BoardCase.new("23", " ")
        # La troisieme ligne du bord
      @C1 = BoardCase.new("31", " ") ;   @C2 = BoardCase.new("32", " ") ;  @C3 = BoardCase.new("33", " ")
  
      
      @win_jeux=false 
     
      @jeux_nul = false
    # Construions une table 3x3 
    #  @array_cases = [[@A1, @A2, @A3], [@B1, @B2, @B3],[ @C1, @C2, @C3]]  
     @array_cases = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
  
    end

=begin   
    p "______________________________"
    def write_on_case (case_choose, player_symbol)
    @array_cases.each { |x| {y.position== case_choose ? y.content = player_symbol  : y } }
    end

    def game_state
        # le statement des lignes:
        @array_cases.each_index do|symb,i| 
         @win_jeux = true if x=="0"
        end
    end 
end   
  p "______________________________"

=end


def write_on_case (case_choose, player_symbol)
    @array_cases.each { |x| x.position== case_choose ? x.content = player_symbol  : x  }
 end

 # la methode outilise une booleane pour saisir le gagnant:
 #If trou veut dire que un des joueurs a gagné. nous avons les trois x ou o qui s'alignent
 def game_state

    #Les lignes pour le joueur 1 
    if @A1.content == "o" && @A2.content == "o" && @A3.content == "o" ||  @B1.content == "o" && @B2.content == "o" && @B3.content == "o" || @C1.content == "o" && @C2.content == "o" && @C3.content == "o" 
        @win_jeux = true 
       end 
    #Les lignes pour le joueur 2
    if @A1.content == "x" && @A2.content == "x" && @A3.content == "x" ||  @B1.content == "x" && @B2.content == "x" && @B3.content == "x" || @C1.content == "x" && @C2.content == "x" && @C3.content == "x"
        @win_jeux = true 
    end
    
    #Les colones pour le joueur 1 
    if @A1.content == "o" && @B1.content == "o" && @C1.content == "o" ||   @A2.content == "o" && @B2.content == "o" && @C2.content == "o" ||  @A3.content == "o" && @B3.content == "o" && @C3.content == "o" 
        @win_jeux = true 
       end

    #Les colones pour le joueur 2
    if @A1.content == "x" && @B1.content == "x" && @C1.content == "x" ||  @A2.content == "x" && @B2.content == "x" && @C2.content == "x"  || @A3.content == "x" && @B3.content == "x" && @C3.content == "x"
        @win_jeux = true 
       end   

     # Les diagonales pour les deux joueurs
     if @A1.content == "o" && @B2.content == "o" && @C3.content == "o" || @A1.content == "x" && @B2.content == "x" && @C3.content == "x" || @A3.content == "o" && @B2.content == "o" && @C1.content == "o" || @A3.content == "x" && @B2.content == "x" && @C1.content == "x"
        @win_jeux = true
        end
   
    end



    # game nil peut arreter le jeux si aucun des joueurs a gagné
    def game_nil
      @array_cases.each { |item| item.content == /[:SPACE:]/ ? @jeux_nul = true : @jeux_nul = false }
    end
  
end 