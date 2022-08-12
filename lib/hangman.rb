module Hangman
  class Player

  end

  class Game
    def initialize
      @player = Player.new
    end

    def play
      # randomly selects a word
      selected_word = select_random_word
      
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
      
      filtered_words.sample
    end

  end
end

include Hangman

game = Game.new
game.play