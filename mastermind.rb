class Game
  MAX_ATTEMPTS = 10
  COLORS = ["R", "G", "B", "P", "S", "O"]
  POSITIONS = 4
  #red, green, blue, pink, silver, orange

  def initialize
    @attempts = 0
    code = generate_code
  end

  def start_game
    puts "Welcome to Mastermind! Your goal is to guess the four colors."
    puts "Available colors: #{COLORS.join(", ")} \n"

    until @attempts == MAX_ATTEMPTS
      execute_game
      if @correct_guess.all? { |element| element == "Check!" }
        puts "You Win!"
        return
      elsif @attempts == 10
        puts "You Lose!"
        return
      end
      puts "\nYou have a total of #{MAX_ATTEMPTS - @attempts} attempts. \n"
      puts "Available colors: #{COLORS.join(", ")} \n" 
    end
  end

  def execute_game
    validate_guess(player_guess)
  end

  def player_guess
    guess = []
    @attempts += 1

    puts "Give your guess\n"

    4.times do |i|
      puts "Color #{i+1}:"
      @user_input = gets.chomp.upcase
      until COLORS.include?(@user_input)
        puts "Invalid input. Please enter a valid color (R, G, B, P, S, or O)."
        @user_input = gets.chomp.upcase
      end
      guess << @user_input
    end
    print "Your guess: " + guess.to_s
    guess
  end

  def validate_guess(guess)
    @correct_colors = 0
    @near_colors = 0
    @correct_guess = []
    
    guess.each_with_index do |color, index|
      if code.include?(color) && color == code[index]
        @correct_colors += 1
        @correct_guess[index] = "Check!"
      elsif code.include?(color)
        @near_colors += 1
        @correct_guess[index] = "Near!"
      else
        @correct_guess[index] = "Wrong!"
      end
    end

    puts "\nHere's your guess: #{@correct_guess.join(", ")}"
  end

  private

  attr_accessor :guess, :code
  def generate_code
    @code = COLORS.sample(4)
  end
end

game = Game.new
game.start_game