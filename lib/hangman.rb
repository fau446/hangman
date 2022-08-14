# 6 guesses

module Hangman
  class Player
    def initialize

    end

    def guess_letter
      
    end
  end

  class Game
    def initialize
      @player = Player.new
    end

    def play
      # randomly selects a word
      answer = select_random_word
      p answer # used for testing, get rid after
      display = Array.new(answer.length, '_')
      p display
      guesses = 0
      while guesses < 6
        # display the display first
        print_array(display)
        player_guess = @player.guess_letter
        # check the letter in the guess is in the array
        # break if word is guessed correctly
        guesses += 1
      end

      if guesses >= 6
        # game is lost
      else
        # game is won
      end
    end

    private

    def select_random_word
      words = File.readlines('google-10000-english-no-swears.txt')

      filtered_words = Array.new
      
      words.each_with_index do |word, index|
        word.strip!
        if word.length >= 5 && word.length <= 12
          filtered_words.push(word)
        end
      end
      # do File.close  ?
      filtered_words.sample
    end

    def print_array(array)
      array = array.join(' ')
      puts array
    end


    def check_guess

    end
  end
end

include Hangman

game = Game.new
game.play