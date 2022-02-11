#one class TicTacToe
#user can chose if it wants to be p1 or p2
#ask user to chose a field
#update field
#display field
#ask user2 to choose a field
#check if the user chose a field thats already chosen
#update field
#display field
#else display error
#ask user2 to choose a field again 
#if correct 
#update field
#display field
#store answers in object?
#check if the user has one combination of inputs?
#if it has declare a winner/return
#continue the game
#  1 | 2 | 3
# ---+---+---
#  4 | 5 | 6
# ---+---+---
#  7 | 8 | 9


class TicTacToe
  attr_accessor :fields
    def initialize
      @fields = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
      @next_turn = 1
      @winner = false
      puts "Welcome to game of TicTacTo! Start?(y/n)"
      @answer = gets.chomp
      if @answer == "y"
        puts "Player 1 enter a name:"
        @player_1 = gets.chomp
        puts "Player 2 enter a name:"
        @player_2 = gets.chomp
    end

    def start_game
      if @answer == "y"
        display_board
        while @winner == false
          if @next_turn % 2 == 1
        user_input(@player_1,"X")
          else 
            user_input(@player_2,"O")
          end
        end
      elsif @answer == "n"
        puts "Wait you can't do that! >:("
      else puts "Wrong input :("
      end
    end
  end

    def display_board
      puts "#{@fields[0][0]} | #{@fields[0][1]} | #{@fields[0][2]}\n---------\n#{@fields[1][0]} | #{@fields[1][1]} | #{@fields[1][2]}\n---------\n#{@fields[2][0]} | #{@fields[2][1]} | #{@fields[2][2]}"
    end

    def user_input(player,char)
          puts "#{player}, please choose a field:"
          user_answer = gets.chomp.to_i
          if !user_answer.between?(0,10)
            puts "Wrong input"
          else 
            traverse(@fields,user_answer,char)
            check_winner(@fields)
          end
        @next_turn += 1
      display_board
    end

    def traverse(field, input, sign)
      field.each do |block|
        block.map! do |b|
        if input == b
          b = sign
        else b = b
        end
      end
    end
  end

    def check_winner(board)
      board.each do |block|
        if block.all? {|el| el == "X"}
          puts "Winner! #{@player_1}"
          @winner = true
        elsif block.all? {|el| el == "O"}
          puts "Winner! #{@player_2}"
          @winner = true
        end
      end
    end
  end


strt = TicTacToe.new()
strt.start_game


