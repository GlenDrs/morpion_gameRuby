
class Show #< Board
    attr_accessor :array_cases
    def initialize 
        @array_cases = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]

    end
    def show_board 
            # Show empty board at initialization and get variable at each player turn
            puts "       C1   C2  C3"
            puts "       ___________"
            puts " L1   | #{@A1.content} | #{@A2.content} | #{@A3.content}|"
            puts "       ___________"
            puts " L2   | #{@B1.content} | #{@B2.content} | #{@B3.content}|"
            puts "       ___________"
            puts " L3   | #{@C1.content} | #{@C2.content} | #{@C3.content}|"
            puts "       ___________"
        
      end

  
end

