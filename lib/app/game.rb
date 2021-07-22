class Game
    
    attr_accessor :players, :board
    @@all_joueurs=[]
  
    def initialize 
      @players = []
      @board = Board.new
      @@all_joueurs << self
    end

    
    def self.all
        @@all_joueurs
      end

  
    # La methode donner_nom ===> Nom du jueur 1/2 ?
    def donner_nom
      puts "Nom du jueur 1 ?"
      print "> "
      @players << Player.new(gets.chomp.to_s, "o")
  
      puts "Nom du jueur 2 ?"
      print "> "
      @players << Player.new(gets.chomp.to_s, "x")
    end
  
    def joueur_select
      while @board.win_jeux == false 
        @players.each { |item| choose_case(item) }
      end
    end
  
    # Les trois cas du jeux. A: un des joueurs gagne, B: match nul ou C: le jeux est en cours!
    def choose_case (player)
      # Quand un des joueur gagne: on affiche quelque emoji
      if @board.win_jeux==true
        puts "🏁 🏁  #{player.nom} WON THE GAME !! 🏁"
        puts "✌🎉🏆"

             # B La pertie termine sans gagnants
      elsif @board.jeux_nul == true    
        puts "Match Nul!!!"
      else
        puts "#{player.nom} avec le char '#{player.s_char}' à toi de jouer entre la case que tu souhaites. Exemple : 11, 12, 13
        pour la premier ligne: 21, 22, et 23 pour la deuxieme ligne. Et pour la troisieme ligne tu peux tapper 31, 32 et 33"
        print "> "
        @board.write_on_case(gets.chomp.to_s, player.s_char)
        @board.show_board
        @board.game_state
      end
    end
  
    # Relancer le jeux
    # !Probleme, a regarder
    def ask_new_game
      puts "Tu veux rejouer? Y/N "
      print "> "
      new_game = gets.chomp.to_s
  
      if new_game == "Y"

        @board.array_cases.map! { |item| item.content = " " }
               self.perform  # essayons de relancer le jeux
            end
    end
  
    def perform
     donner_nom
      puts "Le premier joueur s'appelle #{@players[0].nom} avec un charcter de type #{@players[0].s_char}"
      puts "Le deuxiem joueur s'appelle #{@players[1].nom} avec un character de type #{@players[1].s_char}"

      @board.show_board
      joueur_select
      ask_new_game
    end
  end