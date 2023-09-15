class Game
  MAX_ATTEMPTS = 10
  COLORS = ["R", "G", "B", "P", "S", "O"]
  POSITIONS = 4
  #red, green, blue, pink, silver, orange

  def initialize
    @attempts = 0
    generate_code
    print generate_code
  end

  def start_game
    puts "Welcome to Mastermind! Your goal is to guess the four colors."
    puts "Available colors: #{COLORS.join(", ")}"
    puts "You have a total of #{MAX_ATTEMPTS} attempts."
  end

  def player_guess
    puts "Give your guess:"
    @guess = []
    @attempts += 1
    4.times do |i|
      puts "Color #{i+1}:"
      @user_input = gets.chomp.upcase
      until COLORS.include?(@user_input)
        puts "Invalid input. Please enter a valid color (R, G, B, P, S, or O)."
        @user_input = gets.chomp.upcase
      end
      @guess << @user_input
    end
    print @guess
  end



  private

  def generate_code
    @code = COLORS.sample(4)
  end
end

game = Game.new
game.start_game
game.player_guess